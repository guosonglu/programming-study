# 一个网络应用的安全性始于过滤器

在 Spring Security 中，HTTP 过滤器将不同的职责委托给 HTTP 请求。此外，它们通常管理必须应用于请求的每项职责。因此，这些过滤器形成了一条职责链。一个过滤器接收到请求后，执行其逻辑，并最终将请求委托给链中的下一个过滤器（图 5.1）。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409241809368.png){ loading=lazy }
  <figcaption>图5.1 请求被传递到过滤器链。每个过滤器都会调用一个管理器来对请求执行特定逻辑，然后将其传递给链中的下一个过滤器。</figcaption>
</figure>

让我们用一个比喻来说明。当你去机场时，从进入航站楼到登机，你需要经过多个筛选（图5.2）。首先，你需要出示机票，然后验证护照，接着通过安检。在登机口，可能还会有更多的筛选。例如，在某些情况下，登机前会再次验证护照和签证。这与Spring Security中的过滤器链非常相似。同样，你可以在Spring Security中自定义过滤器链中的过滤器。Spring Security提供了可以通过自定义添加到过滤器链中的过滤器实现，但你也可以定义自定义过滤器。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409241810796.png){ loading=lazy }
  <figcaption>图5.2 在机场，你需要经过一系列检查点，最终才能登上飞机。同样地，Spring Security 实现了一系列过滤器，用于处理应用程序接收到的 HTTP 请求。</figcaption>
</figure>

本章将讨论如何使用 Spring Security 自定义 Web 应用程序中`身份验证`和`授权`架构的一部分过滤器。例如，您可能希望通过为用户增加一个步骤来增强身份验证，比如检查他们的电子邮件地址或使用一次性密码。您还可以添加与审计身份验证事件相关的功能。您会发现应用程序在各种场景中使用身份验证审计，从调试目的到识别用户行为。如今的技术和机器学习算法可以改进应用程序，例如，通过学习用户行为来判断是否有人入侵他们的账户或冒充用户。

了解如何自定义HTTP过滤器责任链是一项宝贵的技能。在实际应用中，应用程序通常有各种需求，默认配置可能不再适用。您需要添加或替换链中的现有组件。默认实现中使用的是HTTP基本身份验证方法，这允许您依赖用户名和密码。然而，在实际场景中，您可能需要更多功能。也许您需要实施不同的身份验证策略，通知外部系统关于授权事件，或者记录成功或失败的身份验证，以便后续进行追踪和审计（如图5.3所示）。无论您的场景如何，Spring Security为您提供了灵活性，可以根据需要精确地建模过滤器链。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409241812148.png){ loading=lazy }
  <figcaption>图5.3 您可以通过在现有过滤器之前、之后或替换现有过滤器来个性化过滤器链。这样，您不仅可以定制认证过程，还可以定制请求和响应的整体处理。</figcaption>
</figure>

## 在 Spring Security 架构中实现过滤器

本节讨论了过滤器及过滤器链在 Spring Security 架构中的工作方式。首先需要了解这一概述，以便理解我们将在后续部分中进行的实现示例。在第 2 章和第 3 章中，我们了解到认证过滤器会拦截请求，并将认证责任进一步委托给`授权管理器`。如果我们想在认证之前执行某些逻辑，可以通过在认证过滤器之前插入一个过滤器来实现。

在 Spring Security 架构中，过滤器是典型的 HTTP 过滤器。我们可以通过实现 jakarta.servlet 包中的 `Filter` 接口来创建过滤器。与其他 HTTP 过滤器一样，你需要重写 `doFilter()` 方法来实现其逻辑。此方法接收 `ServletRequest`、`ServletResponse` 和 `FilterChain` 作为参数：

- `ServletRequest`—表示HTTP请求。我们使用ServletRequest对象来获取有关请求的详细信息。
- `ServletResponse`—表示HTTP响应。我们使用ServletResponse对象在将响应发送回客户端或传递到过滤链的下一步之前对其进行修改。
- `FilterChain`—表示过滤器链。我们使用 FilterChain 对象将请求转发到链中的下一个过滤器。

!!! note

	从 Spring Boot 3 开始，Jakarta EE 取代了旧的 Java EE 规范。由于这一变化，您会注意到一些包的前缀从“javax”变为“jakarta”。例如，像 Filter、ServletRequest 和 ServletResponse 这样的类型，之前位于 javax.servlet 包中，现在则在 jakarta.servlet 包中。

