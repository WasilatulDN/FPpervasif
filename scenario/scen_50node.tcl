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
set val(nn)             50                        ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set val(x)              1500                        ;# X dimension of topography
set val(y)              1500                       ;# Y dimension of topography
set val(stop)           15                       ;# time of simulation end

set ns            [new Simulator]
set tracefd       [open scen_50node.tr w]
set namtrace      [open scen_50node.nam w]

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

$node_(0) set X_ 87.902953681493
$node_(0) set Y_ 679.763445954490
$node_(0) set Z_ 0.000000000000
$node_(1) set X_ 335.976233445820
$node_(1) set Y_ 195.220583026735
$node_(1) set Z_ 0.000000000000
$node_(2) set X_ 428.062433618350
$node_(2) set Y_ 847.556512870769
$node_(2) set Z_ 0.000000000000
$node_(3) set X_ 811.948755962155
$node_(3) set Y_ 929.358545994986
$node_(3) set Z_ 0.000000000000
$node_(4) set X_ 581.732138060100
$node_(4) set Y_ 3.032167356156
$node_(4) set Z_ 0.000000000000
$node_(5) set X_ 201.931734104129
$node_(5) set Y_ 900.888247272176
$node_(5) set Z_ 0.000000000000
$node_(6) set X_ 702.807939188567
$node_(6) set Y_ 971.782895999691
$node_(6) set Z_ 0.000000000000
$node_(7) set X_ 739.260261591090
$node_(7) set Y_ 241.024925171673
$node_(7) set Z_ 0.000000000000
$node_(8) set X_ 431.017123547281
$node_(8) set Y_ 207.781239230767
$node_(8) set Z_ 0.000000000000
$node_(9) set X_ 681.139604811798
$node_(9) set Y_ 843.571228548609
$node_(9) set Z_ 0.000000000000
$node_(10) set X_ 439.878747680872
$node_(10) set Y_ 443.091060771360
$node_(10) set Z_ 0.000000000000
$node_(11) set X_ 843.658525608707
$node_(11) set Y_ 177.093569151001
$node_(11) set Z_ 0.000000000000
$node_(12) set X_ 446.252183248395
$node_(12) set Y_ 733.067317511421
$node_(12) set Z_ 0.000000000000
$node_(13) set X_ 587.974538164843
$node_(13) set Y_ 866.489782982942
$node_(13) set Z_ 0.000000000000
$node_(14) set X_ 284.299425346377
$node_(14) set Y_ 39.604507209206
$node_(14) set Z_ 0.000000000000
$node_(15) set X_ 243.854044871787
$node_(15) set Y_ 169.011216413773
$node_(15) set Z_ 0.000000000000
$node_(16) set X_ 704.349548440591
$node_(16) set Y_ 191.992662831786
$node_(16) set Z_ 0.000000000000
$node_(17) set X_ 760.139540561713
$node_(17) set Y_ 244.142338349858
$node_(17) set Z_ 0.000000000000
$node_(18) set X_ 913.654787940950
$node_(18) set Y_ 379.481123744527
$node_(18) set Z_ 0.000000000000
$node_(19) set X_ 383.974335125336
$node_(19) set Y_ 60.837295524347
$node_(19) set Z_ 0.000000000000
$node_(20) set X_ 315.255771291722
$node_(20) set Y_ 350.781321516846
$node_(20) set Z_ 0.000000000000
$node_(21) set X_ 894.627640043048
$node_(21) set Y_ 256.403303316768
$node_(21) set Z_ 0.000000000000
$node_(22) set X_ 185.392924948067
$node_(22) set Y_ 11.951527438573
$node_(22) set Z_ 0.000000000000
$node_(23) set X_ 761.129756065782
$node_(23) set Y_ 377.977392547600
$node_(23) set Z_ 0.000000000000
$node_(24) set X_ 275.137415441820
$node_(24) set Y_ 542.224867684481
$node_(24) set Z_ 0.000000000000
$node_(25) set X_ 464.761586317422
$node_(25) set Y_ 108.864145503319
$node_(25) set Z_ 0.000000000000
$node_(26) set X_ 974.213620795969
$node_(26) set Y_ 455.845226956487
$node_(26) set Z_ 0.000000000000
$node_(27) set X_ 565.416260298011
$node_(27) set Y_ 228.200993143443
$node_(27) set Z_ 0.000000000000
$node_(28) set X_ 109.571180723329
$node_(28) set Y_ 812.705192724867
$node_(28) set Z_ 0.000000000000
$node_(29) set X_ 413.375651925368
$node_(29) set Y_ 34.574875652691
$node_(29) set Z_ 0.000000000000
$node_(30) set X_ 998.376895594968
$node_(30) set Y_ 214.429162582677
$node_(30) set Z_ 0.000000000000
$node_(31) set X_ 97.640790350103
$node_(31) set Y_ 621.638213819999
$node_(31) set Z_ 0.000000000000
$node_(32) set X_ 148.595475570266
$node_(32) set Y_ 871.061312775303
$node_(32) set Z_ 0.000000000000
$node_(33) set X_ 797.235916095104
$node_(33) set Y_ 366.443164232229
$node_(33) set Z_ 0.000000000000
$node_(34) set X_ 377.412800561139
$node_(34) set Y_ 814.411676115736
$node_(34) set Z_ 0.000000000000
$node_(35) set X_ 767.037141030590
$node_(35) set Y_ 704.513639569943
$node_(35) set Z_ 0.000000000000
$node_(36) set X_ 768.478426114543
$node_(36) set Y_ 831.334405326647
$node_(36) set Z_ 0.000000000000
$node_(37) set X_ 796.814168509410
$node_(37) set Y_ 768.207102033095
$node_(37) set Z_ 0.000000000000
$node_(38) set X_ 624.070173782901
$node_(38) set Y_ 623.479527347661
$node_(38) set Z_ 0.000000000000
$node_(39) set X_ 989.764144614093
$node_(39) set Y_ 491.256632418693
$node_(39) set Z_ 0.000000000000
$node_(40) set X_ 574.351812355494
$node_(40) set Y_ 580.462349517310
$node_(40) set Z_ 0.000000000000
$node_(41) set X_ 503.889470083874
$node_(41) set Y_ 537.642032334009
$node_(41) set Z_ 0.000000000000
$node_(42) set X_ 508.161341933897
$node_(42) set Y_ 881.933729267264
$node_(42) set Z_ 0.000000000000
$node_(43) set X_ 410.583241703295
$node_(43) set Y_ 164.112754896156
$node_(43) set Z_ 0.000000000000
$node_(44) set X_ 744.933807045741
$node_(44) set Y_ 135.956169170999
$node_(44) set Z_ 0.000000000000
$node_(45) set X_ 344.387070888772
$node_(45) set Y_ 800.565078043737
$node_(45) set Z_ 0.000000000000
$node_(46) set X_ 448.845724659020
$node_(46) set Y_ 178.558877934759
$node_(46) set Z_ 0.000000000000
$node_(47) set X_ 148.049404098251
$node_(47) set Y_ 471.528543643173
$node_(47) set Z_ 0.000000000000
$node_(48) set X_ 394.695310643088
$node_(48) set Y_ 500.966528244558
$node_(48) set Z_ 0.000000000000
$node_(49) set X_ 718.662224123660
$node_(49) set Y_ 425.037157583919
$node_(49) set Z_ 0.000000000000



set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 10.0 "$ftp stop"

# set tcp [new Agent/TCP/Newreno]
# $tcp set class_ 2
# set sink [new Agent/TCPSink]
# $ns attach-agent $node_(5) $tcp
# $ns attach-agent $node_(7) $sink
# $ns connect $tcp $sink
# set ftp [new Application/FTP]
# $ftp attach-agent $tcp
# $ns at 0.5 "$ftp start"
# $ns at 1.0 "$ftp stop"

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