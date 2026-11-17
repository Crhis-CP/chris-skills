# chris-skills

Chris 的 AI 技能库：按领域分类的可复用 Agent 技能。
Reusable AI agent skills, organized by domain.

## 技能目录

| 领域 | 技能 | 说明 | 状态 |
|---|---|---|---|
| 矿业资讯 `mining-news/` | [liex-news-push](mining-news/liex-news-push/SKILL.md) | 阿根廷 LIEX 公司新闻：筛选、评分，再分精选和非精选推送到飞书 | 草稿：规则已提取，未本地化 |

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

## 安全

本仓库是公开的。**密钥、令牌、群 ID、Webhook 地址、个人联系方式一律不提交**，放在本地 `.env` 或对应平台的后台里；`.gitignore` 已经排除了 `.env` 和常见的密钥文件。

## 许可

MIT，见 [LICENSE](LICENSE)。部分规则来自 AI矿策 和它的上游 AIHOT，来源说明见 [NOTICE](NOTICE)。
