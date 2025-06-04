#import "../utils/font.typ": use-size

#let summary-block(
  // self
  it,
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

  set list(marker: [□], indent: 24pt)

  // show table.cell: it => {
  //   if calc.odd(it.x) { set fill(lightgray) }
  // }

  it
}

#summary-block()[
  = 本章要点

  == 概念

  - zz
  - zzz
  - #lorem(10)
  - #lorem(11)
  - #lorem(12)
  - 你说的对，但是《原神》是由米哈游自主研发的一款全新开放世界冒险游戏。游戏发生在一个被称作「提瓦特」的幻想世界，在这里，被神选中的人将被授予「神之眼」，导引元素之力。你将扮演一位名为「旅行者」的神秘角色，在自由的旅行中邂逅性格各异、能力独特的同伴们，和他们一起击败强敌，找回失散的亲人——同时，逐步发掘「原神」的真相。

  == 公式

  #table(
    columns: (1fr, 1fr, 1fr),
    [1], [2], [3],
    [4], [5], [6],
  )

  = 延伸阅读

  - 《高分子物理》

  = 课后习题
]
