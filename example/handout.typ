#import "imports.typ": define-config, summary-block, use-size, tablem
#import "unit.typ": *

/// 以下字体配置适用于安装了 Windows 10/11 字体及 Windows 10/11 简体中文字体扩展的设备，
/// 请勿修改 font-family 中定义的键值，一般情况下，其含义为：
/// - SongTi: 宋体，正文字体，通常对应西文中的衬线字体
/// - HeiTi: 黑体，标题字体，通常对应西文中的无衬线字体
/// - KaiTi: 楷体，用于说明性文本和主观性的表达
/// - FangSong: 仿宋，通常用于注释、引文及权威性阐述
/// - Mono: 等宽字体，对于代码，会优先使用此项，推荐中文字体使用黑体或楷体，或者一些流行的中文等宽字体
/// - Math: 数学字体，通常用于数学公式和符号，中文字体默认使用楷体
#let font-family = (
  SongTi: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "NSimSun",
  ),
  HeiTi: (
    (name: "Arial", covers: "latin-in-cjk"),
    "SimHei",
  ),
  KaiTi: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "KaiTi",
  ),
  FangSong: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "FangSong",
  ),
  Mono: (
    (name: "DejaVu Sans Mono", covers: "latin-in-cjk"),
    "SimHei",
  ),
  Math: (
    "New Computer Modern Math",
    "KaiTi",
  ),
)

#let (
  /// entry options
  twoside,
  use-font,
  /// layouts
  meta,
  doc,
  front-matter,
  main-matter,
  back-matter,
  /// pages
  font-display,
  cover,
  preface,
  outline-wrapper,
  notation,
  figure-list,
  table-list,
  equation-list,
  bilingual-bibliography,
) = define-config(
  info: (
    title: (
      title: "高 分 子 流 变 学 讲 义",
      subtitle: "Polymer Rheology",
    ),
    authors: (
      (
        name: "作者1",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者2",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者3",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者4",
        email: "example@mails.tsinghua.edu.cn",
      ),
    ),
    version: "0.3.0",
  ),
  font: font-family,
  bibliography: bibliography.with("refs.bib"),
)

/// Document Configuration
#show: meta

/// Font Display Page
// #font-display()

/// Cover Page
#cover(display-version: true)

/// After Cover Layout, basical layout for Front Matter, Main Matter and Back Matter
#show: doc

/// ------------ ///
/// Front Matter ///
/// ------------ ///

#show: front-matter

// Preface Page
#preface(date: datetime(year: 2025, month: 5, day: 1))[
  #include "preface.typ"
]

// Outline Page
#outline-wrapper()

/// ----------- ///
/// Main Matter ///
/// ----------- ///

#show: main-matter

/// Chapter 1

= 绪论

== 流变学的概念、分支和研究体系

流变学（_Rheology_）的概念最早由美国物理化学家宾汉（E. C. Bingham）提出，其词根 _*Rhe-*_ 源自古希腊语中的 _*flow*_，由此可见，流变学与流动过程密不可分，而广义上讲，流变学本身则是研究材料#text(red)[*流动*]（_Flow_）规律与#text(red)[*变形*]（_Deformation_）规律的科学分支。

很久以来，流动与变形一直被视为两个独立的概念：流动描述液体的粘性行为，为液体材料的性质，液体在流动过程中产生不可逆形变并伴随能量的耗散；变形则是固体材料的属性，描述固体的弹性行为，在变形过程中，其形变可随外力撤除而恢复，具有能量储存与释放的弹性记忆效应。在定量表征层面，牛顿流体遵循剪切应力与剪切速率线性相关的定律（$sigma = eta_0 dot(gamma)$），非牛顿流体的剪切应力与剪切速率的关系较为复杂，但无论是牛顿流体还是非牛顿流体，其流动过程均具有时间依赖性，需在有限时间尺度内观测；而固体材料则服从胡克定律（$sigma = E ε$），其应力-应变响应呈现瞬时特性。这种本质差异揭示了材料相态与力学响应的深刻联系，为流变学研究奠定了理论基础。

