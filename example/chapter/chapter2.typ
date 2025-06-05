#import "../unit.typ": *
#import "../imports.typ": summary-block

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

#figure(image("media/chapter2/图片1.png", width: 150pt),caption:[剪切应变])

剪切应变

$
  gamma = S / d=tan theta
$

剪切速率：单位时间内的剪切应变

定义式

$
  dot(gamma)= (dif gamma) / (dif t)
$

对于平行直线流场，剪切速率等于垂直于流动方向上的速度梯度

$
  dot(gamma)= (dif v_x) / (dif y)
$

对于同心圆流场，

$
  dot(gamma)= r (dif omega) / (dif r)
$

推导：#figure(image("media/chapter2/图片8.png", width: 200pt),caption:[同心圆流场剪切应变推导])\

剪切应力：单位面积上的剪切力

定义式 $tau = F / A$

#figure(image("media/chapter2/图片9.png", width: 200pt),caption:[拉伸应变])

*对于拉伸：*

Hencky拉伸应变（真应变）：

$
  epsilon = integral_(l_0)^l (dif l) / l =ln l / l_0
$

拉伸应变速率：

$
  dot(epsilon)=(dif ln l / l_0) / (dif t)=1 / l dot (dif l) / (dif t)
$

工程拉伸应变：

$
  (Delta l) / l_0
$

拉伸应力：习用应力：

$
  sigma = F / A_0
$

真实应力:

$
  sigma = F / A
$

=== 粘度

*剪切粘度*：剪切应力和剪切速率的比值，称为剪切粘度，也叫表观粘度，通常简称为粘度

定义式

$
  eta_a=tau / dot(gamma)
$

物理意义：流体抵抗流动变形的能力称为粘度，反映流体内摩擦阻力的大小

量纲: $Pa dot "s"$

零切粘度：剪切速率趋于零时的粘度：

$
  eta_0=lim_(dot(gamma)→0) tau / dot(gamma)
$

微分粘度（稠度）：

$
  eta_c=(dif tau) / (dif gamma)
$

表观粘度对应的是流动曲线上某点割线的斜率，微分粘度对应流动曲线上某点切线的斜率。


*拉伸粘度*：

$
  eta_T=sigma / dot(epsilon)
$

拉伸粘度与剪切粘度关系

对于牛顿流体，单轴拉伸:$eta_T=3 eta_a$

双轴拉伸：$eta_T=6 eta_a$

== 非牛顿流体及流变方程

*牛顿流体：粘度不随剪切应力和剪切速率的大小而改变，始终保持常数的流体。*

=== 非牛顿流体划分

(1) 按照粘度随剪切速率的变化

#figure(image("media/chapter2/图片11.png", width: 400pt),caption:[流体粘度随剪切速率变化关系图])

*假塑性流体*：剪切变稀（shear thinning)且没有屈服应力

大多数聚合物流体属于假塑性流体

*塑性流体（宾汉流体）*：塑性和弹性相对，指在应力超过一定限度（屈服应力）的条件下，材料不断裂而继续变形，在外力去掉后还能保持一部分残余变形的性质。

*胀塑性流体*：剪切增稠，其表观粘度随切变速率的增大而增大。

(2) 按照粘度随时间的变化规律

#figure(image("media/chapter2/图片10.png", width: 250pt),caption:[流体粘度随时间变化关系图])

+ *触变性* (thixotropic)：一定剪切速率，随时间增加，$eta$下降
+ *震凝性* (rheopectic)：一定剪切速率，随时间增加，$eta$上升

滞后环：剪切速率由0上升到某个值，然后降低到0，这样一个过程中应力曲线围成的一圈的面积

=== 非牛顿流体的表征

假塑性和胀塑性流体的流动曲线都是非线性的，用指数关系描述其剪切应力和剪切速率的关系。

*幂律公式*(Ostwald-de Waele模型)：$tau=K gamma^n$

其中，$K$为稠度系数（consistency index），$n$为流变指数（power-law index），或称非牛顿指数。

适用范围：同一种材料，在不同的剪切速率范围内，$n$ 值也不是常数，只在某一不大的剪切速率范围内，$n$ 近似为常数；不适用于很低和很高剪切速率。

=== 聚合物普适流动曲线

#figure(image("media/chapter2/图片2.png", width: 200pt),caption:[聚合物普适流动曲线图])

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
$

Carreau-Yasuda模型：

$
  (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / [1 + (lambda dot(gamma))^a]^((1 - n) / a)
$

Cross模型:

$
  (eta - eta_infinity) / (eta_0 - eta_infinity) = 1 / (1 + (lambda dot(gamma))^m)
$

Modified Cross模型:

$
  eta = eta_0 / (1 + (eta_0 dot(gamma) slash tau)^m)
$

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
$

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
$

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
$

==== 柱塞流动

#figure(image("media/chapter2/图片12.png", width: 300pt),caption:[柱塞流动速度分布])

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
$

幂律流体剪切速率：

$
  dot(gamma)_w = dot(gamma)_a / 3 dot ( (dif ln dot(gamma)_a) / (dif ln tau_w) + 2 )
$


#summary-block()
