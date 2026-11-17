# 仓库规则

给所有往本仓库放技能、改技能的 agent 和人看。结构参照 [Anthropic 官方技能库](https://github.com/anthropics/skills)。

下面带“自动检查”标记的规则，由 `.github/workflows/package-skills.yml` 在每次推送到 `main` 时检查。不合规的，技能包不会发布。

## 一、放在哪

```
skills/<技能名>/          每个技能一个文件夹，全部平铺在 skills/ 下
template/                新技能的模板，从这里复制
.claude-plugin/marketplace.json   分类清单
README.md                技能目录（按分类列出）
```

- **不按分类建文件夹**。分类只写在根目录 `README.md` 的技能目录和 `marketplace.json` 里。这样调整分类时不用搬文件，下载链接也不会变。
- **技能名**：小写英文、数字和连字符，不超过 64 个字符，例如 `liex-news-push`。技能名必须和文件夹名一致。【自动检查】
- 根目录不新增其他文件夹。工具类脚本放在用到它的技能的 `scripts/` 里。

## 二、一个技能必须有什么

| 文件 | 必须 | 给谁 | 写什么 |
|---|---|---|---|
| `SKILL.md` | 是【自动检查】 | 智能体 | 开头的 `name` 和 `description`（见下）；正文是做什么、流程、规则 |
| `README.md` | 是【自动检查】 | 人 | 做什么、怎么用；如果要在某个平台上新建智能体，附上创建时填写的介绍；还有怎么测试、怎么维护、版本记录 |
| `evals/evals.json` | 是【自动检查】 | 维护者 | 测试案例和预期结论，不打进技能包 |
| `references/` | 否 | 智能体 | `SKILL.md` 放不下的详细规则，从 `SKILL.md` 里指明什么时候读哪个文件 |
| `scripts/` | 否 | 智能体 | 技能要执行的代码 |

### `SKILL.md` 开头的字段【自动检查】

```
---
name: 技能名，和文件夹名一致
description: 做什么、什么时候用。不超过 1024 个字符
---
```

### 正文的写法

- 不超过 500 行；超过的拆到 `references/`。
- 先说清为什么这样做，再说怎么做。智能体理解了原因，在规则没写到的情况下也能做对。
- 难的判断尽量事先写成表格、清单和例子，让不同模型都能得出同样的结论。不要依赖模型凭感觉打分。

### `evals/evals.json` 的格式【自动检查】

和 Anthropic 的 skill-creator 一致。至少 5 个案例，既要有“应该做”的，也要有“不应该做”的。

```json
{
  "skill_name": "技能名",
  "evals": [
    {
      "id": 1,
      "prompt": "发给智能体的话",
      "expected_output": "预期结论",
      "files": [],
      "expectations": ["可以逐条核对的判断，例如：结论为不推"]
    }
  ]
}
```

## 三、登记【自动检查】

新增技能时，两处都要登记：

1. 根目录 `README.md` 的技能目录：在对应分类下加一行，链接写成 `skills/<技能名>/`。
2. `.claude-plugin/marketplace.json`：在对应分类的 `skills` 列表里加上 `./skills/<技能名>`。

没有合适的分类时，两处同时新建：

- `README.md` 加一个 `### 中文名 English` 标题；
- `marketplace.json` 加一个分类条目，`name` 用小写英文。

**现有分类：**

| 分类 | `marketplace.json` 里的 name |
|---|---|
| 矿业 Mining | `mining` |

## 四、改动流程

1. 改规则。
2. 重跑 `evals/evals.json`，至少用一个较弱的模型跑。新发现的问题，补成测试案例。
3. 在技能 `README.md` 的版本记录里加一行。
4. 推送到 `main`。自动检查通过后，技能包会自动打包，发布到 Releases 的“最新技能包”。

## 五、不许放的

本仓库是公开的，下面这些不许提交：

- 密钥、令牌、App ID、App Secret、群 ID、Webhook 地址【自动检查飞书格式】；
- 个人联系方式；
- 公司内部资料，比如内部清单、真实回测用的内部事件；
- 照抄的他人受版权保护的文字。参考别人的规则时，要用自己的话重写，并在技能 `README.md` 里注明出处。
