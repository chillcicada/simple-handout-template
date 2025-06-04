#import "../utils/font.typ": use-size

/// = Examples
///
/// ```typ
/// #summary-block(
///   notion: [
///     - 流变学的概念、分支和研究体系
///     - 聚合物流变学的研究对象、基本概念和研究方法
///     - 流变学在聚合物加工中的应用
///   ],
///   equation: table(
///     table.header([涵义], [公式], [索引]),
///     [1], [2], [3],
///     [4], [5], [6],
///   ),
///   reference: [
///     - 《高分子物理》
///   ],
/// )
/// ```
#let summary-block(
  // self
  notion: [],
  equation: [],
  reference: [],
) = {
  show heading: it => {
    if (it.level == 1) {
      block(
        width: 100%,
        fill: black,
        text(
          it,
          white,
          size: use-size("四号"),
        ),
        inset: (left: 8pt, y: 4pt),
        below: 16pt,
      )
    } else {
      block(
        text(
          it,
          size: use-size("小四"),
        ),
        inset: (left: 24pt),
      )
    }
  }

  set list(marker: [☐], indent: 24pt)

  set table(
    columns: (1fr, 1fr, auto),
    stroke: none,
    fill: (x, y) => if calc.even(y) { luma(220) },
    align: center + horizon,
  )

  [
    = 本章要点

    == 概念

    #notion

    == 公式

    #equation

    = 延伸阅读

    #reference
  ]
}
