# Redux

## Redux入门案例

### 定义初始state

```js
// 为应用定义初始状态值
const initialState = {
    value: 0
}
```

### 定义reducer方法

reducer方法需要接收俩参数，`当前的 state` 和一个描述发生了什么的 `action 对象`。

当 Redux 应用启动时，我们还没有任何状态，所以我们提供一个 `initialState` 作为该 reducer 的默认值。

```js
// 创建一个“reducer”函数来确定应用程序中发生某些事情时的新状态
function counterReducer(state = initialState, action) {
    // Reducers 通常会查看发生的action 的 type 来决定如何更新状态
    switch (action.type) {
        case 'counter/incremented':
            return {...state, value: state.value + 1}
        case 'counter/decremented':
            return {...state, value: state.value - 1}
        default:
            // 如果 reducer 不关心这个action type，原样返回现有状态
            return state
    }
}
```

Action 始终具有 `type 字段`，该字段的值是你提供的字符串，充当 action 的唯一名称。type
的值应该是一个好理解的名称，以便任何看过这段代码的人都明白它的含义。在这种情况下，我们使用单词 `counter` 作为我们 type
值的前半部分，后半部分是一个`发生了什么`的描述。在这种情况下，我们的 "counter" 是`递增的（incremented）`，所以我们将 type 编写为
`counter/incremented`。

根据 Action 的 type，我们要么需要返回一个全新的对象作为新的 state 的结果，要么返回现有的 state 对象（如果没有任何变化）。请注意，我们通过复制现有
state 并更新副本的方式来 不可变地（immutably）更新状态，而不是直接修改原始对象。

### 创建store实例

我们可以通过调用 Redux 库 `createStore` API 来创建一个 store 实例。

```js
// 通过 createStore 方法创建一个新的 Redux store，
// 使用 counterReducer 进行更新逻辑
const store = Redux.createStore(counterReducer)
```

第二个参数可以传入`预加载状态`：

```js
import {createStore} from 'redux'
import rootReducer from './reducer'

let preloadedState
const persistedTodosString = localStorage.getItem('todos')

if (persistedTodosString) {
    preloadedState = {
        todos: JSON.parse(persistedTodosString)
    }
}

const store = createStore(rootReducer, preloadedState)
```

我们将 reducer 函数传递给 "createStore"，它使用 reducer 函数生成初始状态，并计算任何未来的更新。

### 订阅更新

使用 `store.getState()` 方法从 Redux store 中获取最新状态

```js
store.getState().value
```

Redux store 允许我们调用 store.subscribe() 方法，并传递一个订阅者回调函数，该函数将在每次更新 store 时调用。因此，我们可以将
render 函数作为订阅者传递，并且知道每次 store 更新时，我们都可以使用最新值更新 UI。

```js
store.subscribe(() => {
    const v = store.getState().value
})
```

### 更新状态

```js
store.dispatch({type: 'counter/incremented'})
```

## Redux术语

### Actions对象

action 是一个具有 `type` 字段的普通 `JavaScript 对象`。`你可以将 action 视为描述应用程序中发生了什么的事件.`

- `type 字段`是一个字符串，给这个 action 一个描述性的名字，比如"todos/todoAdded"。我们通常把那个类型的字符串写成“域/事件名称”，其中第一部分是这个
  action 所属的特征或类别，第二部分是发生的具体事情。
- action 对象可以有`其他字段`，其中包含有关发生的事情的附加信息。按照惯例，我们将该信息放在名为 payload 的字段中。

```js
const addTodoAction = {
    type: 'todos/todoAdded',
    payload: 'Buy milk'
}
```

### Reducers方法

`reducer是一个函数`，接收`当前的 state` 和一个 `action 对象`，必要时决定如何更新状态，并返回新状态。函数签名是：
`(state, action) => newState`。 你可以将 reducer 视为一个`事件监听器`，它根据接收到的 action（事件）类型处理事件。

Reducer 必需符合以下规则：

- 仅使用 `state` 和 `action` 参数计算新的状态值
- `禁止直接修改 state`。必须通过复制现有的 state 并对复制的值进行更改的方式来做 不可变更新（immutable updates）。
- 禁止任何异步逻辑、依赖随机值或导致其他`副作用`的代码