作为一门综合了理论和实验的学科，对流变学的研究讨论离不开对材料的研究讨论，广义上讲，流变学的研究对象涵盖气体、液体、固体乃至各种组成复杂的软物质，但在现实中，最早的流变学研究都源自实践的需要，我们通常也只对个别具有代表性和重要性的材料进行深入讨论，基于此，流变学的分支体系逐渐形成，主要分为以下几个核心领域：生物流变学/血液流变学（侧重于血液、细胞和各种软组织）、食品流变学（研究食品的流动和变形特性）、聚合物流变学（专注于高分子材料的流动行为）、地质流变学（研究地壳物质的流动与变形）、石油流变学（涉及油气开采和输送中的流体行为）以及悬浮液/胶体流变学（研究悬浮液和胶体的流动特性）等。这些领域不仅反映了流变学的多样性，也体现了其在工业、医学、环境科学等多个领域的重要应用。

== 聚合物流变学

从上面的讨论，我们知道，聚合物流变学是专注于研究高分子材料流动行为的流变学分支。聚合物流变学聚焦于高分子材料在加工过程中的流动特性，并深入探究此类行为与材料结构、物理化学性质之间的内在关联。其研究对象主要包括聚合物熔体和溶液，这些材料在流动过程中展现出独特的非线性黏弹行为。

其他复杂流体相比，聚合物的化学结构和组成较为明确，分子结构容易设计和表征，因而聚合物流变学也是研究得最深入、成熟的流变学分支之一，此外，聚合物流变学的研究成果和研究手段也为其他流变学分支提供了重要的理论基础和实验方法，因而聚合物流变学在流变学研究体系中占据着核心地位。

#align(
  center,
  block(
    width: 90%,
    fill: luma(245),
    outset: (x: 1em, y: .5em),
    radius: 0.5em,
    text(
      font: "KaiTi",
      size: use-size("小四"),
      align(left)[
        中国科学院长春应用化学研究所殷敬华和栾世方研究组*根据高分子流变学理论*，对医用导管挤出过程开展了深入、系统的研究，阐明了拉伸对导管挤出过程中流量与变形的影响规律，明晰了拉伸作用下医用导管挤出流场及变形对口模温度、螺杆转速、牵引速度等的依赖关系。同时，他们对医用导管挤出拉伸流动过程进行数值分析、挤出变形控制及有限元分析，#text(blue)[*构建了#underline[高端医用导管原料分子结构参数-加工流变行为-精密挤出成型结构]间的关系，达到高端医用导管对尺寸精度控制稳定性的要求，从而解决了我国医用导管尺寸精度低、异形管特殊加工成型水平有限等共性难题。*]

        #text(
          size: use-size("五号"),
          align(right)[——国家自然科学基金委员会、中国科学院，中国学科发展战略：高分子流体动力学。],
        )
      ],
    ),
  ),
)

=== 聚合物流变学的研究对象

聚合物流变学的研究对象主要包括高分子熔体、高分子溶液以及胶乳、粉体粒料、填充体等高分子产品，如下图所示：

#figure(
  image("media/chapter1/聚合物流变学研究对象.png", height: 2.2cm),
  caption: [聚合物流变学的研究对象],
)

=== 聚合物流变学的基本概念

*聚合物流变行为的基本特征是粘弹性*，这也是本课程中最为重要的概念。

科学上表征粘弹性的主要物理量是 Deborah 数，由以色列学者 M. Reiner 于 1964年提出。Deborah 数同时也是一个无量纲数，其物理含义为物体的松弛时间与形变过程时间的比值，即：

$
  "De" = lambda / t
$ <dehorah>

其中 $lambda$ 为物体的松弛时间（Relaxation time），有时也用 $tau$ 来表示，物体的松弛时间通常是特异性的，反映材料本身的固有属性，代表材料内部结构（响应应力或应变变化所需的时间尺度；$t$ 为形变过程的时间，在稳态过程中，也即观测时间，而在振荡过程中，形变过程时间通常为一个振荡周期的时间。

对于松弛（Relaxation），严格的定义为*（受到扰动后的）体系从非平衡态逐渐恢复到平衡态的过程*，也称为弛豫过程。

最简单的松弛过程是 Maxwell 模型描述的松弛过程，为：

$
  (dif X) / (dif t) = - (X - X_0) / lambda
$ <relaxation>

其中 $X$ 表征体系的非平衡状态，$X_0$ 表示体系的平衡状态。在过程中，体系恢复平衡态的速率只与体系当前的状态有关，而与时间等物理量无关。

将@eqt:relaxation 积分可得：

