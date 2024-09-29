# 实现身份认证

第3章和第4章介绍了身份验证流程中的一些组件。我们讨论了`UserDetails`以及如何定义原型来描述Spring
Security中的用户。接下来，我们在示例中使用了`UserDetails`，展示了`UserDetailsService`和`UserDetailsManager`
契约的工作原理及其实现方法。我们还在示例中讨论并使用了这些接口的主要实现。最后，您学习了`PasswordEncoder`
如何管理密码及其使用方法，以及Spring Security`加密模块（SSCM）`中的加密器和密钥生成器。

然而，`AuthenticationProvider` 层负责认证的逻辑。在 `AuthenticationProvider` 中，你会找到决定是否认证请求的条件和指令。将这一责任委托给
`AuthenticationProvider` 的组件是 `AuthenticationManager`，它从 HTTP 过滤器层接收请求，这在第 5
章中已讨论过。在本章中，我们将探讨认证过程，该过程只有两种可能的结果：

- `请求的实体未经过身份验证`。用户未被识别，应用程序拒绝请求，而不将其委托给授权过程。通常，在这种情况下，返回给客户端的响应状态是HTTP
  401 未授权。
- `请求的实体已通过身份验证`。请求者的详细信息被存储，以便应用程序可以使用这些信息进行授权。正如您将在本章中了解到的，SecurityContext
  负责处理当前已认证请求的详细信息。

为了提醒您演员及其之间的关系，图6.1展示了我们在第2章中已经看到的图示。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409261737456.png){ loading=lazy }
  <figcaption>图 6.1 Spring Security 中的认证流程。此过程概述了应用程序识别提交请求的个人的方法。本章重点关注的元素已被突出显示。在此背景下，AuthenticationProvider 负责执行认证过程，而 SecurityContext 保留有关已认证请求的信息。</figcaption>
</figure>

本章将介绍认证流程的其余部分（图6.1中的阴影框）。接下来，在第7章和第8章中，您将学习授权的工作原理，这是HTTP请求中继认证之后的过程。首先，我们需要讨论如何实现
`AuthenticationProvider`接口。您需要了解Spring Security在认证过程中如何理解请求。

为了清晰描述如何表示认证请求，我们将从`Authentication`接口开始。一旦我们讨论完这个接口，就可以进一步观察在成功认证后请求的细节会发生什么。接下来，我们可以讨论
`SecurityContext`接口以及Spring Security如何管理它。在本章的结尾，你将学习如何自定义HTTP
Basic认证方法。我们还将讨论另一种可用于我们应用程序的认证选项——`基于表单的登录`。

## 理解AuthenticationProvider

在企业应用中，你可能会遇到这样的情况：基于用`户名和密码`
的默认身份验证方式不适用。此外，在身份验证方面，你的应用程序可能需要实现多种场景（如图6.2所示）。例如，你可能希望用户能够通过接收到的短
`信验证码`或特定应用程序显示的代码来证明身份。或者，你可能需要实现`用户必须提供存储在文件中`的某种密钥的身份验证场景。你甚至可能需要使用
`用户指纹`的表示来实现身份验证逻辑。框架的目的就是要足够灵活，以便让你能够实现这些场景中的任何一种。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409262059124.png){ loading=lazy }
  <figcaption>图6.2 一个应用程序可能需要多种身份验证方法。尽管用户名和密码在大多数情况下已足够，但在某些情况下，用户身份验证的过程可能会更加复杂。</figcaption>
</figure>

框架通常提供一组最常用的实现，但当然无法涵盖所有可能的选项。在 Spring Security 中，你可以使用 `AuthenticationProvider`
接口来定义任何自定义的认证逻辑。在本节中，你将学习通过实现 `Authentication` 接口来表示认证事件，然后使用
`AuthenticationProvider` 创建自定义的认证逻辑。为了实现我们的目标

- 在第6.1.1节中，我们分析了Spring Security如何表示认证事件。
- 在第6.1.2节中，我们讨论了负责认证逻辑的`AuthenticationProvider`合约。
- 在第6.1.3节中，您将通过实现`AuthenticationProvider`合约来编写自定义身份验证逻辑。

### 在身份验证过程中表示请求

本节讨论了 Spring Security 在认证过程中如何理解`请求`。在深入实现自定义认证逻辑之前，了解这一点非常重要。正如你将在第6.1.2节中了解到的，要实现自定义的
`AuthenticationProvider`，首先需要理解如何描述认证事件。在这里，我们将查看表示`认证`的契约，并讨论你需要了解的方法。