!!! note "为什么Reducer需要是纯函数"

      - Redux 的目标之一是让你的代码可预测。如果仅根据输入参数计算函数的输出，则更容易理解该代码的工作原理并对其进行测试。
      - 另一方面，如果一个函数依赖于自身外部的变量，或者行为随机，你永远不知道运行它时会发生什么。
      - 如果一个函数修改了其他值，包括它的参数，这可能会改变应用程序的工作方式。这可能是常见的错误来源，例如 “ 我更新了状态，但现在我的 UI 没有在应该更新的时候更新！”
      - 一些 Redux DevTools 功能依赖于让你的 reducer 正确地遵循这些规则

reducer 函数内部的逻辑通常遵循以下步骤：

1. 检查 reducer 是否关心这个 action。
	- 如果是，则复制 state，使用新值更新 state 副本，然后返回新 state
2. 否则，返回原来的 state 不变

```js
const initialState = {value: 0}

function counterReducer(state = initialState, action) {
    // 检查 reducer 是否关心这个 action
    if (action.type === 'counter/increment') {
        // 如果是，复制 `state`
        return {
            ...state,
            // 使用新值更新 state 副本
            value: state.value + 1
        }
    }
    // 返回原来的 state 不变
    return state
}
```

### Store对象

当前 Redux 应用的状态存在于一个名为 `store` 的对象中。

store 是通过传入一个 `reducer` 来创建的，并且有一个名为 `getState` 的方法，它返回当前状态值：

```js
import {configureStore} from '@reduxjs/toolkit'

const store = configureStore({reducer: counterReducer})

console.log(store.getState())
// {value: 0}
```

### Dispatch方法

Redux store 有一个方法叫 `dispatch`。`更新 state 的唯一方法是调用 store.dispatch() 并传入一个 action 对象。` store 将执行所有
reducer 函数并计算出更新后的 state，调用 getState() 可以获取新 state。

```js
store.dispatch({type: 'counter/incremented'})

console.log(store.getState())
// {value: 1}
```

`dispatch 一个 action 可以形象的理解为 "触发一个事件"。`发生了一些事情，我们希望 store 知道这件事。 Reducer
就像事件监听器一样，当它们收到关注的 action 后，它就会更新 state 作为响应。

### Selectors方法

Selector 函数可以从 store 状态树中提取指定的片段。随着应用变得越来越大，会遇到应用程序的不同部分需要读取相同的数据，selector
可以避免重复这样的读取逻辑：

```js
const selectCounterValue = state => state.value

const currentValue = selectCounterValue(store.getState())
console.log(currentValue)
// 2
```

## 核心概念和原则

### 单一数据源

应用程序的全局状态作为对象存储在单个 `store` 中。任何给定的数据片段都应仅存在于一个位置，而不是在许多位置重复。

这样，随着事物的变化，可以更轻松地调试和检查应用的状态，并集中需要与整个应用程序交互的逻辑。

### State是只读的

更改状态的唯一方法是 dispatch 一个 action，这是一个描述所发生事件的对象。

这样，UI 就不会意外覆盖数据，并且更容易跟踪发生状态更新的原因。由于 actions 是普通的 JS
对象，因此可以记录、序列化、存储这些操作，并在以后重放这些操作以进行调试或测试。

### 使用Reducer纯函数进行更改

若要指定如何基于 action 更新状态树，请编写 reducer 函数。`Reducers 是纯函数`，它接收旧 state 和 action，并返回新
state。与任何其他函数一样，你可以将 Reducer 拆分为较小的函数以帮助完成工作，或者为常见任务编写可重用的 Reducer。

### 数据流

Redux 应用中的数据流：

- actions 会在用户交互如点击时被 dispatch
- store 通过执行 reducer 方法计算出一个新的 state
- UI 读取最新的state来展示最新的值

