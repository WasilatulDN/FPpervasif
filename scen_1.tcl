
# Define options
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type

set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         150                         ;# max packet in ifq
set val(nn)             18                        ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set val(x)              1000                        ;# X dimension of topography
set val(y)              1000                        ;# Y dimension of topography
set val(stop)           5                       ;# time of simulation end

set ns            [new Simulator]
set tracefd       [open scen_1.tr w]
set namtrace      [open scen_1.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

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

set x 0
for {set i 0} {$i < 3 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 1000
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 100} ]
    # puts $x
}

set x 100
for {set i 3} {$i < 5 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 900
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 200} ]
    # puts $x
}

set x 200
for {set i 5} {$i < 9 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 800
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 100} ]
    # puts $x
}

set x 300
for {set i 9} {$i < 11 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 700
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 100} ]
    # puts $x
}

set node_(11) [$ns node]	
$node_(11) set X_ 600
$node_(11) set Y_ 700
$node_(11) set Z_ 0.0
$node_(11) random-motion 0

set x 300
for {set i 12} {$i < 14 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 600
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 400} ]
    # puts $x
}

set x 300
for {set i 14} {$i < 16 } {incr i} {
	set node_($i) [$ns node]	
    $node_($i) set X_ $x
    $node_($i) set Y_ 500
    $node_($i) set Z_ 0.0
	$node_($i) random-motion 0		;# disable random motion
    set x [ expr {$x + 300} ]
    # puts $x
}

set node_(16) [$ns node]	
$node_(16) set X_ 200
$node_(16) set Y_ 400
$node_(16) set Z_ 0.0
$node_(16) random-motion 0

set node_(17) [$ns node]	
$node_(17) set X_ 100
$node_(17) set Y_ 300
$node_(17) set Z_ 0.0
$node_(17) random-motion 0



#x, y, velocity
# $ns at 20.0 "$node_(0) setdest 450.0 300.0 10.0"
# $node_(1) set idle_time_ 50000ms
# $ns at 20.0 "$node_(0) idle"
# $ns at 20.0 "$ftp set idle_time_ 50000ms"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 0.5 "$ftp start"
$ns at 1.5 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 2.0 "$ftp start"
$ns at 3.0 "$ftp stop"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 3.5 "$ftp start"
$ns at 4.5 "$ftp stop"


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