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

# ADC

# 51 Ohm
part R1 0603 C23197

# 150 Ohm
part R2 0603 C22808
part R3 0603 C22808

# 10 Ohm
part R4 0603 C22859
part R5 0603 C22859
part R6 0603 C22859
part R7 0603 C22859

# 10 kOhm
part R8 0603 C25804

# 100 Ohm
part R9 0603 C22775

# 100 Ohm
part R10 0603 C22775

# 10 kOhm
part R11 0603 C25804

# 100 Ohm
part R12 0603 C22775
part R13 0603 C22775
part R14 0603 C22775

# 1 Ohm
part R15 0805 C25271
part R16 0805 C25271

# 10 kOhm
part R17 0805 C17414

# 1 kOhm
part R18 0805 C17513
part R19 0805 C17513
part R20 0805 C17513
part R21 0805 C17513
part R22 0805 C17513
part R23 0805 C17513

part FB1 1206 C560056

part C1 0603 C15849
part C2 0603 C14663

part C3 0603 C1634

part C4 0603 C14663
part C5 0603 C15849

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
part C17 0603 C14663

part C18 0805 C15850
part C19 0805 C15850

part C20 0805 C15850
part C21 0805 C15850

part C22 0805 C15850
part C23 0805 C15850

part C24 0805 C15850
part C25 0805 C15850

part C26 0805 C15850
part C27 0805 C15850

part C28 0805 C45783
part C29 0805 C45783

part C30 0603 C14663

part T1 AT224 C879856

part Y1 SMD7050-6P C5179988

part IC1 LFCSP48 C653392

# filter

# 5.1 Ohm
part R24 0805 C17724

# 1 kOhm
part R25 0805 C17513
part R26 0805 C17513

# 1 uF
part C33 0805 C28323
part C34 0805 C28323

# 56 pF
part C35 0805 C520063
part C36 0805 C520063

# 100 pF
part C37 0805 C520054
part C38 0805 C520054

# 56 pF
part C39 0805 C520063
part C40 0805 C520063

# 330 nH
part L1 1008 C346446
part L2 1008 C346446

# 100 nH
part L3 1008 C346437

# 330 nH
part L4 1008 C346446

# BAV99

part D1 SOT23-3 C2500
part D2 SOT23-3 C2500

# power

part IC2 SOT223-3 C80105
part IC3 SOT223-3 C507263
part IC4 SOT223-3 C80105
part IC5 SOT223-3 C15578
part IC6 SOT223-3 C507263

# voltage level translator

part IC7 SOT23-5 C2682121

# connectors

part CN1 SMA-EDGE C496550
part CN2 2x25 2x25
part CN3 1x2 1x2

part H1 M3 hole
part H2 M3 hole

puts "  )"
puts "  (nets"

# ADC

wire SEC+ T1/1 R2/1 R4/1
wire VCM1 IC1/46 C1/1 R1/1
wire VCM2 R1/2 R2/2 R3/2 C2/1 T1/2
wire SEC- T1/3 R3/1 R5/1

wire FLT+ R4/2 C3/1 R6/1
wire FLT- R5/2 C3/2 R7/1

wire AIN+ R6/2 IC1/42
wire AIN- R7/2 IC1/43

wire GND T1/4 C1/2 C2/2

wire VREF C4/1 C5/1 IC1/38
wire GND C4/2 C5/2

wire RBIAS IC1/47 R8/1
wire GND R8/2

wire AVDD C6/1 C7/1 C8/1 C9/1 C10/1
wire GND C6/2 C7/2 C8/2 C9/2 C10/2

wire SVDD C11/1
wire GND C11/2

wire DVDD C12/1 C13/1 C14/1
wire GND C12/2 C13/2 C14/2

wire AVDD IC1/4 IC1/5 IC1/34 IC1/36 IC1/44 IC1/45
wire DVDD IC1/13 IC1/20 IC1/29
wire SVDD IC1/33
wire GND IC1/0 IC1/1 IC1/35 IC1/37 IC1/41 IC1/48

wire CLK- C16/1 R9/1 Y1/4
wire CLK+ C17/1 R9/2 Y1/5

wire CLKN C16/2 IC1/3
wire CLKP C17/2 IC1/2

wire CVDD C15/1 Y1/1 Y1/6
wire GND C15/2 Y1/3

# filter

wire ATT1 CN1/1 R24/1 R25/1
wire ATT2 R24/2 R26/1 C33/1

wire TVS1 C33/2 D1/3 C34/1
wire TVS2 D1/1 D2/2
wire TVS3 D1/2 D2/1

wire GND R25/2 R26/2 D2/3

wire FLT1 C34/2 C35/1 L1/1
wire FLT2 L1/2 C36/1 C37/1 L2/1
wire FLT3 L2/2 L3/1
wire FLT4 L3/2 C38/1 C39/1 L4/1
wire FLT5 L4/2 C40/1 T1/6

wire GND CN1/2 C35/2 C36/2 C37/2 C38/2 C39/2 C40/2

# power

wire 5V C18/1 IC2/3
wire DVDD C19/1 IC2/2
wire GND C18/2 C19/2 IC2/1

wire 5V C20/1 IC3/3
wire SVDD C21/1 IC3/2
wire GND C20/2 C21/2 IC3/1

wire 5V C22/1 IC4/3
wire AVDD C23/1 IC4/2
wire GND C22/2 C23/2 IC4/1

wire 5V C24/1 IC5/3
wire CVDD C25/1 IC5/2
wire GND C24/2 C25/2 IC5/1

wire VIN2 C26/1 IC6/3
wire VCCO25 C27/1 IC6/2
wire GND C26/2 C27/2 IC6/1

wire VIN2 CN3/2
wire GND CN3/1

wire VIN1 FB1/1
wire 5V C28/1 C29/1 FB1/2
wire DMP1 C28/2 R15/1
wire DMP2 C29/2 R16/1
wire GND R15/2 R16/2

wire 5V R17/1
wire DVDD R18/1
wire SVDD R19/1
wire AVDD R20/1
wire CVDD R21/1
wire VIN2 R22/1
wire VCCO25 R23/1
wire GND R17/2 R18/2 R19/2 R20/2 R21/2 R22/2 R23/2

wire GND CN2/1 CN2/2 CN2/47 CN2/48
wire VCCO25 CN2/3 CN2/4
wire VIN1 CN2/49 CN2/50

# OE

wire OEB1 CN2/22 R10/1
wire OEB2 R10/2 R11/1 IC7/2
wire OEB3 IC7/4 IC1/6
wire DVDD C30/1 IC7/5
wire GND R11/2 C30/2 IC7/3

# SPI

wire CSB1 CN2/46 R12/1
wire CSB2 R12/2 IC1/32
wire SCLK1 CN2/43 R13/1
wire SCLK2 R13/2 IC1/31
wire SDIO1 CN2/44 R14/1
wire SDIO2 R14/2 IC1/30

# data

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
