using HypothesisTests, Base.Test

sim_data_h0 = [
    0.3823959677906078, -0.2152385089376233, -0.22568375357499895, -1.064710607963763,
    -0.7535992694654291, 1.5414885543718815, -0.7255977944286491, -0.19563221826190302,
    0.23578930816100901, 0.8194975957297876, 1.7827692007679783, 2.2415601558216953,
    1.719223398400187, 2.1276192367249394, 2.077168006791274, 1.3835143629873885,
    -0.39031889042066714, -0.26955292548322785, -1.0271859632037557, -2.7569421445944418,
    -1.9609935225898258, -1.2909315413337634, -0.7400791638330025, -0.8034537562625632,
    0.5334890259883591, 0.46034039265061977, -0.28512392399013586, -1.5051790525247886,
    -1.558356390052481, -1.7234927478553148, -3.838862996282626, -3.9056309827892153,
    -2.6831691343211537, -2.1154736745827103, -1.351974746259323, -0.973375866405973,
    -1.61897292304257, -2.2836191674336015, -4.086645491644496, -5.37569309549424,
    -5.710963175012358, -5.6404955736512, -5.298701806271377, -3.563536140216995,
    -2.263620175906803, -2.057256094504186, -3.0661160500417894, -3.9161717203571875,
    -2.786762284472861, -4.135295740964688, -2.8950048405356283, -2.9506519337429524,
    -2.1912617197974926, -2.221528606444255, -2.5826112742003486, -4.589914476732911,
    -5.158773604079549, -6.308401128476547, -4.427778953845362, -5.898403495232742,
    -6.433614465398474, -7.397158425223975, -8.78226649289989, -8.64796625533862,
    -9.26408292134744, -10.984072277667181, -10.66330299767977, -12.11067589556128,
    -12.602947083630847, -13.016034467614029, -12.014105955158076, -10.839424629182965,
    -12.166394974245012, -13.759609842289079, -14.198319818047874, -12.972522320050007,
    -11.483432041980393, -9.32399885487954, -10.233477872917042, -9.085657572304541,
    -9.590729768826915, -9.857796804045044, -8.358714410114315, -7.561410249938924,
    -7.733050693246021, -8.202130303176117, -7.984506281967517, -7.625359874365167,
    -7.30533515865711, -7.046118830601424, -6.586422845559796, -6.376436485517654,
    -4.8532610943403895, -3.5934664907281935, -3.758749591842454, -3.602555096954818,
    -4.416870391331517, -6.126738597336108, -4.626800721222075, -4.755716359752092,
    -5.205900331311935
]

t = ADFTest(sim_data_h0, :none, 0)

@test t.n == 100
@test t.deterministic == :none
@test t.lag == 0
@test t.stat ≈ -0.6050597112208628
@test t.coef ≈ -0.009972855420884913
@test t.cv ≈ [ -2.5882321870404863, -1.9439589708250309, -1.614431731329 ]
@test pvalue(t) ≈ 0.4525095990064268
show(IOBuffer(), t)

t = ADFTest(sim_data_h0, :constant, 4)

@test t.n == 96
@test t.deterministic == :constant
@test t.lag == 4
@test t.stat ≈ -1.3432252172180439
@test t.coef ≈ -0.034891024784937275
@test t.cv ≈ [ -3.49681816639021, -2.8906107514600103, -2.5822770483285953 ]
@test pvalue(t) ≈ 0.6091721848538273
show(IOBuffer(), t)

t = ADFTest(sim_data_h0, :trend, 1)

@test t.n == 99
@test t.deterministic == :trend
@test t.lag == 1
@test t.stat ≈ -1.643937136091079
@test t.coef ≈ -0.06200340824254233
@test t.cv ≈ [ -4.051321648595895, -3.4548891419983088, -3.1530564880069027 ]
@test pvalue(t) ≈ 0.7747580288456625
show(IOBuffer(), t)

t = ADFTest(sim_data_h0, :squared_trend, 10)

@test t.n == 90
@test t.deterministic == :squared_trend
@test t.lag == 10
@test t.stat ≈ -2.0185041960365777
@test t.coef ≈ -0.11370011315231617
@test t.cv ≈ [ -4.489700198611862, -3.8922014722784897, -3.5900742238045 ]
@test pvalue(t) ≈ 0.8095687207005545
show(IOBuffer(), t)

