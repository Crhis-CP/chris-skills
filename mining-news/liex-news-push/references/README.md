# AI矿策 筛选与评分规则包（原样提取，未做本地化）

- 提取来源：AI-MINE 仓库 `main` 提交 `3a540722582036bc61ebb90923ca28d81d3be40c`（2026-11-17）
- 提取方式：只读复制，仓库一个字没改
- 生效口径：线上缺省规则组 `global`（Owner 2026-11-13 决定，决定台账“DEC-78补充·新评分规则先上线再对比”）
- 用途：作为飞书智能体（阿根廷 LIEX 新闻推送）的规则底稿，后续再做本地化改造

## 目录

| 文件 | 内容 | 性质 |
|---|---|---|
| `01-prefilter.md` | 第一步：判断是否属于金属矿业（PASS / BLOCK / UNKNOWN） | 说明 + 指向原文 |
| `02-score.md` | 第二步：模型给内容类型、五轴分、噪声类型；含占位符的填充值 | 说明 + 指向原文 |
| `03-total-and-threshold.md` | 第三、四步：代码里的权重表、噪声封顶、门槛、二次打分，翻译成文字和表格 | 翻译（原文是代码） |
| `04-representative.md` | 多篇报道同一件事时选哪篇当代表 | 翻译（原文是代码） |
| `05-argentina-geography.md` | 第五步：一条新闻什么时候算“阿根廷的” | 原文摘录 + 翻译 |
| `06-localization-notes.md` | 你这次说的偏好、我发现的需要改造的地方 | 待你决定 |
| `source/` | 8 个仓库文件逐字节复制，SHA-256 见下表 | 原样 |

## 整条流程

```
新闻进来
  │
  ① 预筛（模型）── BLOCK ──→ 丢弃（不是金属矿业）
  │            └─ UNKNOWN ─→ 留着等补材料，不丢
  │ PASS
  ② 评分（模型）：9 类内容类型选 1 + 五轴各 0–10 分 + 噪声类型
  │
  ③ 算总分（代码）：五轴 × 该类型的权重，相加得 0–100；按噪声类型和“材料残缺”封顶
  │
  ④ 门槛（代码）：按信源等级 T1 62 / T1.5 64 / T2 66
  │   第一次分数离门槛 ≤15 分 → 再独立打一次，取平均
  │   平均分 ≥ 门槛 → 精选；否则 → 只进“全部”（总分 <20 的默认不显示）
  │
  （同一件事多篇报道 → 归成一组，选一篇代表）
  │
  ⑤ 阿根廷归属（模型抽取 + 代码核对原文引句）：
      只有“事件发生地 / 规则适用地 / 明示受影响地”是阿根廷，才进阿根廷页面
      总部、发文机关所在地、背景提及都不算
```

关键点：**模型只给五轴分，总分、封顶、门槛、平均都是代码算的。** 飞书智能体没有这段代码，所以 `03-total-and-threshold.md` 把它翻成了可以照着执行的规则；本地化时要决定由谁来算（见 `06-localization-notes.md`）。

## 原文文件与校验值

| 原文件（仓库路径） | 对应步骤 | SHA-256 |
|---|---|---|
| `industry/prompts/prefilter-four-layers.md` | ① 预筛（现行） | `9343024996c4f8b289e4933223cece7c82b937fe93655ae1c78378d96773c304` |
| `industry/prompts/selection-score-global.md` | ② 评分（现行） | `48fc31e0d06e7989ae670beec73c122ce5ca0dc3ade9903879e06e6a237a604e` |
| `industry/prompts/analysis-step-score.md` | ② 评分那一步发给模型的本步指令 | `6048faf425435a26317779e148e1e76bba41936c38003a6f88eae7263bffb148` |
| `industry/selection.ts` | ③④ 权重、封顶、门槛、大型矿企名单 | `1509fa0cd1a460b7dba292025628ee0ac516a1307b42bfb7bb8cee8e899e793a` |
| `packages/backend/src/publication/representative.ts` | 同一事件选代表 | `e9c522ad44afb0675a68130b638ea0643697236263f515c21f94e719584a8f0f` |
| `industry/prompts/structure.md` | ⑤ 法域抽取（第五节） | `25f6f35df94c2801aa72eea13e0322c95773a1547c67a2621eee33d3faa02386` |
| `industry/prompts/selection-country-ar.md` | 阿根廷视角评分（**仅评测，未生效**） | `7fa71903ea5268d5215ecff60a0e39b7a1b03cfef04d596d7755a77123a7888d` |
| `industry/prompts/selection-score-b.md` | 上一行引用的底稿（**未生效**） | `0d5feb85276ff48b00983d08ac8970a0b5854ae7a2cdf12099f851b0ed866062` |

核对命令（在本目录下）：`sha256sum source/*`

## 许可

AI-MINE 是 MIT 许可（版权人 Chirs Codex）。`source/selection-score*.md` 和 `source/selection.ts` 是从上游 AIHOT（MIT，版权人“数字生命卡兹克”）改造来的，所以本仓库根目录的 `LICENSE` 保留了一行 AIHOT 版权声明。
