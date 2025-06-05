#import "../imports.typ": summary-block

= 流变学在聚合物成型加工中的应用

== 两个无量纲数

=== Deborah数和松弛时间

Deborah 数为表征粘弹性的无量纲数，由以色列学者 M. Reiner 1964年提出。

$
  "De" = lambda / t
$

其中，$lambda$ 为松弛时间（relaxation time)，$t$ 为形变过程的时间。

Deborah 数打破了固体和流体响应的界限，提供了衡量粘弹性的定量尺子。$D e$ 越小，响应越快，性质更像液体。

=== 威森堡数和粘弹性流动

$
  N_w = lambda dot(gamma)
$

其中，$tau$ 为松弛时间，$tau = eta / G$，$dot(gamma)$ 为外界剪切速率。

当$N_w<1$ 时，液体为粘性流动，弹性形变很小；$N_w = 1～7$时，液体为稳态粘弹性流体；$N_w>7$时，液体为不稳定流动。

== 流变学对聚合物加工成型的理论指导

=== 指导聚合物树脂的聚合和选用，以获得加工性能优良的聚合物;

流变学指导手机防摔膜的材料设计

=== 指导配方设计、加工方法和加工工艺的选择;

流变学指导3D打印的配方和工艺设计

=== 指导加工机械和模具的设计。

层叠倍增挤出几十上百层复合膜，用作液晶显示器的反射膜

== 流变学对聚合物加工成型的实际案例

=== 拉伸粘度与成型加工性能

难以电纺丝的聚合物溶液，加入PEO，有利于电纺丝获得一百到几微米的超细纤维

=== 挤出胀大的削弱措施

*反常！－碳纳米管填充聚丙烯的挤出收缩*

Kharchenko等人研究发现，在聚丙烯（PP）基体中，多壁碳纳米管（MWNTs）可形成堵塞网络，显著改变复合材料的加工行为及性能。
#figure(
  image("media/chapter4/碳纳米管聚丙烯.png", width: 300pt),
  caption: [通过MWNT填料抑制挤出膨胀],
)

如图所示，虚线为挤出口模的直径。可见碳纳米管填充聚丙烯发生反常的挤出收缩，而纯聚丙烯则挤出胀大。

正常情况下，高分子熔体在挤出时会因为正的法向应力差而发生挤出胀大，而本文发现，在碳纳米管体积分数$phi > phi_c$（大约0.01）时，法向应力差$Delta N=N_1-N_2$变为负值。
//文章自己也不知道怎么解释，但提出了一些假设，就没写了。
//citation: Kharchenko, S., Douglas, J., Obrzut, J. et al. Flow-induced properties of nanotube-filled polymer materials. Nature Mater 3, 564–568 (2004). https://doi.org/10.1038/nmat1183

=== 不稳定流动的消除措施

*案例：聚丙烯薄膜挤出流延过程中的不稳定性*

Tian等人研究聚丙烯（iPP）薄膜在挤出流延（Extrusion Film Casting, EFC）过程中的非线性稳定性与动力学行为，提出其存在拉伸共振不稳定性（draw resonance instability）。

#figure(
  image("media/chapter4/不稳定流动的消除措施.png", width: 350pt),
  caption: [拉伸比（$D r$）对iPP薄膜拉伸过程的影响],
)
图（a）给出了不同拉伸比下膜宽度随时间的演化过程；图（b）显示了$D r=30$时膜宽度、厚度的振荡情况。

当拉伸比低于某个临界值（$D r c$）时，扰动会逐渐减弱并达到稳态；而当超过该值后，薄膜宽度的初始扰动会逐渐放大并形成周期性振荡，导致不稳定。随着拉伸比增大，宽度和厚度波动增加，不稳定性提高。

除此之外，研究还发现，对流换热系数、挤出速度和长宽比等也会影响流动的不稳定性。

//citation: Fucheng Tian, Xiaoliang Tang, Tingyu Xu, Junsheng Yang, Chun Xie, Liangbin Li; Nonlinear stability and dynamics of nonisothermal film casting. J. Rheol. 1 January 2018; 62 (1): 49–61. https://doi.org/10.1122/1.5009198

=== 利用弹性效应，促进聚合物分子链的取向

锂电池用聚丙烯微孔膜

=== 流变学测试

- 根据 $G'$ 和 $G''$ 判断加工性能
- 温度扫描：意面的储能模量变化
- 最长松弛时间应用
- 通过流变学测试解决PHBHHx难吹膜问题

=== 填充对流变行为的影响

聚丙烯填充碳酸钙

#summary-block()