sim_data_h1 = [
    0.3823959677906078, -0.4064364928329272, -0.21366349105383925, -0.9458585999156837,
    -0.161817961459508, 2.2141788431075566, -1.1599969272467523, -0.05003288745663004,
    0.406405082694597, 0.7869108289160771, 1.3567270194962293, 1.1371544648018315,
    0.04624047497940731, 0.4315160758144559, 0.16530680797356267, -0.6110002398171043,
    -2.079333373316608, -0.9189007217208647, -1.21708339858096, -2.338297880681166,
    -0.3732003183359671, 0.48346182208807886, 0.7925832885448003, 0.33291705184283954,
    1.503401308172342, 0.6785520207484317, -0.4061883062665398, -1.4231492816679225,
    -0.7647519783616538, -0.5475123469836606, -2.3891264219191415, -1.2613311974661598,
    0.5917962497349819, 0.8635935846059344, 1.1952957206263544, 0.9762467401665272,
    -0.15747368655333344, -0.7433830876676981, -2.174717868044743, -2.376406537872116,
    -1.5234733484541754, -0.6912690728659298, -0.003840769053141846, 1.7332452815278112,
    2.1665386050740976, 1.2896333839396656, -0.3640432635677706, -1.032077302099283,
    0.6133707848346852, -1.0418480640744843, 0.7193668683918175, 0.3040363409885845,
    0.911408384439752, 0.4254373055731135, -0.1483640149695369, -2.081485210017331,
    -1.6096017323553033, -1.9544283905746491, 0.9034079793438605, -1.0189205517154498,
    -1.0446712460234568, -1.4858795828372295, -2.1280478590945284, -0.9297236919859942,
    -1.0809785120018163, -2.26047861232065, -0.8094700261729145, -1.8521079109679686,
    -1.4183251435535507, -1.1222499557599581, 0.4408035345759739, 1.395083093263098,
    -0.6294287984304979, -1.907929267259316, -1.3926746093884548, 0.5294601933036396,
    1.7538203747214345, 3.0363433744615707, 0.6086926691932826, 1.4521666352091431,
    0.22101112108219845, -0.15656147467703047, 1.4208016565922137, 1.5077049884714973,
    0.5822120509286517, -0.1779735844657705, 0.12863722897571492, 0.42346502209020714,
    0.5317572267531613, 0.5250949414322668, 0.7222434557577614, 0.5711080879210234,
    1.8087294351377763, 2.1641593211810846, 0.9167965594762817, 0.6145927746257767,
    -0.5070189070638104, -1.9633776595364965, 0.5182490463457843, 0.13020888464287564,
    -0.3850795292384054
]

t = ADFTest(sim_data_h1, :none, 2)

@test t.n == 98
@test t.deterministic == :none
@test t.lag == 2
@test t.stat ≈ -4.856134193950414
@test t.coef ≈ -0.5258695197499671
@test t.cv ≈ [ -2.5882321870404863, -1.9439589708250309, -1.614431731329 ]
@test pvalue(t) ≈ 2.011399607967822e-6
show(IOBuffer(), t)

t = ADFTest(sim_data_h1, :constant, 0)

@test t.n == 100
@test t.deterministic == :constant
@test t.lag == 0
@test t.stat ≈ -5.371126891727986
@test t.coef ≈ -0.45433645147215723
@test t.cv ≈ [ -3.49681816639021, -2.8906107514600103, -2.5822770483285953 ]
@test pvalue(t) ≈ 3.8937264616617045e-6
show(IOBuffer(), t)

t = ADFTest(sim_data_h1, :trend, 7)

@test t.n == 93
@test t.deterministic == :trend
@test t.lag == 7
@test t.stat ≈ -2.636305455046
@test t.coef ≈ -0.4407260538688699
@test t.cv ≈ [ -4.051321648595895, -3.4548891419983088, -3.1530564880069027 ]
@test pvalue(t) ≈ 0.2634673926249714
show(IOBuffer(), t)

t = ADFTest(sim_data_h1, :squared_trend, 4)

@test t.n == 96
@test t.deterministic == :squared_trend
@test t.lag == 4
@test t.stat ≈ -4.300112549464304
@test t.coef ≈ -0.6759438045021552
@test t.cv ≈ [ -4.489700198611862, -3.8922014722784897, -3.5900742238045 ]
@test pvalue(t) ≈ 0.012662962461719612
show(IOBuffer(), t)
