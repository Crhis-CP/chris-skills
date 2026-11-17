# 信源与核实

## 一、信源三级

| 级别 | 是什么 | 用来做什么 |
|---|---|---|
| 第一级：官方一手 | 国家和卡塔马卡省的官方公报，政府部门、ARCA、BCRA、国会、省议会、法院发布的正式文件；紫金矿业的交易所公告 | 确认规定的内容、编号、法律效力、生效日期、适用范围 |
| 第二级：专业机构 | 阿根廷大型律所的客户简报，比如 Marval O'Farrell Mairal、Bruchou & Funes de Rioja、Beccar Varela、Allende & Brea；阿根廷矿业企业家商会（CAEM）等行业组织 | 帮助理解条文；找不到官方原文时作为核实依据之一 |
| 第三级：主流媒体 | 全国性媒体 La Nación、Clarín、Infobae、Ámbito、El Cronista；矿业媒体 Panorama Minero、BNamericas；卡塔马卡本地媒体 El Ancasti、El Esquiú | 发现线索；核实社会事件和地方经营环境；交叉核对 |

专业机构的解读和官方原文不一致时，以官方原文为准。清单用来优先查找，不是白名单；清单外的来源也能用，但同样要过七项核实。

## 二、检索清单（每次巡检按顺序逐项打开）

### 1. 国家官方公报第一部分

- **网址：** `https://www.boletinoficial.gob.ar/seccion/primera/年月日`，例如 `https://www.boletinoficial.gob.ar/seccion/primera/20261116`。
- **频率：** 每个工作日一期。当天第一次巡检时处理当天的一期；首次运行或中断过的，补查过去 7 天每一天的。
- **目录标题常常不写主题**，下面几类条目必须打开正文看：
  - 经济部（MINISTERIO DE ECONOMÍA）的**全部决议**。RIGI 的批准和驳回都在这里，标题只有编号。
  - 行政机关（PODER EJECUTIVO）的法令，标题提到下列编号或词语的：
    - 749/2024（RIGI 实施细则）、27.742（设立 RIGI 的法律）；
    - 24.196、Código de Minería、26.639、glaciares；
    - exportación、derechos de exportación。
  - 矿业秘书处（SECRETARÍA DE MINERÍA）的全部条目。
  - ARCA 的总决议（RESOLUCIÓN GENERAL）。
  - BCRA 的 A 类通讯（Comunicación "A"）。B 类通讯不用看。
- 人事任免、职务延期的正文，看一眼即可跳过。
- 打开正文时，网页打不开（比如返回 503）的，记为“未覆盖”，下次巡检再试。

### 2. 卡塔马卡本地媒体首页

浏览标题，找矿业、锂、Liex、Zijin、Fiambalá、Tinogasta、权益金（regalías）、供应商（proveedores）、道路和口岸。

| 媒体 | 网址 |
|---|---|
| El Ancasti | `https://www.elancasti.com.ar/` |
| 卡塔马卡广播电视台 | `https://catamarcartv.com/` |
| El Esquiú | `https://www.elesquiu.com/`。首页常拒绝自动访问，打不开就搜 `site:elesquiu.com Liex`、`site:elesquiu.com minería` |

### 3. 矿业专业媒体

Panorama Minero：`https://www.panorama-minero.com/en/news`

### 4. 其他官方渠道

有对应的候选时再查，用来核实：

- 国会：众议院 hcdn.gob.ar、参议院 senado.gob.ar；
- BCRA：bcra.gob.ar；
- ARCA：arca.gob.ar；
- 卡塔马卡省政府：catamarca.gob.ar（自动访问常返回 403）；
- 最高法院新闻中心：cij.gov.ar。

### 5. 用议题卡的检索词搜索补漏

搜索结果里的日期只能当线索，必须打开原文核对发布日期。

## 三、法律状态词表

正文写阶段时用中文，第一次出现时括注西语。打分时对照 `SKILL.md` 第 5 步的 B 表。

| 中文 | 西语 |
|---|---|
| 议员个人提案 | proyecto de ley (de autoría de un legislador) |
| 行政机关提交法案 | proyecto de ley del Poder Ejecutivo |
| 委员会出具意见 | dictamen de comisión |
| 一院通过 | media sanción |
| 立法通过 | sanción |
| 颁布；部分否决 | promulgación；veto parcial |
| 公布 | publicación en el Boletín Oficial |
| 生效 | entrada en vigencia |
| 待实施细则 | pendiente de reglamentación |
| 暂缓实施 | suspensión |
| 司法暂停适用 | medida cautelar |
| 宣布违宪 | declaración de inconstitucionalidad |
| RIGI 申报；批准；驳回 | solicitud de adhesión；aprobación；rechazo |

行政文件要写明类型和编号：

- 法令（decreto）、紧急法令（DNU）；
- 决议（resolución）、处置令（disposición）；
- BCRA 的 A 类通讯（Comunicación "A"）；
- ARCA 的总决议（Resolución General）。

## 四、打不开官方原文时

阿根廷部分政府网站会拦截自动访问。打不开时：

1. 先找同一份文件的其他官方入口，比如政府门户的转载、国会的法案页面。
2. 还是打不开的，用两个互相独立的来源交叉核实，其中一个最好是第二级的专业机构。编号、日期、阶段在两个来源里都一致，才算通过 V7。
3. 卡片的来源一行末尾注明“官方原文未能打开”。

两个来源对不上，或者只有一个来源的，不推，代码 V7。

## 五、链接

- 只用本次实际打开过、内容和卡片对应的原文页面。
- 搜索结果页、网站首页、转载聚合页都不能用。
- 不能按网站结构拼接或猜测链接。
- 有官方原文的，官方原文放第一个。