<figure markdown="span">
  ![](https://cn.redux.js.org/assets/images/ReduxDataFlowDiagram-49fa8c3968371d9ef6f2a1486bd40a26.gif){ loading=lazy }
  <figcaption>Redux数据流</figcaption>
</figure>

具体来说，对于 Redux，我们可以将这些步骤分解为更详细的内容：

初始启动：

- 使用最顶层的 root reducer 函数创建 Redux store
- store 调用一次 root reducer，并将返回值保存为它的初始 state
- 当 UI 首次渲染时，UI 组件访问 Redux store 的当前 state，并使用该数据来决定要呈现的内容。同时监听 store 的更新，以便他们可以知道
  state 是否已更改。

更新环节：

- 应用程序中发生了某些事情，例如用户单击按钮
- dispatch 一个 action 到 Redux store，例如 dispatch({type: 'counter/increment'})
- store 用之前的 state 和当前的 action 再次运行 reducer 函数，并将返回值保存为新的 state
- store 通知所有订阅过的 UI，通知它们 store 发生更新
- 每个订阅过 store 数据的 UI 组件都会检查它们需要的 state 部分是否被更新。
- 发现数据被更新的每个组件都强制使用新数据重新渲染，紧接着更新网页

## 拆分Reducers

reducer通常被拆分为多个较小的reducer函数，方便阅读和维护。

特定功能的 Redux 代码通常编写为单个文件，称为`slice文件`

Redux 应用程序状态的特定部分的redux应用state称为`slice reducer`

```js title="src/features/todos/todosSlice.js"
export default function todosReducer(state = initialState, action) {
    switch (action.type) {
        case 'todos/todoAdded': {
            // 可以只返回新的 todos 数组 - 周围没有额外的对象
            return [
                ...state,
                {
                    id: nextTodoId(state),
                    text: action.payload,
                    completed: false
                }
            ]
        }
        case 'todos/todoToggled': {
            return state.map(todo => {
                if (todo.id !== action.payload) {
                    return todo
                }

                return {
                    ...todo,
                    completed: !todo.completed
                }
            })
        }
        default:
            return state
    }
}
```

```js title="src/features/filters/filtersSlice.js"
const initialState = {
    status: 'All',
    colors: []
}

export default function filtersReducer(state = initialState, action) {
    switch (action.type) {
        case 'filters/statusFilterChanged': {
            return {
                // 同样，要复制的嵌套层次少了一层
                ...state,
                status: action.payload
            }
        }
        default:
            return state
    }
}
```

现在有两个独立的 slice 文件，每个文件都有自己的 slice reducer 函数。但是，Redux 存储在创建时需要 一个 根 reducer 函数。

```js
import todosReducer from './features/todos/todosSlice'
import filtersReducer from './features/filters/filtersSlice'

export default function rootReducer(state = {}, action) {
    // 返回一个新的根 state 对象
    return {
        // `state.todos` 的值是 todos reducer 返回的值
        todos: todosReducer(state.todos, action),
        // 对于这两个reducer，我们只传入它们的状态 slice
        filters: filtersReducer(state.filters, action)
    }
}
```

!!! note

    请注意，这些 reducer 中的每一个都在管理自己的全局状态部分。每个 reducer 的 state 参数都是不同的，并且对应于它管理的 state 部分。

Redux 核心库包含一个名为 combineReducers 的实用程序，它为我们执行相同的样板步骤(组合 Reducers )。

```js
import {combineReducers} from 'redux'

import todosReducer from './features/todos/todosSlice'
import filtersReducer from './features/filters/filtersSlice'

const rootReducer = combineReducers({
    // 定义一个名为`todos`的顶级状态字段，由`todosReducer`处理
    todos: todosReducer,
    filters: filtersReducer
})

export default rootReducer
```

!!! note

    记住，你给 `combineReducers` 的键名决定了你的状态对象的键名是什么！

## Store内部简单实现

查看 Redux Store 内部实现对于学习 store 有所帮助。

```js
function createStore(reducer, preloadedState) {
    let state = preloadedState
    const listeners = []

    function getState() {
        return state
    }

    function subscribe(listener) {
        listeners.push(listener)
        return function unsubscribe() {
            const index = listeners.indexOf(listener)
            listeners.splice(index, 1)
        }
    }

    function dispatch(action) {
        state = reducer(state, action)
        listeners.forEach(listener => listener())
    }

    dispatch({type: '@@redux/INIT'})

    return {dispatch, subscribe, getState}
}
```

## store增强

### 定义增强方法

```js title="src/exampleAddons/enhancers.js"
export const sayHiOnDispatch = (createStore) => {
    return (rootReducer, preloadedState, enhancers) => {
        const store = createStore(rootReducer, preloadedState, enhancers)

        function newDispatch(action) {
            const result = store.dispatch(action)
            console.log('Hi!')
            return result
        }

        return {...store, dispatch: newDispatch}
    }
}

export const includeMeaningOfLife = (createStore) => {
    return (rootReducer, preloadedState, enhancers) => {
        const store = createStore(rootReducer, preloadedState, enhancers)

        function newGetState() {
            return {
                ...store.getState(),
                meaningOfLife: 42,
            }
        }

        return {...store, getState: newGetState}
    }
}

```

### 使用其中一个方法进行增强

```js
import {createStore} from 'redux'
import rootReducer from './reducer'
import {sayHiOnDispatch} from './exampleAddons/enhancers'

// createStore第三个参数传递增强
const store = createStore(rootReducer, undefined, sayHiOnDispatch)

export default store
```

### 多个增强函数

Redux 核心包含一个 `compose 函数`，可用于将多个 enhancer 合并在一起。

```js
import {createStore, compose} from 'redux'
import rootReducer from './reducer'
import {
    sayHiOnDispatch,
    includeMeaningOfLife
} from './exampleAddons/enhancers'

const composedEnhancer = compose(sayHiOnDispatch, includeMeaningOfLife)

const store = createStore(rootReducer, undefined, composedEnhancer)

export default store
```

### Middleware

Redux 使用一种称为 `middleware` 的特殊插件来让我们自定义 `dispatch 函数`。

`Redux middleware 在 dispatch action 和到达 reducer 之间提供第三方扩展点。`

Redux Middleware 实际上是在 Redux 内置的一个非常特殊的 store enhancer 之上实现的，称为 `applyMiddleware`。

```js
export const print1 = (storeAPI) => (next) => (action) => {
    console.log('1')
    return next(action)
}

export const print2 = (storeAPI) => (next) => (action) => {
    console.log('2')
    return next(action)
}

export const print3 = (storeAPI) => (next) => (action) => {
    console.log('3')
    return next(action)
}
```

```jsx
import {createStore, applyMiddleware} from 'redux'
import rootReducer from './reducer'
import {print1, print2, print3} from './exampleAddons/middleware'

const middlewareEnhancer = applyMiddleware(print1, print2, print3)

// 将 enhancer 为第二参数，因为没有 preloadedState
const store = createStore(rootReducer, middlewareEnhancer)

export default store
```

```js
import store from './store'

store.dispatch({type: 'todos/todoAdded', payload: 'Learn about actions'})
// log: '1'
// log: '2'
// log: '3'
```

Middleware 围绕 store 的 dispatch 方法形成管线。当我们调用 store.dispatch(action) 时，实际上 调用了管线中的第一个
Middleware。 然后，该 Middleware 可以在看到该操作时做任何它想做的事情。通常，Middleware 会检查 action 是否是它关心的特定
type，就像 reducer 一样。如果它是匹配到的 type，Middleware 可能会运行一些自定义逻辑。否则，它将 dispatch 传递给管线中的下一个
Middleware。

不像 reducer，middleware 内部可能有`副作用`，包括超时和其他异步逻辑。

### 自定义Middleware

Redux middleware 被编写为一系列的三个嵌套函数。

```js
// 使用 ES5 function 来编写 Middleware

// 外层 function:
function exampleMiddleware(storeAPI) {
    return function wrapDispatch(next) {
        return function handleAction(action) {
            // 在这里做任何事情：用 next(action) 向前传递 action，
            // 或者使用 storeAPI.dispatch(action) 重启管线
            // 这里也可以使用 storeAPI.getState()

            return next(action)
        }
    }
}
```

- `exampleMiddleware`：外层函数其实就是 “middleware” 本身。它将被 applyMiddleware 调用，并接收包含 store 的 {dispatch,
  getState} 函数的 storeAPI 对象。这些是相同的 dispatch 和 getState 函数，它们实际上是 store 的一部分。如果你调用这个
  dispatch 函数，它会将 action 发送到 middleware 管线的 start。这只会被调用一次。
- `wrapDispatch`：中间函数接收一个名为 next 的函数作为其参数。这个函数实际上是管线中的 next middleware。如果这个 middleware
  是序列中的最后一个，那么 next 实际上是原始的 store.dispatch 函数。调用 next(action) 会将 action 传递给管线中的 next
  middleware。这也只调用一次
- `handleAction`：最后，内部函数接收当前的 action 作为其参数，并在 每次 dispatch action 时调用。

也可以使用 ES6 箭头函数来编写它们:

```js
const anotherExampleMiddleware = storeAPI => next => action => {
    // 当每个 action 都被 dispatch 时，在这里做一些事情

    return next(action)
}
```

### Middleware用例

所以我们可以用中间件做很多事！

当一个 middleware 遇到 dispatch 一个 action 时，它可以做到任何想做的事：

- 将某些内容记录到控制台
- 设置定时
- 进行异步 API 调用
- 修改 action
- 暂停 action，甚至完全停止

特别的是，`middleware 旨在 包含具有副作用的逻辑。`此外，`middleware 可以修改 dispatch 来接受 不是 普通 action 对象的东西。`

## DevTools

### 将DevTools添加到Store

安装DevTools Chrome扩展后，我们需要配置 store，以便 DevTools 可以看到里面发生了什么。DevTools 需要添加特定的 store enhancer
才能实现这一点。

有一个名为 `redux-devtools-extension` 的 NPM 包可以处理复杂的部分。该包导出了一个专门的 composeWithDevTools
函数，我们可以使用它来代替原始的 Redux compose 函数。

```js
import {createStore, applyMiddleware} from 'redux'
import {composeWithDevTools} from 'redux-devtools-extension'
import rootReducer from './reducer'
import {print1, print2, print3} from './exampleAddons/middleware'

const composedEnhancer = composeWithDevTools(
    // 示例：在此处添加你实际要使用的任何 middleware
    applyMiddleware(print1, print2, print3)
    // 其他 store enhancers（如果有）
)

const store = createStore(rootReducer, composedEnhancer)
export default store
```

## Redux + React

Redux 是一个独立的 JS 库。即使没有设置用户界面，也可以创建和使用 Redux store。`这也意味着 Redux 可以和任何 UI 框架一起使用。`

`Redux 是专门为 React 设计的`。React 允许你将 UI 描述为 state 函数，然后 Redux 控制并更新 state 以响应 action。

### useSelector

```js title="原始写法"
store.getState()
```

`useSelector`使得React组件可以从 Redux store 中读取数据。

`useSelector`接收一个selector函数。selector函数接收 Redux store 的 `state` 作为其参数，然后从 `state 中取值并返回`。

```jsx
const selectTodos = state => state.todos
```

selector 函数可以直接返回 Redux state，也可以基于该 state 返回 派生 值。

```jsx
const selectTotalCompletedTodos = state => {
    const completedTodos = state.todos.filter(todo => todo.completed)
    return completedTodos.length
}
```

每当 Redux store 状态更新时，`useSelector 会自动订阅 Redux store！`,无需再手动编写`store.subscribe`监听全局状态了。

`如果 selector 返回的值与上次运行时相比发生了变化，useSelector 将强制组件使用新值重新渲染。`

!!! warning

	`useSelector 使用严格的 === 来比较结果，因此只要 selector 函数返回的结果是新地址引用，组件就会重新渲染！`这意味着如果在 selector 中创建并返回新地址引用，那么每次 dispatch action 后组件都会被重新渲染，即使数据值确实没有改变。

### useDispatch

```js title="原始写法"
store.dispatch(action)
```

React-Redux 的 `useDispatch` hook 函数会返回 store 的 dispatch 方法。（事实上这个 hook 的内部实现真的是 return
store.dispatch。）

因此，我们可以在任何需要 dispatch action 的组件中使用 `const dispatch = useDispatch()`，然后根据需要调用 dispatch(
someAction)。

### Provider

使用 `Provider` 透传 Store

`使用 <Provider> 组件包裹 <App> 组件，并将 Redux store 作为 prop 传递给 <Provider> 组件。`之后，应用程序中的每个组件都可以在需要时能够访问到
Redux store。

### React-Redux模式

#### 全局State、组件State

整个应用程序所需的全局 state 应该放在 Redux store 中。只在一个组件内使用的 state 应该放在组件 state 中。

#### 在组件中使用多个 Selectors

我们可以在一个组件中多次使用 useSelector。并且每次调用 useSelector 都应该总是返回尽可能少的 state。

## 异步操作

### 将异步函数传递给Middleware

```js
const asyncFunctionMiddleware = storeAPI => next => action => {
    // 如果 action 实际上是一个函数...
    if (typeof action === 'function') {
        // 调用该函数并传入 `dispatch` 和 `getState` 作为参数
        return action(storeAPI.dispatch, storeAPI.getState)
    }

    // 否则，它就是一个普通 action，那就继续执行
    return next(action)
}
```

```js
const middlewareEnhancer = applyMiddleware(asyncFunctionMiddleware)
const store = createStore(rootReducer, middlewareEnhancer)

// 编写一个接收 `dispatch` 和 `getState` 作为参数的函数
const fetchSomeData = (dispatch, getState) => {
    // 发送一个异步 HTTP 请求
    client.get('todos').then(todos => {
        // 使用获取的 todos 来 dispatch action
        dispatch({type: 'todos/todosLoaded', payload: todos})
        // 在 dispatch 后检查更新后的 store
        const allTodos = getState().todos
        console.log('Number of todos after loading: ', allTodos.length)
    })
}

// 向 `dispatch` 传入 _函数_ 
store.dispatch(fetchSomeData)
// 打印日志：'加载完成后 todos 的数量：###'
```

### Redux Thunk Middleware

`thunk middleware` 允许我们编写以 dispatch 和 getState 作为参数的函数。thunk 函数可以包含我们想要的任何异步逻辑，并且该逻辑可以根据需要
dispatch action 以及读取 store state。

将异步逻辑写成 thunk 函数允许我们在不知道使用的 Redux store 的情况下能够重用该逻辑。

安装软件包：

```shell
npm install redux-thunk
```

```js
import {createStore, applyMiddleware} from 'redux'
import thunkMiddleware from 'redux-thunk'
import {composeWithDevTools} from 'redux-devtools-extension'
import rootReducer from './reducer'

const composedEnhancer = composeWithDevTools(applyMiddleware(thunkMiddleware))

// store 现在就可以在 `dispatch` 中接收 thunk 函数了
const store = createStore(rootReducer, composedEnhancer)
export default store
```

首先编写一个 thunk 函数，该函数向 /fakeApi/todos 端点进行 AJAX 请求获取到一个 todo 对象数组，然后 dispatch 包含该数组作为
payload 的 action。因为这部分内容和 todos 功能相关，所以我们在 todosSlice.js 文件中编写 thunk 函数：

```js
import {client} from '../../api/client'

const initialState = []

export default function todosReducer(state = initialState, action) {
    switch (action.type) {
        // 省略其他 reducer cases
        case 'todos/todosLoaded': {
            // 通过返回的新值完全替换现有 state
            return action.payload
        }
        default:
            return state
    }
}

// Thunk 函数
export async function fetchTodos(dispatch, getState) {
    const response = await client.get('/fakeApi/todos')
    dispatch({type: 'todos/todosLoaded', payload: response.todos})
}
```

我们只需要在应用程序第一次加载时调用这个 API。以下是 可以 放这个 thunk 函数的地方：

- 在<App> 组件的 useEffect hook 函数中
- 在 <TodoList> 组件的 useEffect hook 函数中
- 直接放在 index.js 导入 store 之后的地方

```js
import React from 'react'
import ReactDOM from 'react-dom'
import {Provider} from 'react-redux'
import './index.css'
import App from './App'

import './api/server'

import store from './store'
import {fetchTodos} from './features/todos/todosSlice'

store.dispatch(fetchTodos)

ReactDOM.render(
    <React.StrictMode>
        <Provider store={store}>
            <App/>
        </Provider>
    </React.StrictMode>,
    document.getElementById('root')
)
```

### Thunk函数接收参数

```js
// 编写一个接收 `text` 参数的同步外部函数：
export function saveNewTodo(text) {
    // 然后创建并返回异步 thunk 函数：
    return async function saveNewTodoThunk(dispatch, getState) {
        // ✅ 现在可以使用文本值并将其发送到服务器了
        const initialTodo = {text}
        const response = await client.post('/fakeApi/todos', {todo: initialTodo})
        dispatch({type: 'todos/todoAdded', payload: response.todo})
    }
}
```

```js
const handleKeyDown = e => {
  // 如果用户按下 Enter 键：
  const trimmedText = text.trim()
  if (e.which === 13 && trimmedText) {
    // 创建 thunk 函数并立即 dispatch
    dispatch(saveNewTodo(trimmedText))
    setText('')
  }
}
```

## 标准Redux模式

### Action Creators

#### 封装action对象

```js title="原始方式"
dispatch({ type: 'todos/todoAdded', payload: trimmedText })
```

action creator 就是创建并返回一个 action 对象的函数。我们通常使用它们来避免每次都手动编写 action 对象：

```js
const todoAdded = text => {
  return {
    type: 'todos/todoAdded',
    payload: text
  }
}

// 代码量少，但可读性差
// 和上面的例子一样！
const todoAdded = todo => ({ type: 'todos/todoAdded', payload: todo })
```

我们调用这个 action creator，然后把返回值直接传给 dispatch：

```js
store.dispatch(todoAdded('Buy milk'))
```

Action creators 有两个主要用途：

- 准备和格式化 action 对象的内容
- 封装创建 action 时所需的任何额外工作

#### 封装thunk函数

```js title="src/features/todos/todosSlice.js"
export function fetchTodos() {
    return async function fetchTodosThunk(dispatch, getState) {
        const response = await client.get('/fakeApi/todos')
        dispatch(todosLoaded(response.todos))
    }
}

// 或者使用箭头函数（代码量少，但可读性差）
// 和上面的例子一样！
export const fetchTodos = () => async dispatch => {
    const response = await client.get('/fakeApi/todos')
    dispatch(todosLoaded(response.todos))
}
```

### 解决数组产生的重复渲染问题

#### 问题一

如果父组件读取整个store数组，虽然可行，但存在性能问题。

每当store中的数组的某个元素发生改变，都会创建新的副本。当 useSelector 接收到一个新的引用时，它会强制重新渲染组件。这将导致整个父组件更新。因为 React会默认递归地重新渲染所有子组件，意味着 所有的子组件组件都会被重新渲染，即使大部分组件实际上根本没有变化！

#### 问题二

为了解决问题一，我们只在组件中返回一个新的 IDs 数组，而不是整个数组对象。

```jsx
useSelector(state => state.todos.map(todo => todo.id))
```

新问题：`array.map() `总是返回一个新数组引用。我们知道 每次 dispatch action 后 React-Redux 的 useSelector hook 都会重新调用其 selector 函数，如果 selector 返回一个新值，`组件一定会重新渲染`。

#### shallowEqual解决方式

更改 `useSelector` 判断值是否变更的方式。useSelector 可以将比较函数作为它的`第二个参数`。比较函数接收旧值和新值作为参数，内部会判断两个值是否相同，相同则返回 “true”，那么组件也就不会被重新渲染。

React-Redux 有一个 shallowEqual 比较函数，我们可以使用它来检查数组 内部每一项 是否仍然相同。

```js title="src/features/todos/TodoList.js"
import React from 'react'
import {useSelector, shallowEqual} from 'react-redux'
import TodoListItem from './TodoListItem'

const selectTodoIds = state => state.todos.map(todo => todo.id)

const TodoList = () => {
    //shallowEqual比较函数,更改useSelector判断值是否变更的方式。
    const todoIds = useSelector(selectTodoIds, shallowEqual)

    const renderedListItems = todoIds.map(todoId => {
        return <TodoListItem key={todoId} id={todoId}/>
    })

    return <ul className="todo-list">{renderedListItems}</ul>
}
```

在子组件中，我们可以通过该 ID 值获取到 todo 项。还可以根据 todo 的 ID 进行 dispatch action 来更新 <TodoListItem> 组件。

```js title="src/features/todos/TodoListItem.js"
import React from 'react'
import {useSelector, useDispatch} from 'react-redux'

import {availableColors, capitalize} from '../filters/colors'

const selectTodoById = (state, todoId) => {
    return state.todos.find(todo => todo.id === todoId)
}

// 仅解构 `props.id`，因为我们只需要 ID 值
const TodoListItem = ({id}) => {
    // 使用 state 和 ID 值调用 `selectTodoById`
    const todo = useSelector(state => selectTodoById(state, id))
    const {text, completed, color} = todo

    const dispatch = useDispatch()

    const handleCompletedChanged = () => {
        dispatch({type: 'todos/todoToggled', payload: todo.id})
    }

    // 省略其他 change 事件处理器
    // 省略其他列表项呈现逻辑和内容

    return (
        <li>
            <div className="view">{/* 省略其他渲染输出 */}</div>
        </li>
    )
}

export default TodoListItem
```

#### 记忆化Selectors解决方式

`Memoization` 是一种缓存——具体来说，就是保存那些非常耗时的计算结果，然后再次遇到同样的计算任务时，直接重用这些结果。

Reselect 库 提供了一个 `createSelector` API，它将生成 memoized selector 函数。`createSelector` 接收一个或多个 input selector 函数作为参数，外加一个 output selector，并返回新的 selector 函数。每次调用 selector 时：

- 所有 input selectors 都使用所有参数被调用
- 只要任何 input selector 返回值已更改，output selector 都将重新运行
- 所有 input selector 的结果都将成为 output selector 的参数
- output selector 的最终结果将被缓存以供下次使用

```shell
npm install reselect
```

```js title="src/features/todos/todosSlice.js"
import { createSelector } from 'reselect'

// 省略 reducer

// 省略 action creators

export const selectTodoIds = createSelector(
  // 首先传入一个或更多的 input selector 函数：
  state => state.todos,
  // 然后，output selector 接收所有输入结果作为参数
  // 并返回最终结果值
  todos => todos.map(todo => todo.id)
)
```

```jsx
import React from 'react'
import { useSelector, shallowEqual } from 'react-redux'

import { selectTodoIds } from './todosSlice'
import TodoListItem from './TodoListItem'

const TodoList = () => {
  const todoIds = useSelector(selectTodoIds)

  const renderedListItems = todoIds.map(todoId => {
    return <TodoListItem key={todoId} id={todoId} />
  })

  return <ul className="todo-list">{renderedListItems}</ul>
}
```

这实际上与 `shallowEqual` 比较函数的行为略有不同。每当 state.todos 数组更改时，我们都会创建一个新的 todo IDs 数组。这包括对 todo 的任何不可变更新，例如切换其 completed 字段，因为我们必须为不可变更新创建一个新数组。

!!! note

    仅当你实际需要从原始数据派生其他值时，memoized selectors 才有用。如果只是查找并返回现有值，则可以将 selector 作为普通函数。

具有多个参数的 Selectors:

```js
import { createSelector } from 'reselect'
import { StatusFilters } from '../filters/filtersSlice'

// 省略其他代码

export const selectFilteredTodos = createSelector(
  // 第一个 input selector：所有的 todo 列表
  state => state.todos,
  // 第二个 input selector：当前状态过滤器
  state => state.filters.status,
  // Output selector：接收两个值
  (todos, status) => {
    if (status === StatusFilters.All) {
      return todos
    }

    const completedStatus = status === StatusFilters.Completed
    // 根据过滤器返回未完成或已完成的 todo 列表
    return todos.filter(todo => todo.completed === completedStatus)
  }
)
```

我们可以使用这个新的 filtered todos selector 作为另一个 selector 的输入，该 selector 返回这些 todo 的 ID：

```js
export const selectFilteredTodoIds = createSelector(
  // 将其他的 memoized selector 作为输入传递
  selectFilteredTodos,
  // 并在 output selector 中导出数据
  filteredTodos => filteredTodos.map(todo => todo.id)
)
```

### 异步请求状态

API 调用可能需要一段时间才能完成。在这种情况下，在我们等待响应完成过程中，通常会显示某种 loading spinner。

- 使用具有某种 loading state 值来表示请求的当前状态
- 在进行 API 调用 前 dispatch “request started” action，该 dispatch 会更改 loading state 值
- 在请求完成时再次更新 loading state 值，以表示调用已完成

然后，UI 层在请求过程中显示 loading spinner，并在请求完成时切换到显示真实数据。
