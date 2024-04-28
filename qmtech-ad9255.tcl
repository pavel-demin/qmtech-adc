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

# 10 Ohm
part R1 0603 C22859

# 120 Ohm
part R2 0603 C22787
part R3 0603 C22787

# 10 Ohm
part R4 0603 C22859
part R5 0603 C22859

# 10 kOhm
part R6 0603 C25804

# 100 Ohm
part R7 0603 C22775

# 100 Ohm
part R8 0603 C22775

# 1 Ohm
part R9 1206 C17928

# 1 kOhm
part R10 0603 C21190
part R11 0603 C21190

# 10 kOhm
part R12 0603 C25804

part C1 0603 C14663
part C2 0603 C14663

part C3 0603 C14663
part C4 0603 C15849

part C5 0603 C14663
part C6 0603 C14663
part C7 0603 C14663
part C8 0603 C14663
part C9 0603 C14663

part C10 0603 C14663

part C11 0603 C14663
part C12 0603 C14663
part C13 0603 C14663

part C14 0603 C14663

part C15 0603 C14663
part C16 0603 C14663

part C17 1206 C13585
part C18 1206 C13585

part C19 1206 C13585
part C20 1206 C13585

part C21 1206 C13585
part C22 1206 C13585

part C23 1206 C13585
part C24 1206 C13585

part C25 1206 C13585
part C26 1206 C13585

part C27 1206 C13585
part C28 1206 C13585

part C29 1206 C13585

part C30 1206 C13585
part C31 1206 C13585

part T1 AT224 C879856

part Y1 SMD7050-6P C5247989

part IC1 LFCSP48 C653392
part IC2 SOT23 C2862740
part IC3 SOT23 C963430
part IC4 SOT23 C2869949
part IC5 SOT23 C2862740
part IC6 SOT23 C963430
part IC7 SOT23 C2869949

part CN1 SMA-EDGE C496550
part CN2 2x25 2x25
part CN3 1x2 1x2

part M1 M3 hole
part M2 M3 hole

puts "  )"
puts "  (nets"

wire INPUT CN1/1 T1/4

wire SEC+ T1/1 R2/1 R4/1
wire VCM1 IC1/46 C1/1 R1/1
wire VCM2 R1/2 R2/2 R3/2 C2/1 T1/2
wire SEC- T1/3 R3/1 R5/1

wire VIN+ R4/2 IC1/42
wire VIN- R5/2 IC1/43

wire GND CN1/2 T1/6 C1/2 C2/2

wire VREF C3/1 C4/1 IC1/38
wire GND C3/2 C4/2

wire RBIAS IC1/47 R6/1
wire GND R6/2

wire AVDD C5/1 C6/1 C7/1 C8/1 C9/1
wire GND C5/2 C6/2 C7/2 C8/2 C9/2

wire SVDD C10/1
wire GND C10/2

wire DVDD C11/1 C12/1 C13/1
wire GND C11/2 C12/2 C13/2

wire AVDD IC1/4 IC1/5 IC1/34 IC1/36 IC1/44 IC1/45
wire DVDD IC1/13 IC1/20 IC1/29
wire SVDD IC1/33
wire GND IC1/0 IC1/1 IC1/6 IC1/35 IC1/37 IC1/41 IC1/48

wire CLK- C15/1 R7/1 Y1/4
wire CLK+ C16/1 R7/2 Y1/5

wire CLKN C15/2 IC1/3
wire CLKP C16/2 IC1/2

wire CVDD C14/1 Y1/1 Y1/6
wire GND C14/2 Y1/3

wire 5V C17/1 IC2/1
wire CVDD C18/1 IC2/5
wire GND C17/2 C18/2 IC2/2 IC2/4

wire 5V C19/1 IC3/1
wire DVDD C20/1 IC3/5
wire GND C19/2 C20/2 IC3/2 IC3/4

wire 5V C21/1 IC4/1
wire SVDD C22/1 IC4/5
wire GND C21/2 C22/2 IC4/2 IC4/4

wire 5V C23/1 IC5/1
wire 3V C24/1 IC5/5
wire GND C23/2 C24/2 IC5/2 IC5/4

wire 3V IC6/1 IC6/3
wire AVDD C25/1 IC6/5
wire GND C25/2 IC6/2 IC6/4

wire AVDD C26/1
wire GND C26/2

wire CVDD C29/1
wire GND C29/2

wire VCCO33 C27/1 IC7/1 IC7/3
wire VCCO25 C28/1 IC7/5
wire GND C27/2 C28/2 IC7/2 IC7/4

wire VCCO33 CN3/2
wire GND CN3/1

wire VIN C30/1 R9/1
wire 5V C31/1 R9/2
wire GND C30/2 C31/2

wire VCCO33 R10/1
wire VCCO25 R11/1
wire 5V R12/1
wire GND R10/2 R11/2 R12/2

wire IN1 CN2/45 R8/1

wire AEN IC2/3 IC3/3 IC4/3 IC5/3 R8/2

wire CSB IC1/32 CN2/46
wire SCLK IC1/31 CN2/43
wire SDIO IC1/30 CN2/44

wire GND CN2/1 CN2/2 CN2/47 CN2/48
wire VCCO25 CN2/3 CN2/4
wire VIN CN2/49 CN2/50

wire DCON IC1/7 CN2/25
wire DCOP IC1/8 CN2/26

wire D1N IC1/11 CN2/27
wire D1P IC1/12 CN2/28

wire D2N IC1/14 CN2/29
wire D2P IC1/15 CN2/30

wire D3N IC1/16 CN2/31
wire D3P IC1/17 CN2/32

wire D4N IC1/18 CN2/33
wire D4P IC1/19 CN2/34

wire D5N IC1/21 CN2/35
wire D5P IC1/22 CN2/36

wire D6N IC1/23 CN2/37
wire D6P IC1/24 CN2/38

wire D7N IC1/25 CN2/39
wire D7P IC1/26 CN2/40

wire ORN IC1/27 CN2/41
wire ORP IC1/28 CN2/42

puts "  )"
puts ")"