`Authentication` 是同名过程中涉及的基本接口之一。`Authentication`
接口代表认证请求事件，并保存请求访问应用程序的实体的详细信息。在认证过程中及之后，您可以使用与认证请求事件相关的信息。
`请求访问应用程序的用户`称为
`主体`。如果您曾在任何应用中使用过 Java Security，您可能知道一个名为 `Principal` 的接口代表相同的概念。Spring Security 的
`Authentication` 接口扩展了这一契约（图 6.3）。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409271621298.png){ loading=lazy }
  <figcaption>图6.3 Authentication协议扩展了Principal协议。它引入了额外的规定，例如需要密码或可以提供有关认证请求的更多细节。某些方面，如权限数组，是 Spring Security 特有的。</figcaption>
</figure>

在 Spring Security 中，`Authentication` 合约不仅代表一个主体，还包含了认证过程是否完成的信息以及权限的集合。这个合约被设计为扩展
Java Security 的 `Principal` 合约，这在与其他框架和应用程序的实现兼容性方面是一个优势。这种灵活性使得从其他方式实现认证的应用程序迁移到
Spring Security 更加容易。

让我们在下面的列表中进一步了解`Authentication`接口的设计。

```java title="清单6.1 Spring Security中声明的Authentication接口"
public interface Authentication extends Principal, Serializable {

	Collection<? extends GrantedAuthority> getAuthorities();

	Object getCredentials();

	Object getDetails();

	Object getPrincipal();

	boolean isAuthenticated();

	void setAuthenticated(boolean isAuthenticated)
			throws IllegalArgumentException;
}
```

目前，您需要学习的接口方法只有以下这些：

- `isAuthenticated()`—如果认证过程结束则返回 true，如果认证过程仍在进行中则返回 false
- `getCredentials()`—返回用于认证过程的密码或任何秘密信息
- `getAuthorities()`—返回经过身份验证的请求所授予权限的集合

我们将在后续章节中讨论适用于所考虑实现的其他Authentication合约方法。

### 实现自定义认证逻辑

本节涉及实现自定义认证逻辑。我们将分析与此职责相关的Spring Security契约，以理解其定义。通过这些细节，您可以在第6.1.3节中通过代码示例实现自定义认证逻辑。

在 Spring Security 中，`AuthenticationProvider` 负责处理认证逻辑。`AuthenticationProvider` 接口的默认实现将查找系统用户的责任委托给
`UserDetailsService`。在认证过程中，它还使用 `PasswordEncoder` 进行密码管理。以下是 `AuthenticationProvider`
的定义，你需要为你的应用程序定义一个自定义认证提供者。

```java title="清单 6.2 AuthenticationProvider 接口"
public interface AuthenticationProvider {

	Authentication authenticate(Authentication authentication)
			throws AuthenticationException;

	boolean supports(Class<?> authentication);
}
```

`AuthenticationProvider` 的职责与 `Authentication` 合约紧密相连。`authenticate()` 方法接收一个 `Authentication`
对象作为参数，并返回一个 `Authentication` 对象。我们通过实现 `authenticate()` 方法来定义认证逻辑。这里，我们快速总结一下实现
`authenticate()` 方法的方式：

- 如果认证失败，该方法应抛出一个`AuthenticationException`异常。
- 如果方法接收到一个不被您的`AuthenticationProvider`实现支持的认证对象，那么该方法应返回`null`。这样，我们就有可能在HTTP
  `过滤器级别`使用多种不同的认证类型。
- 该方法应返回一个表示完全认证对象的`Authentication`实例。对于此实例，`isAuthenticated()`
  方法返回true，并且包含有关认证实体的所有必要详细信息。通常，应用程序还会从该实例中移除敏感数据，例如密码。`在成功认证后，密码不再需要`
  ，保留这些详细信息可能会导致其暴露给不必要的目光。

在 `AuthenticationProvider` 接口中，第二个方法是 `supports(Class<?> authentication)`。如果当前的 `AuthenticationProvider`
支持作为 `Authentication` 对象提供的类型，你可以通过实现这个方法返回 true。请注意，即使这个方法对某个对象返回 true，
`authenticate()` 方法仍有可能通过返回 null 来拒绝请求。Spring Security 的设计更加灵活，允许用户实现一个
`AuthenticationProvider`，可以根据认证请求的详细信息而不仅仅是其类型来拒绝请求。

一个关于`authentication manager`和`authentication provider`如何协同工作以`验证`或`无效化身份验证`
请求的类比是为你的门配备一个更复杂的锁。你可以通过使用`卡片`或`传统的实体钥匙`来打开这个锁（图6.4）。锁本身就是
`authentication manager`，它决定是否打开门。为了做出这个决定，它委托给两个 `authentication providers`：一个知道如何验证`卡片`
，另一个知道如何验证`实体钥匙`。如果你用`卡片`来开门，只处理`实体钥匙`的`authentication provider`
会抱怨它不熟悉这种身份验证。然而，另一个provider支持这种身份验证，并验证卡片是否对这扇门有效。这就是`supports()`方法的目的。

