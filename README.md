# chris-skills

Chris 的 AI 技能库。每个技能都可以直接打包上传给智能体使用。
Ready-to-upload AI agent skills.

## 技能目录

### 矿业 Mining

| 技能 | 做什么 | 下载 |
|---|---|---|
| [liex-news-push](skills/liex-news-push/) | LIEX 新闻监测员：全天巡检对 LIEX 经营有传导效应的阿根廷法规政策和经营环境变化，核实后以中文卡片推送到飞书群 | [liex-news-push.zip](https://github.com/Crhis-CP/chris-skills/releases/latest/download/liex-news-push.zip) |

每个技能的使用方法，见它自己文件夹里的 `README.md`。

## 下载

技能包由 GitHub Actions 在每次更新 `main` 分支后自动打包，发布在 [Releases 的“最新技能包”](https://github.com/Crhis-CP/chris-skills/releases/latest)里。

- 下载链接的格式是 `releases/latest/download/<技能名>.zip`，永远指向最新版本，可以直接转发。
- 技能包不含 `evals/`，测试答案不会让智能体看到。

## 目录结构

参照 [Anthropic 官方技能库](https://github.com/anthropics/skills)：

- 技能平铺放在 `skills/` 下；
- 分类写在本页的技能目录和插件清单里，不靠文件夹层级。

完整规则见 [AGENTS.md](AGENTS.md)。

```
skills/
└── <技能名>/
    ├── SKILL.md        给智能体：做什么、流程、规则（开头写 name 和 description）
    ├── README.md       给人：怎么用、怎么测试、怎么维护、版本记录
    ├── references/     给智能体：SKILL.md 引用的详细规则（可选）
    └── evals/          给维护者：测试案例和预期结论（不打进技能包）
template/               新技能的模板，从这里复制
AGENTS.md               仓库规则：放在哪、必须有什么、怎么登记、不许放什么
CLAUDE.md               让 Claude Code 读取 AGENTS.md
.claude-plugin/
└── marketplace.json    插件清单：写明每个技能属于哪个分类
.github/workflows/
└── package-skills.yml  每次更新 main：按 AGENTS.md 检查，通过后自动打包发布
```

**插件清单（marketplace.json）是做什么的：**

- 记录分类，现在只有“矿业 mining”一类；
- 让本仓库可以在 Claude Code 里安装：`/plugin marketplace add Crhis-CP/chris-skills`。

飞书智能体不用它，只用技能包。

## 新增一个技能

1. 复制 `template/` 到 `skills/<技能名>/`。
2. 按 [AGENTS.md](AGENTS.md) 写好 `SKILL.md`、`README.md`、`evals/evals.json`。
3. 在本页技能目录和 `.claude-plugin/marketplace.json` 里登记到对应分类。
4. 推送到 `main`。不合规的会被自动检查拦下，并写明原因；合规的会自动打包发布。

## 安全

本仓库是公开的。

- **密钥、令牌、群 ID、Webhook 地址、个人联系方式、公司内部资料一律不提交**，放在本地 `.env` 或对应平台的后台里。`.gitignore` 已经排除了 `.env` 和常见的密钥文件。
- 自动检查会扫描飞书 Webhook 和 App ID 的格式，发现就中止发布。

## 许可

MIT，见 [LICENSE](LICENSE)。`liex-news-push` 参考了 AI矿策 的筛选机制，规则文字为重新撰写。
