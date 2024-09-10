# 网站搭建

## 环境搭建

- 安装Python

- 安装mkdocs-material

```shell
pip install mkdocs-material
```

- 创建mkdocs项目

```shell
mkdocs new .
```

- 启动服务

```shell
mkdocs serve

# 对于大项目，文档改变可以提升构建速度
mkdocs serve --dirtyreload
```

- 在mkdocs.yml中配置主题

```yaml
theme:
  name: material
```

- 项目部署：在存储库的根目录下，创建一个新的 GitHub Actions 工作流程，例如 `.github/workflows/ci.yml` ，然后复制并粘贴以下内容：

```yaml
name: ci 
on:
  push:
    branches:
      - master 
      - main
permissions:
  contents: write
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Configure Git Credentials
        run: |
          git config user.name github-actions[bot]
          git config user.email 41898282+github-actions[bot]@users.noreply.github.com
      - uses: actions/setup-python@v5
        with:
          python-version: 3.x
      - run: echo "cache_id=$(date --utc '+%V')" >> $GITHUB_ENV 
      - uses: actions/cache@v4
        with:
          key: mkdocs-material-${{ env.cache_id }}
          path: .cache
          restore-keys: |
            mkdocs-material-
      - run: pip install mkdocs-material 
      - run: mkdocs gh-deploy --force
```

- GitHub Page的发布源分支设置为`gh-pages`。向github推送提交，静态站点将自动构建和部署。

## 自定义CSS和JS

- 自定义文件：

```text
.
├─ docs/
│  └─ javascripts/
│     └─ extra.js
│  └─ stylesheets/
│     └─ extra.css
└─ mkdocs.yml
```

- 在`mkdocs.yml`中进行配置:

```yaml
extra_css:
  - stylesheets/extra.css

extra_javascript:
  - javascripts/extra.js
```