$
  X - X_0 = C e^(- t slash lambda)
$

其中 $C$ 为常数。若 $X_0 = 0$ 则有 $X = C exp(t slash lambda)$；假设 $t = 0$ 时 $X = 0$，可得 $C = - X_0$，此时 $X = X_0(1 - exp(t slash lambda))$。

室温下不同材料的松弛时间如下表所示：

#figure(
  table(
    columns: (auto, auto),
    [水], [$10^(-12) "s"$],
    [高分子 硅橡胶], [$~ min$],
    [岩石], [$10^3 "y"$],
    [玻璃], [$> 100 "y"$],
  ),
  caption: [室温下不同材料的松弛时间],
)

需要注意的是，在聚合物中，由于不同空间尺度下体系存在不同的结构，因而会表现出不同的松弛时间，即聚合物通常有多个松弛时间乃至一个松弛时间域。

=== 聚合物流变学的研究方法：宏观、微观、流变测量学

+ 宏观流变学（又叫唯象流变学、加工流变学）

  宏观上，聚合物材料会表现出即具有粘性又具有弹性的特征，因而可以用相应的物理量进行描述，如粘度$eta$、剪切应力$tau$、拉伸应变$epsilon$、温度$T$、时间$t$等，我们可以采用连续介质力学理论建立物质的应力－应变关系，建立本构方程对其进行描述。

+ 微观流变学（又叫结构流变学）

  研究#text(blue)[流变学性质与其微观结构]－分子链结构、聚集态结构之间的联系

+ 流变测量学

  通过各种仪器测定材料参数和物理函数，#text(blue)[通过可测量的物理量]（流量$Q$、压力差$Delta P$、转速$omega$、扭矩Torque）#text(blue)[获得不可直接测量的流变量]（剪切速率、剪切应力、粘度、法向应力差系数等）。

=== 流变学在聚合物加工中的应用

#figure(
  image("media/chapter1/聚合物流变学的实际应用.png", height: 7cm),
  caption: [聚合物流变学的实际应用],
)

+ 指导聚合物树脂的聚合和选用，以获得加工性能优良的聚合物;

  流变学指导手机防摔膜的材料设计

+ 指导配方设计、加工方法和加工工艺的选择;

  指导3D打印的配方和工艺设计

+ 指导加工机械和模具的设计。

  层叠倍增挤出几十上百层复合膜，用作液晶显示器的反射膜

#summary-block(
  notion: [
    - 流变学是一种世界观（万物皆流、时间尺度）和方法论；
    - 聚合物流变学有用、有趣、有挑战；
    - 粘弹性是聚合物流变行为的基本特征。
  ],
  equation: table(
    table.header([涵义], [公式], [索引]),
    [Deborah 数], [$ "De" = lambda / t $ <->], [@eqt:dehorah],
  ),
  reference: [
    - 国家自然科学基金委员会、中国科学院，中国学科发展战略：高分子流体动力学。科学出版社
  ],
)

/// Chapter 2
= 聚合物在流场中的流动

== 基本概念

=== 流场

*剪切流动*：速度梯度方向与流动方向垂直；

*拉伸流动*：速度梯度方向与流动方向相同。

高聚物熔体或浓溶液在挤出机、注射机的流动都属于剪切流。

剪切流场包括：

+ *平行直线剪切流场*

  *拖曳流*（drag flow）: 一个部件相对于另一个部件作相对运动导致的流动

  *压力流*（poissuille flow）:流体边界静止，压力降导致的流动

+ *同心圆式剪切流场*

=== 应变、应力

*对于剪切：*

#figure(image("media/chapter2/剪切应变.png", width: 150pt), caption: [剪切应变])

剪切应变

$
  gamma = S / d=tan theta
$ <剪切应变>

剪切速率：单位时间内的剪切应变

定义式

$
  dot(gamma)= (dif gamma) / (dif t)
$ <剪切速率>

对于平行直线流场，剪切速率等于垂直于流动方向上的速度梯度

$
  dot(gamma)= (dif v_x) / (dif y)
$

对于同心圆流场，

$
  dot(gamma)= r (dif omega) / (dif r)
$

推导：#figure(image("media/chapter2/同心圆流场剪切应变推导.png", width: 200pt), caption: [同心圆流场剪切应变推导])\

剪切应力：单位面积上的剪切力

