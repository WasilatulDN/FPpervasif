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
set val(nn)             30                        ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set val(x)              1000                        ;# X dimension of topography
set val(y)              1000                       ;# Y dimension of topography
set val(stop)           15                       ;# time of simulation end

set ns            [new Simulator]
set tracefd       [open scen_30node.tr w]
set namtrace      [open scen_30node.nam w]

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


$node_(0) set X_ 588.182117869584
$node_(0) set Y_ 553.191013649043
$node_(0) set Z_ 0.000000000000
$node_(1) set X_ 632.399316769805
$node_(1) set Y_ 569.790854471852
$node_(1) set Z_ 0.000000000000
$node_(2) set X_ 689.074353856842
$node_(2) set Y_ 970.554589963368
$node_(2) set Z_ 0.000000000000
$node_(3) set X_ 151.134390951123
$node_(3) set Y_ 752.892151382185
$node_(3) set Z_ 0.000000000000
$node_(4) set X_ 172.658002216570
$node_(4) set Y_ 516.961995868034
$node_(4) set Z_ 0.000000000000
$node_(5) set X_ 493.931257570559
$node_(5) set Y_ 258.056932984815
$node_(5) set Z_ 0.000000000000
$node_(6) set X_ 269.415150405455
$node_(6) set Y_ 505.340452098943
$node_(6) set Z_ 0.000000000000
$node_(7) set X_ 918.480169503921
$node_(7) set Y_ 615.461471494284
$node_(7) set Z_ 0.000000000000
$node_(8) set X_ 125.290980809490
$node_(8) set Y_ 736.069761473339
$node_(8) set Z_ 0.000000000000
$node_(9) set X_ 180.151503875738
$node_(9) set Y_ 683.109652969709
$node_(9) set Z_ 0.000000000000
$node_(10) set X_ 705.748045070934
$node_(10) set Y_ 337.140952033298
$node_(10) set Z_ 0.000000000000
$node_(11) set X_ 549.671463512737
$node_(11) set Y_ 19.895752924103
$node_(11) set Z_ 0.000000000000
$node_(12) set X_ 986.408936831416
$node_(12) set Y_ 884.966068685274
$node_(12) set Z_ 0.000000000000
$node_(13) set X_ 949.319598837401
$node_(13) set Y_ 839.004546290484
$node_(13) set Z_ 0.000000000000
$node_(14) set X_ 163.220901263400
$node_(14) set Y_ 445.410509976881
$node_(14) set Z_ 0.000000000000
$node_(15) set X_ 729.358554283758
$node_(15) set Y_ 411.391947783885
$node_(15) set Z_ 0.000000000000
$node_(16) set X_ 769.726824272233
$node_(16) set Y_ 883.831221805162
$node_(16) set Z_ 0.000000000000
$node_(17) set X_ 485.487002176535
$node_(17) set Y_ 949.376423487043
$node_(17) set Z_ 0.000000000000
$node_(18) set X_ 325.227784609278
$node_(18) set Y_ 703.633552965657
$node_(18) set Z_ 0.000000000000
$node_(19) set X_ 910.410155860081
$node_(19) set Y_ 407.936657977017
$node_(19) set Z_ 0.000000000000
$node_(20) set X_ 176.711691020995
$node_(20) set Y_ 263.241299370814
$node_(20) set Z_ 0.000000000000
$node_(21) set X_ 575.405937313204
$node_(21) set Y_ 517.703834381513
$node_(21) set Z_ 0.000000000000
$node_(22) set X_ 33.165278355213
$node_(22) set Y_ 842.498043607826
$node_(22) set Z_ 0.000000000000
$node_(23) set X_ 582.465422608146
$node_(23) set Y_ 16.661460154127
$node_(23) set Z_ 0.000000000000
$node_(24) set X_ 378.055833893738
$node_(24) set Y_ 122.512317840606
$node_(24) set Z_ 0.000000000000
$node_(25) set X_ 96.439583706538
$node_(25) set Y_ 651.438863365744
$node_(25) set Z_ 0.000000000000
$node_(26) set X_ 448.605538650870
$node_(26) set Y_ 36.200574955372
$node_(26) set Z_ 0.000000000000
$node_(27) set X_ 338.452614005223
$node_(27) set Y_ 432.541907292026
$node_(27) set Z_ 0.000000000000
$node_(28) set X_ 211.530750151350
$node_(28) set Y_ 234.719975111483
$node_(28) set Z_ 0.000000000000
$node_(29) set X_ 986.028164181360
$node_(29) set Y_ 954.750207622546
$node_(29) set Z_ 0.000000000000


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp
$ns attach-agent $node_(27) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 5.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 6.0 "$ftp start"
$ns at 11.0 "$ftp stop"

# set tcp [new Agent/TCP/Newreno]
# $tcp set class_ 2
# set sink [new Agent/TCPSink]
# $ns attach-agent $node_(2) $tcp
# $ns attach-agent $node_(13) $sink
# $ns connect $tcp $sink
# set ftp [new Application/FTP]
# $ftp attach-agent $tcp
# $ns at 6.0 "$ftp start"
# $ns at 11.0 "$ftp stop"

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