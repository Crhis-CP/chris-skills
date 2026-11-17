# ② 评分：内容类型 + 五轴 + 噪声类型

**原文**：`source/selection-score-global.md`（评分规则全文）和 `source/analysis-step-score.md`（这一步发给模型的本步指令）。均逐字节复制，未改。

## 模型给什么、不给什么

模型**只**输出：

```json
{"type": "project_development", "sig": 0, "nov": 0, "cred": 0, "reson": 0, "act": 0, "materialUnusable": false, "noise": "none"}
```

模型**不**输出总分、门槛、精选结论、理由。总分由代码按 `03-total-and-threshold.md` 计算。

评分时故意**不告诉模型**：来源名称、信源等级（T1/T1.5/T2）、一手性、以前的分数、精选门槛（原文“评估边界”一节、本步指令）。

## 9 种内容类型（`type`）

| 键 | 中文 |
|---|---|
| `policy_regulation` | 政策监管 |
| `operations_output` | 生产经营 |
| `project_development` | 项目建设 |
| `exploration_resource` | 勘探资源 |
| `capital_ma` | 并购融资 |
| `commodity_market` | 市场价格 |
| `technology_processing` | 技术装备 |
| `safety_environment` | 安全环境 |
| `events_opinion` | 会议观点 |

## 五轴（各 0–10，可到一位小数）

| 键 | 名称 | 一句话 |
|---|---|---|
| `sig` | 实质份量 | 在矿业时间线上是节点、本周变化，还是当天脚注 |
| `nov` | 信息增量 | 带来多少明确的新事实、新数字、新阶段 |
| `cred` | 证据强度 | 材料内部对核心事实的支持强度，不看来源名气 |
| `reson` | 影响面 | 全球 7–10 / 区域或单一市场 4–7 / 局部 0–4，不看事件发生在哪国 |
| `act` | 可用性 | 读者能否据此调整经营、合规或投资动作 |

刻度：0–2 脚注或噪声；3–4 例行；5–6 本周值得知道；7–8 重要节点；9–10 罕见标志性事件。

## 6 种噪声类型（`noise`）

| 键 | 含义 | 总分上限 |
|---|---|---|
| `none` | 不属于下列任何一类 | 不封顶 |
| `out_of_scope` | 与金属矿业无关（独立煤铀砂石、一般新闻） | 30 |
| `event_routine` | 会议、致辞、获奖、人事、例行分红回购、宣传 | 35 |
| `price_tick` | 只报单日涨跌、无基准单位时间窗 | 40 |
| `general_gov` | 与矿业无直接关系的一般政务文件 | 40 |
| `junior_routine` | 大型矿企名单之外的小矿企的例行钻探、资源量、融资、季报等 | 55 |

另：`materialUnusable: true`（标题与正文严重不符或正文残缺）→ 总分上限 30。

## 占位符

| 占位符 | 仓库里的填充值 |
|---|---|
| `{{siteName}}` | 站名（AI-MINE / AI矿策） |
| `{{majorCompanies}}` | `industry/selection.ts` 的 `MAJOR_COMPANIES`，共 37 家，用“、”连接，见下 |

`{{majorCompanies}}` 名单（逐字照抄，顺序不变）：

紫金矿业 Zijin Mining、洛阳钼业 CMOC、江西铜业 Jiangxi Copper、中国五矿 China Minmetals、五矿资源 MMG、中国铝业 Chalco、中国宝武 China Baowu、山东黄金 Shandong Gold、赣锋锂业 Ganfeng Lithium、天齐锂业 Tianqi Lithium、华友钴业 Huayou Cobalt、必和必拓 BHP、力拓 Rio Tinto、嘉能可 Glencore、淡水河谷 Vale、英美资源 Anglo American、自由港麦克莫兰 Freeport-McMoRan、纽蒙特 Newmont、巴里克 Barrick、智利国家铜业公司 Codelco、第一量子 First Quantum、艾芬豪矿业 Ivanhoe Mines、雅宝 Albemarle、智利化工矿业 SQM、南方铜业 Southern Copper、泰克资源 Teck Resources、安托法加斯塔 Antofagasta、福蒂斯丘 Fortescue、南32 South32、诺里尔斯克镍业 Nornickel、伊格尔矿业 Agnico Eagle、金田 Gold Fields、盎格鲁黄金阿散蒂 AngloGold Ashanti、金罗斯 Kinross、西班耶-斯蒂尔沃特 Sibanye-Stillwater、托克 Trafigura、摩科瑞 Mercuria

> 已核对：仓库就是用“、”拼接（`packages/backend/src/editorial/analysis-layout.ts` 第 51 行 `MAJOR_COMPANIES.join("、")`），上面就是模型实际看到的文字。名单原文在 `source/selection.ts` 第 98–136 行。
