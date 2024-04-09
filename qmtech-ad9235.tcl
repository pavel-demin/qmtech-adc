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

part C1 0603 C14663

part C2 0603 C1648

part C3 0603 C14663
part C4 0603 C14663
part C5 0603 C14663

part C6 1206 C13585

part C7 0603 C14663
part C8 1206 C13585

part C9 0603 C14663
part C10 0603 C14663
part C11 1206 C13585

part C12 0603 C14663
part C13 1206 C13585

part C14 0603 C14663
part C15 0603 C15849
part C16 1206 C13585

part C17 0603 C14663

part C18 1206 C13585
part C19 1206 C13585

part C20 1206 C13585
part C21 1206 C13585

part C22 1206 C13585
part C23 1206 C13585

part L1 0603 C1002

part T1 AT224 C879856

part Y1 7050 C254233

part IC1 LFCSP32 C653328
part IC2 TSSOP8 C2859546
part IC3 SOT23 C2862740
part IC4 SOT23 C2862740
part IC5 SOT23 C2862740

part CN1 SMA C914554
part CN2 2x25 2x25

part M1 M3 hole
part M2 M3 hole

puts "  )"
puts "  (nets"

wire DVDD C12/1 C13/1 IC1/16
wire GND C12/2 C13/2 IC1/15

wire AVDD C9/1 C10/1 C11/1 IC1/27 IC1/32
wire GND C9/2 C10/2 C11/2 IC1/4 IC1/22 IC1/23 IC1/28 IC1/31 IC1/33

wire INPUT CN1/1 R20/1 T1/6
wire GND CN1/2 R20/2 T1/4

wire VIN+ R16/2 C2/1 IC1/29
wire VIN- R17/2 C2/2 IC1/30

wire SEC+ T1/1 R16/1
wire SEC- T1/3 R17/1

wire VCM T1/2 C1/1 R18/2 R19/1
wire AVDD R18/1
wire GND C1/2 R19/2

wire REFT C3/1 C5/1 C6/1 IC1/26
wire REFB C4/1 C5/2 C6/2 IC1/25
wire GND C3/2 C4/2

wire VREF C7/1 C8/1 IC1/24
wire GND C7/2 C8/2

wire CLK Y1/3 IC2/1
wire CVDD C17/1 Y1/1 Y1/4
wire GND C17/2 Y1/2 IC2/4
wire Y0 IC1/2 IC2/8

wire CVDD C16/1 L1/1
wire BVDD L1/2 C14/1 C15/1 IC2/2 IC2/6
wire GND C14/2 C15/2 C16/2

wire 5V C18/1 IC3/1
wire AVDD C19/1 IC3/5
wire GND C18/2 C19/2 IC3/2 IC3/4

wire 5V C20/1 IC4/1
wire CVDD C21/1 IC4/5
wire GND C20/2 C21/2 IC4/2 IC4/4

wire 5V C22/1 IC5/1
wire DVDD C23/1 IC5/5
wire GND C22/2 C23/2 IC5/2 IC5/4

wire AEN IC3/3 CN2/39
wire CEN IC4/3 CN2/37
wire DEN IC5/3 CN2/35

wire 5V CN2/49 CN2/50
wire GND CN2/1 CN2/2 CN2/47 CN2/48

wire Y1 IC2/3 R1/1
wire D0 IC1/5 R2/1
wire D1 IC1/6 R3/1
wire D2 IC1/7 R4/1
wire D3 IC1/8 R5/1
wire D4 IC1/9 R6/1
wire D5 IC1/10 R7/1
wire D6 IC1/11 R8/1
wire D7 IC1/12 R9/1
wire D8 IC1/13 R10/1
wire D9 IC1/14 R11/1
wire D10 IC1/17 R12/1
wire D11 IC1/18 R13/1
wire D12 IC1/19 R14/1
wire D13 IC1/20 R15/1

wire W1 R1/2 CN2/33
wire W2 R2/2 CN2/31
wire W3 R3/2 CN2/29
wire W4 R4/2 CN2/27
wire W5 R5/2 CN2/25
wire W6 R6/2 CN2/23
wire W7 R7/2 CN2/21
wire W8 R8/2 CN2/19
wire W9 R9/2 CN2/17
wire W10 R10/2 CN2/15
wire W11 R11/2 CN2/13
wire W12 R12/2 CN2/11
wire W13 R13/2 CN2/9
wire W14 R14/2 CN2/7
wire W15 R15/2 CN2/5

puts "  )"
puts ")"
