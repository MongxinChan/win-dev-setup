# Win-Dev-Optimizer：开发者环境架构与瘦身指南

这是我的个人 Windows 开发环境管理方案。记录了如何在一个多分区（C/D/E/F）且开启 **BitLocker** 加密的系统上，实现极致的磁盘利用率与环境自动化。

## 🛠 项目背景

作为一名计算机专业的学生，随着项目的增多和资料的堆积，C 盘“用户文件夹”一度膨胀至 **105 GB**。本项目记录了通过**逻辑迁移**而非简单删除来优化系统的过程。

---

## 📂 磁盘分区哲学 (Architecture)

为了避免数据杂乱（如 D 盘根目录一度堆积 27 个项目的情况），我将存储空间划分为 5 大核心区：

* **`01_System`**: 承接 C 盘迁移出的桌面、文档、下载等高频读写文件夹。
* **`02_Workspace`**: 存放 `Code`、`Cplusplus` 及 `loners.site` 博客源码。
* **`03_Software`**: 存放非工程类软件，及微信/QQ 等社交软件的大量缓存。
* **`04_Media`**: 个人兴趣素材，如 Livehouse 现场记录等。
* **`05_Storage`**: 存放经过数据恢复后的历史存档及系统镜像。

---

## 🚀 核心工具与脚本

### 1. 环境变量自动化排序 (`/scripts/Sort-Path.ps1`)

针对开发环境（Java, Node.js, Go, Docker 等）导致的 `Path` 变量混乱问题：

* **功能**：自动去重、移除失效路径、并按逻辑顺序排列路径。
* **安全**：脚本在执行前会进行路径存在性验证（`Test-Path`）。

### 2. VS Code 深度迁移指南

将 `Microsoft VS Code` 本体搬迁至 `F:\Tool`，并通过**便携模式 (Portable Mode)** 将插件与缓存重定向：

* 在安装目录新建 `data` 文件夹，接管 C 盘的 `extensions` 与 `user-data`。
* 彻底释放 C 盘中 `AppData` 的占用。

### 3. AppData 瘦身策略

使用符号链接（Symbolic Link）处理无法修改路径的软件缓存：

```powershell
# 逻辑示例
mklink /j "C:\Users\Name\AppData\Local\LargeFolder" "D:\03_Software\Cache\LargeFolder"

```

---

## 🛡 安全与灾备 (Disaster Recovery)

* **BitLocker 意识**：所有操作均在磁盘加密状态下进行，手册中强调了备份恢复密钥的重要性。
* **数据恢复经验**：记录了在经历 D 盘数据丢失后，如何使用工具进行扇区级恢复的实战心得。

---

## 👤 关于作者

* **Name**: 孟欣 (Mengxin Chan)
* **Focus**: CS / Software Architecture / 2027 Postgrad Prep
* **Blog**: [loners.site](https://loners.site)