过滤器链表示一组具有特定执行顺序的过滤器。Spring Security 为我们提供了一些过滤器实现及其顺序。以下是其中的一些过滤器：

- `BasicAuthenticationFilter` 负责处理 HTTP 基本身份验证（如果存在）。
- `CsrfFilter` 负责处理跨站请求伪造（CSRF）保护，我们将在第9章中讨论。
- `CorsFilter` 负责处理跨域资源共享 (CORS) 授权规则，我们将在第10章中讨论这一点。

你不需要了解所有的过滤器，因为你可能不会直接在代码中使用它们，但你需要理解过滤器链的工作原理，并了解一些实现。在本书中，我只解释对我们讨论的各种主题至关重要的过滤器。

重要的是要理解，一个应用程序的过滤器链中不一定包含所有这些过滤器的实例。链的长短取决于你如何配置应用程序。例如，在第2章和第3章中，你了解到如果想使用HTTP基本认证方法，就需要调用`HttpSecurity`类的`httpBasic()`方法。调用`httpBasic()`方法后，`BasicAuthenticationFilter`的一个实例会被添加到链中。同样，根据你编写的配置，过滤器链的定义也会受到影响。

您可以在链中相对于另一个过滤器添加一个新过滤器（图5.4）。或者，您可以在已知过滤器之前、之后或其位置添加一个过滤器。每个位置实际上是一个索引（一个数字），您可能还会看到它被称为`顺序`。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409242155498.png){ loading=lazy }
  <figcaption>图5.4 每个过滤器都有一个序号，决定了过滤器在请求中应用的顺序。你可以在 Spring Security 提供的过滤器基础上添加自定义过滤器。</figcaption>
</figure>

如果您想了解更多关于 Spring Security 提供的过滤器及其配置顺序的信息，可以查看枚举 SecurityWebFiltersOrder，访问[地址](https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/config/web/server/SecurityWebFiltersOrder.html)。

您可以在同一位置添加两个或多个过滤器（图5.5）。在第5.4节中，我们将遇到一个常见的情况，这种情况通常会让开发人员感到困惑。

!!! note

	如果多个过滤器具有相同的位置，则它们的调用顺序未定义。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409242157306.png){ loading=lazy }
  <figcaption>图5.5 在过滤器链中，您可能会有多个具有相同顺序值的过滤器。在这种情况下，Spring Security 不保证它们的调用顺序。</figcaption>
</figure>

## 在链中现有过滤器之前添加一个过滤器

本节讨论如何在过滤器链中将自定义HTTP过滤器应用于现有过滤器之前。你可能会遇到这种情况，在这种情况下，这会很有用。为了以实用的方式解决这个问题，我们将以一个项目为例，你将学习如何轻松实现一个自定义过滤器，并在过滤器链中将其应用于现有过滤器之前。然后，你可以将这个示例调整为在生产应用中遇到的任何类似需求。

对于我们的第一个自定义过滤器实现，让我们考虑一个简单的场景。我们希望确保每个请求都有一个名为 `Request-Id` 的头（参见项目 ssia-ch5-ex1）。我们假设我们的应用程序使用这个头来跟踪请求，并且这个头是必需的。同时，我们希望在应用程序执行身份验证之前验证这些假设。身份验证过程可能涉及查询数据库或其他消耗资源的操作，如果请求格式无效，我们不希望应用程序执行这些操作。我们该如何做到这一点呢？解决当前需求只需两个步骤，最后过滤器链如图 5.6 所示。

1. 实现过滤器。创建一个`RequestValidationFilter`类，用于检查请求中是否存在所需的头信息。
2. 将过滤器添加到过滤器链中。在配置类中使用 SecurityFilterChain bean 来完成此操作。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409242338197.png){ loading=lazy }
  <figcaption>图5.6 在我们的示例中，我们添加了一个RequestValidationFilter，它在身份验证过滤器之前起作用。RequestValidationFilter确保如果请求验证失败，则不会进行身份验证。在我们的情况下，请求必须包含一个名为Request-Id的必填头。</figcaption>
</figure>

要完成步骤1——实现过滤器，我们需要定义一个自定义过滤器。下面的列表展示了具体的实现。

```java title="清单 5.1 实现自定义过滤器"
public class RequestValidationFilter 
  implements Filter {

  @Override
  public void doFilter(
     ServletRequest servletRequest, 
     ServletResponse servletResponse, 
     FilterChain filterChain) 
     throws IOException, ServletException {
     // ...
  }
}

```
