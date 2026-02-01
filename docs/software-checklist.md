## 前言

由于个人编程习惯的缘故，这里可能涉及一些个性化的设计，这个清单用于开发，生产环境的安装，各取所需即可。

# 开发环境 Development Runtimes

**语言&运行时 Languages & Runtimes**

- C/C++：`MinGW-w64`，用 VS Code 集成即可
- Java: `Oracle JDK` Version:8/17/21
- Go: `Go SDK`
- Node.js:`nvm-windows`
- Python:`Anoconda`以及下属`pycharm`

**数据库&中间件 Databases & Middleware**

- MySQL：`8.0`，关系型数据库
- PostgreSQL-`Lates`：高级特性型数据库
- Redis：`8` ，高性能缓存与内存存储

**集成开发环境&编辑器 IDEs & Editors**

- VS Code：通用轻量级代码编辑器，个人常用，简单易上手，生态丰富，但需要注意插件的安装位置，熟悉插件体系后，可以非常方便地集成各类开发环境。
- Intelli IDEA： 专业的 Java 集成开发环境，支撑复杂后端项目的工程化需求。有足够多的 Java 插件可以用。

- Pycharm：专业的 Python 集成开发环境，通常与 Anaconda 协同工作。
- Trae：基于 AI 驱动的新一代代码编辑器，国内版是免费的，如果为了追求模型更好点可以切换至国际版。
- Antigravity ：极简/趣味开发工具，可以用于 AI Vibe Coding，交流下来 Antigravity 在这个方面挺不错的。

**版本控制与辅助工具 Engineering Tools**

- Git：值得一提的是，Git 由纯 C 写就，有时间可以看看是 Git 是如何运作的。
- GitHub Desktop：相较于 Git Bash 简易的命令函界面，我觉得对新人更友好一些，适合想要用 GitHub 存储代码，却不熟悉命令的人（不过后期只要多敲，一些熟悉的 Git 指令是很熟悉的）
- Docker Desktop：用于容器化部署 Redis 8 和 PostgreSQL 等数据库。但是值得一提的是，必须要把它安装到非系统盘上，否则很容易爆盘。
- TortoiseSVN：辅助版本管理工具，主要用于处理特定的存量项目或传统的版本控制场景。

**Java 生态与框架**

- MyBatis：轻量级持久层框架。相比全自动 ORM，更中意其对 SQL 的灵活控制，非常适合构建高性能的 Java 应用，可以为了开发轻便用MyBatis-Plus。
- Maven：必不可少的构建工具，用于管理 MyBatis 等第三方库。

# 剪辑工具

- **Adobe PR**：学习周期大概一个月左右可以入门，后期精进的话不错。用于剪辑 Vlog 和 自己喜欢的影视作品。

- **剪映**：简单易上手，上限不是很高，但是有很多小白就一点就会的模板，只需要学会调参数即可。

# 其他好用的小工具/网站推荐

- WireShark：用于分析网络

- Everything：可以用于快速搜索文件，体积很小巧
- Z-library：个人电子书大多数来源于此