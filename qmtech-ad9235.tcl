proc part {ref footprint {mpn ""}} {
  puts "    (comp (ref $ref) (footprint footprints:$footprint) (property (name mpn) (value $mpn)))"
}

set code 1

proc wire {name args} {
  global code
  puts "    (net (code $code) (name $name)"
  foreach element $args {
    set list [split $element /]
    puts "      (node (ref [lindex $list 0]) (pin [lindex $list 1]))"
  }
  puts "    )"
  incr code
}

puts "(export (version E)"
puts "  (components"

for {set i 1} {$i <= 15} {incr i} {
  part R$i 0603 C23345
}

part R16 0603 C23140
part R17 0603 C23140

part R18 0603 C21190
part R19 0603 C21190

part R20 0603 C23185

part C1 0603 C15849
part C2 0603 C19702

part C3 0603 C14663

part C4 0603 C1648

part C5 0603 C14663
part C6 0603 C14663
part C7 0603 C14663

part C8 CASE-A-3216 C7171

part C9 0603 C14663
part C10 CASE-A-3216 C7171

part C11 0603 C14663
part C12 0603 C14663
part C13 CASE-A-3216 C7171

part C14 0603 C14663
part C15 CASE-A-3216 C7171

part C16 0603 C14663

part C17 0603 C14663
part C18 CASE-A-3216 C7171

part L1 0603 C1002

part T1 AT224 C879831

part Y1 7050 C254233

part IC1 SOT23 C2862740
part IC2 LFCSP32 C653328
part IC3 TSSOP8 C2859546

part CN1 1x2 1x2
part CN2 SMA C914554
part CN3 2x25 2x25

part M1 M3 hole
part M2 M3 hole

puts "  )"
puts "  (nets"

wire 5V C1/1 IC1/1 IC1/3 CN1/2

wire DVDD C14/1 C15/1 IC2/16 CN3/3

wire GND C14/2 C15/2 IC2/15 CN3/1

wire AVDD C2/1 IC1/5 R18/1 C11/1 C12/1 C13/1 IC2/27 IC2/32

wire GND C1/2 C2/2 IC1/2 IC1/4 C11/2 C12/2 C13/2 IC2/4 IC2/22 IC2/23 IC2/28 IC2/31 IC2/33 CN1/1

wire GND CN2/2 R20/2 T1/4 R19/2 C3/2 C5/2

wire CLK Y1/3 IC3/1
wire AVDD C16/1 Y1/1 Y1/4
wire GND C16/2 Y1/2 IC3/4
wire Y0 IC2/2 IC3/8

wire INPUT CN2/1 R20/1 T1/6

wire VIN+ R16/2 C4/1 IC2/29
wire VIN- R17/2 C4/2 IC2/30

wire SEC+ T1/1 R16/1
wire VCM T1/2 C3/1 R18/2 R19/1
wire SEC- T1/3 R17/1

wire REFT C5/1 C7/1 C8/1 IC2/26
wire REFB C6/1 C7/2 C8/2 IC2/25
wire GND C5/2 C6/2

wire VREF C9/1 C10/1 IC2/24
wire GND C9/2 C10/2

wire AVDD C18/1 L1/1
wire BVDD L1/2 C17/1 IC3/2 IC3/6
wire GND C17/2 C18/2

wire Y1 IC3/3 R1/1
wire D0 IC2/5 R2/1
wire D1 IC2/6 R3/1
wire D2 IC2/7 R4/1
wire D3 IC2/8 R5/1
wire D4 IC2/9 R6/1
wire D5 IC2/10 R7/1
wire D6 IC2/11 R8/1
wire D7 IC2/12 R9/1
wire D8 IC2/13 R10/1
wire D9 IC2/14 R11/1
wire D10 IC2/17 R12/1
wire D11 IC2/18 R13/1
wire D12 IC2/19 R14/1
wire D13 IC2/20 R15/1

wire W1 R1/2 CN3/33
wire W2 R2/2 CN3/31
wire W3 R3/2 CN3/29
wire W4 R4/2 CN3/27
wire W5 R5/2 CN3/25
wire W6 R6/2 CN3/23
wire W7 R7/2 CN3/21
wire W8 R8/2 CN3/19
wire W9 R9/2 CN3/17
wire W10 R10/2 CN3/15
wire W11 R11/2 CN3/13
wire W12 R12/2 CN3/11
wire W13 R13/2 CN3/9
wire W14 R14/2 CN3/7
wire W15 R15/2 CN3/5

puts "  )"
puts ")"
