// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 12:55:33 2019

`timescale 1ns / 1ps
module switch_led  // sources/rtl/switch_led.v(15)
  (
  switch,
  led
  );

  input [15:0] switch;  // sources/rtl/switch_led.v(17)
  output [15:0] led;  // sources/rtl/switch_led.v(18)

  wire [15:0] led_pad;  // sources/rtl/switch_led.v(18)

  EG_PHY_PAD #(
    //.LOCATION("T13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u0 (
    .do({open_n1,open_n2,open_n3,led_pad[15]}),
    .opad(led[15]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u1 (
    .do({open_n18,open_n19,open_n20,led_pad[14]}),
    .opad(led[14]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("P4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u10 (
    .do({open_n35,open_n36,open_n37,led_pad[5]}),
    .opad(led[5]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u11 (
    .do({open_n52,open_n53,open_n54,led_pad[4]}),
    .opad(led[4]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n69,open_n70,open_n71,led_pad[3]}),
    .opad(led[3]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n86,open_n87,open_n88,led_pad[2]}),
    .opad(led[2]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n103,open_n104,open_n105,led_pad[1]}),
    .opad(led[1]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n120,open_n121,open_n122,led_pad[0]}),
    .opad(led[0]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("R15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u16 (
    .ipad(switch[15]),
    .di(led_pad[15]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u17 (
    .ipad(switch[14]),
    .di(led_pad[14]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("R14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u18 (
    .ipad(switch[13]),
    .di(led_pad[13]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u19 (
    .ipad(switch[12]),
    .di(led_pad[12]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("R12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u2 (
    .do({open_n205,open_n206,open_n207,led_pad[13]}),
    .opad(led[13]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u20 (
    .ipad(switch[11]),
    .di(led_pad[11]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u21 (
    .ipad(switch[10]),
    .di(led_pad[10]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("R9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u22 (
    .ipad(switch[9]),
    .di(led_pad[9]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("N8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u23 (
    .ipad(switch[8]),
    .di(led_pad[8]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u24 (
    .ipad(switch[7]),
    .di(led_pad[7]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("N6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u25 (
    .ipad(switch[6]),
    .di(led_pad[6]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("P6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u26 (
    .ipad(switch[5]),
    .di(led_pad[5]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u27 (
    .ipad(switch[4]),
    .di(led_pad[4]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u28 (
    .ipad(switch[3]),
    .di(led_pad[3]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u29 (
    .ipad(switch[2]),
    .di(led_pad[2]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u3 (
    .do({open_n392,open_n393,open_n394,led_pad[12]}),
    .opad(led[12]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("R5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u30 (
    .ipad(switch[1]),
    .di(led_pad[1]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u31 (
    .ipad(switch[0]),
    .di(led_pad[0]));  // sources/rtl/switch_led.v(17)
  EG_PHY_PAD #(
    //.LOCATION("T9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u4 (
    .do({open_n443,open_n444,open_n445,led_pad[11]}),
    .opad(led[11]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u5 (
    .do({open_n460,open_n461,open_n462,led_pad[10]}),
    .opad(led[10]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("T7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u6 (
    .do({open_n477,open_n478,open_n479,led_pad[9]}),
    .opad(led[9]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("R7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u7 (
    .do({open_n494,open_n495,open_n496,led_pad[8]}),
    .opad(led[8]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("P5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u8 (
    .do({open_n511,open_n512,open_n513,led_pad[7]}),
    .opad(led[7]));  // sources/rtl/switch_led.v(18)
  EG_PHY_PAD #(
    //.LOCATION("N5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u9 (
    .do({open_n528,open_n529,open_n530,led_pad[6]}),
    .opad(led[6]));  // sources/rtl/switch_led.v(18)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();

endmodule 

