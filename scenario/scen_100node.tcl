#10 node

# Define options
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         150                         ;# max packet in ifq
set val(nn)             100                        ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set val(x)              1500                        ;# X dimension of topography
set val(y)              1500                       ;# Y dimension of topography
set val(stop)           10                       ;# time of simulation end

set ns            [new Simulator]
set tracefd       [open scen_100node.tr w]
set namtrace      [open scen_100node.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

set god_ [create-god $val(nn)]

# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
             -llType $val(ll) \
             -macType $val(mac) \
             -ifqType $val(ifq) \
             -ifqLen $val(ifqlen) \
             -antType $val(ant) \
             -propType $val(prop) \
             -phyType $val(netif) \
             -channelType $val(chan) \
             -topoInstance $topo \
             -agentTrace ON \
             -routerTrace ON \
             -macTrace OFF \
             -movementTrace ON

for {set i 0} {$i < $val(nn) } {incr i} {
	set node_($i) [$ns node]	
}


$node_(0) set X_ 1124.150004778803
$node_(0) set Y_ 699.910301268413
$node_(0) set Z_ 0.000000000000
$node_(1) set X_ 1188.556195637139
$node_(1) set Y_ 1447.631862738037
$node_(1) set Z_ 0.000000000000
$node_(2) set X_ 596.157590742404
$node_(2) set Y_ 498.419892432014
$node_(2) set Z_ 0.000000000000
$node_(3) set X_ 1075.936058371957
$node_(3) set Y_ 526.121755115065
$node_(3) set Z_ 0.000000000000
$node_(4) set X_ 117.950608496025
$node_(4) set Y_ 77.532385621857
$node_(4) set Z_ 0.000000000000
$node_(5) set X_ 128.214235456791
$node_(5) set Y_ 1188.133212302743
$node_(5) set Z_ 0.000000000000
$node_(6) set X_ 773.571991571918
$node_(6) set Y_ 1434.372466604568
$node_(6) set Z_ 0.000000000000
$node_(7) set X_ 1419.288030409233
$node_(7) set Y_ 356.533813560156
$node_(7) set Z_ 0.000000000000
$node_(8) set X_ 17.263098990248
$node_(8) set Y_ 872.780798477681
$node_(8) set Z_ 0.000000000000
$node_(9) set X_ 612.392262643574
$node_(9) set Y_ 1497.894582818745
$node_(9) set Z_ 0.000000000000
$node_(10) set X_ 1429.292215451780
$node_(10) set Y_ 245.247571033308
$node_(10) set Z_ 0.000000000000
$node_(11) set X_ 796.858334505589
$node_(11) set Y_ 230.837166312647
$node_(11) set Z_ 0.000000000000
$node_(12) set X_ 710.390278781107
$node_(12) set Y_ 923.205562407793
$node_(12) set Z_ 0.000000000000
$node_(13) set X_ 67.346287427477
$node_(13) set Y_ 1129.532779087969
$node_(13) set Z_ 0.000000000000
$node_(14) set X_ 1132.595879742863
$node_(14) set Y_ 1087.700262605598
$node_(14) set Z_ 0.000000000000
$node_(15) set X_ 396.530665917876
$node_(15) set Y_ 1087.537367992982
$node_(15) set Z_ 0.000000000000
$node_(16) set X_ 811.433374480843
$node_(16) set Y_ 41.159589323493
$node_(16) set Z_ 0.000000000000
$node_(17) set X_ 251.540442304782
$node_(17) set Y_ 1471.387575158993
$node_(17) set Z_ 0.000000000000
$node_(18) set X_ 563.021557663680
$node_(18) set Y_ 166.424370165046
$node_(18) set Z_ 0.000000000000
$node_(19) set X_ 59.802051386523
$node_(19) set Y_ 400.830746249481
$node_(19) set Z_ 0.000000000000
$node_(20) set X_ 1213.894197016487
$node_(20) set Y_ 172.132555466046
$node_(20) set Z_ 0.000000000000
$node_(21) set X_ 1373.437495477265
$node_(21) set Y_ 16.817039227566
$node_(21) set Z_ 0.000000000000
$node_(22) set X_ 951.709967561921
$node_(22) set Y_ 357.838919602916
$node_(22) set Z_ 0.000000000000
$node_(23) set X_ 1100.642496238844
$node_(23) set Y_ 983.054449426785
$node_(23) set Z_ 0.000000000000
$node_(24) set X_ 492.891049133925
$node_(24) set Y_ 474.034922569819
$node_(24) set Z_ 0.000000000000
$node_(25) set X_ 332.288609495394
$node_(25) set Y_ 562.225793707875
$node_(25) set Z_ 0.000000000000
$node_(26) set X_ 847.961177322065
$node_(26) set Y_ 705.631522175706
$node_(26) set Z_ 0.000000000000
$node_(27) set X_ 1121.294113860739
$node_(27) set Y_ 500.325641144936
$node_(27) set Z_ 0.000000000000
$node_(28) set X_ 1403.600365726481
$node_(28) set Y_ 1128.844044357436
$node_(28) set Z_ 0.000000000000
$node_(29) set X_ 938.734730881831
$node_(29) set Y_ 827.395210181876
$node_(29) set Z_ 0.000000000000
$node_(30) set X_ 38.872891474879
$node_(30) set Y_ 481.256993511099
$node_(30) set Z_ 0.000000000000
$node_(31) set X_ 208.591269070046
$node_(31) set Y_ 269.815048463999
$node_(31) set Z_ 0.000000000000
$node_(32) set X_ 117.821373861946
$node_(32) set Y_ 273.878785308168
$node_(32) set Z_ 0.000000000000
$node_(33) set X_ 504.895369410104
$node_(33) set Y_ 1441.546420529870
$node_(33) set Z_ 0.000000000000
$node_(34) set X_ 1028.117488103089
$node_(34) set Y_ 806.084594029373
$node_(34) set Z_ 0.000000000000
$node_(35) set X_ 508.807105322340
$node_(35) set Y_ 326.542261736652
$node_(35) set Z_ 0.000000000000
$node_(36) set X_ 815.645640053389
$node_(36) set Y_ 331.142300362140
$node_(36) set Z_ 0.000000000000
$node_(37) set X_ 958.056492096686
$node_(37) set Y_ 800.267529547132
$node_(37) set Z_ 0.000000000000
$node_(38) set X_ 1499.253860405833
$node_(38) set Y_ 580.863404045717
$node_(38) set Z_ 0.000000000000
$node_(39) set X_ 751.902925059155
$node_(39) set Y_ 752.904390009147
$node_(39) set Z_ 0.000000000000
$node_(40) set X_ 445.183428725729
$node_(40) set Y_ 540.138579171343
$node_(40) set Z_ 0.000000000000
$node_(41) set X_ 217.134220098126
$node_(41) set Y_ 877.630919578306
$node_(41) set Z_ 0.000000000000
$node_(42) set X_ 620.278919701934
$node_(42) set Y_ 1412.413563994230
$node_(42) set Z_ 0.000000000000
$node_(43) set X_ 472.306124921812
$node_(43) set Y_ 680.858181002201
$node_(43) set Z_ 0.000000000000
$node_(44) set X_ 411.958784257860
$node_(44) set Y_ 620.997918343071
$node_(44) set Z_ 0.000000000000
$node_(45) set X_ 1338.716413698395
$node_(45) set Y_ 399.386635067039
$node_(45) set Z_ 0.000000000000
$node_(46) set X_ 651.603251470597
$node_(46) set Y_ 298.986633585119
$node_(46) set Z_ 0.000000000000
$node_(47) set X_ 86.475495711645
$node_(47) set Y_ 1398.538963379363
$node_(47) set Z_ 0.000000000000
$node_(48) set X_ 1467.895972733936
$node_(48) set Y_ 1477.647250949086
$node_(48) set Z_ 0.000000000000
$node_(49) set X_ 425.371529412754
$node_(49) set Y_ 1253.642191355484
$node_(49) set Z_ 0.000000000000
$node_(50) set X_ 1120.051137979756
$node_(50) set Y_ 841.635565985972
$node_(50) set Z_ 0.000000000000
$node_(51) set X_ 1086.013914060522
$node_(51) set Y_ 762.385574652860
$node_(51) set Z_ 0.000000000000
$node_(52) set X_ 1245.115871770331
$node_(52) set Y_ 964.730417277647
$node_(52) set Z_ 0.000000000000
$node_(53) set X_ 648.812081071761
$node_(53) set Y_ 1334.282461793803
$node_(53) set Z_ 0.000000000000
$node_(54) set X_ 143.887439609642
$node_(54) set Y_ 488.932192255253
$node_(54) set Z_ 0.000000000000
$node_(55) set X_ 167.731447002883
$node_(55) set Y_ 1475.536598919801
$node_(55) set Z_ 0.000000000000
$node_(56) set X_ 765.689472729203
$node_(56) set Y_ 827.751647837540
$node_(56) set Z_ 0.000000000000
$node_(57) set X_ 864.235075833485
$node_(57) set Y_ 1316.727446596909
$node_(57) set Z_ 0.000000000000
$node_(58) set X_ 1277.337907158370
$node_(58) set Y_ 120.483326739755
$node_(58) set Z_ 0.000000000000
$node_(59) set X_ 922.508745775982
$node_(59) set Y_ 1435.493422574977
$node_(59) set Z_ 0.000000000000
$node_(60) set X_ 227.694306257278
$node_(60) set Y_ 976.842555027281
$node_(60) set Z_ 0.000000000000
$node_(61) set X_ 246.393298672001
$node_(61) set Y_ 190.890046932066
$node_(61) set Z_ 0.000000000000
$node_(62) set X_ 763.240874920530
$node_(62) set Y_ 1451.240976308036
$node_(62) set Z_ 0.000000000000
$node_(63) set X_ 293.540141791187
$node_(63) set Y_ 1166.623917794268
$node_(63) set Z_ 0.000000000000
$node_(64) set X_ 1230.991999978743
$node_(64) set Y_ 565.937814702062
$node_(64) set Z_ 0.000000000000
$node_(65) set X_ 174.559402234935
$node_(65) set Y_ 1040.418657336170
$node_(65) set Z_ 0.000000000000
$node_(66) set X_ 685.532073627848
$node_(66) set Y_ 351.575196750378
$node_(66) set Z_ 0.000000000000
$node_(67) set X_ 580.733067191317
$node_(67) set Y_ 1282.308336864257
$node_(67) set Z_ 0.000000000000
$node_(68) set X_ 1201.747092060604
$node_(68) set Y_ 690.034841659304
$node_(68) set Z_ 0.000000000000
$node_(69) set X_ 674.151375359736
$node_(69) set Y_ 234.743528726197
$node_(69) set Z_ 0.000000000000
$node_(70) set X_ 371.456862837781
$node_(70) set Y_ 351.439607934896
$node_(70) set Z_ 0.000000000000
$node_(71) set X_ 259.816096523252
$node_(71) set Y_ 220.235474828859
$node_(71) set Z_ 0.000000000000
$node_(72) set X_ 738.035930323292
$node_(72) set Y_ 204.239442008968
$node_(72) set Z_ 0.000000000000
$node_(73) set X_ 426.194381585445
$node_(73) set Y_ 626.355607710305
$node_(73) set Z_ 0.000000000000
$node_(74) set X_ 180.283572873795
$node_(74) set Y_ 563.680709513274
$node_(74) set Z_ 0.000000000000
$node_(75) set X_ 623.098626640745
$node_(75) set Y_ 835.292958244899
$node_(75) set Z_ 0.000000000000
$node_(76) set X_ 578.996989860054
$node_(76) set Y_ 1422.102897147975
$node_(76) set Z_ 0.000000000000
$node_(77) set X_ 688.182058893579
$node_(77) set Y_ 1343.744928249844
$node_(77) set Z_ 0.000000000000
$node_(78) set X_ 1385.301009552230
$node_(78) set Y_ 672.905111677075
$node_(78) set Z_ 0.000000000000
$node_(79) set X_ 664.721738724532
$node_(79) set Y_ 104.330026358516
$node_(79) set Z_ 0.000000000000
$node_(80) set X_ 289.163681712478
$node_(80) set Y_ 765.902438039823
$node_(80) set Z_ 0.000000000000
$node_(81) set X_ 386.403099603915
$node_(81) set Y_ 90.829791941819
$node_(81) set Z_ 0.000000000000
$node_(82) set X_ 1233.520905154838
$node_(82) set Y_ 71.234990916419
$node_(82) set Z_ 0.000000000000
$node_(83) set X_ 303.132176411220
$node_(83) set Y_ 568.937662718593
$node_(83) set Z_ 0.000000000000
$node_(84) set X_ 235.008713645351
$node_(84) set Y_ 155.700552250658
$node_(84) set Z_ 0.000000000000
$node_(85) set X_ 891.470758343562
$node_(85) set Y_ 950.116471998446
$node_(85) set Z_ 0.000000000000
$node_(86) set X_ 45.328365040082
$node_(86) set Y_ 237.579673625662
$node_(86) set Z_ 0.000000000000
$node_(87) set X_ 362.094759548947
$node_(87) set Y_ 537.487345351225
$node_(87) set Z_ 0.000000000000
$node_(88) set X_ 1299.921782310990
$node_(88) set Y_ 910.043272024254
$node_(88) set Z_ 0.000000000000
$node_(89) set X_ 54.228399479647
$node_(89) set Y_ 37.516818219679
$node_(89) set Z_ 0.000000000000
$node_(90) set X_ 1329.763174776626
$node_(90) set Y_ 244.041102184111
$node_(90) set Z_ 0.000000000000
$node_(91) set X_ 1327.516275253935
$node_(91) set Y_ 927.420693892870
$node_(91) set Z_ 0.000000000000
$node_(92) set X_ 575.932107352158
$node_(92) set Y_ 1483.680813714305
$node_(92) set Z_ 0.000000000000
$node_(93) set X_ 118.001495032644
$node_(93) set Y_ 833.461331753050
$node_(93) set Z_ 0.000000000000
$node_(94) set X_ 784.462955470266
$node_(94) set Y_ 275.547477722605
$node_(94) set Z_ 0.000000000000
$node_(95) set X_ 1126.049915495883
$node_(95) set Y_ 969.794681695591
$node_(95) set Z_ 0.000000000000
$node_(96) set X_ 402.317000944618
$node_(96) set Y_ 1252.075477021677
$node_(96) set Z_ 0.000000000000
$node_(97) set X_ 730.086272432922
$node_(97) set Y_ 964.402381353009
$node_(97) set Z_ 0.000000000000
$node_(98) set X_ 673.054165671409
$node_(98) set Y_ 561.660444439708
$node_(98) set Z_ 0.000000000000
$node_(99) set X_ 78.952789987014
$node_(99) set Y_ 1108.364409776357
$node_(99) set Z_ 0.000000000000


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 1.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 1.0 "$ftp stop"

# set tcp [new Agent/TCP/Newreno]
# $tcp set class_ 2
# set sink [new Agent/TCPSink]
# $ns attach-agent $node_(4) $tcp
# $ns attach-agent $node_(13) $sink
# $ns connect $tcp $sink
# set ftp [new Application/FTP]
# $ftp attach-agent $tcp
# $ns at 1.5 "$ftp start"
# $ns at 2.0 "$ftp stop"

# set tcp [new Agent/TCP/Newreno]
# $tcp set class_ 2
# set sink [new Agent/TCPSink]
# $ns attach-agent $node_(1) $tcp
# $ns attach-agent $node_(17) $sink
# $ns connect $tcp $sink
# set ftp [new Application/FTP]
# $ftp attach-agent $tcp
# $ns at 2.5 "$ftp start"
# $ns at 3.0 "$ftp stop"

# Printing the window size
# proc plotWindow {tcpSource file} {
# global ns
# set time 0.01
# set now [$ns now]
# set cwnd [$tcpSource set cwnd_]
# puts $file "$now $cwnd"
# $ns at [expr $now+$time] "plotWindow $tcpSource $file" }
# $ns at 10.1 "plotWindow $tcp $windowVsTime2"

# Define node initial position in nam
for {set i 0} {$i < $val(nn) } { incr i } {
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at $val(stop) "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run