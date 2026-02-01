# Windows 磁盘逻辑架构协议 (Disk Architecture Protocol)

## 1. 核心哲学：动静分离

本架构的核心在于将**系统引导（OS）**、**高频工作流（Active Workspace）**与**冷数据归档（Archive）**在物理/逻辑分区上彻底隔离，以应对 C 盘用户目录（Users）异常膨胀及潜在的分区故障风险。

------

## 2. 分区规划映射表

| **驱动器**    | **逻辑定义**              | **核心承载内容**                                   | **迁移策略**                                    |
| ------------- | ------------------------- | -------------------------------------------------- | ----------------------------------------------- |
| **C: 系统盘** | **Core OS**               | 仅保留 Windows 核心文件与驱动                      | 严格限制 AppData 增长，禁止安装第三方软件       |
| **D: 工作盘** | **Active Workspace**      | 代码工程（`Code/`）、博客源码（`Blog/`）、复习资料 | 承接从 C 盘迁移出的“桌面”与“文档”               |
| **E: 游戏盘** | **Entertainment**         | 大型游戏本体（Steam/WeGame）                       | 独立分区，防止游戏更新占用开发空间              |
| **F: 工具盘** | **Tooling & Engineering** | VS Code、Docker 镜像、环境变量相关的二进制工具     | 全面实施“便携化（Portable）”，不与 C 盘产生耦合 |

------

## 3. 针对 105GB `Users` 目录的瘦身路径

针对 `C:\Users\` 占用过高的问题，实施以下迁移优先级：

1. **用户文件夹重定向**：将 `Desktop`、`Documents`、`Downloads` 物理迁移至 `D:\01_System`。
2. **AppData 软连接 (Symbolic Link)**：
   - `Local/JetBrains` (IDE 索引) $\rightarrow$ `F:\Tool\Cache`
   - `Roaming/WeChat` (聊天记录) $\rightarrow$ `D:\03_Software\TencentData`
3. **环境缓存重定向**：
   - `npm_cache` / `pip_cache` 统一修改全局配置，指向 D 盘。

------

## 4. 安全与维护规范

- **BitLocker 全盘加密**：所有驱动器均开启加密，迁移操作前必须验证恢复密钥。
- **灾备复盘**：吸取 D 盘数据丢失教训，重要项目（如 `JianZi`）必须保持远程 Git 同步。
- **Path 变量维护**：定期运行 `Sort-Path.ps1` 脚本，清理失效的安装路径。