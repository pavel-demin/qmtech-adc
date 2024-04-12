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

part R16 0603 C23345
part R17 0603 C23345

part R18 0603 C21190
part R19 0603 C21190

part R20 0603 C22962

part R21 0603 C22962
part R22 0603 C22962
part R23 0603 C22962

part C1 0603 C14663

part C2 0603 C14663
part C3 0603 C14663
part C4 0603 C14663

part C5 1206 C13585

part C6 0603 C14663
part C7 1206 C13585

part C8 0603 C14663
part C9 0603 C14663
part C10 1206 C13585

part C11 0603 C14663
part C12 1206 C13585

part C13 0603 C14663
part C14 0603 C15849
part C15 1206 C13585

part C16 0603 C14663

part C17 1206 C13585
part C18 1206 C13585

part C19 1206 C13585
part C20 1206 C13585

part C21 1206 C13585
part C22 1206 C13585

part L1 0603 C1002

part T1 AT224 C879856

part Y1 SMD7050-4P C254233

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

wire DVDD C11/1 C12/1 IC1/16
wire GND C11/2 C12/2 IC1/15

wire AVDD C8/1 C9/1 C10/1 IC1/27 IC1/32
wire GND C8/2 C9/2 C10/2 IC1/0 IC1/4 IC1/22 IC1/23 IC1/28 IC1/31

wire INPUT CN1/1 T1/6
wire GND CN1/2 T1/4

wire VIN+ R16/2 R20/1 IC1/29
wire VIN- R17/2 R20/2 IC1/30

wire SEC+ T1/1 R16/1
wire SEC- T1/3 R17/1

wire VCM T1/2 C1/1 R18/2 R19/1
wire AVDD R18/1
wire GND C1/2 R19/2

wire REFT C2/1 C4/1 C5/1 IC1/26
wire REFB C3/1 C4/2 C5/2 IC1/25
wire GND C2/2 C3/2

wire VREF C6/1 C7/1 IC1/24
wire GND C6/2 C7/2

wire CLK Y1/3 IC2/1
wire CVDD C16/1 Y1/1 Y1/4
wire GND C16/2 Y1/2 IC2/4
wire Y0 IC1/2 IC2/8

wire CVDD C15/1 L1/1
wire BVDD L1/2 C13/1 C14/1 IC2/2 IC2/6
wire GND C13/2 C14/2 C15/2

wire 5V C17/1 IC3/1
wire AVDD C18/1 IC3/5
wire GND C17/2 C18/2 IC3/2

wire 5V C19/1 IC4/1
wire CVDD C20/1 IC4/5
wire GND C19/2 C20/2 IC4/2

wire 5V C21/1 IC5/1
wire DVDD C22/1 IC5/5
wire GND C21/2 C22/2 IC5/2

wire AEN IC3/3 R21/1
wire CEN IC4/3 R22/1
wire DEN IC5/3 R23/1

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

wire W16 R21/2 CN2/39
wire W17 R22/2 CN2/37
wire W18 R23/2 CN2/35

puts "  )"
puts ")"