定义式：

$
  tau = F / A
$ <剪切应力>

#figure(image("media/chapter2/拉伸应变.png", width: 200pt), caption: [拉伸应变])

*对于拉伸：*

Hencky拉伸应变（真应变）：

$
  epsilon = integral_(l_0)^l (dif l) / l = ln l / l_0
$ <Hencky拉伸应变>

拉伸应变速率：

$
  dot(epsilon)=(dif ln l / l_0) / (dif t)=1 / l dot (dif l) / (dif t)
$ <拉伸应变速率>

工程拉伸应变：

$
  (Delta l) / l_0
$ <工程拉伸应变>

拉伸应力：习用应力：

$
  sigma = F / A_0
$ <习用拉伸应力>

真实应力:

$
  sigma = F / A
$ <真实拉伸应力>

=== 粘度

*剪切粘度*：剪切应力和剪切速率的比值，称为剪切粘度，也叫表观粘度，通常简称为粘度

定义式

$
  eta_a=tau / dot(gamma)
$ <剪切粘度>

物理意义：流体抵抗流动变形的能力称为粘度，反映流体内摩擦阻力的大小

量纲: $Pa dot "s"$

零切粘度：剪切速率趋于零时的粘度：

$
  eta_0=lim_(dot(gamma)→0) tau / dot(gamma)
$ <零切粘度>

微分粘度（稠度）：

$
  eta_c=(dif tau) / (dif gamma)
$ <微分粘度>

表观粘度对应的是流动曲线上某点割线的斜率，微分粘度对应流动曲线上某点切线的斜率。

*拉伸粘度*：

$
  eta_T=sigma / dot(epsilon)
$ <拉伸粘度>

拉伸粘度与剪切粘度关系

对于牛顿流体，单轴拉伸：

$
  eta_T=3 eta_a
$ <单轴拉伸>

双轴拉伸：

$
  eta_T=6 eta_a
$ <双轴拉伸>

== 非牛顿流体及流变方程

*牛顿流体：粘度不随剪切应力和剪切速率的大小而改变，始终保持常数的流体。*

=== 非牛顿流体划分

(1) 按照粘度随剪切速率的变化

#figure(image("media/chapter2/流体粘度随剪切速率变化关系图.png", width: 400pt), caption: [流体粘度随剪切速率变化关系图])

*假塑性流体*：剪切变稀（shear thinning)且没有屈服应力。

大多数聚合物流体属于假塑性流体

*塑性流体（宾汉流体）*：塑性和弹性相对，指在应力超过一定限度（屈服应力）的条件下，材料不断裂而继续变形，在外力去掉后还能保持一部分残余变形的性质。

*胀塑性流体*：剪切增稠，其表观粘度随切变速率的增大而增大。

(2) 按照粘度随时间的变化规律

#figure(image("media/chapter2/流体粘度随时间变化关系图.png", width: 250pt), caption: [流体粘度随时间变化关系图])

+ *触变性* (thixotropic)：一定剪切速率，随时间增加，$eta$下降
+ *震凝性* (rheopectic)：一定剪切速率，随时间增加，$eta$上升

滞后环：剪切速率由0上升到某个值，然后降低到0，这样一个过程中应力曲线围成的一圈的面积

=== 非牛顿流体的表征

假塑性和胀塑性流体的流动曲线都是非线性的，用指数关系描述其剪切应力和剪切速率的关系。

*幂律公式*(Ostwald-de Waele模型)：

$
  tau=K gamma^n
$ <幂律方程>

其中，$K$为稠度系数（consistency index），$n$为流变指数（power-law index），或称非牛顿指数。

适用范围：同一种材料，在不同的剪切速率范围内，$n$ 值也不是常数，只在某一不大的剪切速率范围内，$n$ 近似为常数；不适用于很低和很高剪切速率。

=== 聚合物普适流动曲线

#figure(image("media/chapter2/聚合物普适流动曲线图.png", width: 200pt), caption: [聚合物普适流动曲线图])

*第一牛顿区*：零切粘度，反映材料在没有外力的平衡态下的性质

微观解释：高分子处于高度缠结的拟网结构，流动阻力大，缠结结构的破坏速度等于形成的速度，粘度保持不变，且最高。

*假塑性区(非牛顿区)*：随切变速率增加，表观粘度值变小。通常聚合物流体加工成型时的变速率正在这一范围内

