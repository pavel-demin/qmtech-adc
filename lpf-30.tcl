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

# 5.1 Ohm
part R1 0603 C25197

# 1 kOhm
part R2 0603 C21190
part R3 0603 C21190

# 100 nF
part C1 0603 C14663
part C2 0603 C14663

# 56 pF
part C3 0603 C527049
part C4 0603 C527049

# 100 pF
part C5 0603 C513648
part C6 0603 C513648

# 56 pF
part C7 0603 C527049
part C8 0603 C527049

# 330 nH
part L1 1008 C346446
part L2 1008 C346446

# 100 nH
part L3 1008 C346437

# 330 nH
part L4 1008 C346446

part D1 SOT23-3 C2500
part D2 SOT23-3 C2500

part IN SMA-EDGE C496550
part OUT SMA-EDGE C496550

part M1 M3 hole
part M2 M3 hole
part M3 M3 hole
part M4 M3 hole

puts "  )"
puts "  (nets"

wire ATT1 IN/1 R1/1 R2/1
wire ATT2 R1/2 R3/1 C1/1

wire TVS1 C1/2 D1/3 C2/1
wire TVS2 D1/1 D2/2
wire TVS3 D1/2 D2/1

wire GND IN/2 R2/2 R3/2 D2/3

wire FLT1 C2/2 C3/1 L1/1
wire FLT2 L1/2 C4/1 C5/1 L2/1
wire FLT3 L2/2 L3/1
wire FLT4 L3/2 C6/1 C7/1 L4/1
wire FLT5 L4/2 C8/1 OUT/1

wire GND C3/2 C4/2 C5/2 C6/2 C7/2 C8/2 OUT/2

puts "  )"
puts ")"