除了测试`认证类型`之外，Spring Security 还增加了一层灵活性。`门锁`可以识别多种类型的`卡`。在这种情况下，当你出示一张卡时，其中一个认证提供者可能会说：
`我理解这是一张卡。但这不是我能验证的卡类型！` 这种情况发生在 `supports()` 返回 true 但 `authenticate()` 返回 null 时。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409272224557.png){ loading=lazy }
  <figcaption>图6.4 AuthenticationManager委托给其中一个可用的认证提供者。AuthenticationProvider可能不支持提供的认证类型。然而，如果它支持该对象类型，它可能不知道如何认证该特定对象。认证过程会进行评估，能够判断请求是否正确的AuthenticationProvider会响应AuthenticationManager。</figcaption>
</figure>

图6.5展示了另一种情景，其中一个`AuthenticationProvider`对象识别了`Authentication`，但判断其无效。在这种情况下，结果将是一个
`AuthenticationException`，最终在Web应用的HTTP响应中表现为`401 Unauthorized`状态。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409282031020.png){ loading=lazy }
  <figcaption>图6.5 如果没有任何一个 AuthenticationProvider 对象识别出 Authentication，或者其中任何一个拒绝它，则结果为 AuthenticationException。</figcaption>
</figure>

### 应用自定义认证逻辑

在本节中，我们实现自定义认证逻辑。您可以在项目 ssia-ch6-ex1 中找到此示例。通过这个示例，您可以应用在 6.1.1 和 6.1.2 节中学到的关于
`Authentication` 和 `AuthenticationProvider` 接口的知识。在清单 6.3 和 6.4 中，我们构建了一个如何实现自定义
`AuthenticationProvider` 的示例。这些步骤也在图 6.5 中展示，具体如下：

1. 声明一个实现 `AuthenticationProvider` 合约的类。
2. 确定新的 `AuthenticationProvider` 支持哪些类型的 `Authentication` 对象。
3. 实现`supports(Class<?> c)`方法，以指定我们定义的`AuthenticationProvider`支持哪种类型的身份验证。
4. 实现 `authenticate(Authentication a)` 方法以实现认证逻辑
5. 将新的 `AuthenticationProvider` 实现实例注册到 Spring Security 中。

```java title="清单6.3 重写AuthenticationProvider的supports()方法"

@Component
public class CustomAuthenticationProvider
		implements AuthenticationProvider {

	// Omitted code

	@Override
	public boolean supports(Class<?> authenticationType) {
		return authenticationType
				.equals(UsernamePasswordAuthenticationToken.class);
	}
}
```

在代码清单6.3中，我们定义了一个实现`AuthenticationProvider`接口的新类。我们使用`@Component`注解标记该类，以便在Spring管理的上下文中拥有其类型的实例。接下来，我们必须决定这个`AuthenticationProvider`支持哪种`Authentication`接口的实现。这取决于我们期望在`authenticate()`方法中提供哪种类型的参数。如果我们没有在认证过滤器级别进行任何自定义（如第5章所述），那么类`UsernamePasswordAuthenticationToken`定义了该类型。这个类是`Authentication`接口的一个实现，代表了使用`用户名和密码`的标准认证请求。

根据这个定义，我们让 `AuthenticationProvider` 支持特定类型的密钥。一旦我们确定了 `AuthenticationProvider` 的范围，就可以通过重写 `authenticate()` 方法来实现认证逻辑，如下所示。

```java title="清单 6.4 实现认证逻辑"
@Component
public class CustomAuthenticationProvider 
  implements AuthenticationProvider {

  private final UserDetailsService userDetailsService;
  private final PasswordEncoder passwordEncoder;

  // Omitted constructor

  @Override
  public Authentication authenticate(Authentication authentication) {
    String username = authentication.getName();
    String password = authentication.getCredentials().toString();

    UserDetails u = userDetailsService.loadUserByUsername(username);

    if (passwordEncoder.matches(password, u.getPassword())) {
      return new UsernamePasswordAuthenticationToken(
            username, 
            password, 
            u.getAuthorities());
    } else {
      throw new BadCredentialsException
                  ("Something went wrong!");
    }
  }

  // Omitted code
}

```

清单6.4中的逻辑很简单，图6.6对此逻辑进行了直观展示。我们使用UserDetailsService实现来获取UserDetails。如果用户不存在，loadUserByUsername()方法应抛出AuthenticationException。在这种情况下，认证过程停止，HTTP过滤器将响应状态设置为HTTP 401 Unauthorized。如果用户名存在，我们可以进一步使用上下文中的PasswordEncoder的matches()方法检查用户的密码。如果密码不匹配，同样应抛出AuthenticationException。如果密码正确，AuthenticationProvider返回一个标记为“authenticated”的Authentication实例，其中包含请求的详细信息。

