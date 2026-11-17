# chris-skills

Chris 的 AI 技能库。每个技能都可以直接打包上传给智能体使用。
Ready-to-upload AI agent skills.

## 技能目录

### 矿业 Mining

| 技能 | 做什么 | 下载 |
|---|---|---|
| [liex-news-push](skills/liex-news-push/) | LIEX 经营环境信息员：全天巡检对 LIEX 经营有传导效应的阿根廷法规政策和经营环境变化，核实后以中文卡片推送到飞书群 | [liex-news-push.zip](https://github.com/Crhis-CP/chris-skills/releases/latest/download/liex-news-push.zip) |

每个技能的使用方法，见它自己文件夹里的 `README.md`。

## 下载

技能包由 GitHub Actions 在每次更新 `main` 分支后自动打包，发布在 [Releases 的“最新技能包”](https://github.com/Crhis-CP/chris-skills/releases/latest)里。

- 下载链接的格式是 `releases/latest/download/<技能名>.zip`，永远指向最新版本，可以直接转发。
- 技能包不含 `evals/`，测试答案不会让智能体看到。

## 目录结构

参照 [Anthropic 官方技能库](https://github.com/anthropics/skills) 的做法：技能平铺放在 `skills/` 下，分类写在本页的技能目录和 `.claude-plugin/marketplace.json` 里，不靠文件夹层级。这样调整分类时不用搬文件，下载链接也不会变。

```
skills/
└── <技能名>/
    ├── SKILL.md        给智能体：做什么、流程、规则（开头写 name 和 description）
    ├── README.md       给人：怎么用、怎么测试、怎么维护、版本记录
    ├── references/     给智能体：SKILL.md 引用的详细规则
    └── evals/          给维护者：测试案例和预期结论（不打进技能包）
.claude-plugin/
└── marketplace.json    分类清单，也让本库可以在 Claude Code 里作为插件市场安装
.github/workflows/
└── package-skills.yml  自动打包和发布
```

## 新增一个技能

1. 在 `skills/` 下新建文件夹，名字用小写英文加连字符。
2. 写 `SKILL.md`、`README.md`。规则多的话，拆到 `references/`。
3. 在 `evals/evals.json` 里写测试案例，格式和 Anthropic 的 skill-creator 一致：每个案例有 `prompt`、`expected_output`、`expectations`。
4. 在本页技能目录的对应分类下加一行；在 `.claude-plugin/marketplace.json` 的对应分类里加上路径。没有合适的分类就新建一个。
5. 推送到 `main`，技能包会自动打包发布。

## 安全

本仓库是公开的。

- **密钥、令牌、群 ID、Webhook 地址、个人联系方式、公司内部资料一律不提交**，放在本地 `.env` 或对应平台的后台里。`.gitignore` 已经排除了 `.env` 和常见的密钥文件。
- 自动打包时会扫描飞书 Webhook 和 App ID 的格式，发现就中止发布。

## 许可

MIT，见 [LICENSE](LICENSE)。`liex-news-push` 参考了 AI矿策 的筛选机制，规则文字为重新撰写。
