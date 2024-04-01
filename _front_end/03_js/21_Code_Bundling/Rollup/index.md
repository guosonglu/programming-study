---
layout: note
title: Rollup
nav_order: 210
parent: 代码打包
grand_parent: JavaScript
create_time: 2024/1/24
---

# 打包React并发布到npm

安装相关依赖

```shell
yarn add rollup rollup-plugin-babel @babel/core @babel/preset-env @babel/preset-react @emotion/babel-preset-css-prop
```

- `rollup`: 打包工具
- `rollup-plugin-babel`: rollup的babel插件
- `@babel/core`: babel核心库
- `@babel/preset-env`: babel预设，用于编译es6+语法
- `@babel/preset-react`: babel预设，用于编译react语法
- `@emotion/babel-preset-css-prop`: babel预设，用于编译emotion的css prop

编写.yarnignore用于屏蔽不需要发布的文件

```text
.gitignore
src
```

编写.babelrc用于配置babel

```json
{
  "presets": [
    "@babel/preset-env",
    "@babel/preset-react",
    "@emotion/babel-preset-css-prop"
  ]
}
```

编写rollup.config.js用于配置rollup

```js
import babel from 'rollup-plugin-babel';

export default {
  input: 'src/index.js',
  output: {
    file: 'dist/index.js',
    format: 'cjs',
  },
  plugins: [
    babel({
      exclude: 'node_modules/**',
    }),
  ],
  external: ['react', 'react-dom'],
};
```

