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
set val(nn)             10                        ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set val(x)              500                        ;# X dimension of topography
set val(y)              500                       ;# Y dimension of topography
set val(stop)           15                       ;# time of simulation end

set ns            [new Simulator]
set tracefd       [open scen_10node.tr w]
set namtrace      [open scen_10node.nam w]

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


$node_(0) set X_ 370.931937278678
$node_(0) set Y_ 189.225017758739
$node_(0) set Z_ 0.000000000000
$node_(1) set X_ 459.460249535677
$node_(1) set Y_ 21.524949459636
$node_(1) set Z_ 0.000000000000
$node_(2) set X_ 335.256097543349
$node_(2) set Y_ 18.134448274962
$node_(2) set Z_ 0.000000000000
$node_(3) set X_ 448.935881810883
$node_(3) set Y_ 59.375425183701
$node_(3) set Z_ 0.000000000000
$node_(4) set X_ 227.819130845922
$node_(4) set Y_ 307.157300386745
$node_(4) set Z_ 0.000000000000
$node_(5) set X_ 24.597764042284
$node_(5) set Y_ 246.663085605465
$node_(5) set Z_ 0.000000000000
$node_(6) set X_ 244.475821580498
$node_(6) set Y_ 35.469670635111
$node_(6) set Z_ 0.000000000000
$node_(7) set X_ 289.006786913008
$node_(7) set Y_ 448.614461420059
$node_(7) set Z_ 0.000000000000
$node_(8) set X_ 412.743310758520
$node_(8) set Y_ 267.122458448045
$node_(8) set Z_ 0.000000000000
$node_(9) set X_ 131.122667638938
$node_(9) set Y_ 455.435051170758
$node_(9) set Z_ 0.000000000000


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 5.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 6.0 "$ftp start"
$ns at 11.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 6.0 "$ftp start"
$ns at 11.0 "$ftp stop"

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