微观解释：切变速率增大，缠结结构被破坏，破坏速度大于形成速度，粘度减小，表现出假塑性流体行为。

*第二牛顿区*：无穷切粘度或极限粘度，通常观察不到

微观解释：切变速率继续增大，高分子中缠结结构被完全破坏，来不及形成新的缠结，体系粘度恒定，表现牛顿流动行为。

*普适粘度曲线拟合公式*

Bird-Carreau模型：

$
  eta &= eta_0 / [1 + (lambda dot(gamma))^2]^((1-n) / 2) \
  dot(gamma) -> 0: & quad eta = eta_0 \
  dot(gamma)>> 1 / lambda: & quad eta approx dot(gamma)^(n - 1) quad "相当于幂律方程"
$ <Bird-Carreau模型>

Carreau-Yasuda模型：

$
  (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / [1 + (lambda dot(gamma))^a]^((1 - n) / a)
$ <Carreau-Yasuda模型>

Cross模型:

$
  (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / (1 + (lambda dot(gamma))^m)
$ <Cross模型>

Modified Cross模型:

$
  eta = eta_0 / (1 + (eta_0 dot(gamma) slash tau)^m)
$ <Modified-Cross模型>

== 聚合物流体通过管形口模和缝模的流动

=== 在圆管中流动

==== 牛顿流体

*假设条件*：

+ 流体为稳态层流（稳态意味着各点速度不随时间变化），速度方向平行于流动方向
+ 液体为不可压缩
+ 流动是等温过程
+ 液体在壁面无滑动（壁面流体速度为0）
+ 粘度不随时间变化

*剪切应力分布*

在圆管内取一个半径为r的圆柱形液体进行受力分析 :

$
  Delta p ⋅ pi r^2 - tau_r⋅ 2 pi r L = 0
$

$
  tau_r=Delta p / (2L)⋅ r
$

*速度分布*：

$
  tau = eta dot(gamma) \
  dot(gamma)= -(dif v_r) / (dif r) \
  dot(gamma)= tau_r / eta = (Delta P) / (2eta L) dot r \
  -dif v_r = (Delta P) / (2eta L) dot r dif r \
  integral_(v_r)^0 -dif v_r = integral_r^R (Delta P) / (2eta L) dot r dif r \
  v_r = (Delta P) / (4eta L) dot (R^2 - r^2) \
$

$
  v_0 &= (Delta P) / (4eta L) dot R^2 \
  v_r &= v_0 dot (1 - r^2 / R^2)
$

*体积流率*：

$
  Q = integral_0^R v_r dot 2pi r dif r = (Delta P pi R^4) / (8eta L)
$ <圆管中牛顿流体体积流率>

==== 非牛顿流体

$
  tau_r &= k dot(gamma)^n = (Delta p r) / (2L) \
  dot(gamma) &= -(dif v_r) / (dif r) = ( (Delta p r) / (2K L) )^(1 / n)
$

$
  v_r
  &= integral_r^R dot(gamma) dif r \
  &= ( (Delta p) / (2K L) )^(1 / n) dot n / (n+1) dot ( R^((n+1) / n) - r^((n+1) / n) ) \
  &= ( (Delta p R) / (2K L) )^(1 / n) (n R) / (n+1) [1 - (r / R)^((n+1) / n)]
$

$
  v_0 = (n R) / (n+1) ( (Delta p R) / (2K L) )^(1 / n) \
  v_r = n / (n+1) ( (Delta P) / (2k L) )^(1 / n) ( R^((n+1) / n) - r^((n+1) / n) ) = v_0 [1 - ( r / R )^((n+1) / n)]
$

体积流率：

$
  Q
  &= integral_0^R 2pi r dif r dot v_r \
  &= integral_0^R 2pi ( (Delta p) / (2K L) )^(1 / n) n / (n+1) ( R^((n+1) / n) dot r - r^((2n+1) / n) ) dif r \
  &= 2pi ( (Delta p) / (2K L) )^(1 / n) n / (n+1) ( R^((3n+1) / n) / 2 - n / (3n+1) R^((3n+1) / n) ) \
  &= (pi n R^3) / (3n+1) ( (Delta p R) / (2K L) )^(1 / n) \
$ <圆管中非牛顿流体体积流率>

$
  overline(v) &= Q / (pi R^2) = (n R) / (3n+1) ( (Delta p R) / (2K L) )^(k n) = (n+1) / (3n+1) v_0^2 \
  v_r &= overline(v)dot (3n+1) / (n+1) [1 - (r / R)^((n+1) / pi)]
$

管壁处剪切速率：

$
  dot(gamma)_(R, 牛) &= (3n + 1) / n dot Q / (pi R^3) \
  dot(gamma)_(R,非 牛) &= (3n + 1) / (4n) dot gamma_牛
$

$n$ 的测定方法：

$
  n = (dif ln tau_w ) / (dif ln dot(gamma)_a)
$

Rabinowitsch-Mooney 公式

$
  dot(gamma)_w = dot(gamma)_a / 4 dot ( (dif ln dot(gamma)_a) / (dif ln tau_w) + 3 )
$ <Rabinowitsch-Mooney公式>

==== 柱塞流动

#figure(image("media/chapter2/柱塞流动速度分布.png", width: 300pt), caption: [柱塞流动速度分布])

流动分两部分：

+ 近壁，$τ > τ_y$屈服应力，$tau = tau_y + 𝜂 dot(gamma)$；

+ 中心，$τ<τ_y$，类似固体，像塞子一样沿受力方向流动，塞子内部没有速度差，$dot(gamma)=0$。

缺点：混合不均－，受剪切力小，制品性能差，难以上色。

==== 温度分布

k为流体的导热系数，K为幂律方程的系数。

$
  T - T_w = 1 / (2k) (1 / (2K))^(1 / n) ((partial p) / (partial z))^((n+1) / n) (n / (3n+1))^2 R^((3n+1) / n) [1 - (r / R)^((3n+1) / n)]
$

无量纲温度分布:

$
  (T - T_w) / (T_0 - T_w) = 1 - (r / R)^((3n+1) / n)
$

$T_0$，圆管中心温度；$T_w$，管壁温度

==== 熔融指数

定义为：在一定温度下，熔融状态的高聚物在一定负荷下，十分钟内从规定直径和长度的标准毛细管中流出的重量（克重）。

*熔融指数是反映流动性好坏的指标。*熔融指数越大，流动性越好。

=== 在狭缝中流动

矩形狭缝，公式推导与圆管中方法相似

$L$: 距离，$W$: 狭缝宽度，$H$: 狭缝高度

狭缝几何条件: $W >> H$

表观剪切应力（牛顿流体）:

$
  Delta P dot w L=tau_w dot 2 L
$

$
  tau_w = (Delta P H) / (2L)
$

牛顿流体剪切速率:

$
  dot(gamma)_a = (6 Q) / (W H^2)
$ <狭缝中牛顿流体剪切速率>

幂律流体剪切速率：

$
  dot(gamma)_w = dot(gamma)_a / 3 dot ( (dif ln dot(gamma)_a) / (dif ln tau_w) + 2 )
$ <狭缝中幂律流体剪切速率>

#summary-block(
  notion: [
    - 牛顿流体：粘度不随剪切应力和剪切速率的大小而改变，始终保持常数的流体。
    - 假塑性流体：剪切变稀（shear thinning)且没有屈服应力。
    - 塑性流体（宾汉流体）：塑性和弹性相对，指在应力超过一定限度（屈服应力）的条件下，材料不断裂而继续变形，在外力去掉后还能保持一部分残余变形的性质。
    - 胀塑性流体：剪切增稠，其表观粘度随切变速率的增大而增大。
    - 触变性 (thixotropic)：一定剪切速率，随时间增加，$eta$下降
    - 震凝性 (rheopectic)：一定剪切速率，随时间增加，$eta$上升
    - 幂律方程：$tau = K gamma^n$，其中 $K$ 为稠度系数，$n$ 为流变指数。
    - 聚合物普适流动曲线：第一牛顿区、假塑性区、第二牛顿区。
    - 第一牛顿区：零切粘度，反映材料在没有外力的平衡态下的性质。
    - 假塑性区：随切变速率增加，表观粘度值变小。通常聚合物流体加工成型时的变速率正在这一范围内。
    - 第二牛顿区：无穷切粘度或极限粘度，通常观察不到。
    - 熔融指数：在一定温度下，熔融状态的高聚物在一定负荷下，十分钟内从规定直径和长度的标准毛细管中流出的重量（克重）。熔融指数是反映流动性好坏的指标。熔融指数越大，流动性越好。
  ],
  equation: table(
    table.header([涵义], [公式], [索引]),
    [剪切应变], [$ gamma = S / d = tan theta $ <->], [@eqt:剪切应变],
    [剪切速率], [$ dot(gamma) = (dif gamma) / (dif t) $ <->], [@eqt:剪切速率],
    [剪切应力], [$ tau = F / A $ <->], [@eqt:剪切应力],
    [Hencky拉伸应变（真应变）], [$ epsilon = integral_(l_0)^l (dif l) / l = ln l / l_0 $ <->], [@eqt:Hencky拉伸应变],
    [拉伸应变速率], [$
        dot(epsilon) = (dif ln l / l_0) / (dif t) = 1 / l dot (dif l) / (dif t)
      $ <->], [@eqt:拉伸应变速率],
    [习用拉伸应力], [$ sigma = F / A_0 $ <->], [@eqt:习用拉伸应力],
    [真实拉伸应力], [$ sigma = F / A $ <->], [@eqt:真实拉伸应力],
    [剪切粘度], [$ eta_a = tau / dot(gamma) $ <->], [@eqt:剪切粘度],
    [零切粘度], [$ eta_0 = lim_(dot(gamma)→0) tau / dot(gamma) $ <->], [@eqt:零切粘度],
    [微分粘度（稠度）], [$ eta_c = (dif tau) / (dif gamma) $ <->], [@eqt:微分粘度],
    [拉伸粘度], [$ eta_T = sigma / dot(epsilon) $ <->], [@eqt:拉伸粘度],
    [单轴拉伸], [$ eta_T = 3 eta_a $ <->], [@eqt:单轴拉伸],
    [双轴拉伸], [$ eta_T = 6 eta_a $ <->], [@eqt:双轴拉伸],
    [幂律方程], [$ tau = K gamma^n $ <->], [@eqt:幂律方程],
    [Bird-Carreau模型], [$
        eta = eta_0 / [1 + (lambda dot(gamma))^2]^((1-n) / 2)
      $ <->], [@eqt:Bird-Carreau模型],
    [Carreau-Yasuda模型], [$
        (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / [1 + (lambda dot(gamma))^a]^((1 - n) / a)
      $ <->], [@eqt:Carreau-Yasuda模型],
    [Cross模型], [$
        (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / (1 + (lambda dot(gamma))^m)
      $ <->], [@eqt:Cross模型],
    [Modified Cross模型], [$
        eta = eta_0 / (1 + (eta_0 dot(gamma) slash tau)^m)
      $ <->], [@eqt:Modified-Cross模型],
    [圆管中牛顿流体体积流率], [$ Q = (Delta P pi R^4) / (8eta L) $ <->], [@eqt:圆管中牛顿流体体积流率],
    [圆管中非牛顿流体体积流率], [$
        Q = (pi n R^3) / (3n+1) ( (Delta p R) / (2K L) )^(1 / n)
      $ <->], [@eqt:圆管中非牛顿流体体积流率],
    [Rabinowitsch-Mooney公式], [$
        dot(gamma)_w = dot(gamma)_a / 4 dot ( (dif ln dot(gamma)_a) / (dif ln tau_w) + 3 )
      $ <->], [@eqt:Rabinowitsch-Mooney公式],
    [狭缝中牛顿流体剪切速率], [$ dot(gamma)_a = (6 Q) / (W H^2) $ <->], [@eqt:狭缝中牛顿流体剪切速率],
    [狭缝中幂律流体剪切速率], [$
        dot(gamma)_w = dot(gamma)_a / 3 dot ( (dif ln dot(gamma)_a) / (dif ln tau_w) + 2 )
      $ <->], [@eqt:狭缝中幂律流体剪切速率],
  ),
)

/// Chapter 3

// #include "chapter/chapter3.typ"

/// Chapter 4

// #include "chapter/chapter4.typ"

/// ----------- ///
/// Back Matter ///
/// ----------- ///

#show: back-matter

#notation[
  / D#sub[m]: 预混通道外径 (mm)
  / D#sub[m]: 预混通道外径 (mm)
]

#figure-list()

#table-list()

#equation-list()

#bilingual-bibliography()
