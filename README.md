# chris-skills

Chris 的 AI 技能库：可以直接上传给智能体使用的技能包，按类别存放。
Ready-to-upload AI agent skills, organized by category.

## 技能目录

| 类别 | 技能 | 说明 | 状态 |
|---|---|---|---|
| 矿业资讯 `mining-news/` | [liex-news-push](skills/mining-news/liex-news-push/SKILL.md) | 全天巡检对阿根廷 LIEX 经营有传导效应的法规政策和经营环境变化，核实后以“精选 + 分数”卡片推送到飞书群 | 可用：提示词见 [PROMPT.md](skills/mining-news/liex-news-push/PROMPT.md)，设计记录见 [LOCALIZATION.md](skills/mining-news/liex-news-push/LOCALIZATION.md) |

## 目录约定

```
skills/
└── <类别>/
    └── <技能名>/
        ├── SKILL.md        技能说明：做什么、什么时候用、流程、输出格式
        ├── PROMPT.md       贴给智能体的提示词（可选）
        ├── references/     技能用到的规则、资料（可选）
        └── scripts/        技能用到的代码（可选）
```

- 所有技能都放在 `skills/` 下，先按类别分文件夹，再放技能。类别和技能文件夹都用小写英文加连字符，例如 `skills/mining-news/liex-news-push/`。
- 只放能直接上传给智能体使用的技能。设计记录（`LOCALIZATION.md`、`BRIEF.md`）留在技能文件夹里，但不打进技能包。
- 每个技能的 `SKILL.md` 开头写 `name` 和 `description`，兼容 Claude 技能格式。
- 新增技能时，在上面的技能目录表里加一行。

## 打包

把一个技能打成可上传给智能体的 zip 包（输出到 `dist/`，不提交）：

```bash
tools/package-skill.sh skills/mining-news/liex-news-push
```

## 安全

本仓库是公开的。**密钥、令牌、群 ID、Webhook 地址、个人联系方式一律不提交**，放在本地 `.env` 或对应平台的后台里；`.gitignore` 已经排除了 `.env` 和常见的密钥文件。

## 许可

MIT，见 [LICENSE](LICENSE)。`liex-news-push` 参考了 AI矿策 的筛选机制，规则文字为重新撰写。
