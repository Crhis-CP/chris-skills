# 经验笔记：去哪找、怎么找

这里记的是实测中积累的经验，**是参考，不是必须执行的步骤**。网站会改版、会拦截，这份笔记会随时更新。最后更新：2026-11-18（12 个智能体实测之后）。

## 一、国家官方公报（必查）

- **按日期打开第一部分：** `https://www.boletinoficial.gob.ar/seccion/primera/年月日`，例如 `.../seccion/primera/20261116`。只有工作日出刊。
- **目录标题常常不写主题：**
  - RIGI 的批准是经济部（MINISTERIO DE ECONOMÍA）的决议，目录里只有编号，要打开正文看；
  - 修改 RIGI 细则的法令，标题只写“Decreto N° 749/2024. Modificación.”；
  - 标题提到 27.742、24.196、26.639、glaciares、exportación 的法令，也要打开看。
- **正文页面的地址格式：** `https://www.boletinoficial.gob.ar/detalleAviso/primera/编号/年月日`。读不到目录里的链接时，用决议编号搜索详情页。
- **网站时好时坏，**有时返回空响应或 503。打不开的条目记下编号，下次巡检再试。RIGI 批准通常会被 Infobae、Ámbito 等媒体报道，可以用 `RIGI aprobó` 加项目名搜索。
- 人事任免、职务延期的条目，一眼就能看出来，不用细读。BCRA 只看 A 类通讯，B 类不用看。

## 二、卡塔马卡本地新闻（必查）

**2026 年 11 月的实测结果**（飞书智能体 1 次，加上 12 个测试智能体）。能不能打开时好时坏，打不开就换一家：

| 来源 | 网址 | 实测情况 |
|---|---|---|
| La Unión | launion.digital | 多数能打开 |
| Reporte del Valle | reportedelvalle.com | 能打开 |
| 卡塔马卡广播电视台 | catamarcartv.com | 多数能打开，偶尔限流 |
| El Ancasti | elancasti.com.ar | 时好时坏，飞书智能体被拦截过 |
| El Esquiú | elesquiu.com | 时好时坏，飞书智能体被拦截过 |
| 卡塔马卡省政府 | catamarca.gob.ar | 多数被拦截 |

**本地新闻最容易漏。** 实测中，卡塔马卡议员的本地采购法案、LIEX 被诈骗的案件，都只登在本地媒体上，大多数测试智能体没找到。找到它们的办法：

- 站内搜索：`site:launion.digital minería`、`site:elancasti.com.ar Liex`、`site:elesquiu.com litio`；
- 搜 LIEX 的名字时，也看外省媒体，比如诈骗案最早见于图库曼省的 Contexto Tucumán。

**都打不开时：** 用搜索找线索，比如 `Catamarca minería`、`Fiambalá`、`Liex`、`Paso San Francisco`、`proveedores mineros Catamarca`，限定最近几天。搜索结果的标题和摘要只能当线索，必须在能打开的原文页面核实后才能推。

## 三、道路和口岸

- 国家道路局（Vialidad Nacional）每天发布卡塔马卡辖区的路况报告，El Esquiú 会转载，标题是“Estado de rutas nacionales en Catamarca”。
- ruta0.com 这类路况聚合网站，内容常常前后矛盾，只能当线索。
- 口岸关闭时，写清是哪一侧关闭。比如 2026-11-17 的报告：口岸因智利一侧积雪关闭，阿根廷一侧 60 号国道可以通行。

## 四、其他有用的来源

- **国会：** 众议院 hcdn.gob.ar、参议院 senado.gob.ar，可以查法案的阶段和表决记录。
- **央行和税务局：** bcra.gob.ar、arca.gob.ar。它们的新规同时刊登在官方公报上，从公报看更方便。
- **全国性媒体：** Infobae、La Nación、Clarín、Ámbito、El Cronista。
- **矿业媒体：** Panorama Minero（panorama-minero.com/en/news）、BNamericas。
- **律所简报：** Marval O'Farrell Mairal、Bruchou & Funes de Rioja、Beccar Varela、Allende & Brea。官方原文打不开时，可以作为交叉核实的来源之一。

## 五、陷阱

- **日期陷阱：** 搜索结果和网页顶部的日期，常常是网站当天的日期。实测中，2022 年和 2024 年的旧文被标成了 2026 年 11 月。一律以正文的发布日期为准。
- **事件日期按事件本身算：** 用事件发生日或官方公布日，媒体报道日不算。比如一项 11 月 5 日的裁定，11 月 15 日才被报道，事件日期仍是 11 月 5 日。
- **同时打开的网页不要超过 3 个，**否则会超时。
- **不要自己推断星期几和节假日。**

## 六、常用检索词

- **LIEX：** `Liex`、`Tres Quebradas`、`Zijin Catamarca`
- **法规：** `Ley de Glaciares`、`Decreto 749/2024 modificación`、`RIGI aprobación`、`Ley 24.196`、`derechos de exportación litio`、`BCRA Comunicación A dividendos`
- **卡塔马卡：** `Catamarca regalías mineras`、`Catamarca litio agua amparo`、`Paso San Francisco`、`Fiambalá`、`Tinogasta minería`
- **劳动与并购：** `AOMA`、`reforma laboral`、`adquisición litio Argentina`
