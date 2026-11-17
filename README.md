# chris-skills

Chris 的 AI 技能库：按领域分类的可复用 Agent 技能。
Reusable AI agent skills, organized by domain.

## 技能目录

| 领域 | 技能 | 说明 | 状态 |
|---|---|---|---|
| 思考方法 `thinking/` | [first-principles-reframe](thinking/first-principles-reframe/SKILL.md) | 动手前先重构需求：第一性原理、区分目标与手段、跨领域借鉴、提问对齐、给推荐 | 可用 |
| 矿业资讯 `mining-news/` | [liex-news-push](mining-news/liex-news-push/SKILL.md) | 全天巡检对阿根廷 LIEX 经营有传导效应的法规政策和经营环境变化，核实后以“精选 + 分数”卡片推送到飞书群 | 可用：提示词见 [PROMPT.md](mining-news/liex-news-push/PROMPT.md)，设计记录见 [LOCALIZATION.md](mining-news/liex-news-push/LOCALIZATION.md) |

## 目录约定

```
<领域>/
└── <技能名>/
    ├── SKILL.md        技能说明：做什么、什么时候用、流程、输出格式
    ├── references/     技能用到的规则、资料（可选）
    └── scripts/        技能用到的代码（可选）
```

- 领域文件夹、技能文件夹都用小写英文加连字符，例如 `mining-news/liex-news-push/`。
- 每个技能的 `SKILL.md` 开头写 `name` 和 `description`，兼容 Claude 技能格式。
- 新增技能时，在上面的技能目录表里加一行。

## 打包

把一个技能打成可上传给智能体的 zip 包（输出到 `dist/`，不提交）：

```bash
tools/package-skill.sh mining-news/liex-news-push
```

## 安全

本仓库是公开的。**密钥、令牌、群 ID、Webhook 地址、个人联系方式一律不提交**，放在本地 `.env` 或对应平台的后台里；`.gitignore` 已经排除了 `.env` 和常见的密钥文件。

## 许可

MIT，见 [LICENSE](LICENSE)。`liex-news-push` 参考了 AI矿策 的筛选机制，规则文字为重新撰写。
