// Verilog netlist created by TD v4.6.12906
// Fri Aug  9 20:06:14 2019

`timescale 1ns / 1ps
module top  // src/rtl/top.v(1)
  (
  flash_sdi,
  key,
  rxd,
  sclk,
  flash_cs,
  flash_sck,
  flash_sdo,
  led,
  tube,
  tube_sel,
  txd
  );

  input flash_sdi;  // src/rtl/top.v(15)
  input key;  // src/rtl/top.v(5)
  input rxd;  // src/rtl/top.v(8)
  input sclk;  // src/rtl/top.v(3)
  output flash_cs;  // src/rtl/top.v(13)
  output flash_sck;  // src/rtl/top.v(12)
  output flash_sdo;  // src/rtl/top.v(14)
  output [15:0] led;  // src/rtl/top.v(22)
  output [7:0] tube;  // src/rtl/top.v(18)
  output [3:0] tube_sel;  // src/rtl/top.v(19)
  output txd;  // src/rtl/top.v(9)

  wire [23:0] fls_addr;  // src/rtl/top.v(38)
  wire [7:0] fls_read;  // src/rtl/top.v(40)
  wire [7:0] fls_write;  // src/rtl/top.v(39)
  wire [15:0] id;  // src/rtl/top.v(44)
  wire [2:0] mod_sel;  // src/rtl/top.v(37)
  wire [3:0] sm_bit1_num;  // src/rtl/top.v(47)
  wire [3:0] sm_bit2_num;  // src/rtl/top.v(48)
  wire [3:0] sm_bit3_num;  // src/rtl/top.v(49)
  wire [3:0] sm_bit4_num;  // src/rtl/top.v(50)
  wire [7:0] tube_pad;  // src/rtl/top.v(18)
  wire [17:0] \u_tube_dri/cnt_w ;  // src/rtl/tube/tube_dri.v(33)
  wire [17:0] \u_tube_dri/n1 ;
  wire [3:0] \u_tube_dri/sm_seg_num ;  // src/rtl/tube/tube_dri.v(36)
  wire [3:0] \u_tube_dri/ux_rst/cnt ;  // src/rtl/tube/rst.v(20)
  wire _al_u22_o;
  wire _al_u25_o;
  wire _al_u27_o;
  wire _al_u28_o;
  wire _al_u30_o;
  wire _al_u31_o;
  wire _al_u33_o;
  wire _al_u34_o;
  wire busy;  // src/rtl/top.v(45)
  wire flash_sdi_pad;  // src/rtl/top.v(15)
  wire sclk_pad;  // src/rtl/top.v(3)
  wire start;  // src/rtl/top.v(36)
  wire \u_tube_dri/add0/c11 ;
  wire \u_tube_dri/add0/c15 ;
  wire \u_tube_dri/add0/c3 ;
  wire \u_tube_dri/add0/c7 ;
  wire \u_tube_dri/mux1_b0_sel_is_0_o_neg ;
  wire \u_tube_dri/mux1_b1_sel_is_1_o_neg ;
  wire \u_tube_dri/mux1_b2_sel_is_2_o_neg ;
  wire \u_tube_dri/mux1_b3_sel_is_3_o_neg ;
  wire \u_tube_dri/rst_n ;  // src/rtl/tube/tube_dri.v(30)
  wire \u_tube_dri/ux_rst/add0/c1 ;
  wire \u_tube_dri/ux_rst/add0/c3 ;
  wire \u_tube_dri/ux_rst/n0 ;

  EG_PHY_PAD #(
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u10 (
    .ipad(key));  // src/rtl/top.v(5)
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u11 (
    .ipad(sclk),
    .di(sclk_pad));  // src/rtl/top.v(3)
  EG_PHY_PAD #(
    //.LOCATION("A2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n36,open_n37,open_n38,1'b1}),
    .opad(tube[7]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("B2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n53,open_n54,open_n55,tube_pad[6]}),
    .opad(tube[6]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("D3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n70,open_n71,open_n72,tube_pad[5]}),
    .opad(tube[5]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("F5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n87,open_n88,open_n89,tube_pad[4]}),
    .opad(tube[4]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("E4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n104,open_n105,open_n106,tube_pad[3]}),
    .opad(tube[3]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("F4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u17 (
    .do({open_n121,open_n122,open_n123,tube_pad[2]}),
    .opad(tube[2]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("B3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u18 (
    .do({open_n138,open_n139,open_n140,tube_pad[1]}),
    .opad(tube[1]));  // src/rtl/top.v(18)
  EG_PHY_PAD #(
    //.LOCATION("E3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u19 (
    .do({open_n155,open_n156,open_n157,tube_pad[0]}),
    .opad(tube[0]));  // src/rtl/top.v(18)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("~(C*D)"),
    .INIT_LUT0(16'b0011011110111111),
    .INIT_LUT1(16'b0000111111111111),
    .MODE("LOGIC"))
    \_al_u20|_al_u33  (
    .a({open_n171,\u_tube_dri/cnt_w [16]}),
    .b({open_n172,\u_tube_dri/cnt_w [17]}),
    .c({\u_tube_dri/cnt_w [17],sm_bit3_num[0]}),
    .d({\u_tube_dri/cnt_w [16],sm_bit4_num[0]}),
    .f({\u_tube_dri/mux1_b3_sel_is_3_o_neg ,_al_u33_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("~(C*~D)"),
    .INIT_LUT0(16'b0011011110111111),
    .INIT_LUT1(16'b1111111100001111),
    .MODE("LOGIC"))
    \_al_u21|_al_u30  (
    .a({open_n193,\u_tube_dri/cnt_w [16]}),
    .b({open_n194,\u_tube_dri/cnt_w [17]}),
    .c({\u_tube_dri/cnt_w [17],sm_bit3_num[1]}),
    .d({\u_tube_dri/cnt_w [16],sm_bit4_num[1]}),
    .f({\u_tube_dri/mux1_b2_sel_is_2_o_neg ,_al_u30_o}));
  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*D)"),
    //.LUTF1("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("~(C*D)"),
    //.LUTG1("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111111111),
    .INIT_LUTF1(16'b0011011110111111),
    .INIT_LUTG0(16'b0000111111111111),
    .INIT_LUTG1(16'b0011011110111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u22|u_tube_dri/reg0_b3  (
    .a({\u_tube_dri/cnt_w [16],open_n215}),
    .b({\u_tube_dri/cnt_w [17],open_n216}),
    .c({sm_bit3_num[3],_al_u25_o}),
    .clk(sclk_pad),
    .d({sm_bit4_num[3],_al_u22_o}),
    .sr(\u_tube_dri/rst_n ),
    .f({_al_u22_o,open_n234}),
    .q({open_n238,\u_tube_dri/sm_seg_num [3]}));  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*D)"),
    //.LUTF1("~(~C*~D)"),
    //.LUTG0("~(~C*D)"),
    //.LUTG1("~(~C*~D)"),
    .INIT_LUTF0(16'b1111000011111111),
    .INIT_LUTF1(16'b1111111111110000),
    .INIT_LUTG0(16'b1111000011111111),
    .INIT_LUTG1(16'b1111111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u23|_al_u24  (
    .c({\u_tube_dri/cnt_w [17],\u_tube_dri/cnt_w [17]}),
    .d({\u_tube_dri/cnt_w [16],\u_tube_dri/cnt_w [16]}),
    .f({\u_tube_dri/mux1_b0_sel_is_0_o_neg ,\u_tube_dri/mux1_b1_sel_is_1_o_neg }));
  // src/rtl/tube/rst.v(36)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100110111101111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u25|u_tube_dri/ux_rst/rst_n_reg  (
    .a({\u_tube_dri/cnt_w [16],\u_tube_dri/ux_rst/cnt [0]}),
    .b({\u_tube_dri/cnt_w [17],\u_tube_dri/ux_rst/cnt [1]}),
    .c({sm_bit1_num[3],\u_tube_dri/ux_rst/cnt [2]}),
    .clk(sclk_pad),
    .d({sm_bit2_num[3],\u_tube_dri/ux_rst/cnt [3]}),
    .f({_al_u25_o,\u_tube_dri/ux_rst/n0 }),
    .q({open_n284,\u_tube_dri/rst_n }));  // src/rtl/tube/rst.v(36)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    //.LUTF1("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    //.LUTG1("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000010010010),
    .INIT_LUTF1(16'b0011011110111111),
    .INIT_LUTG0(16'b0000000010010010),
    .INIT_LUTG1(16'b0011011110111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u27|u_tube_dri/mux2_b3_rom0  (
    .a({\u_tube_dri/cnt_w [16],\u_tube_dri/sm_seg_num [0]}),
    .b({\u_tube_dri/cnt_w [17],\u_tube_dri/sm_seg_num [1]}),
    .c({sm_bit3_num[2],\u_tube_dri/sm_seg_num [2]}),
    .d({sm_bit4_num[2],\u_tube_dri/sm_seg_num [3]}),
    .f({_al_u27_o,tube_pad[3]}));
  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*D)"),
    //.LUTF1("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("~(C*D)"),
    //.LUTG1("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111111111),
    .INIT_LUTF1(16'b1100110111101111),
    .INIT_LUTG0(16'b0000111111111111),
    .INIT_LUTG1(16'b1100110111101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u28|u_tube_dri/reg0_b2  (
    .a({\u_tube_dri/cnt_w [16],open_n309}),
    .b({\u_tube_dri/cnt_w [17],open_n310}),
    .c({sm_bit1_num[2],_al_u28_o}),
    .clk(sclk_pad),
    .d({sm_bit2_num[2],_al_u27_o}),
    .sr(\u_tube_dri/rst_n ),
    .f({_al_u28_o,open_n328}),
    .q({open_n332,\u_tube_dri/sm_seg_num [2]}));  // src/rtl/tube/tube_dri.v(76)
  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b1100110111101111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u31|u_tube_dri/reg0_b1  (
    .a({\u_tube_dri/cnt_w [16],open_n333}),
    .b({\u_tube_dri/cnt_w [17],open_n334}),
    .c({sm_bit1_num[1],_al_u31_o}),
    .clk(sclk_pad),
    .d({sm_bit2_num[1],_al_u30_o}),
    .sr(\u_tube_dri/rst_n ),
    .f({_al_u31_o,open_n348}),
    .q({open_n352,\u_tube_dri/sm_seg_num [1]}));  // src/rtl/tube/tube_dri.v(76)
  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*D)"),
    //.LUT1("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111111111111),
    .INIT_LUT1(16'b1100110111101111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u34|u_tube_dri/reg0_b0  (
    .a({\u_tube_dri/cnt_w [16],open_n353}),
    .b({\u_tube_dri/cnt_w [17],open_n354}),
    .c({sm_bit1_num[0],_al_u34_o}),
    .clk(sclk_pad),
    .d({sm_bit2_num[0],_al_u33_o}),
    .sr(\u_tube_dri/rst_n ),
    .f({_al_u34_o,open_n368}),
    .q({open_n372,\u_tube_dri/sm_seg_num [0]}));  // src/rtl/tube/tube_dri.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~B*~C*~D+A*~B*~C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D)"),
    //.LUT1("(~D*~C*B*~A)"),
    .INIT_LUT0(16'b1111110010000011),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u36|u_tube_dri/mux2_b6_rom0  (
    .a({\u_tube_dri/sm_seg_num [0],\u_tube_dri/sm_seg_num [0]}),
    .b({\u_tube_dri/sm_seg_num [1],\u_tube_dri/sm_seg_num [1]}),
    .c({\u_tube_dri/sm_seg_num [2],\u_tube_dri/sm_seg_num [2]}),
    .d({\u_tube_dri/sm_seg_num [3],\u_tube_dri/sm_seg_num [3]}),
    .f({tube_pad[2],tube_pad[6]}));
  EG_PHY_PAD #(
    //.LOCATION("K11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u9 (
    .ipad(flash_sdi),
    .di(flash_sdi_pad));  // src/rtl/top.v(15)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  flash_dri u_flash_dri (
    .clk(sclk_pad),
    .fls_addr(fls_addr),
    .fls_sdi(flash_sdi_pad),
    .fls_write(fls_write),
    .mod_sel(mod_sel),
    .start(start),
    .busy(busy),
    .fls_ncs(flash_cs),
    .fls_read(fls_read),
    .fls_sck(flash_sck),
    .fls_sdo(flash_sdo),
    .id(id));  // src/rtl/top.v(84)
  EG_PHY_LSLICE #(
    //.MACRO("u_tube_dri/add0/ucin_al_u38"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_tube_dri/add0/u11_al_u41  (
    .a({\u_tube_dri/cnt_w [13],\u_tube_dri/cnt_w [11]}),
    .b({\u_tube_dri/cnt_w [14],\u_tube_dri/cnt_w [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_tube_dri/add0/c11 ),
    .f({\u_tube_dri/n1 [13],\u_tube_dri/n1 [11]}),
    .fco(\u_tube_dri/add0/c15 ),
    .fx({\u_tube_dri/n1 [14],\u_tube_dri/n1 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_tube_dri/add0/ucin_al_u38"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_tube_dri/add0/u15_al_u42  (
    .a({\u_tube_dri/cnt_w [17],\u_tube_dri/cnt_w [15]}),
    .b({open_n508,\u_tube_dri/cnt_w [16]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n511,1'b0}),
    .fci(\u_tube_dri/add0/c15 ),
    .f({\u_tube_dri/n1 [17],\u_tube_dri/n1 [15]}),
    .fx({open_n527,\u_tube_dri/n1 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_tube_dri/add0/ucin_al_u38"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_tube_dri/add0/u3_al_u39  (
    .a({\u_tube_dri/cnt_w [5],\u_tube_dri/cnt_w [3]}),
    .b({\u_tube_dri/cnt_w [6],\u_tube_dri/cnt_w [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_tube_dri/add0/c3 ),
    .f({\u_tube_dri/n1 [5],\u_tube_dri/n1 [3]}),
    .fco(\u_tube_dri/add0/c7 ),
    .fx({\u_tube_dri/n1 [6],\u_tube_dri/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_tube_dri/add0/ucin_al_u38"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_tube_dri/add0/u7_al_u40  (
    .a({\u_tube_dri/cnt_w [9],\u_tube_dri/cnt_w [7]}),
    .b({\u_tube_dri/cnt_w [10],\u_tube_dri/cnt_w [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_tube_dri/add0/c7 ),
    .f({\u_tube_dri/n1 [9],\u_tube_dri/n1 [7]}),
    .fco(\u_tube_dri/add0/c11 ),
    .fx({\u_tube_dri/n1 [10],\u_tube_dri/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_tube_dri/add0/ucin_al_u38"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/add0/ucin_al_u38  (
    .a({\u_tube_dri/cnt_w [1],1'b0}),
    .b({\u_tube_dri/cnt_w [2],\u_tube_dri/cnt_w [0]}),
    .c(2'b00),
    .clk(sclk_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_tube_dri/n1 [1:0]),
    .sr(\u_tube_dri/rst_n ),
    .f({\u_tube_dri/n1 [1],open_n579}),
    .fco(\u_tube_dri/add0/c3 ),
    .fx({\u_tube_dri/n1 [2],\u_tube_dri/n1 [0]}),
    .q(\u_tube_dri/cnt_w [1:0]));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*B*C*~D)"),
    //.LUT1("(A*~B*~C*~D+~A*~B*C*~D)"),
    .INIT_LUT0(16'b0000000010001110),
    .INIT_LUT1(16'b0000000000010010),
    .MODE("LOGIC"))
    \u_tube_dri/mux2_b0_rom0|u_tube_dri/mux2_b5_rom0  (
    .a({\u_tube_dri/sm_seg_num [0],\u_tube_dri/sm_seg_num [0]}),
    .b({\u_tube_dri/sm_seg_num [1],\u_tube_dri/sm_seg_num [1]}),
    .c({\u_tube_dri/sm_seg_num [2],\u_tube_dri/sm_seg_num [2]}),
    .d({\u_tube_dri/sm_seg_num [3],\u_tube_dri/sm_seg_num [3]}),
    .f({tube_pad[0],tube_pad[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    //.LUTF1("(A*~B*C*~D+~A*B*C*~D)"),
    //.LUTG0("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    //.LUTG1("(A*~B*C*~D+~A*B*C*~D)"),
    .INIT_LUTF0(16'b0000001010111010),
    .INIT_LUTF1(16'b0000000001100000),
    .INIT_LUTG0(16'b0000001010111010),
    .INIT_LUTG1(16'b0000000001100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \u_tube_dri/mux2_b1_rom0|u_tube_dri/mux2_b4_rom0  (
    .a({\u_tube_dri/sm_seg_num [0],\u_tube_dri/sm_seg_num [0]}),
    .b({\u_tube_dri/sm_seg_num [1],\u_tube_dri/sm_seg_num [1]}),
    .c({\u_tube_dri/sm_seg_num [2],\u_tube_dri/sm_seg_num [2]}),
    .d({\u_tube_dri/sm_seg_num [3],\u_tube_dri/sm_seg_num [3]}),
    .f({tube_pad[1],tube_pad[4]}));
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b10|u_tube_dri/reg1_b17  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [10],\u_tube_dri/n1 [17]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [10],\u_tube_dri/cnt_w [17]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b11|u_tube_dri/reg1_b16  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [11],\u_tube_dri/n1 [16]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [11],\u_tube_dri/cnt_w [16]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b12|u_tube_dri/reg1_b9  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [12],\u_tube_dri/n1 [9]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [12],\u_tube_dri/cnt_w [9]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b13|u_tube_dri/reg1_b8  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [13],\u_tube_dri/n1 [8]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [13],\u_tube_dri/cnt_w [8]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b14|u_tube_dri/reg1_b7  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [14],\u_tube_dri/n1 [7]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [14],\u_tube_dri/cnt_w [7]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b15|u_tube_dri/reg1_b6  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [15],\u_tube_dri/n1 [6]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [15],\u_tube_dri/cnt_w [6]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b2|u_tube_dri/reg1_b5  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [2],\u_tube_dri/n1 [5]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [2],\u_tube_dri/cnt_w [5]}));  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_tube_dri/reg1_b3|u_tube_dri/reg1_b4  (
    .clk(sclk_pad),
    .mi({\u_tube_dri/n1 [3],\u_tube_dri/n1 [4]}),
    .sr(\u_tube_dri/rst_n ),
    .q({\u_tube_dri/cnt_w [3],\u_tube_dri/cnt_w [4]}));  // src/rtl/tube/tube_dri.v(61)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("B1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_tube_dri/reg2_b0_DO  (
    .ce(1'b1),
    .do({open_n832,open_n833,open_n834,\u_tube_dri/mux1_b0_sel_is_0_o_neg }),
    .osclk(sclk_pad),
    .rst(\u_tube_dri/rst_n ),
    .opad(tube_sel[0]));  // src/rtl/tube/tube_dri.v(91)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_tube_dri/reg2_b1_DO  (
    .ce(1'b1),
    .do({open_n846,open_n847,open_n848,\u_tube_dri/mux1_b1_sel_is_1_o_neg }),
    .osclk(sclk_pad),
    .rst(\u_tube_dri/rst_n ),
    .opad(tube_sel[1]));  // src/rtl/tube/tube_dri.v(91)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_tube_dri/reg2_b2_DO  (
    .ce(1'b1),
    .do({open_n860,open_n861,open_n862,\u_tube_dri/mux1_b2_sel_is_2_o_neg }),
    .osclk(sclk_pad),
    .rst(\u_tube_dri/rst_n ),
    .opad(tube_sel[2]));  // src/rtl/tube/tube_dri.v(91)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("F3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \u_tube_dri/reg2_b3_DO  (
    .ce(1'b1),
    .do({open_n874,open_n875,open_n876,\u_tube_dri/mux1_b3_sel_is_3_o_neg }),
    .osclk(sclk_pad),
    .rst(\u_tube_dri/rst_n ),
    .opad(tube_sel[3]));  // src/rtl/tube/tube_dri.v(91)
  EG_PHY_MSLICE #(
    //.MACRO("u_tube_dri/ux_rst/reg0_b0|u_tube_dri/ux_rst/add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_tube_dri/ux_rst/reg0_b0|u_tube_dri/ux_rst/add0/ucin  (
    .a({\u_tube_dri/ux_rst/cnt [0],1'b0}),
    .b({1'b1,open_n888}),
    .clk(sclk_pad),
    .sr(\u_tube_dri/ux_rst/n0 ),
    .fco(\u_tube_dri/ux_rst/add0/c1 ),
    .q({\u_tube_dri/ux_rst/cnt [0],open_n910}));
  EG_PHY_MSLICE #(
    //.MACRO("u_tube_dri/ux_rst/reg0_b0|u_tube_dri/ux_rst/add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_tube_dri/ux_rst/reg0_b2|u_tube_dri/ux_rst/reg0_b1  (
    .a(\u_tube_dri/ux_rst/cnt [2:1]),
    .b(2'b00),
    .clk(sclk_pad),
    .fci(\u_tube_dri/ux_rst/add0/c1 ),
    .sr(\u_tube_dri/ux_rst/n0 ),
    .fco(\u_tube_dri/ux_rst/add0/c3 ),
    .q(\u_tube_dri/ux_rst/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_tube_dri/ux_rst/reg0_b0|u_tube_dri/ux_rst/add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_tube_dri/ux_rst/reg0_b3_al_u43  (
    .a({open_n931,\u_tube_dri/ux_rst/cnt [3]}),
    .b({open_n932,1'b0}),
    .clk(sclk_pad),
    .fci(\u_tube_dri/ux_rst/add0/c3 ),
    .sr(\u_tube_dri/ux_rst/n0 ),
    .q({open_n954,\u_tube_dri/ux_rst/cnt [3]}));
  \uart(CLK_RATE=24000000)  u_uart (
    .busy(busy),
    .clk(sclk_pad),
    .fls_read(fls_read),
    .id(id),
    .rx(rxd),
    .fls_addr(fls_addr),
    .fls_write(fls_write),
    .led(led),
    .mod_sel(mod_sel),
    .sm_bit1(sm_bit1_num),
    .sm_bit2(sm_bit2_num),
    .sm_bit3(sm_bit3_num),
    .sm_bit4(sm_bit4_num),
    .start(start),
    .tx(txd));  // src/rtl/top.v(57)

endmodule 

module flash_dri  // src/rtl/flash/flash_dri.v(22)
  (
  clk,
  fls_addr,
  fls_sdi,
  fls_write,
  mod_sel,
  start,
  busy,
  fls_ncs,
  fls_read,
  fls_sck,
  fls_sdo,
  frd_addr,
  frd_data,
  frd_en,
  id
  );

  input clk;  // src/rtl/flash/flash_dri.v(24)
  input [23:0] fls_addr;  // src/rtl/flash/flash_dri.v(37)
  input fls_sdi;  // src/rtl/flash/flash_dri.v(30)
  input [7:0] fls_write;  // src/rtl/flash/flash_dri.v(38)
  input [2:0] mod_sel;  // src/rtl/flash/flash_dri.v(34)
  input start;  // src/rtl/flash/flash_dri.v(33)
  output busy;  // src/rtl/flash/flash_dri.v(48)
  output fls_ncs;  // src/rtl/flash/flash_dri.v(28)
  output [7:0] fls_read;  // src/rtl/flash/flash_dri.v(39)
  output fls_sck;  // src/rtl/flash/flash_dri.v(27)
  output fls_sdo;  // src/rtl/flash/flash_dri.v(29)
  output [23:0] frd_addr;  // src/rtl/flash/flash_dri.v(43)
  output [7:0] frd_data;  // src/rtl/flash/flash_dri.v(44)
  output frd_en;  // src/rtl/flash/flash_dri.v(42)
  output [15:0] id;  // src/rtl/flash/flash_dri.v(47)

  wire [9:0] \u_flash_erase/cnt ;  // src/rtl/flash/flash_erase.v(36)
  wire [6:0] \u_flash_erase/cycle_cnt ;  // src/rtl/flash/flash_erase.v(37)
  wire [9:0] \u_flash_erase/n0 ;
  wire [2:0] \u_flash_erase/phase_cnt ;  // src/rtl/flash/flash_erase.v(38)
  wire [7:0] \u_flash_erase/tx_reg ;  // src/rtl/flash/flash_erase.v(39)
  wire [9:0] \u_flash_id/cnt ;  // src/rtl/flash/flash_id.v(37)
  wire [6:0] \u_flash_id/cycle_cnt ;  // src/rtl/flash/flash_id.v(38)
  wire [9:0] \u_flash_id/n0 ;
  wire [2:0] \u_flash_id/phase_cnt ;  // src/rtl/flash/flash_id.v(39)
  wire [7:0] \u_flash_id/rx_reg ;  // src/rtl/flash/flash_id.v(41)
  wire [31:0] \u_flash_id/tx_reg ;  // src/rtl/flash/flash_id.v(40)
  wire [9:0] \u_flash_read/cnt ;  // src/rtl/flash/flash_read.v(41)
  wire [6:0] \u_flash_read/cycle_cnt ;  // src/rtl/flash/flash_read.v(42)
  wire [9:0] \u_flash_read/n0 ;
  wire [2:0] \u_flash_read/phase_cnt ;  // src/rtl/flash/flash_read.v(43)
  wire [7:0] \u_flash_read/rx_reg ;  // src/rtl/flash/flash_read.v(45)
  wire [31:0] \u_flash_read/tx_reg ;  // src/rtl/flash/flash_read.v(44)
  wire [9:0] \u_flash_sector_erase/cnt ;  // src/rtl/flash/flash_sector_erase.v(39)
  wire [6:0] \u_flash_sector_erase/cycle_cnt ;  // src/rtl/flash/flash_sector_erase.v(40)
  wire [9:0] \u_flash_sector_erase/n0 ;
  wire [2:0] \u_flash_sector_erase/phase_cnt ;  // src/rtl/flash/flash_sector_erase.v(41)
  wire [31:0] \u_flash_sector_erase/tx_reg ;  // src/rtl/flash/flash_sector_erase.v(42)
  wire [31:0] \u_flash_wait_free/cnt ;  // src/rtl/flash/flash_wait_free.v(36)
  wire [28:0] \u_flash_wait_free/cycle_cnt ;  // src/rtl/flash/flash_wait_free.v(37)
  wire [31:0] \u_flash_wait_free/n0 ;
  wire [2:0] \u_flash_wait_free/phase_cnt ;  // src/rtl/flash/flash_wait_free.v(38)
  wire [7:0] \u_flash_wait_free/rx_reg ;  // src/rtl/flash/flash_wait_free.v(40)
  wire [7:0] \u_flash_wait_free/tx_reg ;  // src/rtl/flash/flash_wait_free.v(39)
  wire [9:0] \u_flash_write/cnt ;  // src/rtl/flash/flash_write.v(40)
  wire [6:0] \u_flash_write/cycle_cnt ;  // src/rtl/flash/flash_write.v(41)
  wire [9:0] \u_flash_write/n0 ;
  wire [2:0] \u_flash_write/phase_cnt ;  // src/rtl/flash/flash_write.v(42)
  wire [39:0] \u_flash_write/tx_reg ;  // src/rtl/flash/flash_write.v(43)
  wire [9:0] \u_flash_write_enable/cnt ;  // src/rtl/flash/flash_write_enable.v(36)
  wire [6:0] \u_flash_write_enable/cycle_cnt ;  // src/rtl/flash/flash_write_enable.v(37)
  wire [2:0] \u_flash_write_enable/phase_cnt ;  // src/rtl/flash/flash_write_enable.v(38)
  wire [7:0] \u_flash_write_enable/tx_reg ;  // src/rtl/flash/flash_write_enable.v(39)
  wire _al_u101_o;
  wire _al_u103_o;
  wire _al_u105_o;
  wire _al_u107_o;
  wire _al_u109_o;
  wire _al_u112_o;
  wire _al_u114_o;
  wire _al_u116_o;
  wire _al_u118_o;
  wire _al_u120_o;
  wire _al_u122_o;
  wire _al_u124_o;
  wire _al_u126_o;
  wire _al_u128_o;
  wire _al_u130_o;
  wire _al_u132_o;
  wire _al_u134_o;
  wire _al_u136_o;
  wire _al_u138_o;
  wire _al_u140_o;
  wire _al_u142_o;
  wire _al_u144_o;
  wire _al_u146_o;
  wire _al_u148_o;
  wire _al_u150_o;
  wire _al_u152_o;
  wire _al_u154_o;
  wire _al_u156_o;
  wire _al_u158_o;
  wire _al_u160_o;
  wire _al_u162_o;
  wire _al_u164_o;
  wire _al_u166_o;
  wire _al_u168_o;
  wire _al_u170_o;
  wire _al_u172_o;
  wire _al_u175_o;
  wire _al_u176_o;
  wire _al_u177_o;
  wire _al_u178_o;
  wire _al_u179_o;
  wire _al_u180_o;
  wire _al_u181_o;
  wire _al_u182_o;
  wire _al_u183_o;
  wire _al_u185_o;
  wire _al_u186_o;
  wire _al_u187_o;
  wire _al_u188_o;
  wire _al_u189_o;
  wire _al_u18_o;
  wire _al_u190_o;
  wire _al_u192_o;
  wire _al_u193_o;
  wire _al_u194_o;
  wire _al_u195_o;
  wire _al_u196_o;
  wire _al_u197_o;
  wire _al_u20_o;
  wire _al_u219_o;
  wire _al_u221_o;
  wire _al_u223_o;
  wire _al_u226_o;
  wire _al_u229_o;
  wire _al_u22_o;
  wire _al_u231_o;
  wire _al_u233_o;
  wire _al_u235_o;
  wire _al_u237_o;
  wire _al_u239_o;
  wire _al_u241_o;
  wire _al_u242_o;
  wire _al_u24_o;
  wire _al_u26_o;
  wire _al_u28_o;
  wire _al_u30_o;
  wire _al_u32_o;
  wire _al_u34_o;
  wire _al_u36_o;
  wire _al_u38_o;
  wire _al_u40_o;
  wire _al_u42_o;
  wire _al_u44_o;
  wire _al_u46_o;
  wire _al_u48_o;
  wire _al_u50_o;
  wire _al_u52_o;
  wire _al_u54_o;
  wire _al_u56_o;
  wire _al_u58_o;
  wire _al_u60_o;
  wire _al_u62_o;
  wire _al_u65_o;
  wire _al_u67_o;
  wire _al_u69_o;
  wire _al_u71_o;
  wire _al_u73_o;
  wire _al_u75_o;
  wire _al_u77_o;
  wire _al_u79_o;
  wire _al_u81_o;
  wire _al_u83_o;
  wire _al_u85_o;
  wire _al_u87_o;
  wire _al_u89_o;
  wire _al_u91_o;
  wire _al_u93_o;
  wire _al_u95_o;
  wire _al_u97_o;
  wire _al_u99_o;
  wire busy_erase;  // src/rtl/flash/flash_dri.v(104)
  wire busy_frd;  // src/rtl/flash/flash_dri.v(108)
  wire busy_id;  // src/rtl/flash/flash_dri.v(109)
  wire busy_rd;  // src/rtl/flash/flash_dri.v(107)
  wire busy_sector;  // src/rtl/flash/flash_dri.v(105)
  wire busy_wen;  // src/rtl/flash/flash_dri.v(102)
  wire busy_wfree;  // src/rtl/flash/flash_dri.v(103)
  wire busy_wr;  // src/rtl/flash/flash_dri.v(106)
  wire fls_ncs_erase;  // src/rtl/flash/flash_dri.v(64)
  wire fls_ncs_frd;  // src/rtl/flash/flash_dri.v(68)
  wire fls_ncs_id;  // src/rtl/flash/flash_dri.v(69)
  wire fls_ncs_rd;  // src/rtl/flash/flash_dri.v(67)
  wire fls_ncs_sector;  // src/rtl/flash/flash_dri.v(65)
  wire fls_ncs_wen;  // src/rtl/flash/flash_dri.v(62)
  wire fls_ncs_wfree;  // src/rtl/flash/flash_dri.v(63)
  wire fls_ncs_wr;  // src/rtl/flash/flash_dri.v(66)
  wire fls_sck_erase;  // src/rtl/flash/flash_dri.v(54)
  wire fls_sck_frd;  // src/rtl/flash/flash_dri.v(58)
  wire fls_sck_id;  // src/rtl/flash/flash_dri.v(59)
  wire fls_sck_rd;  // src/rtl/flash/flash_dri.v(57)
  wire fls_sck_sector;  // src/rtl/flash/flash_dri.v(55)
  wire fls_sck_wen;  // src/rtl/flash/flash_dri.v(52)
  wire fls_sck_wfree;  // src/rtl/flash/flash_dri.v(53)
  wire fls_sck_wr;  // src/rtl/flash/flash_dri.v(56)
  wire fls_sdi_frd;  // src/rtl/flash/flash_dri.v(88)
  wire fls_sdi_id;  // src/rtl/flash/flash_dri.v(89)
  wire fls_sdi_rd;  // src/rtl/flash/flash_dri.v(87)
  wire fls_sdi_wfree;  // src/rtl/flash/flash_dri.v(83)
  wire fls_sdo_erase;  // src/rtl/flash/flash_dri.v(74)
  wire fls_sdo_frd;  // src/rtl/flash/flash_dri.v(78)
  wire fls_sdo_id;  // src/rtl/flash/flash_dri.v(79)
  wire fls_sdo_rd;  // src/rtl/flash/flash_dri.v(77)
  wire fls_sdo_sector;  // src/rtl/flash/flash_dri.v(75)
  wire fls_sdo_wen;  // src/rtl/flash/flash_dri.v(72)
  wire fls_sdo_wfree;  // src/rtl/flash/flash_dri.v(73)
  wire fls_sdo_wr;  // src/rtl/flash/flash_dri.v(76)
  wire n24;
  wire n25;
  wire n26;
  wire start_erase;  // src/rtl/flash/flash_dri.v(94)
  wire start_frd;  // src/rtl/flash/flash_dri.v(98)
  wire start_id;  // src/rtl/flash/flash_dri.v(99)
  wire start_rd;  // src/rtl/flash/flash_dri.v(97)
  wire start_sector;  // src/rtl/flash/flash_dri.v(95)
  wire start_wen;  // src/rtl/flash/flash_dri.v(92)
  wire start_wfree;  // src/rtl/flash/flash_dri.v(93)
  wire start_wr;  // src/rtl/flash/flash_dri.v(96)
  wire \u_flash_erase/add0/c3 ;
  wire \u_flash_erase/add0/c7 ;
  wire \u_flash_erase/n6 ;
  wire \u_flash_erase/sft_wen ;  // src/rtl/flash/flash_erase.v(40)
  wire \u_flash_id/add0/c3 ;
  wire \u_flash_id/add0/c7 ;
  wire \u_flash_id/byte_flag ;  // src/rtl/flash/flash_id.v(44)
  wire \u_flash_id/lt0_c1 ;
  wire \u_flash_id/lt0_c3 ;
  wire \u_flash_id/lt0_c5 ;
  wire \u_flash_id/lt0_c7 ;
  wire \u_flash_id/lt1_c1 ;
  wire \u_flash_id/lt1_c3 ;
  wire \u_flash_id/lt1_c5 ;
  wire \u_flash_id/lt1_c7 ;
  wire \u_flash_id/n17 ;
  wire \u_flash_id/n7 ;
  wire \u_flash_id/n9 ;
  wire \u_flash_id/sft_ren ;  // src/rtl/flash/flash_id.v(43)
  wire \u_flash_id/sft_wen ;  // src/rtl/flash/flash_id.v(42)
  wire \u_flash_read/add0/c3 ;
  wire \u_flash_read/add0/c7 ;
  wire \u_flash_read/byte_flag ;  // src/rtl/flash/flash_read.v(48)
  wire \u_flash_read/lt0_c1 ;
  wire \u_flash_read/lt0_c3 ;
  wire \u_flash_read/lt0_c5 ;
  wire \u_flash_read/lt0_c7 ;
  wire \u_flash_read/n15 ;
  wire \u_flash_read/n7 ;
  wire \u_flash_read/sft_ren ;  // src/rtl/flash/flash_read.v(47)
  wire \u_flash_read/sft_wen ;  // src/rtl/flash/flash_read.v(46)
  wire \u_flash_sector_erase/add0/c3 ;
  wire \u_flash_sector_erase/add0/c7 ;
  wire \u_flash_sector_erase/n6 ;
  wire \u_flash_sector_erase/sft_wen ;  // src/rtl/flash/flash_sector_erase.v(43)
  wire \u_flash_wait_free/add0/c11 ;
  wire \u_flash_wait_free/add0/c15 ;
  wire \u_flash_wait_free/add0/c19 ;
  wire \u_flash_wait_free/add0/c23 ;
  wire \u_flash_wait_free/add0/c27 ;
  wire \u_flash_wait_free/add0/c3 ;
  wire \u_flash_wait_free/add0/c31 ;
  wire \u_flash_wait_free/add0/c7 ;
  wire \u_flash_wait_free/byte_flag ;  // src/rtl/flash/flash_wait_free.v(43)
  wire \u_flash_wait_free/fls_busy ;  // src/rtl/flash/flash_wait_free.v(44)
  wire \u_flash_wait_free/lt0_c1 ;
  wire \u_flash_wait_free/lt0_c11 ;
  wire \u_flash_wait_free/lt0_c13 ;
  wire \u_flash_wait_free/lt0_c15 ;
  wire \u_flash_wait_free/lt0_c17 ;
  wire \u_flash_wait_free/lt0_c19 ;
  wire \u_flash_wait_free/lt0_c21 ;
  wire \u_flash_wait_free/lt0_c23 ;
  wire \u_flash_wait_free/lt0_c25 ;
  wire \u_flash_wait_free/lt0_c27 ;
  wire \u_flash_wait_free/lt0_c29 ;
  wire \u_flash_wait_free/lt0_c3 ;
  wire \u_flash_wait_free/lt0_c5 ;
  wire \u_flash_wait_free/lt0_c7 ;
  wire \u_flash_wait_free/lt0_c9 ;
  wire \u_flash_wait_free/n18 ;
  wire \u_flash_wait_free/n7 ;
  wire \u_flash_wait_free/sft_ren ;  // src/rtl/flash/flash_wait_free.v(42)
  wire \u_flash_wait_free/sft_wen ;  // src/rtl/flash/flash_wait_free.v(41)
  wire \u_flash_write/add0/c3 ;
  wire \u_flash_write/add0/c7 ;
  wire \u_flash_write/n6 ;
  wire \u_flash_write/sft_wen ;  // src/rtl/flash/flash_write.v(44)
  wire \u_flash_write_enable/add0/c1 ;
  wire \u_flash_write_enable/add0/c3 ;
  wire \u_flash_write_enable/add0/c5 ;
  wire \u_flash_write_enable/add0/c7 ;
  wire \u_flash_write_enable/add0/c9 ;
  wire \u_flash_write_enable/n6 ;
  wire \u_flash_write_enable/sft_wen ;  // src/rtl/flash/flash_write_enable.v(40)

  // src/rtl/flash/flash_sector_erase.v(116)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u101|u_flash_sector_erase/busy_reg  (
    .a({start_sector,_al_u226_o}),
    .b({\u_flash_sector_erase/tx_reg [12],\u_flash_sector_erase/cycle_cnt [4]}),
    .c({\u_flash_sector_erase/tx_reg [13],\u_flash_sector_erase/cycle_cnt [5]}),
    .ce(\u_flash_sector_erase/n6 ),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,\u_flash_sector_erase/cycle_cnt [6]}),
    .mi({open_n3,1'b0}),
    .sr(start_sector),
    .f({_al_u101_o,\u_flash_sector_erase/n6 }),
    .q({open_n18,busy_sector}));  // src/rtl/flash/flash_sector_erase.v(116)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u103|u_flash_sector_erase/reg2_b23  (
    .a({start_sector,open_n19}),
    .b({\u_flash_sector_erase/tx_reg [11],fls_addr[23]}),
    .c({\u_flash_sector_erase/tx_reg [12],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u79_o}),
    .f({_al_u103_o,open_n34}),
    .q({open_n38,\u_flash_sector_erase/tx_reg [23]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u105|u_flash_sector_erase/reg2_b22  (
    .a({start_sector,open_n39}),
    .b({\u_flash_sector_erase/tx_reg [10],fls_addr[22]}),
    .c({\u_flash_sector_erase/tx_reg [11],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u81_o}),
    .f({_al_u105_o,open_n54}),
    .q({open_n58,\u_flash_sector_erase/tx_reg [22]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010100010001),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u107|u_flash_sector_erase/reg2_b10  (
    .a({start_sector,open_n59}),
    .b({\u_flash_sector_erase/tx_reg [10],fls_addr[10]}),
    .c({\u_flash_sector_erase/tx_reg [9],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u107_o}),
    .f({_al_u107_o,open_n78}),
    .q({open_n82,\u_flash_sector_erase/tx_reg [10]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000100010111000),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u109|u_flash_sector_erase/reg2_b0  (
    .a({start_sector,fls_addr[0]}),
    .b({\u_flash_sector_erase/tx_reg [0],start_sector}),
    .c(\u_flash_sector_erase/tx_reg [1:0]),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,\u_flash_sector_erase/sft_wen }),
    .f({_al_u109_o,open_n97}),
    .q({open_n101,\u_flash_sector_erase/tx_reg [0]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_write.v(124)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u112|u_flash_write/busy_reg  (
    .a({start_wr,_al_u229_o}),
    .b({\u_flash_write/tx_reg [8],\u_flash_write/cycle_cnt [4]}),
    .c({\u_flash_write/tx_reg [9],\u_flash_write/cycle_cnt [5]}),
    .ce(\u_flash_write/n6 ),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,\u_flash_write/cycle_cnt [6]}),
    .mi({open_n105,1'b0}),
    .sr(start_wr),
    .f({_al_u112_o,\u_flash_write/n6 }),
    .q({open_n120,busy_wr}));  // src/rtl/flash/flash_write.v(124)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u114|u_flash_write/reg2_b8  (
    .a({start_wr,open_n121}),
    .b({\u_flash_write/tx_reg [7],fls_addr[0]}),
    .c({\u_flash_write/tx_reg [8],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u114_o}),
    .f({_al_u114_o,open_n136}),
    .q({open_n140,\u_flash_write/tx_reg [8]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u116|u_flash_write/reg2_b7  (
    .a({start_wr,open_n141}),
    .b({\u_flash_write/tx_reg [6],fls_write[7]}),
    .c({\u_flash_write/tx_reg [7],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u116_o}),
    .f({_al_u116_o,open_n160}),
    .q({open_n164,\u_flash_write/tx_reg [7]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u118|u_flash_write/reg2_b6  (
    .a({start_wr,open_n165}),
    .b({\u_flash_write/tx_reg [5],fls_write[6]}),
    .c({\u_flash_write/tx_reg [6],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u118_o}),
    .f({_al_u118_o,open_n180}),
    .q({open_n184,\u_flash_write/tx_reg [6]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u120|u_flash_write/reg2_b5  (
    .a({start_wr,open_n185}),
    .b({\u_flash_write/tx_reg [4],fls_write[5]}),
    .c({\u_flash_write/tx_reg [5],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u120_o}),
    .f({_al_u120_o,open_n200}),
    .q({open_n204,\u_flash_write/tx_reg [5]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u122|u_flash_write/reg2_b4  (
    .a({start_wr,open_n205}),
    .b({\u_flash_write/tx_reg [3],fls_write[4]}),
    .c({\u_flash_write/tx_reg [4],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u122_o}),
    .f({_al_u122_o,open_n224}),
    .q({open_n228,\u_flash_write/tx_reg [4]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000100000101),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0001000100000101),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u126|u_flash_write/reg2_b32  (
    .a({start_wr,start_wr}),
    .b({\u_flash_write/tx_reg [29],\u_flash_write/tx_reg [30]}),
    .c({\u_flash_write/tx_reg [30],\u_flash_write/tx_reg [31]}),
    .ce(\u_flash_write/sft_wen ),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,\u_flash_write/sft_wen }),
    .mi({open_n232,\u_flash_write/tx_reg [31]}),
    .sr(start_wr),
    .f({_al_u126_o,_al_u124_o}),
    .q({open_n247,\u_flash_write/tx_reg [32]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u128|u_flash_write/reg2_b3  (
    .a({start_wr,open_n248}),
    .b({\u_flash_write/tx_reg [2],fls_write[3]}),
    .c({\u_flash_write/tx_reg [3],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u128_o}),
    .f({_al_u128_o,open_n267}),
    .q({open_n271,\u_flash_write/tx_reg [3]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u130|u_flash_write/reg2_b29  (
    .a({start_wr,open_n272}),
    .b({\u_flash_write/tx_reg [28],fls_addr[21]}),
    .c({\u_flash_write/tx_reg [29],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u130_o}),
    .f({_al_u130_o,open_n291}),
    .q({open_n295,\u_flash_write/tx_reg [29]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u132|u_flash_write/reg2_b28  (
    .a({start_wr,open_n296}),
    .b({\u_flash_write/tx_reg [27],fls_addr[20]}),
    .c({\u_flash_write/tx_reg [28],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u132_o}),
    .f({_al_u132_o,open_n311}),
    .q({open_n315,\u_flash_write/tx_reg [28]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u134|u_flash_write/reg2_b27  (
    .a({start_wr,open_n316}),
    .b({\u_flash_write/tx_reg [26],fls_addr[19]}),
    .c({\u_flash_write/tx_reg [27],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u134_o}),
    .f({_al_u134_o,open_n331}),
    .q({open_n335,\u_flash_write/tx_reg [27]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u136|u_flash_write/reg2_b26  (
    .a({start_wr,open_n336}),
    .b({\u_flash_write/tx_reg [25],fls_addr[18]}),
    .c({\u_flash_write/tx_reg [26],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u136_o}),
    .f({_al_u136_o,open_n355}),
    .q({open_n359,\u_flash_write/tx_reg [26]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u138|u_flash_write/reg2_b25  (
    .a({start_wr,open_n360}),
    .b({\u_flash_write/tx_reg [24],fls_addr[17]}),
    .c({\u_flash_write/tx_reg [25],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u138_o}),
    .f({_al_u138_o,open_n379}),
    .q({open_n383,\u_flash_write/tx_reg [25]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u140|u_flash_write/reg2_b24  (
    .a({start_wr,open_n384}),
    .b({\u_flash_write/tx_reg [23],fls_addr[16]}),
    .c({\u_flash_write/tx_reg [24],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u140_o}),
    .f({_al_u140_o,open_n399}),
    .q({open_n403,\u_flash_write/tx_reg [24]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u142|u_flash_write/reg2_b23  (
    .a({start_wr,open_n404}),
    .b({\u_flash_write/tx_reg [22],fls_addr[15]}),
    .c({\u_flash_write/tx_reg [23],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u142_o}),
    .f({_al_u142_o,open_n419}),
    .q({open_n423,\u_flash_write/tx_reg [23]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u144|u_flash_write/reg2_b22  (
    .a({start_wr,open_n424}),
    .b({\u_flash_write/tx_reg [21],fls_addr[14]}),
    .c({\u_flash_write/tx_reg [22],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u144_o}),
    .f({_al_u144_o,open_n443}),
    .q({open_n447,\u_flash_write/tx_reg [22]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u146|u_flash_write/reg2_b21  (
    .a({start_wr,open_n448}),
    .b({\u_flash_write/tx_reg [20],fls_addr[13]}),
    .c({\u_flash_write/tx_reg [21],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u146_o}),
    .f({_al_u146_o,open_n467}),
    .q({open_n471,\u_flash_write/tx_reg [21]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u148|u_flash_write/reg2_b20  (
    .a({start_wr,open_n472}),
    .b({\u_flash_write/tx_reg [19],fls_addr[12]}),
    .c({\u_flash_write/tx_reg [20],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u148_o}),
    .f({_al_u148_o,open_n487}),
    .q({open_n491,\u_flash_write/tx_reg [20]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u150|u_flash_write/reg2_b2  (
    .a({start_wr,open_n492}),
    .b({\u_flash_write/tx_reg [1],fls_write[2]}),
    .c({\u_flash_write/tx_reg [2],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u150_o}),
    .f({_al_u150_o,open_n507}),
    .q({open_n511,\u_flash_write/tx_reg [2]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u152|u_flash_write/reg2_b19  (
    .a({start_wr,open_n512}),
    .b({\u_flash_write/tx_reg [18],fls_addr[11]}),
    .c({\u_flash_write/tx_reg [19],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u152_o}),
    .f({_al_u152_o,open_n527}),
    .q({open_n531,\u_flash_write/tx_reg [19]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u154|u_flash_write/reg2_b18  (
    .a({start_wr,open_n532}),
    .b({\u_flash_write/tx_reg [17],fls_addr[10]}),
    .c({\u_flash_write/tx_reg [18],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u154_o}),
    .f({_al_u154_o,open_n551}),
    .q({open_n555,\u_flash_write/tx_reg [18]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u156|u_flash_write/reg2_b17  (
    .a({start_wr,open_n556}),
    .b({\u_flash_write/tx_reg [16],fls_addr[9]}),
    .c({\u_flash_write/tx_reg [17],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u156_o}),
    .f({_al_u156_o,open_n575}),
    .q({open_n579,\u_flash_write/tx_reg [17]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u158|u_flash_write/reg2_b16  (
    .a({start_wr,open_n580}),
    .b({\u_flash_write/tx_reg [15],fls_addr[8]}),
    .c({\u_flash_write/tx_reg [16],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u158_o}),
    .f({_al_u158_o,open_n595}),
    .q({open_n599,\u_flash_write/tx_reg [16]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u160|u_flash_write/reg2_b15  (
    .a({start_wr,open_n600}),
    .b({\u_flash_write/tx_reg [14],fls_addr[7]}),
    .c({\u_flash_write/tx_reg [15],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u160_o}),
    .f({_al_u160_o,open_n615}),
    .q({open_n619,\u_flash_write/tx_reg [15]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u162|u_flash_write/reg2_b14  (
    .a({start_wr,open_n620}),
    .b({\u_flash_write/tx_reg [13],fls_addr[6]}),
    .c({\u_flash_write/tx_reg [14],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u162_o}),
    .f({_al_u162_o,open_n639}),
    .q({open_n643,\u_flash_write/tx_reg [14]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u164|u_flash_write/reg2_b13  (
    .a({start_wr,open_n644}),
    .b({\u_flash_write/tx_reg [12],fls_addr[5]}),
    .c({\u_flash_write/tx_reg [13],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u164_o}),
    .f({_al_u164_o,open_n663}),
    .q({open_n667,\u_flash_write/tx_reg [13]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u166|u_flash_write/reg2_b12  (
    .a({start_wr,open_n668}),
    .b({\u_flash_write/tx_reg [11],fls_addr[4]}),
    .c({\u_flash_write/tx_reg [12],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u166_o}),
    .f({_al_u166_o,open_n683}),
    .q({open_n687,\u_flash_write/tx_reg [12]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u168|u_flash_write/reg2_b11  (
    .a({start_wr,open_n688}),
    .b({\u_flash_write/tx_reg [10],fls_addr[3]}),
    .c({\u_flash_write/tx_reg [11],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u168_o}),
    .f({_al_u168_o,open_n703}),
    .q({open_n707,\u_flash_write/tx_reg [11]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000010100010001),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000010100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u170|u_flash_write/reg2_b9  (
    .a({start_wr,open_n708}),
    .b({\u_flash_write/tx_reg [10],fls_addr[1]}),
    .c({\u_flash_write/tx_reg [9],start_wr}),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,_al_u112_o}),
    .f({_al_u170_o,open_n727}),
    .q({open_n731,\u_flash_write/tx_reg [9]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    //.LUT0("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000100010111000),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u172|u_flash_write/reg2_b0  (
    .a({start_wr,fls_write[0]}),
    .b({\u_flash_write/tx_reg [0],start_wr}),
    .c(\u_flash_write/tx_reg [1:0]),
    .clk(clk),
    .d({\u_flash_write/sft_wen ,\u_flash_write/sft_wen }),
    .f({_al_u172_o,open_n746}),
    .q({open_n750,\u_flash_write/tx_reg [0]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_read.v(125)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*A)"),
    //.LUT1("(D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001000000000),
    .INIT_LUT1(16'b0000001000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u175|u_flash_read/fls_sdo_reg  (
    .a({mod_sel[2],mod_sel[2]}),
    .b({mod_sel[1],mod_sel[1]}),
    .c({mod_sel[0],mod_sel[0]}),
    .clk(clk),
    .d({fls_ncs_rd,fls_sdo_rd}),
    .mi({open_n762,\u_flash_read/tx_reg [31]}),
    .f({_al_u175_o,_al_u195_o}),
    .q({open_n767,fls_sdo_rd}));  // src/rtl/flash/flash_read.v(125)
  // src/rtl/flash/flash_sector_erase.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(B*A*~(~D*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b1000100000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u177|u_flash_sector_erase/fls_ncs_reg  (
    .a({mod_sel[2],open_n768}),
    .b({mod_sel[1],open_n769}),
    .c({mod_sel[0],open_n770}),
    .clk(clk),
    .d({fls_ncs_sector,busy_sector}),
    .f({_al_u177_o,open_n785}),
    .q({open_n789,fls_ncs_sector}));  // src/rtl/flash/flash_sector_erase.v(86)
  // src/rtl/flash/flash_id.v(144)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~A*~(B*~(~D*~C)))"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~A*~(B*~(~D*~C)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0001000100010101),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0001000100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u178|u_flash_id/busy_reg  (
    .a({_al_u175_o,_al_u221_o}),
    .b({_al_u177_o,\u_flash_id/cycle_cnt [4]}),
    .c({mod_sel[0],\u_flash_id/cycle_cnt [5]}),
    .ce(\u_flash_id/n17 ),
    .clk(clk),
    .d({fls_ncs_id,\u_flash_id/cycle_cnt [6]}),
    .mi({open_n793,1'b0}),
    .sr(start_id),
    .f({_al_u178_o,\u_flash_id/n17 }),
    .q({open_n808,busy_id}));  // src/rtl/flash/flash_id.v(144)
  // src/rtl/flash/flash_read.v(92)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(D*C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0010000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u179|u_flash_read/fls_ncs_reg  (
    .a({mod_sel[2],open_n809}),
    .b({mod_sel[1],open_n810}),
    .c({mod_sel[0],open_n811}),
    .clk(clk),
    .d({fls_ncs_frd,busy_rd}),
    .f({_al_u179_o,open_n826}),
    .q({open_n830,fls_ncs_rd}));  // src/rtl/flash/flash_read.v(92)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u180|_al_u176  (
    .c({mod_sel[1],mod_sel[1]}),
    .d({mod_sel[2],mod_sel[2]}),
    .f({_al_u180_o,_al_u176_o}));
  // src/rtl/flash/flash_erase.v(120)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b1010100000100000),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b1010100000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u181|u_flash_erase/busy_reg  (
    .a({_al_u180_o,_al_u219_o}),
    .b({mod_sel[0],\u_flash_erase/cycle_cnt [4]}),
    .c({fls_ncs_erase,\u_flash_erase/cycle_cnt [5]}),
    .ce(\u_flash_erase/n6 ),
    .clk(clk),
    .d({fls_ncs_wr,\u_flash_erase/cycle_cnt [6]}),
    .mi({open_n858,1'b0}),
    .sr(start_erase),
    .f({_al_u181_o,\u_flash_erase/n6 }),
    .q({open_n873,busy_erase}));  // src/rtl/flash/flash_erase.v(120)
  // src/rtl/flash/flash_write_enable.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*~A)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(D*~C*~B*~A)"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000100000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000000100000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u182|u_flash_write_enable/reg0_b0  (
    .a({open_n874,\u_flash_write_enable/cycle_cnt [0]}),
    .b({open_n875,\u_flash_write_enable/cycle_cnt [1]}),
    .c({mod_sel[1],\u_flash_write_enable/cycle_cnt [2]}),
    .clk(clk),
    .d({mod_sel[2],\u_flash_write_enable/cycle_cnt [3]}),
    .mi({open_n880,\u_flash_write_enable/cnt [3]}),
    .f({_al_u182_o,_al_u231_o}),
    .q({open_n896,\u_flash_write_enable/cycle_cnt [0]}));  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(120)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b1010100000100000),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b1010100000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u183|u_flash_write_enable/busy_reg  (
    .a({_al_u182_o,_al_u231_o}),
    .b({mod_sel[0],\u_flash_write_enable/cycle_cnt [4]}),
    .c({fls_ncs_wfree,\u_flash_write_enable/cycle_cnt [5]}),
    .ce(\u_flash_write_enable/n6 ),
    .clk(clk),
    .d({fls_ncs_wen,\u_flash_write_enable/cycle_cnt [6]}),
    .mi({open_n900,1'b0}),
    .sr(start_wen),
    .f({_al_u183_o,\u_flash_write_enable/n6 }),
    .q({open_n915,busy_wen}));  // src/rtl/flash/flash_write_enable.v(120)
  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("~(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1111111111111101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u184|u_flash_erase/reg3_b0  (
    .a({_al_u178_o,busy_erase}),
    .b({_al_u181_o,busy_frd}),
    .c({_al_u183_o,busy_id}),
    .clk(clk),
    .d({_al_u179_o,busy_rd}),
    .mi({open_n927,\u_flash_erase/n0 [0]}),
    .sr(busy_erase),
    .f({n25,_al_u242_o}),
    .q({open_n931,\u_flash_erase/cnt [0]}));  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_id.v(121)
  EG_PHY_MSLICE #(
    //.LUT0("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUT1("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1010100000100000),
    .INIT_LUT1(16'b1010100000100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u186|u_flash_id/fls_sdo_reg  (
    .a({_al_u176_o,_al_u176_o}),
    .b({mod_sel[0],mod_sel[0]}),
    .c({fls_sck_id,fls_sdo_id}),
    .clk(clk),
    .d({fls_sck_sector,fls_sdo_sector}),
    .mi({open_n943,\u_flash_id/tx_reg [31]}),
    .f({_al_u186_o,_al_u193_o}),
    .q({open_n948,fls_sdo_id}));  // src/rtl/flash/flash_id.v(121)
  // src/rtl/flash/flash_read.v(119)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    //.LUT1("(D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010000000),
    .INIT_LUT1(16'b0000001000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u187|u_flash_read/byte_flag_reg  (
    .a({mod_sel[2],_al_u237_o}),
    .b({mod_sel[1],\u_flash_read/cycle_cnt [2]}),
    .c({mod_sel[0],\u_flash_read/phase_cnt [0]}),
    .clk(clk),
    .d({fls_sck_rd,\u_flash_read/phase_cnt [1]}),
    .f({_al_u187_o,open_n963}),
    .q({open_n967,\u_flash_read/byte_flag }));  // src/rtl/flash/flash_read.v(119)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTF1("(D*C*~B*A)"),
    //.LUTG0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG1("(D*C*~B*A)"),
    .INIT_LUTF0(16'b0001000100000101),
    .INIT_LUTF1(16'b0010000000000000),
    .INIT_LUTG0(16'b0001000100000101),
    .INIT_LUTG1(16'b0010000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u188|_al_u40  (
    .a({mod_sel[2],start_rd}),
    .b({mod_sel[1],\u_flash_read/tx_reg [1]}),
    .c({mod_sel[0],\u_flash_read/tx_reg [2]}),
    .d({fls_sck_frd,\u_flash_read/sft_wen }),
    .f({_al_u188_o,_al_u40_o}));
  // src/rtl/flash/flash_read.v(154)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u18|u_flash_read/busy_reg  (
    .a({start_rd,_al_u223_o}),
    .b({\u_flash_read/tx_reg [8],\u_flash_read/cycle_cnt [4]}),
    .c({\u_flash_read/tx_reg [9],\u_flash_read/cycle_cnt [5]}),
    .ce(\u_flash_read/n15 ),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,\u_flash_read/cycle_cnt [6]}),
    .mi({open_n995,1'b0}),
    .sr(start_rd),
    .f({_al_u18_o,\u_flash_read/n15 }),
    .q({open_n1010,busy_rd}));  // src/rtl/flash/flash_read.v(154)
  // src/rtl/flash/flash_erase.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~A*~(B*~(~D*~C)))"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~A*~(B*~(~D*~C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0001000100010101),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0001000100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u190|u_flash_erase/sft_wen_reg  (
    .a({_al_u188_o,open_n1011}),
    .b({_al_u189_o,\u_flash_erase/phase_cnt [0]}),
    .c({mod_sel[0],\u_flash_erase/phase_cnt [1]}),
    .clk(clk),
    .d({fls_sck_erase,fls_sck_erase}),
    .f({_al_u190_o,open_n1030}),
    .q({open_n1034,\u_flash_erase/sft_wen }));  // src/rtl/flash/flash_erase.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*C*~B*~A)"),
    //.LUTG0("~(~D*C*~B*~A)"),
    .INIT_LUTF0(16'b1111111111101111),
    .INIT_LUTG0(16'b1111111111101111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u191 (
    .a({open_n1035,_al_u185_o}),
    .b({open_n1036,_al_u186_o}),
    .c({open_n1037,_al_u190_o}),
    .d({open_n1040,_al_u187_o}),
    .f({open_n1058,n24}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~A*~(~D*C))"),
    //.LUT1("(D*C*~B*A)"),
    .INIT_LUT0(16'b0100010000000100),
    .INIT_LUT1(16'b0010000000000000),
    .MODE("LOGIC"))
    \_al_u194|_al_u189  (
    .a({mod_sel[2],mod_sel[2]}),
    .b({mod_sel[1],mod_sel[1]}),
    .c({mod_sel[0],mod_sel[0]}),
    .d({fls_sdo_frd,fls_sck_wr}),
    .f({_al_u194_o,_al_u189_o}));
  // src/rtl/flash/flash_wait_free.v(122)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTF1("~(~D*C*~B*~A)"),
    //.LUTG0("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTG1("~(~D*C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010100000100000),
    .INIT_LUTF1(16'b1111111111101111),
    .INIT_LUTG0(16'b1010100000100000),
    .INIT_LUTG1(16'b1111111111101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u198|u_flash_wait_free/fls_sdo_reg  (
    .a({_al_u192_o,_al_u182_o}),
    .b({_al_u193_o,mod_sel[0]}),
    .c({_al_u197_o,fls_sdo_wfree}),
    .clk(clk),
    .d({_al_u194_o,fls_sdo_wen}),
    .mi({open_n1088,\u_flash_wait_free/tx_reg [7]}),
    .f({n26,_al_u192_o}),
    .q({open_n1104,fls_sdo_wfree}));  // src/rtl/flash/flash_wait_free.v(122)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u20|u_flash_read/reg2_b8  (
    .a({start_rd,open_n1105}),
    .b({\u_flash_read/tx_reg [7],fls_addr[8]}),
    .c({\u_flash_read/tx_reg [8],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u20_o}),
    .f({_al_u20_o,open_n1120}),
    .q({open_n1124,\u_flash_read/tx_reg [8]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u22|u_flash_read/reg2_b7  (
    .a({start_rd,open_n1125}),
    .b({\u_flash_read/tx_reg [6],fls_addr[7]}),
    .c({\u_flash_read/tx_reg [7],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u22_o}),
    .f({_al_u22_o,open_n1144}),
    .q({open_n1148,\u_flash_read/tx_reg [7]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u24|u_flash_read/reg2_b6  (
    .a({start_rd,open_n1149}),
    .b({\u_flash_read/tx_reg [5],fls_addr[6]}),
    .c({\u_flash_read/tx_reg [6],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u24_o}),
    .f({_al_u24_o,open_n1168}),
    .q({open_n1172,\u_flash_read/tx_reg [6]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u26|u_flash_read/reg2_b5  (
    .a({start_rd,open_n1173}),
    .b({\u_flash_read/tx_reg [4],fls_addr[5]}),
    .c({\u_flash_read/tx_reg [5],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u26_o}),
    .f({_al_u26_o,open_n1188}),
    .q({open_n1192,\u_flash_read/tx_reg [5]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u28|u_flash_read/reg2_b4  (
    .a({start_rd,open_n1193}),
    .b({\u_flash_read/tx_reg [3],fls_addr[4]}),
    .c({\u_flash_read/tx_reg [4],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u28_o}),
    .f({_al_u28_o,open_n1208}),
    .q({open_n1212,\u_flash_read/tx_reg [4]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u30|u_flash_read/reg2_b3  (
    .a({start_rd,open_n1213}),
    .b({\u_flash_read/tx_reg [2],fls_addr[3]}),
    .c({\u_flash_read/tx_reg [3],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u30_o}),
    .f({_al_u30_o,open_n1232}),
    .q({open_n1236,\u_flash_read/tx_reg [3]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000100000101),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0001000100000101),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u34|u_flash_read/reg2_b24  (
    .a({start_rd,start_rd}),
    .b({\u_flash_read/tx_reg [21],\u_flash_read/tx_reg [22]}),
    .c({\u_flash_read/tx_reg [22],\u_flash_read/tx_reg [23]}),
    .ce(\u_flash_read/sft_wen ),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,\u_flash_read/sft_wen }),
    .mi({open_n1240,\u_flash_read/tx_reg [23]}),
    .sr(start_rd),
    .f({_al_u34_o,_al_u32_o}),
    .q({open_n1255,\u_flash_read/tx_reg [24]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u36|u_flash_read/reg2_b21  (
    .a({start_rd,open_n1256}),
    .b({\u_flash_read/tx_reg [20],fls_addr[21]}),
    .c({\u_flash_read/tx_reg [21],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u36_o}),
    .f({_al_u36_o,open_n1275}),
    .q({open_n1279,\u_flash_read/tx_reg [21]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u38|u_flash_read/reg2_b20  (
    .a({start_rd,open_n1280}),
    .b({\u_flash_read/tx_reg [19],fls_addr[20]}),
    .c({\u_flash_read/tx_reg [20],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u38_o}),
    .f({_al_u38_o,open_n1295}),
    .q({open_n1299,\u_flash_read/tx_reg [20]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u42|u_flash_read/reg2_b19  (
    .a({start_rd,open_n1300}),
    .b({\u_flash_read/tx_reg [18],fls_addr[19]}),
    .c({\u_flash_read/tx_reg [19],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u42_o}),
    .f({_al_u42_o,open_n1315}),
    .q({open_n1319,\u_flash_read/tx_reg [19]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u44|u_flash_read/reg2_b18  (
    .a({start_rd,open_n1320}),
    .b({\u_flash_read/tx_reg [17],fls_addr[18]}),
    .c({\u_flash_read/tx_reg [18],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u44_o}),
    .f({_al_u44_o,open_n1339}),
    .q({open_n1343,\u_flash_read/tx_reg [18]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u46|u_flash_read/reg2_b17  (
    .a({start_rd,open_n1344}),
    .b({\u_flash_read/tx_reg [16],fls_addr[17]}),
    .c({\u_flash_read/tx_reg [17],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u46_o}),
    .f({_al_u46_o,open_n1363}),
    .q({open_n1367,\u_flash_read/tx_reg [17]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u48|u_flash_read/reg2_b16  (
    .a({start_rd,open_n1368}),
    .b({\u_flash_read/tx_reg [15],fls_addr[16]}),
    .c({\u_flash_read/tx_reg [16],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u48_o}),
    .f({_al_u48_o,open_n1383}),
    .q({open_n1387,\u_flash_read/tx_reg [16]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u50|u_flash_read/reg2_b15  (
    .a({start_rd,open_n1388}),
    .b({\u_flash_read/tx_reg [14],fls_addr[15]}),
    .c({\u_flash_read/tx_reg [15],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u50_o}),
    .f({_al_u50_o,open_n1403}),
    .q({open_n1407,\u_flash_read/tx_reg [15]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u52|u_flash_read/reg2_b14  (
    .a({start_rd,open_n1408}),
    .b({\u_flash_read/tx_reg [13],fls_addr[14]}),
    .c({\u_flash_read/tx_reg [14],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u52_o}),
    .f({_al_u52_o,open_n1427}),
    .q({open_n1431,\u_flash_read/tx_reg [14]}));  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT_LUTF0(16'b0001000100000101),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0001000100000101),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u54|_al_u56  (
    .a({start_rd,start_rd}),
    .b(\u_flash_read/tx_reg [12:11]),
    .c(\u_flash_read/tx_reg [13:12]),
    .d({\u_flash_read/sft_wen ,\u_flash_read/sft_wen }),
    .f({_al_u54_o,_al_u56_o}));
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u58|u_flash_read/reg2_b10  (
    .a({start_rd,open_n1456}),
    .b({\u_flash_read/tx_reg [10],fls_addr[10]}),
    .c({\u_flash_read/tx_reg [11],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u60_o}),
    .f({_al_u58_o,open_n1475}),
    .q({open_n1479,\u_flash_read/tx_reg [10]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000010100010001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u60|u_flash_read/reg2_b9  (
    .a({start_rd,open_n1480}),
    .b({\u_flash_read/tx_reg [10],fls_addr[9]}),
    .c({\u_flash_read/tx_reg [9],start_rd}),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,_al_u18_o}),
    .f({_al_u60_o,open_n1495}),
    .q({open_n1499,\u_flash_read/tx_reg [9]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000100010111000),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u62|u_flash_read/reg2_b0  (
    .a({start_rd,fls_addr[0]}),
    .b({\u_flash_read/tx_reg [0],start_rd}),
    .c(\u_flash_read/tx_reg [1:0]),
    .clk(clk),
    .d({\u_flash_read/sft_wen ,\u_flash_read/sft_wen }),
    .f({_al_u62_o,open_n1514}),
    .q({open_n1518,\u_flash_read/tx_reg [0]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u65|u_flash_sector_erase/reg2_b9  (
    .a({start_sector,open_n1519}),
    .b({\u_flash_sector_erase/tx_reg [8],fls_addr[9]}),
    .c({\u_flash_sector_erase/tx_reg [9],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u65_o}),
    .f({_al_u65_o,open_n1534}),
    .q({open_n1538,\u_flash_sector_erase/tx_reg [9]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u67|u_flash_sector_erase/reg2_b8  (
    .a({start_sector,open_n1539}),
    .b({\u_flash_sector_erase/tx_reg [7],fls_addr[8]}),
    .c({\u_flash_sector_erase/tx_reg [8],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u67_o}),
    .f({_al_u67_o,open_n1558}),
    .q({open_n1562,\u_flash_sector_erase/tx_reg [8]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u69|u_flash_sector_erase/reg2_b7  (
    .a({start_sector,open_n1563}),
    .b({\u_flash_sector_erase/tx_reg [6],fls_addr[7]}),
    .c({\u_flash_sector_erase/tx_reg [7],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u69_o}),
    .f({_al_u69_o,open_n1582}),
    .q({open_n1586,\u_flash_sector_erase/tx_reg [7]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u71|u_flash_sector_erase/reg2_b6  (
    .a({start_sector,open_n1587}),
    .b({\u_flash_sector_erase/tx_reg [5],fls_addr[6]}),
    .c({\u_flash_sector_erase/tx_reg [6],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u71_o}),
    .f({_al_u71_o,open_n1602}),
    .q({open_n1606,\u_flash_sector_erase/tx_reg [6]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u73|u_flash_sector_erase/reg2_b5  (
    .a({start_sector,open_n1607}),
    .b({\u_flash_sector_erase/tx_reg [4],fls_addr[5]}),
    .c({\u_flash_sector_erase/tx_reg [5],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u73_o}),
    .f({_al_u73_o,open_n1622}),
    .q({open_n1626,\u_flash_sector_erase/tx_reg [5]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u75|u_flash_sector_erase/reg2_b4  (
    .a({start_sector,open_n1627}),
    .b({\u_flash_sector_erase/tx_reg [3],fls_addr[4]}),
    .c({\u_flash_sector_erase/tx_reg [4],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u75_o}),
    .f({_al_u75_o,open_n1646}),
    .q({open_n1650,\u_flash_sector_erase/tx_reg [4]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u77|u_flash_sector_erase/reg2_b3  (
    .a({start_sector,open_n1651}),
    .b({\u_flash_sector_erase/tx_reg [2],fls_addr[3]}),
    .c({\u_flash_sector_erase/tx_reg [3],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u77_o}),
    .f({_al_u77_o,open_n1670}),
    .q({open_n1674,\u_flash_sector_erase/tx_reg [3]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000100000101),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0001000100000101),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u81|u_flash_sector_erase/reg2_b24  (
    .a({start_sector,start_sector}),
    .b({\u_flash_sector_erase/tx_reg [21],\u_flash_sector_erase/tx_reg [22]}),
    .c({\u_flash_sector_erase/tx_reg [22],\u_flash_sector_erase/tx_reg [23]}),
    .ce(\u_flash_sector_erase/sft_wen ),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,\u_flash_sector_erase/sft_wen }),
    .mi({open_n1678,\u_flash_sector_erase/tx_reg [23]}),
    .sr(start_sector),
    .f({_al_u81_o,_al_u79_o}),
    .q({open_n1693,\u_flash_sector_erase/tx_reg [24]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u83|u_flash_sector_erase/reg2_b21  (
    .a({start_sector,open_n1694}),
    .b({\u_flash_sector_erase/tx_reg [20],fls_addr[21]}),
    .c({\u_flash_sector_erase/tx_reg [21],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u83_o}),
    .f({_al_u83_o,open_n1713}),
    .q({open_n1717,\u_flash_sector_erase/tx_reg [21]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u85|u_flash_sector_erase/reg2_b20  (
    .a({start_sector,open_n1718}),
    .b({\u_flash_sector_erase/tx_reg [19],fls_addr[20]}),
    .c({\u_flash_sector_erase/tx_reg [20],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u85_o}),
    .f({_al_u85_o,open_n1737}),
    .q({open_n1741,\u_flash_sector_erase/tx_reg [20]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u87|u_flash_sector_erase/reg2_b2  (
    .a({start_sector,open_n1742}),
    .b({\u_flash_sector_erase/tx_reg [1],fls_addr[2]}),
    .c({\u_flash_sector_erase/tx_reg [2],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u87_o}),
    .f({_al_u87_o,open_n1757}),
    .q({open_n1761,\u_flash_sector_erase/tx_reg [2]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u89|u_flash_sector_erase/reg2_b19  (
    .a({start_sector,open_n1762}),
    .b({\u_flash_sector_erase/tx_reg [18],fls_addr[19]}),
    .c({\u_flash_sector_erase/tx_reg [19],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u89_o}),
    .f({_al_u89_o,open_n1777}),
    .q({open_n1781,\u_flash_sector_erase/tx_reg [19]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u91|u_flash_sector_erase/reg2_b18  (
    .a({start_sector,open_n1782}),
    .b({\u_flash_sector_erase/tx_reg [17],fls_addr[18]}),
    .c({\u_flash_sector_erase/tx_reg [18],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u91_o}),
    .f({_al_u91_o,open_n1801}),
    .q({open_n1805,\u_flash_sector_erase/tx_reg [18]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u93|u_flash_sector_erase/reg2_b17  (
    .a({start_sector,open_n1806}),
    .b({\u_flash_sector_erase/tx_reg [16],fls_addr[17]}),
    .c({\u_flash_sector_erase/tx_reg [17],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u93_o}),
    .f({_al_u93_o,open_n1825}),
    .q({open_n1829,\u_flash_sector_erase/tx_reg [17]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u95|u_flash_sector_erase/reg2_b16  (
    .a({start_sector,open_n1830}),
    .b({\u_flash_sector_erase/tx_reg [15],fls_addr[16]}),
    .c({\u_flash_sector_erase/tx_reg [16],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u95_o}),
    .f({_al_u95_o,open_n1845}),
    .q({open_n1849,\u_flash_sector_erase/tx_reg [16]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0001000100000101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u97|u_flash_sector_erase/reg2_b15  (
    .a({start_sector,open_n1850}),
    .b({\u_flash_sector_erase/tx_reg [14],fls_addr[15]}),
    .c({\u_flash_sector_erase/tx_reg [15],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u97_o}),
    .f({_al_u97_o,open_n1865}),
    .q({open_n1869,\u_flash_sector_erase/tx_reg [15]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0001000100000101),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0001000100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u99|u_flash_sector_erase/reg2_b14  (
    .a({start_sector,open_n1870}),
    .b({\u_flash_sector_erase/tx_reg [13],fls_addr[14]}),
    .c({\u_flash_sector_erase/tx_reg [14],start_sector}),
    .clk(clk),
    .d({\u_flash_sector_erase/sft_wen ,_al_u99_o}),
    .f({_al_u99_o,open_n1889}),
    .q({open_n1893,\u_flash_sector_erase/tx_reg [14]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_id.v(88)
  // src/rtl/flash/flash_dri.v(332)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("~(C*D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("~(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000111111111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000111111111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \busy_reg|u_flash_id/fls_ncs_reg  (
    .c({_al_u242_o,open_n1898}),
    .clk(clk),
    .d({_al_u241_o,busy_id}),
    .q({busy,fls_ncs_id}));  // src/rtl/flash/flash_id.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("P14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    fls_ncs_reg_DO (
    .ce(1'b1),
    .do({open_n1922,open_n1923,open_n1924,n25}),
    .osclk(clk),
    .opad(fls_ncs));  // src/rtl/flash/flash_dri.v(311)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("H4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    fls_sck_reg_DO (
    .ce(1'b1),
    .do({open_n1937,open_n1938,open_n1939,n24}),
    .osclk(clk),
    .opad(fls_sck));  // src/rtl/flash/flash_dri.v(296)
  // src/rtl/flash/flash_dri.v(281)
  // src/rtl/flash/flash_dri.v(281)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \fls_sdi_frd_reg|fls_sdi_rd_reg  (
    .a({fls_sdi,fls_sdi}),
    .b({mod_sel[2],mod_sel[2]}),
    .c({mod_sel[1],mod_sel[1]}),
    .clk(clk),
    .d({mod_sel[0],mod_sel[0]}),
    .q({fls_sdi_frd,fls_sdi_rd}));  // src/rtl/flash/flash_dri.v(281)
  // src/rtl/flash/flash_dri.v(281)
  // src/rtl/flash/flash_dri.v(281)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \fls_sdi_id_reg|fls_sdi_wfree_reg  (
    .b({fls_sdi,fls_sdi}),
    .c({mod_sel[0],mod_sel[0]}),
    .clk(clk),
    .d({_al_u176_o,_al_u182_o}),
    .q({fls_sdi_id,fls_sdi_wfree}));  // src/rtl/flash/flash_dri.v(281)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("M13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    fls_sdo_reg_DO (
    .ce(1'b1),
    .do({open_n2000,open_n2001,open_n2002,n26}),
    .osclk(clk),
    .opad(fls_sdo));  // src/rtl/flash/flash_dri.v(326)
  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \start_erase_reg|start_wr_reg  (
    .b({mod_sel[0],mod_sel[0]}),
    .c({start,start}),
    .clk(clk),
    .d({_al_u180_o,_al_u180_o}),
    .q({start_erase,start_wr}));  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*A)"),
    //.LUT1("(D*C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001000000000),
    .INIT_LUT1(16'b0010000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \start_frd_reg|start_rd_reg  (
    .a({mod_sel[2],mod_sel[2]}),
    .b({mod_sel[1],mod_sel[1]}),
    .c({mod_sel[0],mod_sel[0]}),
    .clk(clk),
    .d({start,start}),
    .q({start_frd,start_rd}));  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \start_id_reg|start_sector_reg  (
    .b({mod_sel[0],mod_sel[0]}),
    .c({start,start}),
    .clk(clk),
    .d({_al_u176_o,_al_u176_o}),
    .q({start_id,start_sector}));  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  // src/rtl/flash/flash_dri.v(268)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \start_wen_reg|start_wfree_reg  (
    .b({mod_sel[0],mod_sel[0]}),
    .c({start,start}),
    .clk(clk),
    .d({_al_u182_o,_al_u182_o}),
    .q({start_wen,start_wfree}));  // src/rtl/flash/flash_dri.v(268)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_erase/add0/ucin_al_u260"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_erase/add0/u3_al_u261  (
    .a({\u_flash_erase/cnt [5],\u_flash_erase/cnt [3]}),
    .b({\u_flash_erase/cnt [6],\u_flash_erase/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_erase/add0/c3 ),
    .f({\u_flash_erase/n0 [5],\u_flash_erase/n0 [3]}),
    .fco(\u_flash_erase/add0/c7 ),
    .fx({\u_flash_erase/n0 [6],\u_flash_erase/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_erase/add0/ucin_al_u260"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_erase/add0/u7_al_u262  (
    .a({\u_flash_erase/cnt [9],\u_flash_erase/cnt [7]}),
    .b({open_n2123,\u_flash_erase/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n2126,1'b0}),
    .fci(\u_flash_erase/add0/c7 ),
    .f({\u_flash_erase/n0 [9],\u_flash_erase/n0 [7]}),
    .fx({open_n2142,\u_flash_erase/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_erase/add0/ucin_al_u260"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/add0/ucin_al_u260  (
    .a({\u_flash_erase/cnt [1],1'b0}),
    .b({\u_flash_erase/cnt [2],\u_flash_erase/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_erase/cnt [0],\u_flash_erase/cnt [2]}),
    .f({\u_flash_erase/n0 [1],open_n2159}),
    .fco(\u_flash_erase/add0/c3 ),
    .fx({\u_flash_erase/n0 [2],\u_flash_erase/n0 [0]}),
    .q({\u_flash_erase/phase_cnt [0],fls_sck_erase}));
  // src/rtl/flash/flash_write.v(115)
  // src/rtl/flash/flash_erase.v(111)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~A*~(~D*C))"),
    //.LUTF1("(~A*~(B*~(~D*~C)))"),
    //.LUTG0("(B*~A*~(~D*C))"),
    //.LUTG1("(~A*~(B*~(~D*~C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100010000000100),
    .INIT_LUTF1(16'b0001000100010101),
    .INIT_LUTG0(16'b0100010000000100),
    .INIT_LUTG1(16'b0001000100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/fls_sdo_reg|u_flash_write/fls_sdo_reg  (
    .a({_al_u195_o,mod_sel[2]}),
    .b({_al_u196_o,mod_sel[1]}),
    .c({mod_sel[0],mod_sel[0]}),
    .clk(clk),
    .d({fls_sdo_erase,fls_sdo_wr}),
    .mi({\u_flash_erase/tx_reg [7],\u_flash_write/tx_reg [39]}),
    .f({_al_u197_o,_al_u196_o}),
    .q({fls_sdo_erase,fls_sdo_wr}));  // src/rtl/flash/flash_write.v(115)
  // src/rtl/flash/flash_erase.v(84)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b0|u_flash_erase/fls_ncs_reg  (
    .a({\u_flash_erase/cycle_cnt [0],open_n2179}),
    .b({\u_flash_erase/cycle_cnt [1],open_n2180}),
    .c({\u_flash_erase/cycle_cnt [2],open_n2181}),
    .clk(clk),
    .d({\u_flash_erase/cycle_cnt [3],busy_erase}),
    .mi({\u_flash_erase/cnt [3],open_n2186}),
    .f({_al_u219_o,open_n2199}),
    .q({\u_flash_erase/cycle_cnt [0],fls_ncs_erase}));  // src/rtl/flash/flash_erase.v(84)
  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b1|u_flash_read/reg0_b3  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [4],\u_flash_read/cnt [6]}),
    .q({\u_flash_erase/cycle_cnt [1],\u_flash_read/cycle_cnt [3]}));  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b2|u_flash_write_enable/reg0_b5  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [5],\u_flash_write_enable/cnt [8]}),
    .q({\u_flash_erase/cycle_cnt [2],\u_flash_write_enable/cycle_cnt [5]}));  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b3|u_flash_write_enable/reg0_b1  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [6],\u_flash_write_enable/cnt [4]}),
    .q({\u_flash_erase/cycle_cnt [3],\u_flash_write_enable/cycle_cnt [1]}));  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b4|u_flash_write/reg0_b2  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [7],\u_flash_write/cnt [5]}),
    .q({\u_flash_erase/cycle_cnt [4],\u_flash_write/cycle_cnt [2]}));  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_sector_erase.v(65)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b5|u_flash_sector_erase/reg0_b5  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [8],\u_flash_sector_erase/cnt [8]}),
    .q({\u_flash_erase/cycle_cnt [5],\u_flash_sector_erase/cycle_cnt [5]}));  // src/rtl/flash/flash_sector_erase.v(65)
  // src/rtl/flash/flash_erase.v(69)
  // src/rtl/flash/flash_erase.v(63)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_erase/reg0_b6|u_flash_erase/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_erase/cnt [9],\u_flash_erase/cnt [1]}),
    .q({\u_flash_erase/cycle_cnt [6],\u_flash_erase/phase_cnt [1]}));  // src/rtl/flash/flash_erase.v(69)
  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_erase/reg2_b1|u_flash_erase/reg2_b0  (
    .ce(\u_flash_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_erase/tx_reg [0],1'b0}),
    .sr(start_erase),
    .q(\u_flash_erase/tx_reg [1:0]));  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_erase/reg2_b2|u_flash_erase/reg2_b3  (
    .ce(\u_flash_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_erase/tx_reg [1],\u_flash_erase/tx_reg [2]}),
    .sr(start_erase),
    .q({\u_flash_erase/tx_reg [2],\u_flash_erase/tx_reg [3]}));  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_erase/reg2_b4|u_flash_erase/reg2_b5  (
    .ce(\u_flash_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_erase/tx_reg [3],\u_flash_erase/tx_reg [4]}),
    .sr(start_erase),
    .q({\u_flash_erase/tx_reg [4],\u_flash_erase/tx_reg [5]}));  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(93)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_erase/reg2_b6|u_flash_erase/reg2_b7  (
    .ce(\u_flash_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_erase/tx_reg [5],\u_flash_erase/tx_reg [6]}),
    .sr(start_erase),
    .q({\u_flash_erase/tx_reg [6],\u_flash_erase/tx_reg [7]}));  // src/rtl/flash/flash_erase.v(93)
  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_erase/reg3_b1|u_flash_erase/reg3_b9  (
    .clk(clk),
    .mi({\u_flash_erase/n0 [1],\u_flash_erase/n0 [9]}),
    .sr(busy_erase),
    .q({\u_flash_erase/cnt [1],\u_flash_erase/cnt [9]}));  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_erase/reg3_b2|u_flash_erase/reg3_b8  (
    .clk(clk),
    .mi({\u_flash_erase/n0 [2],\u_flash_erase/n0 [8]}),
    .sr(busy_erase),
    .q({\u_flash_erase/cnt [2],\u_flash_erase/cnt [8]}));  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_erase/reg3_b3|u_flash_erase/reg3_b7  (
    .clk(clk),
    .mi({\u_flash_erase/n0 [3],\u_flash_erase/n0 [7]}),
    .sr(busy_erase),
    .q({\u_flash_erase/cnt [3],\u_flash_erase/cnt [7]}));  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_erase/reg3_b4|u_flash_erase/reg3_b6  (
    .clk(clk),
    .mi({\u_flash_erase/n0 [4],\u_flash_erase/n0 [6]}),
    .sr(busy_erase),
    .q({\u_flash_erase/cnt [4],\u_flash_erase/cnt [6]}));  // src/rtl/flash/flash_erase.v(57)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_erase/reg3_b5  (
    .clk(clk),
    .mi({open_n2592,\u_flash_erase/n0 [5]}),
    .sr(busy_erase),
    .q({open_n2598,\u_flash_erase/cnt [5]}));  // src/rtl/flash/flash_erase.v(57)
  flash_fast_read u_flash_fast_read (
    .clk(clk),
    .fls_sdi(fls_sdi_frd),
    .start(start_frd),
    .addr(frd_addr),
    .busy(busy_frd),
    .dout(frd_data),
    .dout_en(frd_en),
    .fls_ncs(fls_ncs_frd),
    .fls_sck(fls_sck_frd),
    .fls_sdo(fls_sdo_frd));  // src/rtl/flash/flash_dri.v(214)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_id/add0/ucin_al_u263"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_id/add0/u3_al_u264  (
    .a({\u_flash_id/cnt [5],\u_flash_id/cnt [3]}),
    .b({\u_flash_id/cnt [6],\u_flash_id/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_id/add0/c3 ),
    .f({\u_flash_id/n0 [5],\u_flash_id/n0 [3]}),
    .fco(\u_flash_id/add0/c7 ),
    .fx({\u_flash_id/n0 [6],\u_flash_id/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_id/add0/ucin_al_u263"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_id/add0/u7_al_u265  (
    .a({\u_flash_id/cnt [9],\u_flash_id/cnt [7]}),
    .b({open_n2617,\u_flash_id/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n2620,1'b0}),
    .fci(\u_flash_id/add0/c7 ),
    .f({\u_flash_id/n0 [9],\u_flash_id/n0 [7]}),
    .fx({open_n2636,\u_flash_id/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_id/add0/ucin_al_u263"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/add0/ucin_al_u263  (
    .a({\u_flash_id/cnt [1],1'b0}),
    .b({\u_flash_id/cnt [2],\u_flash_id/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_id/cnt [0],\u_flash_id/cnt [2]}),
    .f({\u_flash_id/n0 [1],open_n2653}),
    .fco(\u_flash_id/add0/c3 ),
    .fx({\u_flash_id/n0 [2],\u_flash_id/n0 [0]}),
    .q({\u_flash_id/phase_cnt [0],fls_sck_id}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt0_0|u_flash_id/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt0_0|u_flash_id/lt0_cin  (
    .a(2'b10),
    .b({\u_flash_id/cycle_cnt [0],open_n2654}),
    .fco(\u_flash_id/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt0_0|u_flash_id/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt0_2|u_flash_id/lt0_1  (
    .a(2'b11),
    .b(\u_flash_id/cycle_cnt [2:1]),
    .fci(\u_flash_id/lt0_c1 ),
    .fco(\u_flash_id/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt0_0|u_flash_id/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt0_4|u_flash_id/lt0_3  (
    .a(2'b11),
    .b(\u_flash_id/cycle_cnt [4:3]),
    .fci(\u_flash_id/lt0_c3 ),
    .fco(\u_flash_id/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt0_0|u_flash_id/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt0_6|u_flash_id/lt0_5  (
    .a(2'b00),
    .b(\u_flash_id/cycle_cnt [6:5]),
    .fci(\u_flash_id/lt0_c5 ),
    .fco(\u_flash_id/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt0_0|u_flash_id/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt0_cout_al_u275  (
    .a({open_n2752,1'b0}),
    .b({open_n2753,1'b1}),
    .fci(\u_flash_id/lt0_c7 ),
    .f({open_n2772,\u_flash_id/n7 }));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt1_0|u_flash_id/lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/lt1_0|u_flash_id/lt1_cin  (
    .a({\u_flash_id/cycle_cnt [0],1'b0}),
    .b({1'b0,open_n2778}),
    .clk(clk),
    .mi({open_n2794,\u_flash_id/cnt [3]}),
    .fco(\u_flash_id/lt1_c1 ),
    .q({open_n2800,\u_flash_id/cycle_cnt [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt1_0|u_flash_id/lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt1_2|u_flash_id/lt1_1  (
    .a(\u_flash_id/cycle_cnt [2:1]),
    .b(2'b00),
    .fci(\u_flash_id/lt1_c1 ),
    .fco(\u_flash_id/lt1_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt1_0|u_flash_id/lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt1_4|u_flash_id/lt1_3  (
    .a(\u_flash_id/cycle_cnt [4:3]),
    .b(2'b10),
    .fci(\u_flash_id/lt1_c3 ),
    .fco(\u_flash_id/lt1_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt1_0|u_flash_id/lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt1_6|u_flash_id/lt1_5  (
    .a(\u_flash_id/cycle_cnt [6:5]),
    .b(2'b01),
    .fci(\u_flash_id/lt1_c5 ),
    .fco(\u_flash_id/lt1_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_id/lt1_0|u_flash_id/lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_id/lt1_cout_al_u276  (
    .a({open_n2873,1'b0}),
    .b({open_n2874,1'b1}),
    .fci(\u_flash_id/lt1_c7 ),
    .f({open_n2893,\u_flash_id/n9 }));
  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(67)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg0_b1|u_flash_id/reg0_b2  (
    .a({fls_sck_id,\u_flash_id/cycle_cnt [0]}),
    .b({\u_flash_id/n7 ,\u_flash_id/cycle_cnt [1]}),
    .c({\u_flash_id/cycle_cnt [0],\u_flash_id/cycle_cnt [2]}),
    .clk(clk),
    .d({\u_flash_id/cycle_cnt [1],\u_flash_id/cycle_cnt [3]}),
    .mi({\u_flash_id/cnt [4],\u_flash_id/cnt [5]}),
    .f({_al_u233_o,_al_u221_o}),
    .q({\u_flash_id/cycle_cnt [1],\u_flash_id/cycle_cnt [2]}));  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(67)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg0_b3|u_flash_id/reg0_b4  (
    .clk(clk),
    .mi({\u_flash_id/cnt [6],\u_flash_id/cnt [7]}),
    .q({\u_flash_id/cycle_cnt [3],\u_flash_id/cycle_cnt [4]}));  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(67)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg0_b5|u_flash_id/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_id/cnt [8],\u_flash_id/cnt [9]}),
    .q({\u_flash_id/cycle_cnt [5],\u_flash_id/cycle_cnt [6]}));  // src/rtl/flash/flash_id.v(67)
  // src/rtl/flash/flash_id.v(115)
  // src/rtl/flash/flash_id.v(73)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg1_b1|u_flash_id/byte_flag_reg  (
    .a({open_n2972,_al_u233_o}),
    .b({\u_flash_id/phase_cnt [0],\u_flash_id/cycle_cnt [2]}),
    .c(\u_flash_id/phase_cnt [1:0]),
    .clk(clk),
    .d({\u_flash_id/n9 ,\u_flash_id/phase_cnt [1]}),
    .mi({\u_flash_id/cnt [1],open_n2984}),
    .f({_al_u235_o,open_n2986}),
    .q({\u_flash_id/phase_cnt [1],\u_flash_id/byte_flag }));  // src/rtl/flash/flash_id.v(115)
  // src/rtl/flash/flash_id.v(97)
  // src/rtl/flash/flash_id.v(97)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_id/reg2_b29|u_flash_id/reg2_b28  (
    .ce(\u_flash_id/sft_wen ),
    .clk(clk),
    .mi({\u_flash_id/tx_reg [28],1'b0}),
    .sr(start_id),
    .q(\u_flash_id/tx_reg [29:28]));  // src/rtl/flash/flash_id.v(97)
  // src/rtl/flash/flash_id.v(97)
  // src/rtl/flash/flash_id.v(97)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_id/reg2_b30|u_flash_id/reg2_b31  (
    .ce(\u_flash_id/sft_wen ),
    .clk(clk),
    .mi({\u_flash_id/tx_reg [29],\u_flash_id/tx_reg [30]}),
    .sr(start_id),
    .q({\u_flash_id/tx_reg [30],\u_flash_id/tx_reg [31]}));  // src/rtl/flash/flash_id.v(97)
  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg3_b0|u_flash_id/reg3_b7  (
    .ce(\u_flash_id/sft_ren ),
    .clk(clk),
    .mi({fls_sdi_id,\u_flash_id/rx_reg [6]}),
    .q({\u_flash_id/rx_reg [0],\u_flash_id/rx_reg [7]}));  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg3_b1|u_flash_id/reg3_b2  (
    .ce(\u_flash_id/sft_ren ),
    .clk(clk),
    .mi({\u_flash_id/rx_reg [0],\u_flash_id/rx_reg [1]}),
    .q({\u_flash_id/rx_reg [1],\u_flash_id/rx_reg [2]}));  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg3_b3|u_flash_id/reg3_b4  (
    .ce(\u_flash_id/sft_ren ),
    .clk(clk),
    .mi({\u_flash_id/rx_reg [2],\u_flash_id/rx_reg [3]}),
    .q({\u_flash_id/rx_reg [3],\u_flash_id/rx_reg [4]}));  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(128)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg3_b5|u_flash_id/reg3_b6  (
    .ce(\u_flash_id/sft_ren ),
    .clk(clk),
    .mi({\u_flash_id/rx_reg [4],\u_flash_id/rx_reg [5]}),
    .q({\u_flash_id/rx_reg [5],\u_flash_id/rx_reg [6]}));  // src/rtl/flash/flash_id.v(128)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b10|u_flash_id/reg4_b2  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[2],\u_flash_id/rx_reg [2]}),
    .q({id[10],id[2]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b11|u_flash_id/reg4_b3  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[3],\u_flash_id/rx_reg [3]}),
    .q({id[11],id[3]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b12|u_flash_id/reg4_b4  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[4],\u_flash_id/rx_reg [4]}),
    .q({id[12],id[4]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b13|u_flash_id/reg4_b5  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[5],\u_flash_id/rx_reg [5]}),
    .q({id[13],id[5]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b14|u_flash_id/reg4_b6  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[6],\u_flash_id/rx_reg [6]}),
    .q({id[14],id[6]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b15|u_flash_id/reg4_b7  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[7],\u_flash_id/rx_reg [7]}),
    .q({id[15],id[7]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b8|u_flash_id/reg4_b0  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[0],\u_flash_id/rx_reg [0]}),
    .q({id[8],id[0]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(135)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/reg4_b9|u_flash_id/reg4_b1  (
    .ce(\u_flash_id/byte_flag ),
    .clk(clk),
    .mi({id[1],\u_flash_id/rx_reg [1]}),
    .q({id[9],id[1]}));  // src/rtl/flash/flash_id.v(135)
  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_id/reg5_b0|u_flash_id/reg5_b9  (
    .clk(clk),
    .mi({\u_flash_id/n0 [0],\u_flash_id/n0 [9]}),
    .sr(busy_id),
    .q({\u_flash_id/cnt [0],\u_flash_id/cnt [9]}));  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_id/reg5_b1|u_flash_id/reg5_b8  (
    .clk(clk),
    .mi({\u_flash_id/n0 [1],\u_flash_id/n0 [8]}),
    .sr(busy_id),
    .q({\u_flash_id/cnt [1],\u_flash_id/cnt [8]}));  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_id/reg5_b2|u_flash_id/reg5_b7  (
    .clk(clk),
    .mi({\u_flash_id/n0 [2],\u_flash_id/n0 [7]}),
    .sr(busy_id),
    .q({\u_flash_id/cnt [2],\u_flash_id/cnt [7]}));  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_id/reg5_b3|u_flash_id/reg5_b6  (
    .clk(clk),
    .mi({\u_flash_id/n0 [3],\u_flash_id/n0 [6]}),
    .sr(busy_id),
    .q({\u_flash_id/cnt [3],\u_flash_id/cnt [6]}));  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_id/reg5_b4|u_flash_id/reg5_b5  (
    .clk(clk),
    .mi({\u_flash_id/n0 [4],\u_flash_id/n0 [5]}),
    .sr(busy_id),
    .q({\u_flash_id/cnt [4],\u_flash_id/cnt [5]}));  // src/rtl/flash/flash_id.v(61)
  // src/rtl/flash/flash_id.v(109)
  // src/rtl/flash/flash_id.v(103)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_id/sft_wen_reg|u_flash_id/sft_ren_reg  (
    .b({\u_flash_id/phase_cnt [0],fls_sck_id}),
    .c({\u_flash_id/phase_cnt [1],\u_flash_id/n7 }),
    .clk(clk),
    .d({fls_sck_id,_al_u235_o}),
    .q({\u_flash_id/sft_wen ,\u_flash_id/sft_ren }));  // src/rtl/flash/flash_id.v(109)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_read/add0/ucin_al_u266"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_read/add0/u3_al_u267  (
    .a({\u_flash_read/cnt [5],\u_flash_read/cnt [3]}),
    .b({\u_flash_read/cnt [6],\u_flash_read/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_read/add0/c3 ),
    .f({\u_flash_read/n0 [5],\u_flash_read/n0 [3]}),
    .fco(\u_flash_read/add0/c7 ),
    .fx({\u_flash_read/n0 [6],\u_flash_read/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_read/add0/ucin_al_u266"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_read/add0/u7_al_u268  (
    .a({\u_flash_read/cnt [9],\u_flash_read/cnt [7]}),
    .b({open_n3523,\u_flash_read/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n3526,1'b0}),
    .fci(\u_flash_read/add0/c7 ),
    .f({\u_flash_read/n0 [9],\u_flash_read/n0 [7]}),
    .fx({open_n3542,\u_flash_read/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_read/add0/ucin_al_u266"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/add0/ucin_al_u266  (
    .a({\u_flash_read/cnt [1],1'b0}),
    .b({\u_flash_read/cnt [2],\u_flash_read/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_read/cnt [0],\u_flash_read/cnt [2]}),
    .f({\u_flash_read/n0 [1],open_n3559}),
    .fco(\u_flash_read/add0/c3 ),
    .fx({\u_flash_read/n0 [2],\u_flash_read/n0 [0]}),
    .q({\u_flash_read/phase_cnt [0],fls_sck_rd}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_read/lt0_0|u_flash_read/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/lt0_0|u_flash_read/lt0_cin  (
    .a(2'b10),
    .b({\u_flash_read/cycle_cnt [0],open_n3560}),
    .clk(clk),
    .mi({open_n3576,\u_flash_read/cnt [3]}),
    .fco(\u_flash_read/lt0_c1 ),
    .q({open_n3582,\u_flash_read/cycle_cnt [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_read/lt0_0|u_flash_read/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_read/lt0_2|u_flash_read/lt0_1  (
    .a(2'b11),
    .b(\u_flash_read/cycle_cnt [2:1]),
    .fci(\u_flash_read/lt0_c1 ),
    .fco(\u_flash_read/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_read/lt0_0|u_flash_read/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_read/lt0_4|u_flash_read/lt0_3  (
    .a(2'b11),
    .b(\u_flash_read/cycle_cnt [4:3]),
    .fci(\u_flash_read/lt0_c3 ),
    .fco(\u_flash_read/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_read/lt0_0|u_flash_read/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_read/lt0_6|u_flash_read/lt0_5  (
    .a(2'b00),
    .b(\u_flash_read/cycle_cnt [6:5]),
    .fci(\u_flash_read/lt0_c5 ),
    .fco(\u_flash_read/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_read/lt0_0|u_flash_read/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_read/lt0_cout_al_u277  (
    .a({open_n3655,1'b0}),
    .b({open_n3656,1'b1}),
    .fci(\u_flash_read/lt0_c7 ),
    .f({open_n3675,\u_flash_read/n7 }));
  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_read.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg0_b2|u_flash_read/reg0_b1  (
    .a({\u_flash_read/cycle_cnt [0],fls_sck_rd}),
    .b({\u_flash_read/cycle_cnt [1],\u_flash_read/n7 }),
    .c({\u_flash_read/cycle_cnt [2],\u_flash_read/cycle_cnt [0]}),
    .clk(clk),
    .d({\u_flash_read/cycle_cnt [3],\u_flash_read/cycle_cnt [1]}),
    .mi(\u_flash_read/cnt [5:4]),
    .f({_al_u223_o,_al_u237_o}),
    .q(\u_flash_read/cycle_cnt [2:1]));  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg0_b4|u_flash_read/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_read/cnt [7],\u_flash_read/cnt [9]}),
    .q({\u_flash_read/cycle_cnt [4],\u_flash_read/cycle_cnt [6]}));  // src/rtl/flash/flash_read.v(71)
  // src/rtl/flash/flash_read.v(77)
  // src/rtl/flash/flash_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg0_b5|u_flash_read/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_read/cnt [8],\u_flash_read/cnt [1]}),
    .q({\u_flash_read/cycle_cnt [5],\u_flash_read/phase_cnt [1]}));  // src/rtl/flash/flash_read.v(77)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b11|u_flash_sector_erase/reg2_b11  (
    .b({fls_addr[11],fls_addr[11]}),
    .c({start_rd,start_sector}),
    .clk(clk),
    .d({_al_u58_o,_al_u105_o}),
    .q({\u_flash_read/tx_reg [11],\u_flash_sector_erase/tx_reg [11]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b12|u_flash_sector_erase/reg2_b12  (
    .b({fls_addr[12],fls_addr[12]}),
    .c({start_rd,start_sector}),
    .clk(clk),
    .d({_al_u56_o,_al_u103_o}),
    .q({\u_flash_read/tx_reg [12],\u_flash_sector_erase/tx_reg [12]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b13|u_flash_sector_erase/reg2_b13  (
    .b({fls_addr[13],fls_addr[13]}),
    .c({start_rd,start_sector}),
    .clk(clk),
    .d({_al_u54_o,_al_u101_o}),
    .q({\u_flash_read/tx_reg [13],\u_flash_sector_erase/tx_reg [13]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b1|u_flash_sector_erase/reg2_b1  (
    .b({fls_addr[1],fls_addr[1]}),
    .c({start_rd,start_sector}),
    .clk(clk),
    .d({_al_u62_o,_al_u109_o}),
    .q({\u_flash_read/tx_reg [1],\u_flash_sector_erase/tx_reg [1]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b22|u_flash_write/reg2_b30  (
    .b({fls_addr[22],fls_addr[22]}),
    .c({start_rd,start_wr}),
    .clk(clk),
    .d({_al_u34_o,_al_u126_o}),
    .q({\u_flash_read/tx_reg [22],\u_flash_write/tx_reg [30]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b23|u_flash_write/reg2_b31  (
    .b({fls_addr[23],fls_addr[23]}),
    .c({start_rd,start_wr}),
    .clk(clk),
    .d({_al_u32_o,_al_u124_o}),
    .q({\u_flash_read/tx_reg [23],\u_flash_write/tx_reg [31]}));  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_read/reg2_b25  (
    .ce(\u_flash_read/sft_wen ),
    .clk(clk),
    .mi({open_n3906,\u_flash_read/tx_reg [24]}),
    .sr(start_rd),
    .q({open_n3912,\u_flash_read/tx_reg [25]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_read/reg2_b26|u_flash_read/reg2_b27  (
    .ce(\u_flash_read/sft_wen ),
    .clk(clk),
    .mi({\u_flash_read/tx_reg [25],\u_flash_read/tx_reg [26]}),
    .sr(start_rd),
    .q({\u_flash_read/tx_reg [26],\u_flash_read/tx_reg [27]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_read/reg2_b28|u_flash_read/reg2_b29  (
    .ce(\u_flash_read/sft_wen ),
    .clk(clk),
    .mi({\u_flash_read/tx_reg [27],\u_flash_read/tx_reg [28]}),
    .sr(start_rd),
    .q({\u_flash_read/tx_reg [28],\u_flash_read/tx_reg [29]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg2_b2|u_flash_write/reg2_b10  (
    .b({fls_addr[2],fls_addr[2]}),
    .c({start_rd,start_wr}),
    .clk(clk),
    .d({_al_u40_o,_al_u170_o}),
    .q({\u_flash_read/tx_reg [2],\u_flash_write/tx_reg [10]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_read/reg2_b30|u_flash_read/reg2_b31  (
    .ce(\u_flash_read/sft_wen ),
    .clk(clk),
    .mi({\u_flash_read/tx_reg [29],\u_flash_read/tx_reg [30]}),
    .sr(start_rd),
    .q({\u_flash_read/tx_reg [30],\u_flash_read/tx_reg [31]}));  // src/rtl/flash/flash_read.v(101)
  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg3_b0|u_flash_read/reg3_b7  (
    .ce(\u_flash_read/sft_ren ),
    .clk(clk),
    .mi({fls_sdi_rd,\u_flash_read/rx_reg [6]}),
    .q({\u_flash_read/rx_reg [0],\u_flash_read/rx_reg [7]}));  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg3_b1|u_flash_read/reg3_b2  (
    .ce(\u_flash_read/sft_ren ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [0],\u_flash_read/rx_reg [1]}),
    .q({\u_flash_read/rx_reg [1],\u_flash_read/rx_reg [2]}));  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg3_b3|u_flash_read/reg3_b4  (
    .ce(\u_flash_read/sft_ren ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [2],\u_flash_read/rx_reg [3]}),
    .q({\u_flash_read/rx_reg [3],\u_flash_read/rx_reg [4]}));  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(132)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg3_b5|u_flash_read/reg3_b6  (
    .ce(\u_flash_read/sft_ren ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [4],\u_flash_read/rx_reg [5]}),
    .q({\u_flash_read/rx_reg [5],\u_flash_read/rx_reg [6]}));  // src/rtl/flash/flash_read.v(132)
  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg4_b0|u_flash_read/reg4_b6  (
    .ce(\u_flash_read/byte_flag ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [0],\u_flash_read/rx_reg [6]}),
    .q({fls_read[0],fls_read[6]}));  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg4_b1|u_flash_read/reg4_b5  (
    .ce(\u_flash_read/byte_flag ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [1],\u_flash_read/rx_reg [5]}),
    .q({fls_read[1],fls_read[5]}));  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg4_b2|u_flash_read/reg4_b4  (
    .ce(\u_flash_read/byte_flag ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [2],\u_flash_read/rx_reg [4]}),
    .q({fls_read[2],fls_read[4]}));  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(145)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/reg4_b7|u_flash_read/reg4_b3  (
    .ce(\u_flash_read/byte_flag ),
    .clk(clk),
    .mi({\u_flash_read/rx_reg [7],\u_flash_read/rx_reg [3]}),
    .q({fls_read[7],fls_read[3]}));  // src/rtl/flash/flash_read.v(145)
  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_read/reg5_b0|u_flash_read/reg5_b9  (
    .clk(clk),
    .mi({\u_flash_read/n0 [0],\u_flash_read/n0 [9]}),
    .sr(busy_rd),
    .q({\u_flash_read/cnt [0],\u_flash_read/cnt [9]}));  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_read/reg5_b1|u_flash_read/reg5_b8  (
    .clk(clk),
    .mi({\u_flash_read/n0 [1],\u_flash_read/n0 [8]}),
    .sr(busy_rd),
    .q({\u_flash_read/cnt [1],\u_flash_read/cnt [8]}));  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_read/reg5_b2|u_flash_read/reg5_b7  (
    .clk(clk),
    .mi({\u_flash_read/n0 [2],\u_flash_read/n0 [7]}),
    .sr(busy_rd),
    .q({\u_flash_read/cnt [2],\u_flash_read/cnt [7]}));  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_read/reg5_b3|u_flash_read/reg5_b6  (
    .clk(clk),
    .mi({\u_flash_read/n0 [3],\u_flash_read/n0 [6]}),
    .sr(busy_rd),
    .q({\u_flash_read/cnt [3],\u_flash_read/cnt [6]}));  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_read/reg5_b4|u_flash_read/reg5_b5  (
    .clk(clk),
    .mi({\u_flash_read/n0 [4],\u_flash_read/n0 [5]}),
    .sr(busy_rd),
    .q({\u_flash_read/cnt [4],\u_flash_read/cnt [5]}));  // src/rtl/flash/flash_read.v(65)
  // src/rtl/flash/flash_read.v(107)
  // src/rtl/flash/flash_read.v(113)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(D*C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_read/sft_ren_reg|u_flash_read/sft_wen_reg  (
    .a({fls_sck_rd,open_n4355}),
    .b({\u_flash_read/n7 ,\u_flash_read/phase_cnt [0]}),
    .c({\u_flash_read/phase_cnt [0],\u_flash_read/phase_cnt [1]}),
    .clk(clk),
    .d({\u_flash_read/phase_cnt [1],fls_sck_rd}),
    .q({\u_flash_read/sft_ren ,\u_flash_read/sft_wen }));  // src/rtl/flash/flash_read.v(107)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_sector_erase/add0/ucin_al_u269"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_sector_erase/add0/u3_al_u270  (
    .a({\u_flash_sector_erase/cnt [5],\u_flash_sector_erase/cnt [3]}),
    .b({\u_flash_sector_erase/cnt [6],\u_flash_sector_erase/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_sector_erase/add0/c3 ),
    .f({\u_flash_sector_erase/n0 [5],\u_flash_sector_erase/n0 [3]}),
    .fco(\u_flash_sector_erase/add0/c7 ),
    .fx({\u_flash_sector_erase/n0 [6],\u_flash_sector_erase/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_sector_erase/add0/ucin_al_u269"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_sector_erase/add0/u7_al_u271  (
    .a({\u_flash_sector_erase/cnt [9],\u_flash_sector_erase/cnt [7]}),
    .b({open_n4393,\u_flash_sector_erase/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n4396,1'b0}),
    .fci(\u_flash_sector_erase/add0/c7 ),
    .f({\u_flash_sector_erase/n0 [9],\u_flash_sector_erase/n0 [7]}),
    .fx({open_n4412,\u_flash_sector_erase/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_sector_erase/add0/ucin_al_u269"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/add0/ucin_al_u269  (
    .a({\u_flash_sector_erase/cnt [1],1'b0}),
    .b({\u_flash_sector_erase/cnt [2],\u_flash_sector_erase/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_sector_erase/cnt [0],\u_flash_sector_erase/cnt [2]}),
    .f({\u_flash_sector_erase/n0 [1],open_n4429}),
    .fco(\u_flash_sector_erase/add0/c3 ),
    .fx({\u_flash_sector_erase/n0 [2],\u_flash_sector_erase/n0 [0]}),
    .q({\u_flash_sector_erase/phase_cnt [0],fls_sck_sector}));
  // src/rtl/flash/flash_write_enable.v(111)
  // src/rtl/flash/flash_sector_erase.v(107)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/fls_sdo_reg|u_flash_write_enable/fls_sdo_reg  (
    .clk(clk),
    .mi({\u_flash_sector_erase/tx_reg [31],\u_flash_write_enable/tx_reg [7]}),
    .q({fls_sdo_sector,fls_sdo_wen}));  // src/rtl/flash/flash_write_enable.v(111)
  // src/rtl/flash/flash_sector_erase.v(101)
  // src/rtl/flash/flash_sector_erase.v(65)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/reg0_b0|u_flash_sector_erase/sft_wen_reg  (
    .a({\u_flash_sector_erase/cycle_cnt [0],open_n4455}),
    .b({\u_flash_sector_erase/cycle_cnt [1],\u_flash_sector_erase/phase_cnt [0]}),
    .c({\u_flash_sector_erase/cycle_cnt [2],\u_flash_sector_erase/phase_cnt [1]}),
    .clk(clk),
    .d({\u_flash_sector_erase/cycle_cnt [3],fls_sck_sector}),
    .mi({\u_flash_sector_erase/cnt [3],open_n4460}),
    .f({_al_u226_o,open_n4473}),
    .q({\u_flash_sector_erase/cycle_cnt [0],\u_flash_sector_erase/sft_wen }));  // src/rtl/flash/flash_sector_erase.v(101)
  // src/rtl/flash/flash_sector_erase.v(71)
  // src/rtl/flash/flash_sector_erase.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/reg0_b1|u_flash_sector_erase/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_sector_erase/cnt [4],\u_flash_sector_erase/cnt [1]}),
    .q({\u_flash_sector_erase/cycle_cnt [1],\u_flash_sector_erase/phase_cnt [1]}));  // src/rtl/flash/flash_sector_erase.v(71)
  // src/rtl/flash/flash_sector_erase.v(65)
  // src/rtl/flash/flash_sector_erase.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/reg0_b2|u_flash_sector_erase/reg0_b3  (
    .clk(clk),
    .mi({\u_flash_sector_erase/cnt [5],\u_flash_sector_erase/cnt [6]}),
    .q({\u_flash_sector_erase/cycle_cnt [2],\u_flash_sector_erase/cycle_cnt [3]}));  // src/rtl/flash/flash_sector_erase.v(65)
  // src/rtl/flash/flash_sector_erase.v(65)
  // src/rtl/flash/flash_sector_erase.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_sector_erase/reg0_b4|u_flash_sector_erase/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_sector_erase/cnt [7],\u_flash_sector_erase/cnt [9]}),
    .q({\u_flash_sector_erase/cycle_cnt [4],\u_flash_sector_erase/cycle_cnt [6]}));  // src/rtl/flash/flash_sector_erase.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_sector_erase/reg2_b25  (
    .ce(\u_flash_sector_erase/sft_wen ),
    .clk(clk),
    .mi({open_n4574,\u_flash_sector_erase/tx_reg [24]}),
    .sr(start_sector),
    .q({open_n4580,\u_flash_sector_erase/tx_reg [25]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_sector_erase/reg2_b26|u_flash_sector_erase/reg2_b27  (
    .ce(\u_flash_sector_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_sector_erase/tx_reg [25],\u_flash_sector_erase/tx_reg [26]}),
    .sr(start_sector),
    .q({\u_flash_sector_erase/tx_reg [26],\u_flash_sector_erase/tx_reg [27]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_sector_erase/reg2_b28|u_flash_sector_erase/reg2_b29  (
    .ce(\u_flash_sector_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_sector_erase/tx_reg [27],\u_flash_sector_erase/tx_reg [28]}),
    .sr(start_sector),
    .q({\u_flash_sector_erase/tx_reg [28],\u_flash_sector_erase/tx_reg [29]}));  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_sector_erase/reg2_b30|u_flash_sector_erase/reg2_b31  (
    .ce(\u_flash_sector_erase/sft_wen ),
    .clk(clk),
    .mi({\u_flash_sector_erase/tx_reg [29],\u_flash_sector_erase/tx_reg [30]}),
    .sr(start_sector),
    .q({\u_flash_sector_erase/tx_reg [30],\u_flash_sector_erase/tx_reg [31]}));  // src/rtl/flash/flash_sector_erase.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b0  (
    .a({open_n4658,busy_sector}),
    .b({open_n4659,busy_wfree}),
    .c({open_n4660,busy_wr}),
    .clk(clk),
    .d({open_n4662,busy_wen}),
    .mi({open_n4666,\u_flash_sector_erase/n0 [0]}),
    .sr(busy_sector),
    .f({open_n4678,_al_u241_o}),
    .q({open_n4682,\u_flash_sector_erase/cnt [0]}));  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b1|u_flash_sector_erase/reg3_b9  (
    .clk(clk),
    .mi({\u_flash_sector_erase/n0 [1],\u_flash_sector_erase/n0 [9]}),
    .sr(busy_sector),
    .q({\u_flash_sector_erase/cnt [1],\u_flash_sector_erase/cnt [9]}));  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b2|u_flash_sector_erase/reg3_b8  (
    .clk(clk),
    .mi({\u_flash_sector_erase/n0 [2],\u_flash_sector_erase/n0 [8]}),
    .sr(busy_sector),
    .q({\u_flash_sector_erase/cnt [2],\u_flash_sector_erase/cnt [8]}));  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b3|u_flash_sector_erase/reg3_b7  (
    .clk(clk),
    .mi({\u_flash_sector_erase/n0 [3],\u_flash_sector_erase/n0 [7]}),
    .sr(busy_sector),
    .q({\u_flash_sector_erase/cnt [3],\u_flash_sector_erase/cnt [7]}));  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b4|u_flash_sector_erase/reg3_b6  (
    .clk(clk),
    .mi({\u_flash_sector_erase/n0 [4],\u_flash_sector_erase/n0 [6]}),
    .sr(busy_sector),
    .q({\u_flash_sector_erase/cnt [4],\u_flash_sector_erase/cnt [6]}));  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_sector_erase/reg3_b5  (
    .clk(clk),
    .mi({open_n4799,\u_flash_sector_erase/n0 [5]}),
    .sr(busy_sector),
    .q({open_n4816,\u_flash_sector_erase/cnt [5]}));  // src/rtl/flash/flash_sector_erase.v(59)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u11_al_u254  (
    .a({\u_flash_wait_free/cnt [13],\u_flash_wait_free/cnt [11]}),
    .b({\u_flash_wait_free/cnt [14],\u_flash_wait_free/cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c11 ),
    .f({\u_flash_wait_free/n0 [13],\u_flash_wait_free/n0 [11]}),
    .fco(\u_flash_wait_free/add0/c15 ),
    .fx({\u_flash_wait_free/n0 [14],\u_flash_wait_free/n0 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u15_al_u255  (
    .a({\u_flash_wait_free/cnt [17],\u_flash_wait_free/cnt [15]}),
    .b({\u_flash_wait_free/cnt [18],\u_flash_wait_free/cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c15 ),
    .f({\u_flash_wait_free/n0 [17],\u_flash_wait_free/n0 [15]}),
    .fco(\u_flash_wait_free/add0/c19 ),
    .fx({\u_flash_wait_free/n0 [18],\u_flash_wait_free/n0 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u19_al_u256  (
    .a({\u_flash_wait_free/cnt [21],\u_flash_wait_free/cnt [19]}),
    .b({\u_flash_wait_free/cnt [22],\u_flash_wait_free/cnt [20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c19 ),
    .f({\u_flash_wait_free/n0 [21],\u_flash_wait_free/n0 [19]}),
    .fco(\u_flash_wait_free/add0/c23 ),
    .fx({\u_flash_wait_free/n0 [22],\u_flash_wait_free/n0 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u23_al_u257  (
    .a({\u_flash_wait_free/cnt [25],\u_flash_wait_free/cnt [23]}),
    .b({\u_flash_wait_free/cnt [26],\u_flash_wait_free/cnt [24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c23 ),
    .f({\u_flash_wait_free/n0 [25],\u_flash_wait_free/n0 [23]}),
    .fco(\u_flash_wait_free/add0/c27 ),
    .fx({\u_flash_wait_free/n0 [26],\u_flash_wait_free/n0 [24]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u27_al_u258  (
    .a({\u_flash_wait_free/cnt [29],\u_flash_wait_free/cnt [27]}),
    .b({\u_flash_wait_free/cnt [30],\u_flash_wait_free/cnt [28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c27 ),
    .f({\u_flash_wait_free/n0 [29],\u_flash_wait_free/n0 [27]}),
    .fco(\u_flash_wait_free/add0/c31 ),
    .fx({\u_flash_wait_free/n0 [30],\u_flash_wait_free/n0 [28]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u31_al_u259  (
    .a({open_n4907,\u_flash_wait_free/cnt [31]}),
    .c(2'b00),
    .d({open_n4912,1'b0}),
    .fci(\u_flash_wait_free/add0/c31 ),
    .f({open_n4929,\u_flash_wait_free/n0 [31]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u3_al_u252  (
    .a({\u_flash_wait_free/cnt [5],\u_flash_wait_free/cnt [3]}),
    .b({\u_flash_wait_free/cnt [6],\u_flash_wait_free/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c3 ),
    .f({\u_flash_wait_free/n0 [5],\u_flash_wait_free/n0 [3]}),
    .fco(\u_flash_wait_free/add0/c7 ),
    .fx({\u_flash_wait_free/n0 [6],\u_flash_wait_free/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_wait_free/add0/u7_al_u253  (
    .a({\u_flash_wait_free/cnt [9],\u_flash_wait_free/cnt [7]}),
    .b({\u_flash_wait_free/cnt [10],\u_flash_wait_free/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_wait_free/add0/c7 ),
    .f({\u_flash_wait_free/n0 [9],\u_flash_wait_free/n0 [7]}),
    .fco(\u_flash_wait_free/add0/c11 ),
    .fx({\u_flash_wait_free/n0 [10],\u_flash_wait_free/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_wait_free/add0/ucin_al_u251"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/add0/ucin_al_u251  (
    .a({\u_flash_wait_free/cnt [1],1'b0}),
    .b({\u_flash_wait_free/cnt [2],\u_flash_wait_free/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_wait_free/cnt [0],\u_flash_wait_free/cnt [2]}),
    .f({\u_flash_wait_free/n0 [1],open_n4985}),
    .fco(\u_flash_wait_free/add0/c3 ),
    .fx({\u_flash_wait_free/n0 [2],\u_flash_wait_free/n0 [0]}),
    .q({\u_flash_wait_free/phase_cnt [0],fls_sck_wfree}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/busy_reg  (
    .a({open_n4986,\u_flash_wait_free/fls_busy }),
    .b({open_n4987,fls_sck_wfree}),
    .c({open_n4988,\u_flash_wait_free/phase_cnt [0]}),
    .ce(\u_flash_wait_free/n18 ),
    .clk(clk),
    .d({open_n4989,\u_flash_wait_free/phase_cnt [1]}),
    .mi({open_n4993,1'b0}),
    .sr(start_wfree),
    .f({open_n5005,\u_flash_wait_free/n18 }),
    .q({open_n5009,busy_wfree}));  // src/rtl/flash/flash_wait_free.v(147)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(116)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/byte_flag_reg|u_flash_wait_free/reg0_b1  (
    .a({_al_u239_o,fls_sck_wfree}),
    .b({\u_flash_wait_free/cycle_cnt [2],\u_flash_wait_free/n7 }),
    .c({\u_flash_wait_free/phase_cnt [0],\u_flash_wait_free/cycle_cnt [0]}),
    .clk(clk),
    .d({\u_flash_wait_free/phase_cnt [1],\u_flash_wait_free/cycle_cnt [1]}),
    .mi({open_n5014,\u_flash_wait_free/cnt [4]}),
    .f({open_n5027,_al_u239_o}),
    .q({\u_flash_wait_free/byte_flag ,\u_flash_wait_free/cycle_cnt [1]}));  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/fls_busy_reg  (
    .ce(\u_flash_wait_free/byte_flag ),
    .clk(clk),
    .mi({open_n5042,\u_flash_wait_free/rx_reg [0]}),
    .sr(start_wfree),
    .q({open_n5059,\u_flash_wait_free/fls_busy }));  // src/rtl/flash/flash_wait_free.v(138)
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin  (
    .a(2'b10),
    .b({\u_flash_wait_free/cycle_cnt [0],open_n5060}),
    .clk(clk),
    .mi({open_n5076,\u_flash_wait_free/cnt [3]}),
    .fco(\u_flash_wait_free/lt0_c1 ),
    .q({open_n5082,\u_flash_wait_free/cycle_cnt [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_10|u_flash_wait_free/lt0_9  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [10:9]),
    .fci(\u_flash_wait_free/lt0_c9 ),
    .fco(\u_flash_wait_free/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_12|u_flash_wait_free/lt0_11  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [12:11]),
    .fci(\u_flash_wait_free/lt0_c11 ),
    .fco(\u_flash_wait_free/lt0_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_14|u_flash_wait_free/lt0_13  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [14:13]),
    .fci(\u_flash_wait_free/lt0_c13 ),
    .fco(\u_flash_wait_free/lt0_c15 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y4Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_16|u_flash_wait_free/lt0_15  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [16:15]),
    .fci(\u_flash_wait_free/lt0_c15 ),
    .fco(\u_flash_wait_free/lt0_c17 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y4Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_18|u_flash_wait_free/lt0_17  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [18:17]),
    .fci(\u_flash_wait_free/lt0_c17 ),
    .fco(\u_flash_wait_free/lt0_c19 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y5Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_20|u_flash_wait_free/lt0_19  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [20:19]),
    .fci(\u_flash_wait_free/lt0_c19 ),
    .fco(\u_flash_wait_free/lt0_c21 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y5Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_22|u_flash_wait_free/lt0_21  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [22:21]),
    .fci(\u_flash_wait_free/lt0_c21 ),
    .fco(\u_flash_wait_free/lt0_c23 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y6Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_24|u_flash_wait_free/lt0_23  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [24:23]),
    .fci(\u_flash_wait_free/lt0_c23 ),
    .fco(\u_flash_wait_free/lt0_c25 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y6Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_26|u_flash_wait_free/lt0_25  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [26:25]),
    .fci(\u_flash_wait_free/lt0_c25 ),
    .fco(\u_flash_wait_free/lt0_c27 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y7Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_28|u_flash_wait_free/lt0_27  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [28:27]),
    .fci(\u_flash_wait_free/lt0_c27 ),
    .fco(\u_flash_wait_free/lt0_c29 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_2|u_flash_wait_free/lt0_1  (
    .a(2'b11),
    .b(\u_flash_wait_free/cycle_cnt [2:1]),
    .fci(\u_flash_wait_free/lt0_c1 ),
    .fco(\u_flash_wait_free/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_4|u_flash_wait_free/lt0_3  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [4:3]),
    .fci(\u_flash_wait_free/lt0_c3 ),
    .fco(\u_flash_wait_free/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_6|u_flash_wait_free/lt0_5  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [6:5]),
    .fci(\u_flash_wait_free/lt0_c5 ),
    .fco(\u_flash_wait_free/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_8|u_flash_wait_free/lt0_7  (
    .a(2'b00),
    .b(\u_flash_wait_free/cycle_cnt [8:7]),
    .fci(\u_flash_wait_free/lt0_c7 ),
    .fco(\u_flash_wait_free/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_wait_free/lt0_0|u_flash_wait_free/lt0_cin"),
    //.R_POSITION("X0Y7Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_flash_wait_free/lt0_cout_al_u278  (
    .a({open_n5419,1'b0}),
    .b({open_n5420,1'b1}),
    .fci(\u_flash_wait_free/lt0_c29 ),
    .f({open_n5439,\u_flash_wait_free/n7 }));
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b10|u_flash_wait_free/reg0_b2  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [13],\u_flash_wait_free/cnt [5]}),
    .q({\u_flash_wait_free/cycle_cnt [10],\u_flash_wait_free/cycle_cnt [2]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b11|u_flash_wait_free/reg0_b9  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [14],\u_flash_wait_free/cnt [12]}),
    .q({\u_flash_wait_free/cycle_cnt [11],\u_flash_wait_free/cycle_cnt [9]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b12|u_flash_wait_free/reg0_b15  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [15],\u_flash_wait_free/cnt [18]}),
    .q({\u_flash_wait_free/cycle_cnt [12],\u_flash_wait_free/cycle_cnt [15]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b13|u_flash_wait_free/reg0_b14  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [16],\u_flash_wait_free/cnt [17]}),
    .q({\u_flash_wait_free/cycle_cnt [13],\u_flash_wait_free/cycle_cnt [14]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b16|u_flash_wait_free/reg0_b18  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [19],\u_flash_wait_free/cnt [21]}),
    .q({\u_flash_wait_free/cycle_cnt [16],\u_flash_wait_free/cycle_cnt [18]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b17|u_flash_wait_free/reg0_b23  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [20],\u_flash_wait_free/cnt [26]}),
    .q({\u_flash_wait_free/cycle_cnt [17],\u_flash_wait_free/cycle_cnt [23]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b19|u_flash_wait_free/reg0_b20  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [22],\u_flash_wait_free/cnt [23]}),
    .q({\u_flash_wait_free/cycle_cnt [19],\u_flash_wait_free/cycle_cnt [20]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b21|u_flash_wait_free/reg0_b22  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [24],\u_flash_wait_free/cnt [25]}),
    .q({\u_flash_wait_free/cycle_cnt [21],\u_flash_wait_free/cycle_cnt [22]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(74)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b24|u_flash_wait_free/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [27],\u_flash_wait_free/cnt [1]}),
    .q({\u_flash_wait_free/cycle_cnt [24],\u_flash_wait_free/phase_cnt [1]}));  // src/rtl/flash/flash_wait_free.v(74)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b25|u_flash_wait_free/reg0_b26  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [28],\u_flash_wait_free/cnt [29]}),
    .q({\u_flash_wait_free/cycle_cnt [25],\u_flash_wait_free/cycle_cnt [26]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b27|u_flash_wait_free/reg0_b28  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [30],\u_flash_wait_free/cnt [31]}),
    .q({\u_flash_wait_free/cycle_cnt [27],\u_flash_wait_free/cycle_cnt [28]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b3|u_flash_wait_free/reg0_b4  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [6],\u_flash_wait_free/cnt [7]}),
    .q({\u_flash_wait_free/cycle_cnt [3],\u_flash_wait_free/cycle_cnt [4]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b5|u_flash_wait_free/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [8],\u_flash_wait_free/cnt [9]}),
    .q({\u_flash_wait_free/cycle_cnt [5],\u_flash_wait_free/cycle_cnt [6]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(68)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg0_b7|u_flash_wait_free/reg0_b8  (
    .clk(clk),
    .mi({\u_flash_wait_free/cnt [10],\u_flash_wait_free/cnt [11]}),
    .q({\u_flash_wait_free/cycle_cnt [7],\u_flash_wait_free/cycle_cnt [8]}));  // src/rtl/flash/flash_wait_free.v(68)
  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/reg2_b1|u_flash_wait_free/reg2_b0  (
    .ce(\u_flash_wait_free/sft_wen ),
    .clk(clk),
    .mi({\u_flash_wait_free/tx_reg [0],1'b0}),
    .sr(start_wfree),
    .q(\u_flash_wait_free/tx_reg [1:0]));  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/reg2_b2|u_flash_wait_free/reg2_b3  (
    .ce(\u_flash_wait_free/sft_wen ),
    .clk(clk),
    .mi({\u_flash_wait_free/tx_reg [1],\u_flash_wait_free/tx_reg [2]}),
    .sr(start_wfree),
    .q({\u_flash_wait_free/tx_reg [2],\u_flash_wait_free/tx_reg [3]}));  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/reg2_b4|u_flash_wait_free/reg2_b5  (
    .ce(\u_flash_wait_free/sft_wen ),
    .clk(clk),
    .mi({\u_flash_wait_free/tx_reg [3],\u_flash_wait_free/tx_reg [4]}),
    .sr(start_wfree),
    .q({\u_flash_wait_free/tx_reg [4],\u_flash_wait_free/tx_reg [5]}));  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  // src/rtl/flash/flash_wait_free.v(98)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_wait_free/reg2_b6|u_flash_wait_free/reg2_b7  (
    .ce(\u_flash_wait_free/sft_wen ),
    .clk(clk),
    .mi({\u_flash_wait_free/tx_reg [5],\u_flash_wait_free/tx_reg [6]}),
    .sr(start_wfree),
    .q({\u_flash_wait_free/tx_reg [6],\u_flash_wait_free/tx_reg [7]}));  // src/rtl/flash/flash_wait_free.v(98)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/reg3_b0  (
    .ce(\u_flash_wait_free/sft_ren ),
    .clk(clk),
    .mi({open_n5934,fls_sdi_wfree}),
    .q({open_n5952,\u_flash_wait_free/rx_reg [0]}));  // src/rtl/flash/flash_wait_free.v(129)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b0|u_flash_wait_free/reg4_b9  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [0],\u_flash_wait_free/n0 [9]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [0],\u_flash_wait_free/cnt [9]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b10|u_flash_wait_free/reg4_b8  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [10],\u_flash_wait_free/n0 [8]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [10],\u_flash_wait_free/cnt [8]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b11|u_flash_wait_free/reg4_b7  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [11],\u_flash_wait_free/n0 [7]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [11],\u_flash_wait_free/cnt [7]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b12|u_flash_wait_free/reg4_b6  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [12],\u_flash_wait_free/n0 [6]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [12],\u_flash_wait_free/cnt [6]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b13|u_flash_wait_free/reg4_b5  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [13],\u_flash_wait_free/n0 [5]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [13],\u_flash_wait_free/cnt [5]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b14|u_flash_wait_free/reg4_b4  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [14],\u_flash_wait_free/n0 [4]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [14],\u_flash_wait_free/cnt [4]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b15|u_flash_wait_free/reg4_b31  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [15],\u_flash_wait_free/n0 [31]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [15],\u_flash_wait_free/cnt [31]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b16|u_flash_wait_free/reg4_b30  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [16],\u_flash_wait_free/n0 [30]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [16],\u_flash_wait_free/cnt [30]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b17|u_flash_wait_free/reg4_b3  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [17],\u_flash_wait_free/n0 [3]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [17],\u_flash_wait_free/cnt [3]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b18|u_flash_wait_free/reg4_b29  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [18],\u_flash_wait_free/n0 [29]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [18],\u_flash_wait_free/cnt [29]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b19|u_flash_wait_free/reg4_b28  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [19],\u_flash_wait_free/n0 [28]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [19],\u_flash_wait_free/cnt [28]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b1|u_flash_wait_free/reg4_b27  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [1],\u_flash_wait_free/n0 [27]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [1],\u_flash_wait_free/cnt [27]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b20|u_flash_wait_free/reg4_b26  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [20],\u_flash_wait_free/n0 [26]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [20],\u_flash_wait_free/cnt [26]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b21|u_flash_wait_free/reg4_b25  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [21],\u_flash_wait_free/n0 [25]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [21],\u_flash_wait_free/cnt [25]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b22|u_flash_wait_free/reg4_b24  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [22],\u_flash_wait_free/n0 [24]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [22],\u_flash_wait_free/cnt [24]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(62)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_wait_free/reg4_b2|u_flash_wait_free/reg4_b23  (
    .clk(clk),
    .mi({\u_flash_wait_free/n0 [2],\u_flash_wait_free/n0 [23]}),
    .sr(busy_wfree),
    .q({\u_flash_wait_free/cnt [2],\u_flash_wait_free/cnt [23]}));  // src/rtl/flash/flash_wait_free.v(62)
  // src/rtl/flash/flash_wait_free.v(104)
  // src/rtl/flash/flash_wait_free.v(110)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(D*C*B*~A)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(D*C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_wait_free/sft_ren_reg|u_flash_wait_free/sft_wen_reg  (
    .a({fls_sck_wfree,open_n6369}),
    .b({\u_flash_wait_free/n7 ,\u_flash_wait_free/phase_cnt [0]}),
    .c({\u_flash_wait_free/phase_cnt [0],\u_flash_wait_free/phase_cnt [1]}),
    .clk(clk),
    .d({\u_flash_wait_free/phase_cnt [1],fls_sck_wfree}),
    .q({\u_flash_wait_free/sft_ren ,\u_flash_wait_free/sft_wen }));  // src/rtl/flash/flash_wait_free.v(104)
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_write/add0/ucin_al_u272"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_write/add0/u3_al_u273  (
    .a({\u_flash_write/cnt [5],\u_flash_write/cnt [3]}),
    .b({\u_flash_write/cnt [6],\u_flash_write/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_flash_write/add0/c3 ),
    .f({\u_flash_write/n0 [5],\u_flash_write/n0 [3]}),
    .fco(\u_flash_write/add0/c7 ),
    .fx({\u_flash_write/n0 [6],\u_flash_write/n0 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_write/add0/ucin_al_u272"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_flash_write/add0/u7_al_u274  (
    .a({\u_flash_write/cnt [9],\u_flash_write/cnt [7]}),
    .b({open_n6411,\u_flash_write/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n6414,1'b0}),
    .fci(\u_flash_write/add0/c7 ),
    .f({\u_flash_write/n0 [9],\u_flash_write/n0 [7]}),
    .fx({open_n6430,\u_flash_write/n0 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_flash_write/add0/ucin_al_u272"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/add0/ucin_al_u272  (
    .a({\u_flash_write/cnt [1],1'b0}),
    .b({\u_flash_write/cnt [2],\u_flash_write/cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({\u_flash_write/cnt [0],\u_flash_write/cnt [2]}),
    .f({\u_flash_write/n0 [1],open_n6447}),
    .fco(\u_flash_write/add0/c3 ),
    .fx({\u_flash_write/n0 [2],\u_flash_write/n0 [0]}),
    .q({\u_flash_write/phase_cnt [0],fls_sck_wr}));
  // src/rtl/flash/flash_write.v(88)
  // src/rtl/flash/flash_write.v(67)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/reg0_b0|u_flash_write/fls_ncs_reg  (
    .a({\u_flash_write/cycle_cnt [0],open_n6448}),
    .b({\u_flash_write/cycle_cnt [1],open_n6449}),
    .c({\u_flash_write/cycle_cnt [2],open_n6450}),
    .clk(clk),
    .d({\u_flash_write/cycle_cnt [3],busy_wr}),
    .mi({\u_flash_write/cnt [3],open_n6462}),
    .f({_al_u229_o,open_n6464}),
    .q({\u_flash_write/cycle_cnt [0],fls_ncs_wr}));  // src/rtl/flash/flash_write.v(88)
  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_write.v(67)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/reg0_b1|u_flash_write/reg0_b3  (
    .clk(clk),
    .mi({\u_flash_write/cnt [4],\u_flash_write/cnt [6]}),
    .q({\u_flash_write/cycle_cnt [1],\u_flash_write/cycle_cnt [3]}));  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_write.v(67)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/reg0_b4|u_flash_write/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_write/cnt [7],\u_flash_write/cnt [9]}),
    .q({\u_flash_write/cycle_cnt [4],\u_flash_write/cycle_cnt [6]}));  // src/rtl/flash/flash_write.v(67)
  // src/rtl/flash/flash_write.v(73)
  // src/rtl/flash/flash_write.v(67)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/reg0_b5|u_flash_write/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_write/cnt [8],\u_flash_write/cnt [1]}),
    .q({\u_flash_write/cycle_cnt [5],\u_flash_write/phase_cnt [1]}));  // src/rtl/flash/flash_write.v(73)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write/reg2_b33  (
    .ce(\u_flash_write/sft_wen ),
    .clk(clk),
    .mi({open_n6565,\u_flash_write/tx_reg [32]}),
    .sr(start_wr),
    .q({open_n6571,\u_flash_write/tx_reg [33]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write/reg2_b34|u_flash_write/reg2_b35  (
    .ce(\u_flash_write/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write/tx_reg [33],\u_flash_write/tx_reg [34]}),
    .sr(start_wr),
    .q({\u_flash_write/tx_reg [34],\u_flash_write/tx_reg [35]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write/reg2_b36|u_flash_write/reg2_b37  (
    .ce(\u_flash_write/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write/tx_reg [35],\u_flash_write/tx_reg [36]}),
    .sr(start_wr),
    .q({\u_flash_write/tx_reg [36],\u_flash_write/tx_reg [37]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(97)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write/reg2_b38|u_flash_write/reg2_b39  (
    .ce(\u_flash_write/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write/tx_reg [37],\u_flash_write/tx_reg [38]}),
    .sr(start_wr),
    .q({\u_flash_write/tx_reg [38],\u_flash_write/tx_reg [39]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write/reg3_b0|u_flash_write/reg3_b9  (
    .clk(clk),
    .mi({\u_flash_write/n0 [0],\u_flash_write/n0 [9]}),
    .sr(busy_wr),
    .q({\u_flash_write/cnt [0],\u_flash_write/cnt [9]}));  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write/reg3_b1|u_flash_write/reg3_b8  (
    .clk(clk),
    .mi({\u_flash_write/n0 [1],\u_flash_write/n0 [8]}),
    .sr(busy_wr),
    .q({\u_flash_write/cnt [1],\u_flash_write/cnt [8]}));  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write/reg3_b2|u_flash_write/reg3_b7  (
    .clk(clk),
    .mi({\u_flash_write/n0 [2],\u_flash_write/n0 [7]}),
    .sr(busy_wr),
    .q({\u_flash_write/cnt [2],\u_flash_write/cnt [7]}));  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write/reg3_b3|u_flash_write/reg3_b6  (
    .clk(clk),
    .mi({\u_flash_write/n0 [3],\u_flash_write/n0 [6]}),
    .sr(busy_wr),
    .q({\u_flash_write/cnt [3],\u_flash_write/cnt [6]}));  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(61)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write/reg3_b4|u_flash_write/reg3_b5  (
    .clk(clk),
    .mi({\u_flash_write/n0 [4],\u_flash_write/n0 [5]}),
    .sr(busy_wr),
    .q({\u_flash_write/cnt [4],\u_flash_write/cnt [5]}));  // src/rtl/flash/flash_write.v(61)
  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_write.v(103)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    //.LUT1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001111),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write/sft_wen_reg|u_flash_write/reg2_b1  (
    .b({\u_flash_write/phase_cnt [0],fls_write[1]}),
    .c({\u_flash_write/phase_cnt [1],start_wr}),
    .clk(clk),
    .d({fls_sck_wr,_al_u172_o}),
    .q({\u_flash_write/sft_wen ,\u_flash_write/tx_reg [1]}));  // src/rtl/flash/flash_write.v(97)
  // src/rtl/flash/flash_wait_free.v(89)
  // src/rtl/flash/flash_write_enable.v(84)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write_enable/fls_ncs_reg|u_flash_wait_free/fls_ncs_reg  (
    .clk(clk),
    .d({busy_wen,busy_wfree}),
    .q({fls_ncs_wen,fls_ncs_wfree}));  // src/rtl/flash/flash_wait_free.v(89)
  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(63)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write_enable/reg0_b2|u_flash_write_enable/reg0_b3  (
    .clk(clk),
    .mi({\u_flash_write_enable/cnt [5],\u_flash_write_enable/cnt [6]}),
    .q({\u_flash_write_enable/cycle_cnt [2],\u_flash_write_enable/cycle_cnt [3]}));  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(63)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write_enable/reg0_b4|u_flash_write_enable/reg0_b6  (
    .clk(clk),
    .mi({\u_flash_write_enable/cnt [7],\u_flash_write_enable/cnt [9]}),
    .q({\u_flash_write_enable/cycle_cnt [4],\u_flash_write_enable/cycle_cnt [6]}));  // src/rtl/flash/flash_write_enable.v(63)
  // src/rtl/flash/flash_write_enable.v(69)
  // src/rtl/flash/flash_write_enable.v(69)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write_enable/reg1_b0|u_flash_write_enable/reg1_b1  (
    .clk(clk),
    .mi({\u_flash_write_enable/cnt [0],\u_flash_write_enable/cnt [1]}),
    .q({\u_flash_write_enable/phase_cnt [0],\u_flash_write_enable/phase_cnt [1]}));  // src/rtl/flash/flash_write_enable.v(69)
  // src/rtl/flash/flash_write_enable.v(93)
  // src/rtl/flash/flash_write_enable.v(93)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write_enable/reg2_b2|u_flash_write_enable/reg2_b1  (
    .ce(\u_flash_write_enable/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write_enable/tx_reg [1],1'b0}),
    .sr(start_wen),
    .q(\u_flash_write_enable/tx_reg [2:1]));  // src/rtl/flash/flash_write_enable.v(93)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write_enable/reg2_b3  (
    .ce(\u_flash_write_enable/sft_wen ),
    .clk(clk),
    .mi({open_n6944,\u_flash_write_enable/tx_reg [2]}),
    .sr(start_wen),
    .q({open_n6961,\u_flash_write_enable/tx_reg [3]}));  // src/rtl/flash/flash_write_enable.v(93)
  // src/rtl/flash/flash_write_enable.v(93)
  // src/rtl/flash/flash_write_enable.v(93)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write_enable/reg2_b4|u_flash_write_enable/reg2_b5  (
    .ce(\u_flash_write_enable/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write_enable/tx_reg [3],\u_flash_write_enable/tx_reg [4]}),
    .sr(start_wen),
    .q({\u_flash_write_enable/tx_reg [4],\u_flash_write_enable/tx_reg [5]}));  // src/rtl/flash/flash_write_enable.v(93)
  // src/rtl/flash/flash_write_enable.v(93)
  // src/rtl/flash/flash_write_enable.v(93)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u_flash_write_enable/reg2_b6|u_flash_write_enable/reg2_b7  (
    .ce(\u_flash_write_enable/sft_wen ),
    .clk(clk),
    .mi({\u_flash_write_enable/tx_reg [5],\u_flash_write_enable/tx_reg [6]}),
    .sr(start_wen),
    .q({\u_flash_write_enable/tx_reg [6],\u_flash_write_enable/tx_reg [7]}));  // src/rtl/flash/flash_write_enable.v(93)
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin  (
    .a({\u_flash_write_enable/cnt [0],1'b0}),
    .b({1'b1,open_n7008}),
    .clk(clk),
    .sr(busy_wen),
    .fco(\u_flash_write_enable/add0/c1 ),
    .q({\u_flash_write_enable/cnt [0],open_n7030}));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b2|u_flash_write_enable/reg3_b1  (
    .a(\u_flash_write_enable/cnt [2:1]),
    .b(2'b00),
    .clk(clk),
    .fci(\u_flash_write_enable/add0/c1 ),
    .sr(busy_wen),
    .fco(\u_flash_write_enable/add0/c3 ),
    .q(\u_flash_write_enable/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b4|u_flash_write_enable/reg3_b3  (
    .a(\u_flash_write_enable/cnt [4:3]),
    .b(2'b00),
    .clk(clk),
    .fci(\u_flash_write_enable/add0/c3 ),
    .sr(busy_wen),
    .fco(\u_flash_write_enable/add0/c5 ),
    .q(\u_flash_write_enable/cnt [4:3]));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b6|u_flash_write_enable/reg3_b5  (
    .a(\u_flash_write_enable/cnt [6:5]),
    .b(2'b00),
    .clk(clk),
    .fci(\u_flash_write_enable/add0/c5 ),
    .sr(busy_wen),
    .fco(\u_flash_write_enable/add0/c7 ),
    .q(\u_flash_write_enable/cnt [6:5]));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b8|u_flash_write_enable/reg3_b7  (
    .a(\u_flash_write_enable/cnt [8:7]),
    .b(2'b00),
    .clk(clk),
    .fci(\u_flash_write_enable/add0/c7 ),
    .sr(busy_wen),
    .fco(\u_flash_write_enable/add0/c9 ),
    .q(\u_flash_write_enable/cnt [8:7]));
  EG_PHY_MSLICE #(
    //.MACRO("u_flash_write_enable/reg3_b0|u_flash_write_enable/add0/ucin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_flash_write_enable/reg3_b9_al_u279  (
    .a({open_n7111,\u_flash_write_enable/cnt [9]}),
    .b({open_n7112,1'b0}),
    .clk(clk),
    .fci(\u_flash_write_enable/add0/c9 ),
    .sr(busy_wen),
    .q({open_n7134,\u_flash_write_enable/cnt [9]}));
  // src/rtl/flash/flash_write_enable.v(75)
  // src/rtl/flash/flash_write_enable.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010100000100000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1010100000100000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_flash_write_enable/sft_wen_reg|u_flash_write_enable/fls_sck_reg  (
    .a({open_n7135,_al_u182_o}),
    .b({\u_flash_write_enable/phase_cnt [0],mod_sel[0]}),
    .c({\u_flash_write_enable/phase_cnt [1],fls_sck_wfree}),
    .clk(clk),
    .d({fls_sck_wen,fls_sck_wen}),
    .mi({open_n7140,\u_flash_write_enable/cnt [2]}),
    .f({open_n7153,_al_u185_o}),
    .q({\u_flash_write_enable/sft_wen ,fls_sck_wen}));  // src/rtl/flash/flash_write_enable.v(75)

endmodule 

module \uart(CLK_RATE=24000000)   // src/rtl/uart/uart.v(10)
  (
  busy,
  clk,
  fls_read,
  id,
  rx,
  fls_addr,
  fls_write,
  led,
  mod_sel,
  sm_bit1,
  sm_bit2,
  sm_bit3,
  sm_bit4,
  start,
  tx
  );

  input busy;  // src/rtl/uart/uart.v(38)
  input clk;  // src/rtl/uart/uart.v(16)
  input [7:0] fls_read;  // src/rtl/uart/uart.v(36)
  input [15:0] id;  // src/rtl/uart/uart.v(37)
  input rx;  // src/rtl/uart/uart.v(19)
  output [23:0] fls_addr;  // src/rtl/uart/uart.v(34)
  output [7:0] fls_write;  // src/rtl/uart/uart.v(35)
  output [15:0] led;  // src/rtl/uart/uart.v(29)
  output [2:0] mod_sel;  // src/rtl/uart/uart.v(33)
  output [3:0] sm_bit1;  // src/rtl/uart/uart.v(23)
  output [3:0] sm_bit2;  // src/rtl/uart/uart.v(24)
  output [3:0] sm_bit3;  // src/rtl/uart/uart.v(25)
  output [3:0] sm_bit4;  // src/rtl/uart/uart.v(26)
  output start;  // src/rtl/uart/uart.v(32)
  output tx;  // src/rtl/uart/uart.v(20)

  parameter BAUDRATE = 115200;
  parameter CLK_RATE = 24000000;
  wire [7:0] rx_data;  // src/rtl/uart/uart.v(42)
  wire [7:0] tx_data;  // src/rtl/uart/uart.v(44)
  wire [31:0] \u_uart_tx/clk_cnt ;  // src/rtl/uart/uart_tx.v(29)
  wire [3:0] \u_uart_tx/cnt ;  // src/rtl/uart/uart_tx.v(27)
  wire [7:0] \u_uart_tx/data ;  // src/rtl/uart/uart_tx.v(28)
  wire [31:0] \u_uart_tx/n1 ;
  wire [31:0] ubus_raddr;  // src/rtl/uart/uart.v(50)
  wire [31:0] ubus_rdata;  // src/rtl/uart/uart.v(52)
  wire [31:0] ubus_waddr;  // src/rtl/uart/uart.v(47)
  wire [31:0] ubus_wdata;  // src/rtl/uart/uart.v(48)
  wire _al_u34_o;
  wire _al_u35_o;
  wire _al_u36_o;
  wire _al_u37_o;
  wire _al_u38_o;
  wire _al_u39_o;
  wire _al_u40_o;
  wire _al_u41_o;
  wire _al_u42_o;
  wire _al_u43_o;
  wire _al_u44_o;
  wire _al_u46_o;
  wire _al_u47_o;
  wire _al_u48_o;
  wire _al_u49_o;
  wire _al_u50_o;
  wire _al_u51_o;
  wire _al_u52_o;
  wire _al_u53_o;
  wire _al_u54_o;
  wire _al_u55_o;
  wire rx_en;  // src/rtl/uart/uart.v(41)
  wire tx_en;  // src/rtl/uart/uart.v(43)
  wire tx_pad;  // src/rtl/uart/uart.v(20)
  wire tx_ready;  // src/rtl/uart/uart.v(45)
  wire \u_uart_tx/add0/c11 ;
  wire \u_uart_tx/add0/c15 ;
  wire \u_uart_tx/add0/c19 ;
  wire \u_uart_tx/add0/c23 ;
  wire \u_uart_tx/add0/c27 ;
  wire \u_uart_tx/add0/c3 ;
  wire \u_uart_tx/add0/c31 ;
  wire \u_uart_tx/add0/c7 ;
  wire \u_uart_tx/add1/c1 ;
  wire \u_uart_tx/add1/c3 ;
  wire \u_uart_tx/clk_en ;  // src/rtl/uart/uart_tx.v(26)
  wire \u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart_tx/n4 ;
  wire \u_uart_tx/n8 ;
  wire \u_uart_tx/start ;  // src/rtl/uart/uart_tx.v(25)
  wire ubus_bken;  // src/rtl/uart/uart.v(51)
  wire ubus_ren;  // src/rtl/uart/uart.v(49)
  wire ubus_wen;  // src/rtl/uart/uart.v(46)

  EG_PHY_PAD #(
    //.LOCATION("C11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u31 (
    .do({open_n1,open_n2,open_n3,tx_pad}),
    .opad(tx));  // src/rtl/uart/uart.v(20)
  // src/rtl/uart/uart_tx.v(56)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*~A)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000010000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u32|u_uart_tx/start_reg  (
    .a({open_n17,\u_uart_tx/cnt [0]}),
    .b({open_n18,\u_uart_tx/cnt [1]}),
    .c({tx_en,\u_uart_tx/cnt [2]}),
    .ce(\u_uart_tx/n4 ),
    .clk(clk),
    .d({\u_uart_tx/start ,\u_uart_tx/cnt [3]}),
    .mi({open_n29,1'b0}),
    .sr(tx_en),
    .f({\u_uart_tx/n8 ,\u_uart_tx/n4 }),
    .q({open_n33,\u_uart_tx/start }));  // src/rtl/uart/uart_tx.v(56)
  // src/rtl/uart/uart_tx.v(47)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u36|u_uart_tx/clk_en_reg  (
    .c({\u_uart_tx/cnt [1],_al_u55_o}),
    .clk(clk),
    .d({\u_uart_tx/cnt [0],_al_u50_o}),
    .f({_al_u36_o,open_n56}),
    .q({open_n60,\u_uart_tx/clk_en }));  // src/rtl/uart/uart_tx.v(47)
  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B*A))"),
    //.LUT1("(C*~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111111100000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u38|u_uart_tx/reg0_b5  (
    .a({open_n61,\u_uart_tx/data [5]}),
    .b({_al_u35_o,\u_uart_tx/cnt [0]}),
    .c({_al_u37_o,\u_uart_tx/cnt [1]}),
    .ce(\u_uart_tx/n8 ),
    .clk(clk),
    .d({_al_u34_o,\u_uart_tx/cnt [2]}),
    .mi({open_n72,tx_data[5]}),
    .f({_al_u38_o,_al_u37_o}),
    .q({open_n77,\u_uart_tx/data [5]}));  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B*A))"),
    //.LUTF1("(~C*~(B*~D))"),
    //.LUTG0("(~D*~(C*B*A))"),
    //.LUTG1("(~C*~(B*~D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001111111),
    .INIT_LUTF1(16'b0000111100000011),
    .INIT_LUTG0(16'b0000000001111111),
    .INIT_LUTG1(16'b0000111100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u41|u_uart_tx/reg0_b1  (
    .a({open_n78,\u_uart_tx/data [1]}),
    .b({_al_u40_o,\u_uart_tx/cnt [0]}),
    .c({\u_uart_tx/cnt [3],\u_uart_tx/cnt [1]}),
    .ce(\u_uart_tx/n8 ),
    .clk(clk),
    .d({_al_u39_o,\u_uart_tx/cnt [2]}),
    .mi({open_n82,tx_data[1]}),
    .f({_al_u41_o,_al_u40_o}),
    .q({open_n98,\u_uart_tx/data [1]}));  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(90)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~(~D*~C)*~(B*~A))"),
    //.LUTF1("~(C*~(~D*~(~B*~A)))"),
    //.LUTG0("~(~(~D*~C)*~(B*~A))"),
    //.LUTG1("~(C*~(~D*~(~B*~A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100010001001111),
    .INIT_LUTF1(16'b0000111111101111),
    .INIT_LUTG0(16'b0100010001001111),
    .INIT_LUTG1(16'b0000111111101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u42|u_uart_tx/tx_reg  (
    .a({_al_u36_o,_al_u38_o}),
    .b({\u_uart_tx/cnt [2],_al_u41_o}),
    .c({\u_uart_tx/cnt [3],_al_u42_o}),
    .clk(clk),
    .d({tx_pad,_al_u44_o}),
    .f({_al_u42_o,open_n117}),
    .q({open_n121,tx_pad}));  // src/rtl/uart/uart_tx.v(90)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    .INIT_LUT0(16'b0000000000001111),
    .MODE("LOGIC"))
    _al_u43 (
    .c({open_n126,\u_uart_tx/cnt [2]}),
    .d({open_n129,\u_uart_tx/cnt [1]}),
    .f({open_n143,_al_u43_o}));
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u50|u_uart_tx/reg2_b6  (
    .a({_al_u46_o,\u_uart_tx/clk_cnt [6]}),
    .b({_al_u47_o,\u_uart_tx/clk_cnt [7]}),
    .c({_al_u48_o,\u_uart_tx/clk_cnt [8]}),
    .clk(clk),
    .d({_al_u49_o,\u_uart_tx/clk_cnt [9]}),
    .mi({open_n160,\u_uart_tx/n1 [6]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u50_o,_al_u48_o}),
    .q({open_n164,\u_uart_tx/clk_cnt [6]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u55|u_uart_tx/reg2_b2  (
    .a({_al_u51_o,\u_uart_tx/clk_cnt [2]}),
    .b({_al_u52_o,\u_uart_tx/clk_cnt [20]}),
    .c({_al_u53_o,\u_uart_tx/clk_cnt [21]}),
    .clk(clk),
    .d({_al_u54_o,\u_uart_tx/clk_cnt [22]}),
    .mi({open_n176,\u_uart_tx/n1 [2]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u55_o,_al_u53_o}),
    .q({open_n180,\u_uart_tx/clk_cnt [2]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(99)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u57|u_uart_tx/tx_ready_reg  (
    .b({_al_u55_o,open_n183}),
    .c({\u_uart_tx/start ,open_n184}),
    .clk(clk),
    .d({_al_u50_o,\u_uart_tx/start }),
    .sr(tx_en),
    .f({\u_uart_tx/mux1_b0_sel_is_1_o ,open_n198}),
    .q({open_n202,tx_ready}));  // src/rtl/uart/uart_tx.v(99)
  \uart_rx(CLK_RATE=24000000)  u_uart_rx (
    .clk(clk),
    .rx(rx),
    .rx_data(rx_data),
    .rx_en(rx_en));  // src/rtl/uart/uart.v(60)
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u11_al_u62  (
    .a({\u_uart_tx/clk_cnt [13],\u_uart_tx/clk_cnt [11]}),
    .b({\u_uart_tx/clk_cnt [14],\u_uart_tx/clk_cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c11 ),
    .f({\u_uart_tx/n1 [13],\u_uart_tx/n1 [11]}),
    .fco(\u_uart_tx/add0/c15 ),
    .fx({\u_uart_tx/n1 [14],\u_uart_tx/n1 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u15_al_u63  (
    .a({\u_uart_tx/clk_cnt [17],\u_uart_tx/clk_cnt [15]}),
    .b({\u_uart_tx/clk_cnt [18],\u_uart_tx/clk_cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c15 ),
    .f({\u_uart_tx/n1 [17],\u_uart_tx/n1 [15]}),
    .fco(\u_uart_tx/add0/c19 ),
    .fx({\u_uart_tx/n1 [18],\u_uart_tx/n1 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u19_al_u64  (
    .a({\u_uart_tx/clk_cnt [21],\u_uart_tx/clk_cnt [19]}),
    .b({\u_uart_tx/clk_cnt [22],\u_uart_tx/clk_cnt [20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c19 ),
    .f({\u_uart_tx/n1 [21],\u_uart_tx/n1 [19]}),
    .fco(\u_uart_tx/add0/c23 ),
    .fx({\u_uart_tx/n1 [22],\u_uart_tx/n1 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u23_al_u65  (
    .a({\u_uart_tx/clk_cnt [25],\u_uart_tx/clk_cnt [23]}),
    .b({\u_uart_tx/clk_cnt [26],\u_uart_tx/clk_cnt [24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c23 ),
    .f({\u_uart_tx/n1 [25],\u_uart_tx/n1 [23]}),
    .fco(\u_uart_tx/add0/c27 ),
    .fx({\u_uart_tx/n1 [26],\u_uart_tx/n1 [24]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u27_al_u66  (
    .a({\u_uart_tx/clk_cnt [29],\u_uart_tx/clk_cnt [27]}),
    .b({\u_uart_tx/clk_cnt [30],\u_uart_tx/clk_cnt [28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c27 ),
    .f({\u_uart_tx/n1 [29],\u_uart_tx/n1 [27]}),
    .fco(\u_uart_tx/add0/c31 ),
    .fx({\u_uart_tx/n1 [30],\u_uart_tx/n1 [28]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u31_al_u67  (
    .a({open_n293,\u_uart_tx/clk_cnt [31]}),
    .c(2'b00),
    .d({open_n298,1'b0}),
    .fci(\u_uart_tx/add0/c31 ),
    .f({open_n315,\u_uart_tx/n1 [31]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u3_al_u60  (
    .a({\u_uart_tx/clk_cnt [5],\u_uart_tx/clk_cnt [3]}),
    .b({\u_uart_tx/clk_cnt [6],\u_uart_tx/clk_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c3 ),
    .f({\u_uart_tx/n1 [5],\u_uart_tx/n1 [3]}),
    .fco(\u_uart_tx/add0/c7 ),
    .fx({\u_uart_tx/n1 [6],\u_uart_tx/n1 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_uart_tx/add0/u7_al_u61  (
    .a({\u_uart_tx/clk_cnt [9],\u_uart_tx/clk_cnt [7]}),
    .b({\u_uart_tx/clk_cnt [10],\u_uart_tx/clk_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_uart_tx/add0/c7 ),
    .f({\u_uart_tx/n1 [9],\u_uart_tx/n1 [7]}),
    .fco(\u_uart_tx/add0/c11 ),
    .fx({\u_uart_tx/n1 [10],\u_uart_tx/n1 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_uart_tx/add0/ucin_al_u59"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/add0/ucin_al_u59  (
    .a({\u_uart_tx/clk_cnt [1],1'b0}),
    .b({\u_uart_tx/clk_cnt [2],\u_uart_tx/clk_cnt [0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_uart_tx/n1 [1:0]),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({\u_uart_tx/n1 [1],open_n370}),
    .fco(\u_uart_tx/add0/c3 ),
    .fx({\u_uart_tx/n1 [2],\u_uart_tx/n1 [0]}),
    .q(\u_uart_tx/clk_cnt [1:0]));
  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~B*~(C*~D))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~B*~(C*~D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0011001100000011),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0011001100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart_tx/reg0_b0|u_uart_tx/reg0_b2  (
    .a({open_n371,\u_uart_tx/data [2]}),
    .b({\u_uart_tx/cnt [0],\u_uart_tx/data [3]}),
    .c(\u_uart_tx/cnt [1:0]),
    .ce(\u_uart_tx/n8 ),
    .clk(clk),
    .d({\u_uart_tx/data [0],\u_uart_tx/cnt [1]}),
    .mi({tx_data[0],tx_data[2]}),
    .f({_al_u39_o,_al_u34_o}),
    .q({\u_uart_tx/data [0],\u_uart_tx/data [2]}));  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart_tx/reg0_b3|u_uart_tx/reg0_b7  (
    .ce(\u_uart_tx/n8 ),
    .clk(clk),
    .mi({tx_data[3],tx_data[7]}),
    .q({\u_uart_tx/data [3],\u_uart_tx/data [7]}));  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000101000100010),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000101000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_uart_tx/reg0_b6|u_uart_tx/reg0_b4  (
    .a({_al_u43_o,open_n414}),
    .b({\u_uart_tx/data [6],\u_uart_tx/cnt [0]}),
    .c({\u_uart_tx/data [7],\u_uart_tx/cnt [1]}),
    .ce(\u_uart_tx/n8 ),
    .clk(clk),
    .d({\u_uart_tx/cnt [0],\u_uart_tx/data [4]}),
    .mi({tx_data[6],tx_data[4]}),
    .f({_al_u44_o,_al_u35_o}),
    .q({\u_uart_tx/data [6],\u_uart_tx/data [4]}));  // src/rtl/uart/uart_tx.v(63)
  EG_PHY_MSLICE #(
    //.MACRO("u_uart_tx/reg1_b0|u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg1_b0|u_uart_tx/add1/ucin  (
    .a({\u_uart_tx/cnt [0],1'b0}),
    .b({1'b1,open_n433}),
    .ce(\u_uart_tx/clk_en ),
    .clk(clk),
    .sr(\u_uart_tx/start ),
    .fco(\u_uart_tx/add1/c1 ),
    .q({\u_uart_tx/cnt [0],open_n454}));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart_tx/reg1_b0|u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg1_b2|u_uart_tx/reg1_b1  (
    .a(\u_uart_tx/cnt [2:1]),
    .b(2'b00),
    .ce(\u_uart_tx/clk_en ),
    .clk(clk),
    .fci(\u_uart_tx/add1/c1 ),
    .sr(\u_uart_tx/start ),
    .fco(\u_uart_tx/add1/c3 ),
    .q(\u_uart_tx/cnt [2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("u_uart_tx/reg1_b0|u_uart_tx/add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg1_b3_al_u68  (
    .a({open_n474,\u_uart_tx/cnt [3]}),
    .b({open_n475,1'b0}),
    .ce(\u_uart_tx/clk_en ),
    .clk(clk),
    .fci(\u_uart_tx/add1/c3 ),
    .sr(\u_uart_tx/start ),
    .q({open_n496,\u_uart_tx/cnt [3]}));
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b10|u_uart_tx/reg2_b30  (
    .a({\u_uart_tx/clk_cnt [0],\u_uart_tx/clk_cnt [30]}),
    .b({\u_uart_tx/clk_cnt [1],\u_uart_tx/clk_cnt [31]}),
    .c({\u_uart_tx/clk_cnt [10],\u_uart_tx/clk_cnt [4]}),
    .clk(clk),
    .d({\u_uart_tx/clk_cnt [11],\u_uart_tx/clk_cnt [5]}),
    .mi({\u_uart_tx/n1 [10],\u_uart_tx/n1 [30]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u52_o,_al_u49_o}),
    .q({\u_uart_tx/clk_cnt [10],\u_uart_tx/clk_cnt [30]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b11|u_uart_tx/reg2_b9  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [11],\u_uart_tx/n1 [9]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [11],\u_uart_tx/clk_cnt [9]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b12|u_uart_tx/reg2_b27  (
    .a({\u_uart_tx/clk_cnt [12],\u_uart_tx/clk_cnt [27]}),
    .b({\u_uart_tx/clk_cnt [13],\u_uart_tx/clk_cnt [28]}),
    .c({\u_uart_tx/clk_cnt [14],\u_uart_tx/clk_cnt [29]}),
    .clk(clk),
    .d({\u_uart_tx/clk_cnt [15],\u_uart_tx/clk_cnt [3]}),
    .mi({\u_uart_tx/n1 [12],\u_uart_tx/n1 [27]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u51_o,_al_u46_o}),
    .q({\u_uart_tx/clk_cnt [12],\u_uart_tx/clk_cnt [27]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b13|u_uart_tx/reg2_b8  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [13],\u_uart_tx/n1 [8]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [13],\u_uart_tx/clk_cnt [8]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b14|u_uart_tx/reg2_b7  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [14],\u_uart_tx/n1 [7]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [14],\u_uart_tx/clk_cnt [7]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b15|u_uart_tx/reg2_b5  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [15],\u_uart_tx/n1 [5]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [15],\u_uart_tx/clk_cnt [5]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b16|u_uart_tx/reg2_b23  (
    .a({\u_uart_tx/clk_cnt [16],\u_uart_tx/clk_cnt [23]}),
    .b({\u_uart_tx/clk_cnt [17],\u_uart_tx/clk_cnt [24]}),
    .c({\u_uart_tx/clk_cnt [18],\u_uart_tx/clk_cnt [25]}),
    .clk(clk),
    .d({\u_uart_tx/clk_cnt [19],\u_uart_tx/clk_cnt [26]}),
    .mi({\u_uart_tx/n1 [16],\u_uart_tx/n1 [23]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .f({_al_u54_o,_al_u47_o}),
    .q({\u_uart_tx/clk_cnt [16],\u_uart_tx/clk_cnt [23]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b17|u_uart_tx/reg2_b4  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [17],\u_uart_tx/n1 [4]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [17],\u_uart_tx/clk_cnt [4]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b18|u_uart_tx/reg2_b31  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [18],\u_uart_tx/n1 [31]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [18],\u_uart_tx/clk_cnt [31]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b19|u_uart_tx/reg2_b3  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [19],\u_uart_tx/n1 [3]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [19],\u_uart_tx/clk_cnt [3]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b20|u_uart_tx/reg2_b29  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [20],\u_uart_tx/n1 [29]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [20],\u_uart_tx/clk_cnt [29]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b21|u_uart_tx/reg2_b28  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [21],\u_uart_tx/n1 [28]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [21],\u_uart_tx/clk_cnt [28]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b22|u_uart_tx/reg2_b26  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [22],\u_uart_tx/n1 [26]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [22],\u_uart_tx/clk_cnt [26]}));  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  // src/rtl/uart/uart_tx.v(41)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_uart_tx/reg2_b24|u_uart_tx/reg2_b25  (
    .clk(clk),
    .mi({\u_uart_tx/n1 [24],\u_uart_tx/n1 [25]}),
    .sr(\u_uart_tx/mux1_b0_sel_is_1_o ),
    .q({\u_uart_tx/clk_cnt [24],\u_uart_tx/clk_cnt [25]}));  // src/rtl/uart/uart_tx.v(41)
  ubus u_ubus (
    .busy(busy),
    .clk(clk),
    .fls_read(fls_read),
    .id(id),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata({open_n823,open_n824,open_n825,open_n826,open_n827,open_n828,open_n829,open_n830,ubus_wdata[23:0]}),
    .ubus_wen(ubus_wen),
    .fls_addr(fls_addr),
    .fls_write(fls_write),
    .led(led),
    .mod_sel(mod_sel),
    .sm_bit1(sm_bit1),
    .sm_bit2(sm_bit2),
    .sm_bit3(sm_bit3),
    .sm_bit4(sm_bit4),
    .start(start),
    .ubus_bken(ubus_bken),
    .ubus_rdata(ubus_rdata));  // src/rtl/uart/uart.v(117)
  uprotocol u_uprotocol (
    .clk(clk),
    .rx_data(rx_data),
    .rx_en(rx_en),
    .tx_ready(tx_ready),
    .ubus_bken(ubus_bken),
    .ubus_rdata(ubus_rdata),
    .tx_data(tx_data),
    .tx_en(tx_en),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata({open_n831,open_n832,open_n833,open_n834,open_n835,open_n836,open_n837,open_n838,ubus_wdata[23:0]}),
    .ubus_wen(ubus_wen));  // src/rtl/uart/uart.v(91)

endmodule 

module flash_fast_read  // src/rtl/flash/flash_fast_read.v(22)
  (
  clk,
  fls_sdi,
  start,
  addr,
  busy,
  dout,
  dout_en,
  fls_ncs,
  fls_sck,
  fls_sdo
  );

  input clk;  // src/rtl/flash/flash_fast_read.v(24)
  input fls_sdi;  // src/rtl/flash/flash_fast_read.v(30)
  input start;  // src/rtl/flash/flash_fast_read.v(33)
  output [23:0] addr;  // src/rtl/flash/flash_fast_read.v(35)
  output busy;  // src/rtl/flash/flash_fast_read.v(38)
  output [7:0] dout;  // src/rtl/flash/flash_fast_read.v(36)
  output dout_en;  // src/rtl/flash/flash_fast_read.v(34)
  output fls_ncs;  // src/rtl/flash/flash_fast_read.v(28)
  output fls_sck;  // src/rtl/flash/flash_fast_read.v(27)
  output fls_sdo;  // src/rtl/flash/flash_fast_read.v(29)

  wire [31:0] cnt;  // src/rtl/flash/flash_fast_read.v(41)
  wire [28:0] cycle_cnt;  // src/rtl/flash/flash_fast_read.v(42)
  wire [31:0] n0;
  wire [23:0] n15;
  wire [2:0] phase_cnt;  // src/rtl/flash/flash_fast_read.v(43)
  wire [7:0] rx_reg;  // src/rtl/flash/flash_fast_read.v(45)
  wire [31:0] tx_reg;  // src/rtl/flash/flash_fast_read.v(44)
  wire _al_u10_o;
  wire _al_u11_o;
  wire _al_u12_o;
  wire _al_u13_o;
  wire _al_u14_o;
  wire _al_u15_o;
  wire _al_u5_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c27 ;
  wire \add0/c3 ;
  wire \add0/c31 ;
  wire \add0/c7 ;
  wire \add1/c11 ;
  wire \add1/c15 ;
  wire \add1/c19 ;
  wire \add1/c23 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire byte_flag;  // src/rtl/flash/flash_fast_read.v(48)
  wire lt0_c1;
  wire lt0_c11;
  wire lt0_c13;
  wire lt0_c15;
  wire lt0_c17;
  wire lt0_c19;
  wire lt0_c21;
  wire lt0_c23;
  wire lt0_c25;
  wire lt0_c27;
  wire lt0_c29;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire lt0_c9;
  wire n18;
  wire n7;
  wire sft_ren;  // src/rtl/flash/flash_fast_read.v(47)
  wire sft_wen;  // src/rtl/flash/flash_fast_read.v(46)

  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    .INIT_LUT0(16'b0000000000001111),
    .MODE("LOGIC"))
    _al_u11 (
    .c({open_n4,cycle_cnt[1]}),
    .d({open_n7,cycle_cnt[0]}),
    .f({open_n21,_al_u11_o}));
  // src/rtl/flash/flash_fast_read.v(163)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u15|busy_reg  (
    .a({_al_u11_o,_al_u10_o}),
    .b({_al_u12_o,_al_u15_o}),
    .c({_al_u13_o,_al_u7_o}),
    .ce(n18),
    .clk(clk),
    .d({_al_u14_o,_al_u8_o}),
    .mi({open_n30,1'b0}),
    .sr(start),
    .f({_al_u15_o,n18}),
    .q({open_n45,busy}));  // src/rtl/flash/flash_fast_read.v(163)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u11_al_u21  (
    .a({cnt[13],cnt[11]}),
    .b({cnt[14],cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n0[13],n0[11]}),
    .fco(\add0/c15 ),
    .fx({n0[14],n0[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u15_al_u22  (
    .a({cnt[17],cnt[15]}),
    .b({cnt[18],cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n0[17],n0[15]}),
    .fco(\add0/c19 ),
    .fx({n0[18],n0[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u19_al_u23  (
    .a({cnt[21],cnt[19]}),
    .b({cnt[22],cnt[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n0[21],n0[19]}),
    .fco(\add0/c23 ),
    .fx({n0[22],n0[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u23_al_u24  (
    .a({cnt[25],cnt[23]}),
    .b({cnt[26],cnt[24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c23 ),
    .f({n0[25],n0[23]}),
    .fco(\add0/c27 ),
    .fx({n0[26],n0[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u27_al_u25  (
    .a({cnt[29],cnt[27]}),
    .b({cnt[30],cnt[28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c27 ),
    .f({n0[29],n0[27]}),
    .fco(\add0/c31 ),
    .fx({n0[30],n0[28]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u31_al_u26  (
    .a({open_n136,cnt[31]}),
    .c(2'b00),
    .d({open_n141,1'b0}),
    .fci(\add0/c31 ),
    .f({open_n158,n0[31]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u19  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n0[5],n0[3]}),
    .fco(\add0/c7 ),
    .fx({n0[6],n0[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u20  (
    .a({cnt[9],cnt[7]}),
    .b({cnt[10],cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n0[9],n0[7]}),
    .fco(\add0/c11 ),
    .fx({n0[10],n0[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u18"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \add0/ucin_al_u18  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi({cnt[0],cnt[2]}),
    .f({n0[1],open_n214}),
    .fco(\add0/c3 ),
    .fx({n0[2],n0[0]}),
    .q({phase_cnt[0],fls_sck}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u11_al_u30  (
    .a({addr[13],addr[11]}),
    .b({addr[14],addr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c11 ),
    .f({n15[13],n15[11]}),
    .fco(\add1/c15 ),
    .fx({n15[14],n15[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u15_al_u31  (
    .a({addr[17],addr[15]}),
    .b({addr[18],addr[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c15 ),
    .f({n15[17],n15[15]}),
    .fco(\add1/c19 ),
    .fx({n15[18],n15[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u19_al_u32  (
    .a({addr[21],addr[19]}),
    .b({addr[22],addr[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c19 ),
    .f({n15[21],n15[19]}),
    .fco(\add1/c23 ),
    .fx({n15[22],n15[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u23_al_u33  (
    .a({open_n269,addr[23]}),
    .c(2'b00),
    .d({open_n274,1'b0}),
    .fci(\add1/c23 ),
    .f({open_n291,n15[23]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u3_al_u28  (
    .a({addr[5],addr[3]}),
    .b({addr[6],addr[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n15[5],n15[3]}),
    .fco(\add1/c7 ),
    .fx({n15[6],n15[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u7_al_u29  (
    .a({addr[9],addr[7]}),
    .b({addr[10],addr[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c7 ),
    .f({n15[9],n15[7]}),
    .fco(\add1/c11 ),
    .fx({n15[10],n15[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u27"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \add1/ucin_al_u27  (
    .a({addr[1],1'b0}),
    .b({addr[2],addr[0]}),
    .c(2'b00),
    .ce(byte_flag),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n15[1:0]),
    .sr(start),
    .f({n15[1],open_n345}),
    .fco(\add1/c3 ),
    .fx({n15[2],n15[0]}),
    .q(addr[1:0]));
  // src/rtl/flash/flash_fast_read.v(138)
  // src/rtl/flash/flash_fast_read.v(125)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \fls_sdo_reg|dout_en_reg  (
    .clk(clk),
    .mi({tx_reg[31],byte_flag}),
    .q({fls_sdo,dout_en}));  // src/rtl/flash/flash_fast_read.v(138)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \lt0_0|lt0_cin  (
    .a(2'b10),
    .b({cycle_cnt[0],open_n371}),
    .clk(clk),
    .mi({open_n387,cnt[3]}),
    .fco(lt0_c1),
    .q({open_n393,cycle_cnt[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_10|lt0_9  (
    .a(2'b00),
    .b(cycle_cnt[10:9]),
    .fci(lt0_c9),
    .fco(lt0_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_12|lt0_11  (
    .a(2'b00),
    .b(cycle_cnt[12:11]),
    .fci(lt0_c11),
    .fco(lt0_c13));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_14|lt0_13  (
    .a(2'b00),
    .b(cycle_cnt[14:13]),
    .fci(lt0_c13),
    .fco(lt0_c15));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y4Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_16|lt0_15  (
    .a(2'b00),
    .b(cycle_cnt[16:15]),
    .fci(lt0_c15),
    .fco(lt0_c17));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y4Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_18|lt0_17  (
    .a(2'b00),
    .b(cycle_cnt[18:17]),
    .fci(lt0_c17),
    .fco(lt0_c19));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y5Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_20|lt0_19  (
    .a(2'b00),
    .b(cycle_cnt[20:19]),
    .fci(lt0_c19),
    .fco(lt0_c21));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y5Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_22|lt0_21  (
    .a(2'b00),
    .b(cycle_cnt[22:21]),
    .fci(lt0_c21),
    .fco(lt0_c23));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y6Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_24|lt0_23  (
    .a(2'b00),
    .b(cycle_cnt[24:23]),
    .fci(lt0_c23),
    .fco(lt0_c25));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y6Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_26|lt0_25  (
    .a(2'b00),
    .b(cycle_cnt[26:25]),
    .fci(lt0_c25),
    .fco(lt0_c27));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y7Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_28|lt0_27  (
    .a(2'b00),
    .b(cycle_cnt[28:27]),
    .fci(lt0_c27),
    .fco(lt0_c29));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(2'b11),
    .b(cycle_cnt[2:1]),
    .fci(lt0_c1),
    .fco(lt0_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_4|lt0_3  (
    .a(2'b00),
    .b(cycle_cnt[4:3]),
    .fci(lt0_c3),
    .fco(lt0_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_6|lt0_5  (
    .a(2'b01),
    .b(cycle_cnt[6:5]),
    .fci(lt0_c5),
    .fco(lt0_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_8|lt0_7  (
    .a(2'b00),
    .b(cycle_cnt[8:7]),
    .fci(lt0_c7),
    .fco(lt0_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y7Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_cout_al_u34 (
    .a({open_n730,1'b0}),
    .b({open_n731,1'b1}),
    .fci(lt0_c29),
    .f({open_n750,n7}));
  // src/rtl/flash/flash_fast_read.v(92)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b10|fls_ncs_reg  (
    .a({cycle_cnt[10],open_n756}),
    .b({cycle_cnt[11],open_n757}),
    .c({cycle_cnt[12],open_n758}),
    .clk(clk),
    .d({cycle_cnt[13],busy}),
    .mi({cnt[13],open_n770}),
    .f({_al_u12_o,open_n772}),
    .q({cycle_cnt[10],fls_ncs}));  // src/rtl/flash/flash_fast_read.v(92)
  // src/rtl/flash/flash_fast_read.v(77)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b11|reg1_b1  (
    .clk(clk),
    .mi({cnt[14],cnt[1]}),
    .q({cycle_cnt[11],phase_cnt[1]}));  // src/rtl/flash/flash_fast_read.v(77)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b12|reg0_b2  (
    .clk(clk),
    .mi({cnt[15],cnt[5]}),
    .q({cycle_cnt[12],cycle_cnt[2]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b13|reg0_b9  (
    .clk(clk),
    .mi({cnt[16],cnt[12]}),
    .q({cycle_cnt[13],cycle_cnt[9]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b14|reg0_b18  (
    .a({cycle_cnt[14],cycle_cnt[18]}),
    .b({cycle_cnt[15],cycle_cnt[19]}),
    .c({cycle_cnt[16],cycle_cnt[2]}),
    .clk(clk),
    .d({cycle_cnt[17],cycle_cnt[20]}),
    .mi({cnt[17],cnt[21]}),
    .f({_al_u14_o,_al_u13_o}),
    .q({cycle_cnt[14],cycle_cnt[18]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b15|reg0_b8  (
    .clk(clk),
    .mi({cnt[18],cnt[11]}),
    .q({cycle_cnt[15],cycle_cnt[8]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b16|reg0_b6  (
    .clk(clk),
    .mi({cnt[19],cnt[9]}),
    .q({cycle_cnt[16],cycle_cnt[6]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b17|reg0_b5  (
    .clk(clk),
    .mi({cnt[20],cnt[8]}),
    .q({cycle_cnt[17],cycle_cnt[5]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b19|reg0_b4  (
    .clk(clk),
    .mi({cnt[22],cnt[7]}),
    .q({cycle_cnt[19],cycle_cnt[4]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(119)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b1|byte_flag_reg  (
    .a({fls_sck,_al_u5_o}),
    .b({n7,cycle_cnt[2]}),
    .c({cycle_cnt[0],phase_cnt[0]}),
    .clk(clk),
    .d({cycle_cnt[1],phase_cnt[1]}),
    .mi({cnt[4],open_n997}),
    .f({_al_u5_o,open_n999}),
    .q({cycle_cnt[1],byte_flag}));  // src/rtl/flash/flash_fast_read.v(119)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b20|reg0_b28  (
    .clk(clk),
    .mi({cnt[23],cnt[31]}),
    .q({cycle_cnt[20],cycle_cnt[28]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b21|reg0_b25  (
    .a({cycle_cnt[21],cycle_cnt[25]}),
    .b({cycle_cnt[22],cycle_cnt[26]}),
    .c({cycle_cnt[23],cycle_cnt[27]}),
    .clk(clk),
    .d({cycle_cnt[24],cycle_cnt[28]}),
    .mi({cnt[24],cnt[28]}),
    .f({_al_u8_o,_al_u7_o}),
    .q({cycle_cnt[21],cycle_cnt[25]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b22|reg0_b27  (
    .clk(clk),
    .mi({cnt[25],cnt[30]}),
    .q({cycle_cnt[22],cycle_cnt[27]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b23|reg0_b26  (
    .clk(clk),
    .mi({cnt[26],cnt[29]}),
    .q({cycle_cnt[23],cycle_cnt[26]}));  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg0_b24 (
    .clk(clk),
    .mi({open_n1120,cnt[27]}),
    .q({open_n1127,cycle_cnt[24]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(71)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*A)"),
    //.LUT1("(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000100000),
    .INIT_LUT1(16'b0000000000000010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b7|reg0_b3  (
    .a({_al_u9_o,cycle_cnt[3]}),
    .b({cycle_cnt[7],cycle_cnt[4]}),
    .c({cycle_cnt[8],cycle_cnt[5]}),
    .clk(clk),
    .d({cycle_cnt[9],cycle_cnt[6]}),
    .mi({cnt[10],cnt[6]}),
    .f({_al_u10_o,_al_u9_o}),
    .q({cycle_cnt[7],cycle_cnt[3]}));  // src/rtl/flash/flash_fast_read.v(71)
  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b25|reg2_b24  (
    .ce(sft_wen),
    .clk(clk),
    .mi({tx_reg[24],1'b0}),
    .sr(start),
    .q(tx_reg[25:24]));  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b26|reg2_b27  (
    .ce(sft_wen),
    .clk(clk),
    .mi({tx_reg[25],tx_reg[26]}),
    .sr(start),
    .q({tx_reg[26],tx_reg[27]}));  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b28|reg2_b29  (
    .ce(sft_wen),
    .clk(clk),
    .mi({tx_reg[27],tx_reg[28]}),
    .sr(start),
    .q({tx_reg[28],tx_reg[29]}));  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(101)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b30|reg2_b31  (
    .ce(sft_wen),
    .clk(clk),
    .mi({tx_reg[29],tx_reg[30]}),
    .sr(start),
    .q({tx_reg[30],tx_reg[31]}));  // src/rtl/flash/flash_fast_read.v(101)
  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b0|reg3_b7  (
    .ce(sft_ren),
    .clk(clk),
    .mi({fls_sdi,rx_reg[6]}),
    .q({rx_reg[0],rx_reg[7]}));  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b1|reg3_b2  (
    .ce(sft_ren),
    .clk(clk),
    .mi({rx_reg[0],rx_reg[1]}),
    .q({rx_reg[1],rx_reg[2]}));  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b3|reg3_b4  (
    .ce(sft_ren),
    .clk(clk),
    .mi({rx_reg[2],rx_reg[3]}),
    .q({rx_reg[3],rx_reg[4]}));  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(132)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b5|reg3_b6  (
    .ce(sft_ren),
    .clk(clk),
    .mi({rx_reg[4],rx_reg[5]}),
    .q({rx_reg[5],rx_reg[6]}));  // src/rtl/flash/flash_fast_read.v(132)
  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b0|reg4_b6  (
    .ce(byte_flag),
    .clk(clk),
    .mi({rx_reg[0],rx_reg[6]}),
    .q({dout[0],dout[6]}));  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b1|reg4_b5  (
    .ce(byte_flag),
    .clk(clk),
    .mi({rx_reg[1],rx_reg[5]}),
    .q({dout[1],dout[5]}));  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b2|reg4_b4  (
    .ce(byte_flag),
    .clk(clk),
    .mi({rx_reg[2],rx_reg[4]}),
    .q({dout[2],dout[4]}));  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(145)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b7|reg4_b3  (
    .ce(byte_flag),
    .clk(clk),
    .mi({rx_reg[7],rx_reg[3]}),
    .q({dout[7],dout[3]}));  // src/rtl/flash/flash_fast_read.v(145)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b10|reg5_b9  (
    .ce(byte_flag),
    .clk(clk),
    .mi(n15[10:9]),
    .sr(start),
    .q(addr[10:9]));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b11|reg5_b8  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[11],n15[8]}),
    .sr(start),
    .q({addr[11],addr[8]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b12|reg5_b7  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[12],n15[7]}),
    .sr(start),
    .q({addr[12],addr[7]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b13|reg5_b6  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[13],n15[6]}),
    .sr(start),
    .q({addr[13],addr[6]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b14|reg5_b5  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[14],n15[5]}),
    .sr(start),
    .q({addr[14],addr[5]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b15|reg5_b4  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[15],n15[4]}),
    .sr(start),
    .q({addr[15],addr[4]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b16|reg5_b3  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[16],n15[3]}),
    .sr(start),
    .q({addr[16],addr[3]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b17|reg5_b23  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[17],n15[23]}),
    .sr(start),
    .q({addr[17],addr[23]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b18|reg5_b22  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[18],n15[22]}),
    .sr(start),
    .q({addr[18],addr[22]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b19|reg5_b21  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[19],n15[21]}),
    .sr(start),
    .q({addr[19],addr[21]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(154)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .REG1_REGSET("SET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg5_b2|reg5_b20  (
    .ce(byte_flag),
    .clk(clk),
    .mi({n15[2],n15[20]}),
    .sr(start),
    .q({addr[2],addr[20]}));  // src/rtl/flash/flash_fast_read.v(154)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b0|reg6_b9  (
    .clk(clk),
    .mi({n0[0],n0[9]}),
    .sr(busy),
    .q({cnt[0],cnt[9]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b10|reg6_b8  (
    .clk(clk),
    .mi({n0[10],n0[8]}),
    .sr(busy),
    .q({cnt[10],cnt[8]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b11|reg6_b7  (
    .clk(clk),
    .mi({n0[11],n0[7]}),
    .sr(busy),
    .q({cnt[11],cnt[7]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b12|reg6_b6  (
    .clk(clk),
    .mi({n0[12],n0[6]}),
    .sr(busy),
    .q({cnt[12],cnt[6]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b13|reg6_b5  (
    .clk(clk),
    .mi({n0[13],n0[5]}),
    .sr(busy),
    .q({cnt[13],cnt[5]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b14|reg6_b4  (
    .clk(clk),
    .mi({n0[14],n0[4]}),
    .sr(busy),
    .q({cnt[14],cnt[4]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b15|reg6_b31  (
    .clk(clk),
    .mi({n0[15],n0[31]}),
    .sr(busy),
    .q({cnt[15],cnt[31]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b16|reg6_b30  (
    .clk(clk),
    .mi({n0[16],n0[30]}),
    .sr(busy),
    .q({cnt[16],cnt[30]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b17|reg6_b3  (
    .clk(clk),
    .mi({n0[17],n0[3]}),
    .sr(busy),
    .q({cnt[17],cnt[3]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b18|reg6_b29  (
    .clk(clk),
    .mi({n0[18],n0[29]}),
    .sr(busy),
    .q({cnt[18],cnt[29]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b19|reg6_b28  (
    .clk(clk),
    .mi({n0[19],n0[28]}),
    .sr(busy),
    .q({cnt[19],cnt[28]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b1|reg6_b27  (
    .clk(clk),
    .mi({n0[1],n0[27]}),
    .sr(busy),
    .q({cnt[1],cnt[27]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b20|reg6_b26  (
    .clk(clk),
    .mi({n0[20],n0[26]}),
    .sr(busy),
    .q({cnt[20],cnt[26]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b21|reg6_b25  (
    .clk(clk),
    .mi({n0[21],n0[25]}),
    .sr(busy),
    .q({cnt[21],cnt[25]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b22|reg6_b24  (
    .clk(clk),
    .mi({n0[22],n0[24]}),
    .sr(busy),
    .q({cnt[22],cnt[24]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(65)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg6_b2|reg6_b23  (
    .clk(clk),
    .mi({n0[2],n0[23]}),
    .sr(busy),
    .q({cnt[2],cnt[23]}));  // src/rtl/flash/flash_fast_read.v(65)
  // src/rtl/flash/flash_fast_read.v(113)
  // src/rtl/flash/flash_fast_read.v(107)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*~A)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(D*C*B*~A)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0100000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \sft_wen_reg|sft_ren_reg  (
    .a({open_n2144,fls_sck}),
    .b({phase_cnt[0],n7}),
    .c(phase_cnt[1:0]),
    .clk(clk),
    .d({fls_sck,phase_cnt[1]}),
    .q({sft_wen,sft_ren}));  // src/rtl/flash/flash_fast_read.v(113)

endmodule 

module \uart_rx(CLK_RATE=24000000)   // src/rtl/uart/uart_rx.v(8)
  (
  clk,
  rx,
  rx_data,
  rx_en
  );

  input clk;  // src/rtl/uart/uart_rx.v(14)
  input rx;  // src/rtl/uart/uart_rx.v(17)
  output [7:0] rx_data;  // src/rtl/uart/uart_rx.v(21)
  output rx_en;  // src/rtl/uart/uart_rx.v(20)

  parameter BAUDRATE = 115200;
  parameter CLK_RATE = 24000000;
  wire [31:0] clk_cnt;  // src/rtl/uart/uart_rx.v(29)
  wire [3:0] cnt;  // src/rtl/uart/uart_rx.v(26)
  wire [7:0] data;  // src/rtl/uart/uart_rx.v(27)
  wire [31:0] n7;
  wire [1:0] rx_d;  // src/rtl/uart/uart_rx.v(28)
  wire _al_u42_o;
  wire _al_u46_o;
  wire _al_u51_o;
  wire _al_u54_o;
  wire _al_u55_o;
  wire _al_u56_o;
  wire _al_u57_o;
  wire _al_u58_o;
  wire _al_u59_o;
  wire _al_u60_o;
  wire _al_u61_o;
  wire _al_u62_o;
  wire _al_u63_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c27 ;
  wire \add0/c3 ;
  wire \add0/c31 ;
  wire \add0/c7 ;
  wire \add1/c1 ;
  wire \add1/c3 ;
  wire clk_en;  // src/rtl/uart/uart_rx.v(25)
  wire mux1_b0_sel_is_1_o;
  wire mux4_b0_sel_is_3_o;
  wire mux4_b1_sel_is_3_o;
  wire mux4_b2_sel_is_3_o;
  wire mux4_b3_sel_is_3_o;
  wire mux4_b4_sel_is_3_o;
  wire mux4_b5_sel_is_3_o;
  wire mux4_b6_sel_is_3_o;
  wire mux4_b7_sel_is_3_o;
  wire n0;
  wire n1;
  wire rx_pad;  // src/rtl/uart/uart_rx.v(17)
  wire start;  // src/rtl/uart/uart_rx.v(24)

  EG_PHY_PAD #(
    //.LOCATION("B15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u28 (
    .ipad(rx),
    .di(rx_pad));  // src/rtl/uart/uart_rx.v(17)
  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u41|reg2_b5  (
    .a({cnt[0],open_n17}),
    .b(cnt[1:0]),
    .c(cnt[2:1]),
    .ce(mux4_b5_sel_is_3_o),
    .clk(clk),
    .d({cnt[3],_al_u46_o}),
    .mi({open_n21,rx_pad}),
    .f({n1,mux4_b5_sel_is_3_o}),
    .q({open_n37,data[5]}));  // src/rtl/uart/uart_rx.v(86)
  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u42|reg2_b3  (
    .b({cnt[2],cnt[0]}),
    .c({cnt[3],cnt[1]}),
    .ce(mux4_b3_sel_is_3_o),
    .clk(clk),
    .d({clk_en,_al_u46_o}),
    .mi({open_n50,rx_pad}),
    .f({_al_u42_o,mux4_b3_sel_is_3_o}),
    .q({open_n55,data[3]}));  // src/rtl/uart/uart_rx.v(86)
  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u46|reg2_b6  (
    .b({cnt[2],cnt[0]}),
    .c({cnt[3],cnt[1]}),
    .ce(mux4_b6_sel_is_3_o),
    .clk(clk),
    .d({clk_en,_al_u46_o}),
    .mi({open_n68,rx_pad}),
    .f({_al_u46_o,mux4_b6_sel_is_3_o}),
    .q({open_n73,data[6]}));  // src/rtl/uart/uart_rx.v(86)
  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u51|reg2_b2  (
    .b({cnt[2],cnt[0]}),
    .c({cnt[3],cnt[1]}),
    .ce(mux4_b2_sel_is_3_o),
    .clk(clk),
    .d({clk_en,_al_u42_o}),
    .mi({open_n86,rx_pad}),
    .f({_al_u51_o,mux4_b2_sel_is_3_o}),
    .q({open_n91,data[2]}));  // src/rtl/uart/uart_rx.v(86)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u58|reg0_b7  (
    .a({_al_u54_o,clk_cnt[6]}),
    .b({_al_u55_o,clk_cnt[7]}),
    .c({_al_u56_o,clk_cnt[8]}),
    .clk(clk),
    .d({_al_u57_o,clk_cnt[9]}),
    .mi({open_n103,n7[7]}),
    .sr(mux1_b0_sel_is_1_o),
    .f({_al_u58_o,_al_u56_o}),
    .q({open_n107,clk_cnt[7]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u63|reg0_b2  (
    .a({_al_u59_o,clk_cnt[2]}),
    .b({_al_u60_o,clk_cnt[20]}),
    .c({_al_u61_o,clk_cnt[21]}),
    .clk(clk),
    .d({_al_u62_o,clk_cnt[22]}),
    .mi({open_n119,n7[2]}),
    .sr(mux1_b0_sel_is_1_o),
    .f({_al_u63_o,_al_u61_o}),
    .q({open_n123,clk_cnt[2]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u68|reg2_b4  (
    .b({_al_u63_o,cnt[0]}),
    .c({start,cnt[1]}),
    .ce(mux4_b4_sel_is_3_o),
    .clk(clk),
    .d({_al_u58_o,_al_u46_o}),
    .mi({open_n129,rx_pad}),
    .f({mux1_b0_sel_is_1_o,mux4_b4_sel_is_3_o}),
    .q({open_n145,data[4]}));  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u11_al_u72  (
    .a({clk_cnt[13],clk_cnt[11]}),
    .b({clk_cnt[14],clk_cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n7[13],n7[11]}),
    .fco(\add0/c15 ),
    .fx({n7[14],n7[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u15_al_u73  (
    .a({clk_cnt[17],clk_cnt[15]}),
    .b({clk_cnt[18],clk_cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n7[17],n7[15]}),
    .fco(\add0/c19 ),
    .fx({n7[18],n7[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u19_al_u74  (
    .a({clk_cnt[21],clk_cnt[19]}),
    .b({clk_cnt[22],clk_cnt[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n7[21],n7[19]}),
    .fco(\add0/c23 ),
    .fx({n7[22],n7[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u23_al_u75  (
    .a({clk_cnt[25],clk_cnt[23]}),
    .b({clk_cnt[26],clk_cnt[24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c23 ),
    .f({n7[25],n7[23]}),
    .fco(\add0/c27 ),
    .fx({n7[26],n7[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u27_al_u76  (
    .a({clk_cnt[29],clk_cnt[27]}),
    .b({clk_cnt[30],clk_cnt[28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c27 ),
    .f({n7[29],n7[27]}),
    .fco(\add0/c31 ),
    .fx({n7[30],n7[28]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u31_al_u77  (
    .a({open_n236,clk_cnt[31]}),
    .c(2'b00),
    .d({open_n241,1'b0}),
    .fci(\add0/c31 ),
    .f({open_n258,n7[31]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u70  (
    .a({clk_cnt[5],clk_cnt[3]}),
    .b({clk_cnt[6],clk_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n7[5],n7[3]}),
    .fco(\add0/c7 ),
    .fx({n7[6],n7[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u71  (
    .a({clk_cnt[9],clk_cnt[7]}),
    .b({clk_cnt[10],clk_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n7[9],n7[7]}),
    .fco(\add0/c11 ),
    .fx({n7[10],n7[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \add0/ucin_al_u69  (
    .a({clk_cnt[1],1'b0}),
    .b({clk_cnt[2],clk_cnt[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n7[1:0]),
    .sr(mux1_b0_sel_is_1_o),
    .f({n7[1],open_n313}),
    .fco(\add0/c3 ),
    .fx({n7[2],n7[0]}),
    .q(clk_cnt[1:0]));
  // src/rtl/uart/uart_rx.v(92)
  // src/rtl/uart/uart_rx.v(61)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \clk_en_reg|rx_en_reg  (
    .c({_al_u63_o,start}),
    .clk(clk),
    .d({_al_u58_o,n1}),
    .q({clk_en,rx_en}));  // src/rtl/uart/uart_rx.v(92)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b30  (
    .a({clk_cnt[0],clk_cnt[30]}),
    .b({clk_cnt[1],clk_cnt[31]}),
    .c({clk_cnt[10],clk_cnt[4]}),
    .clk(clk),
    .d({clk_cnt[11],clk_cnt[5]}),
    .mi({n7[10],n7[30]}),
    .sr(mux1_b0_sel_is_1_o),
    .f({_al_u60_o,_al_u57_o}),
    .q({clk_cnt[10],clk_cnt[30]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b11|reg0_b9  (
    .clk(clk),
    .mi({n7[11],n7[9]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[11],clk_cnt[9]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b12|reg0_b27  (
    .a({clk_cnt[12],clk_cnt[27]}),
    .b({clk_cnt[13],clk_cnt[28]}),
    .c({clk_cnt[14],clk_cnt[29]}),
    .clk(clk),
    .d({clk_cnt[15],clk_cnt[3]}),
    .mi({n7[12],n7[27]}),
    .sr(mux1_b0_sel_is_1_o),
    .f({_al_u59_o,_al_u54_o}),
    .q({clk_cnt[12],clk_cnt[27]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b13|reg0_b8  (
    .clk(clk),
    .mi({n7[13],n7[8]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[13],clk_cnt[8]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b14|reg0_b4  (
    .clk(clk),
    .mi({n7[14],n7[4]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[14],clk_cnt[4]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b15|reg0_b31  (
    .clk(clk),
    .mi({n7[15],n7[31]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[15],clk_cnt[31]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b16|reg0_b23  (
    .a({clk_cnt[16],clk_cnt[23]}),
    .b({clk_cnt[17],clk_cnt[24]}),
    .c({clk_cnt[18],clk_cnt[25]}),
    .clk(clk),
    .d({clk_cnt[19],clk_cnt[26]}),
    .mi({n7[16],n7[23]}),
    .sr(mux1_b0_sel_is_1_o),
    .f({_al_u62_o,_al_u55_o}),
    .q({clk_cnt[16],clk_cnt[23]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b17|reg0_b29  (
    .clk(clk),
    .mi({n7[17],n7[29]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[17],clk_cnt[29]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b18|reg0_b28  (
    .clk(clk),
    .mi({n7[18],n7[28]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[18],clk_cnt[28]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b19|reg0_b26  (
    .clk(clk),
    .mi({n7[19],n7[26]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[19],clk_cnt[26]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b20|reg0_b25  (
    .clk(clk),
    .mi({n7[20],n7[25]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[20],clk_cnt[25]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b21|reg0_b24  (
    .clk(clk),
    .mi({n7[21],n7[24]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({clk_cnt[21],clk_cnt[24]}));  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    reg0_b22 (
    .clk(clk),
    .mi({open_n623,n7[22]}),
    .sr(mux1_b0_sel_is_1_o),
    .q({open_n640,clk_cnt[22]}));  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b3|reg0_b6  (
    .b({_al_u63_o,_al_u63_o}),
    .c({n7[3],n7[6]}),
    .clk(clk),
    .d({_al_u58_o,_al_u58_o}),
    .sr(start),
    .q({clk_cnt[3],clk_cnt[6]}));  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    reg0_b5 (
    .b({open_n667,_al_u63_o}),
    .c({open_n668,n7[5]}),
    .clk(clk),
    .d({open_n670,_al_u58_o}),
    .sr(start),
    .q({open_n688,clk_cnt[5]}));  // src/rtl/uart/uart_rx.v(55)
  EG_PHY_MSLICE #(
    //.MACRO("reg1_b0|add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg1_b0|add1/ucin  (
    .a({cnt[0],1'b0}),
    .b({1'b1,open_n689}),
    .ce(clk_en),
    .clk(clk),
    .sr(start),
    .fco(\add1/c1 ),
    .q({cnt[0],open_n710}));
  EG_PHY_MSLICE #(
    //.MACRO("reg1_b0|add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg1_b1  (
    .a(cnt[2:1]),
    .b(2'b00),
    .ce(clk_en),
    .clk(clk),
    .fci(\add1/c1 ),
    .sr(start),
    .fco(\add1/c3 ),
    .q(cnt[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("reg1_b0|add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    reg1_b3_al_u78 (
    .a({open_n730,cnt[3]}),
    .b({open_n731,1'b0}),
    .ce(clk_en),
    .clk(clk),
    .fci(\add1/c3 ),
    .sr(start),
    .q({open_n752,cnt[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg2_b0 (
    .b({open_n755,cnt[0]}),
    .c({open_n756,cnt[1]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({open_n757,_al_u42_o}),
    .mi({open_n761,rx_pad}),
    .f({open_n774,mux4_b0_sel_is_3_o}),
    .q({open_n778,data[0]}));  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg2_b1 (
    .b({open_n781,cnt[0]}),
    .c({open_n782,cnt[1]}),
    .ce(mux4_b1_sel_is_3_o),
    .clk(clk),
    .d({open_n783,_al_u42_o}),
    .mi({open_n787,rx_pad}),
    .f({open_n800,mux4_b1_sel_is_3_o}),
    .q({open_n804,data[1]}));  // src/rtl/uart/uart_rx.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg2_b7 (
    .b({open_n807,cnt[0]}),
    .c({open_n808,cnt[1]}),
    .ce(mux4_b7_sel_is_3_o),
    .clk(clk),
    .d({open_n809,_al_u51_o}),
    .mi({open_n820,rx_pad}),
    .f({open_n822,mux4_b7_sel_is_3_o}),
    .q({open_n826,data[7]}));  // src/rtl/uart/uart_rx.v(86)
  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b0|reg3_b7  (
    .ce(n1),
    .clk(clk),
    .mi({data[0],data[7]}),
    .q({rx_data[0],rx_data[7]}));  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b1|reg3_b6  (
    .ce(n1),
    .clk(clk),
    .mi({data[1],data[6]}),
    .q({rx_data[1],rx_data[6]}));  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b2|reg3_b5  (
    .ce(n1),
    .clk(clk),
    .mi({data[2],data[5]}),
    .q({rx_data[2],rx_data[5]}));  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  // src/rtl/uart/uart_rx.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b3|reg3_b4  (
    .ce(n1),
    .clk(clk),
    .mi({data[3],data[4]}),
    .q({rx_data[3],rx_data[4]}));  // src/rtl/uart/uart_rx.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTG0("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg4_b0 (
    .c({open_n935,rx_d[1]}),
    .clk(clk),
    .d({open_n937,rx_d[0]}),
    .mi({open_n941,rx_pad}),
    .f({open_n954,n0}),
    .q({open_n958,rx_d[0]}));  // src/rtl/uart/uart_rx.v(35)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg4_b1 (
    .clk(clk),
    .mi({open_n971,rx_d[0]}),
    .q({open_n989,rx_d[1]}));  // src/rtl/uart/uart_rx.v(35)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    start_reg (
    .ce(n1),
    .clk(clk),
    .mi({open_n1008,1'b0}),
    .sr(n0),
    .q({open_n1014,start}));  // src/rtl/uart/uart_rx.v(44)

endmodule 

module ubus  // src/rtl/uart/ubus.v(8)
  (
  busy,
  clk,
  fls_read,
  id,
  ubus_raddr,
  ubus_ren,
  ubus_waddr,
  ubus_wdata,
  ubus_wen,
  fls_addr,
  fls_write,
  led,
  mod_sel,
  sm_bit1,
  sm_bit2,
  sm_bit3,
  sm_bit4,
  start,
  ubus_bken,
  ubus_rdata
  );

  input busy;  // src/rtl/uart/ubus.v(41)
  input clk;  // src/rtl/uart/ubus.v(10)
  input [7:0] fls_read;  // src/rtl/uart/ubus.v(39)
  input [15:0] id;  // src/rtl/uart/ubus.v(40)
  input [31:0] ubus_raddr;  // src/rtl/uart/ubus.v(19)
  input ubus_ren;  // src/rtl/uart/ubus.v(18)
  input [31:0] ubus_waddr;  // src/rtl/uart/ubus.v(14)
  input [31:0] ubus_wdata;  // src/rtl/uart/ubus.v(15)
  input ubus_wen;  // src/rtl/uart/ubus.v(13)
  output [23:0] fls_addr;  // src/rtl/uart/ubus.v(37)
  output [7:0] fls_write;  // src/rtl/uart/ubus.v(38)
  output [15:0] led;  // src/rtl/uart/ubus.v(26)
  output [2:0] mod_sel;  // src/rtl/uart/ubus.v(36)
  output [3:0] sm_bit1;  // src/rtl/uart/ubus.v(29)
  output [3:0] sm_bit2;  // src/rtl/uart/ubus.v(30)
  output [3:0] sm_bit3;  // src/rtl/uart/ubus.v(31)
  output [3:0] sm_bit4;  // src/rtl/uart/ubus.v(32)
  output start;  // src/rtl/uart/ubus.v(35)
  output ubus_bken;  // src/rtl/uart/ubus.v(20)
  output [31:0] ubus_rdata;  // src/rtl/uart/ubus.v(21)

  wire [15:0] led_pad;  // src/rtl/uart/ubus.v(26)
  wire  \sel8_b1/B2 ;
  wire  \sel8_b2/B4 ;
  wire  \sel8_b3/B2 ;
  wire  \sel8_b4/B4 ;
  wire  \sel8_b5/B2 ;
  wire  \sel8_b6/B2 ;
  wire  \sel8_b7/B4 ;
  wire _al_u101_o;
  wire _al_u103_o;
  wire _al_u105_o;
  wire _al_u107_o;
  wire _al_u109_o;
  wire _al_u112_o;
  wire _al_u114_o;
  wire _al_u115_o;
  wire _al_u23_o;
  wire _al_u24_o;
  wire _al_u25_o;
  wire _al_u26_o;
  wire _al_u27_o;
  wire _al_u28_o;
  wire _al_u29_o;
  wire _al_u30_o;
  wire _al_u31_o;
  wire _al_u32_o;
  wire _al_u34_o;
  wire _al_u35_o;
  wire _al_u37_o;
  wire _al_u38_o;
  wire _al_u43_o;
  wire _al_u44_o;
  wire _al_u45_o;
  wire _al_u46_o;
  wire _al_u47_o;
  wire _al_u48_o;
  wire _al_u49_o;
  wire _al_u50_o;
  wire _al_u51_o;
  wire _al_u52_o;
  wire _al_u54_o;
  wire _al_u56_o;
  wire _al_u58_o;
  wire _al_u61_o;
  wire _al_u63_o;
  wire _al_u66_o;
  wire _al_u69_o;
  wire _al_u72_o;
  wire _al_u75_o;
  wire _al_u80_o;
  wire _al_u93_o;
  wire _al_u99_o;
  wire mux0_b0_sel_is_3_o;
  wire mux1_b0_sel_is_3_o;
  wire mux5_b0_sel_is_3_o;
  wire mux6_b0_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire n3;
  wire n35_lutinv;
  wire n36_lutinv;
  wire n37_lutinv;
  wire n38_lutinv;
  wire n39_lutinv;

  EG_PHY_PAD #(
    //.LOCATION("T13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u1 (
    .do({open_n1,open_n2,open_n3,led_pad[15]}),
    .opad(led[15]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("N5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u10 (
    .do({open_n18,open_n19,open_n20,led_pad[6]}),
    .opad(led[6]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*D))"),
    //.LUTF1("(~(C*B)*~(~D*A))"),
    //.LUTG0("~(B*~(C*D))"),
    //.LUTG1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001100110011),
    .INIT_LUTF1(16'b0011111100010101),
    .INIT_LUTG0(16'b1111001100110011),
    .INIT_LUTG1(16'b0011111100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u101|reg7_b14  (
    .a({n35_lutinv,open_n34}),
    .b({n37_lutinv,_al_u101_o}),
    .c({id[14],ubus_rdata[14]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[14],n39_lutinv}),
    .f({_al_u101_o,open_n52}),
    .q({open_n56,ubus_rdata[14]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*D))"),
    //.LUTF1("(~(C*B)*~(~D*A))"),
    //.LUTG0("~(B*~(C*D))"),
    //.LUTG1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001100110011),
    .INIT_LUTF1(16'b0011111100010101),
    .INIT_LUTG0(16'b1111001100110011),
    .INIT_LUTG1(16'b0011111100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u103|reg7_b13  (
    .a({n35_lutinv,open_n57}),
    .b({n37_lutinv,_al_u103_o}),
    .c({id[13],ubus_rdata[13]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[13],n39_lutinv}),
    .f({_al_u103_o,open_n75}),
    .q({open_n79,ubus_rdata[13]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0011111100010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u105|reg7_b12  (
    .a({n35_lutinv,open_n80}),
    .b({n37_lutinv,_al_u105_o}),
    .c({id[12],ubus_rdata[12]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[12],n39_lutinv}),
    .f({_al_u105_o,open_n94}),
    .q({open_n98,ubus_rdata[12]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0011111100010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u107|reg7_b11  (
    .a({n35_lutinv,open_n99}),
    .b({n37_lutinv,_al_u107_o}),
    .c({id[11],ubus_rdata[11]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[11],n39_lutinv}),
    .f({_al_u107_o,open_n113}),
    .q({open_n117,ubus_rdata[11]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*D))"),
    //.LUTF1("(~(C*B)*~(~D*A))"),
    //.LUTG0("~(B*~(C*D))"),
    //.LUTG1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001100110011),
    .INIT_LUTF1(16'b0011111100010101),
    .INIT_LUTG0(16'b1111001100110011),
    .INIT_LUTG1(16'b0011111100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u109|reg7_b10  (
    .a({n35_lutinv,open_n118}),
    .b({n37_lutinv,_al_u109_o}),
    .c({id[10],ubus_rdata[10]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[10],n39_lutinv}),
    .f({_al_u109_o,open_n136}),
    .q({open_n140,ubus_rdata[10]}));  // src/rtl/uart/ubus.v(80)
  EG_PHY_PAD #(
    //.LOCATION("P4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u11 (
    .do({open_n142,open_n143,open_n144,led_pad[5]}),
    .opad(led[5]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~B*~(D*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111111001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u111|reg7_b1  (
    .a({open_n158,n39_lutinv}),
    .b({open_n159,\sel8_b1/B2 }),
    .c({id[1],_al_u112_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n37_lutinv,ubus_rdata[1]}),
    .f({\sel8_b1/B2 ,open_n173}),
    .q({open_n177,ubus_rdata[1]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~(~D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0101111100010011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u112|reg8_b1  (
    .a({n36_lutinv,open_n178}),
    .b({n35_lutinv,open_n179}),
    .c({fls_read[1],open_n180}),
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({led_pad[1],ubus_wdata[1]}),
    .f({_al_u112_o,open_n194}),
    .q({open_n198,led_pad[1]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*B*~(D*A))"),
    //.LUTF1("(~(C*B)*~(~D*A))"),
    //.LUTG0("~(C*B*~(D*A))"),
    //.LUTG1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1011111100111111),
    .INIT_LUTF1(16'b0011111100010101),
    .INIT_LUTG0(16'b1011111100111111),
    .INIT_LUTG1(16'b0011111100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u114|reg7_b0  (
    .a({n35_lutinv,n39_lutinv}),
    .b({n37_lutinv,_al_u114_o}),
    .c({id[0],_al_u115_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[0],ubus_rdata[0]}),
    .f({_al_u114_o,open_n216}),
    .q({open_n220,ubus_rdata[0]}));  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~(C*B)*~(D*A))"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~(C*B)*~(D*A))"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0001010100111111),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0001010100111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u115|_al_u60  (
    .a({n36_lutinv,n36_lutinv}),
    .b({n38_lutinv,n35_lutinv}),
    .c({busy,n37_lutinv}),
    .d({fls_read[0],n38_lutinv}),
    .f({_al_u115_o,n39_lutinv}));
  EG_PHY_PAD #(
    //.LOCATION("M5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u12 (
    .do({open_n246,open_n247,open_n248,led_pad[4]}),
    .opad(led[4]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("N4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u13 (
    .do({open_n263,open_n264,open_n265,led_pad[3]}),
    .opad(led[3]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("N3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u14 (
    .do({open_n280,open_n281,open_n282,led_pad[2]}),
    .opad(led[2]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("M4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u15 (
    .do({open_n297,open_n298,open_n299,led_pad[1]}),
    .opad(led[1]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n314,open_n315,open_n316,led_pad[0]}),
    .opad(led[0]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_PAD #(
    //.LOCATION("T12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u2 (
    .do({open_n331,open_n332,open_n333,led_pad[14]}),
    .opad(led[14]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u23|_al_u24  (
    .a({ubus_waddr[27],ubus_waddr[31]}),
    .b({ubus_waddr[26],ubus_waddr[30]}),
    .c({ubus_waddr[25],ubus_waddr[29]}),
    .d({ubus_waddr[24],ubus_waddr[28]}),
    .f({_al_u23_o,_al_u24_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u25|_al_u26  (
    .a({ubus_waddr[19],ubus_waddr[23]}),
    .b({ubus_waddr[18],ubus_waddr[22]}),
    .c({ubus_waddr[17],ubus_waddr[21]}),
    .d({ubus_waddr[16],ubus_waddr[20]}),
    .f({_al_u25_o,_al_u26_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u27|_al_u31  (
    .a({_al_u23_o,ubus_waddr[7]}),
    .b({_al_u24_o,ubus_waddr[6]}),
    .c({_al_u25_o,ubus_waddr[5]}),
    .d({_al_u26_o,ubus_waddr[4]}),
    .f({_al_u27_o,_al_u31_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u28|_al_u29  (
    .a({ubus_waddr[11],ubus_waddr[15]}),
    .b({ubus_waddr[10],ubus_waddr[14]}),
    .c({ubus_waddr[9],ubus_waddr[13]}),
    .d({ubus_waddr[8],ubus_waddr[12]}),
    .f({_al_u28_o,_al_u29_o}));
  EG_PHY_PAD #(
    //.LOCATION("R12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u3 (
    .do({open_n436,open_n437,open_n438,led_pad[13]}),
    .opad(led[13]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u30|_al_u38  (
    .b({open_n454,_al_u30_o}),
    .c({_al_u29_o,_al_u37_o}),
    .d({_al_u28_o,_al_u27_o}),
    .f({_al_u30_o,_al_u38_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~D*C*~B*~A)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000000000010000),
    .MODE("LOGIC"))
    \_al_u32|_al_u42  (
    .a({ubus_waddr[3],open_n475}),
    .b(ubus_waddr[2:1]),
    .c(ubus_waddr[1:0]),
    .d({ubus_waddr[0],_al_u35_o}),
    .f({_al_u32_o,mux1_b0_sel_is_3_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~B*A)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(D*C*~B*A)"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b0010000000000000),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0010000000000000),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u34|_al_u37  (
    .a({_al_u31_o,_al_u31_o}),
    .b({ubus_waddr[3],ubus_waddr[3]}),
    .c({ubus_waddr[2],ubus_waddr[2]}),
    .d({ubus_wen,ubus_wen}),
    .f({_al_u34_o,_al_u37_o}));
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u35|start_reg  (
    .a({open_n520,_al_u27_o}),
    .b({_al_u30_o,_al_u30_o}),
    .c({_al_u34_o,_al_u31_o}),
    .ce(n3),
    .clk(clk),
    .d({_al_u27_o,_al_u32_o}),
    .mi({open_n531,ubus_wdata[0]}),
    .sr(ubus_wen),
    .f({_al_u35_o,n3}),
    .q({open_n535,start}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u36|reg4_b0  (
    .b({ubus_waddr[1],ubus_waddr[1]}),
    .c({ubus_waddr[0],ubus_waddr[0]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u35_o,_al_u35_o}),
    .mi({open_n548,ubus_wdata[0]}),
    .f({mux0_b0_sel_is_3_o,mux5_b0_sel_is_3_o}),
    .q({open_n553,mod_sel[0]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u39|reg6_b0  (
    .b({ubus_waddr[1],ubus_waddr[1]}),
    .c({ubus_waddr[0],ubus_waddr[0]}),
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u38_o,_al_u38_o}),
    .mi({open_n559,ubus_wdata[0]}),
    .f({mux6_b0_sel_is_3_o,mux7_b0_sel_is_3_o}),
    .q({open_n575,fls_write[0]}));  // src/rtl/uart/ubus.v(64)
  EG_PHY_PAD #(
    //.LOCATION("M7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u4 (
    .do({open_n577,open_n578,open_n579,led_pad[12]}),
    .opad(led[12]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u43|_al_u47  (
    .a({ubus_raddr[27],_al_u43_o}),
    .b({ubus_raddr[26],_al_u44_o}),
    .c({ubus_raddr[25],_al_u45_o}),
    .d({ubus_raddr[24],_al_u46_o}),
    .f({_al_u43_o,_al_u47_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u44|_al_u45  (
    .a({ubus_raddr[31],ubus_raddr[19]}),
    .b({ubus_raddr[30],ubus_raddr[18]}),
    .c({ubus_raddr[29],ubus_raddr[17]}),
    .d({ubus_raddr[28],ubus_raddr[16]}),
    .f({_al_u44_o,_al_u45_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u46|_al_u48  (
    .a({ubus_raddr[23],ubus_raddr[11]}),
    .b({ubus_raddr[22],ubus_raddr[10]}),
    .c({ubus_raddr[21],ubus_raddr[9]}),
    .d({ubus_raddr[20],ubus_raddr[8]}),
    .f({_al_u46_o,_al_u48_o}));
  EG_PHY_PAD #(
    //.LOCATION("T9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u5 (
    .do({open_n662,open_n663,open_n664,led_pad[11]}),
    .opad(led[11]));  // src/rtl/uart/ubus.v(26)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u50|_al_u49  (
    .a({open_n678,ubus_raddr[15]}),
    .b({open_n679,ubus_raddr[14]}),
    .c({_al_u49_o,ubus_raddr[13]}),
    .d({_al_u48_o,ubus_raddr[12]}),
    .f({_al_u50_o,_al_u49_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D*B)*~(C*A))"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~(D*B)*~(C*A))"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0001001101011111),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0001001101011111),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u51|_al_u75  (
    .a({ubus_raddr[7],n36_lutinv}),
    .b({ubus_raddr[6],n37_lutinv}),
    .c({ubus_raddr[5],fls_read[4]}),
    .d({ubus_raddr[4],id[4]}),
    .f({_al_u51_o,_al_u75_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(~D*C*B*~A)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000001000000),
    .MODE("LOGIC"))
    \_al_u52|_al_u58  (
    .a({ubus_raddr[3],ubus_raddr[3]}),
    .b({ubus_raddr[2],ubus_raddr[2]}),
    .c({ubus_raddr[1],ubus_raddr[1]}),
    .d({ubus_raddr[0],ubus_raddr[0]}),
    .f({_al_u52_o,_al_u58_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u53|_al_u55  (
    .a({_al_u47_o,_al_u47_o}),
    .b({_al_u50_o,_al_u50_o}),
    .c({_al_u51_o,_al_u51_o}),
    .d({_al_u52_o,_al_u54_o}),
    .f({n36_lutinv,n35_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*~A)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b0100000000000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u54|_al_u56  (
    .a({ubus_raddr[3],ubus_raddr[3]}),
    .b({ubus_raddr[2],ubus_raddr[2]}),
    .c({ubus_raddr[1],ubus_raddr[1]}),
    .d({ubus_raddr[0],ubus_raddr[0]}),
    .f({_al_u54_o,_al_u56_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u59|_al_u57  (
    .a({_al_u47_o,_al_u47_o}),
    .b({_al_u50_o,_al_u50_o}),
    .c({_al_u51_o,_al_u51_o}),
    .d({_al_u58_o,_al_u56_o}),
    .f({n38_lutinv,n37_lutinv}));
  EG_PHY_PAD #(
    //.LOCATION("T8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u6 (
    .do({open_n813,open_n814,open_n815,led_pad[10]}),
    .opad(led[10]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*D))"),
    //.LUTF1("(~(C*B)*~(~D*A))"),
    //.LUTG0("~(B*~(C*D))"),
    //.LUTG1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001100110011),
    .INIT_LUTF1(16'b0011111100010101),
    .INIT_LUTG0(16'b1111001100110011),
    .INIT_LUTG1(16'b0011111100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u61|reg7_b9  (
    .a({n35_lutinv,open_n829}),
    .b({n37_lutinv,_al_u61_o}),
    .c({id[9],ubus_rdata[9]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[9],n39_lutinv}),
    .f({_al_u61_o,open_n847}),
    .q({open_n851,ubus_rdata[9]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0011111100010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u63|reg7_b8  (
    .a({n35_lutinv,open_n852}),
    .b({n37_lutinv,_al_u63_o}),
    .c({id[8],ubus_rdata[8]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[8],n39_lutinv}),
    .f({_al_u63_o,open_n866}),
    .q({open_n870,ubus_rdata[8]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~B*~(D*A))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(C*~B*~(D*A))"),
    //.LUTG1("(~C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1110111111001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u65|reg7_b7  (
    .a({open_n871,n39_lutinv}),
    .b({open_n872,\sel8_b7/B4 }),
    .c({led_pad[7],_al_u66_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n35_lutinv,ubus_rdata[7]}),
    .f({\sel8_b7/B4 ,open_n890}),
    .q({open_n894,ubus_rdata[7]}));  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D*B)*~(C*A))"),
    //.LUTF1("(~(D*B)*~(C*A))"),
    //.LUTG0("(~(D*B)*~(C*A))"),
    //.LUTG1("(~(D*B)*~(C*A))"),
    .INIT_LUTF0(16'b0001001101011111),
    .INIT_LUTF1(16'b0001001101011111),
    .INIT_LUTG0(16'b0001001101011111),
    .INIT_LUTG1(16'b0001001101011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u66|_al_u93  (
    .a({n36_lutinv,n36_lutinv}),
    .b({n37_lutinv,n37_lutinv}),
    .c({fls_read[7],fls_read[2]}),
    .d({id[7],id[2]}),
    .f({_al_u66_o,_al_u93_o}));
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~B*~(D*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111111001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u68|reg7_b6  (
    .a({open_n919,n39_lutinv}),
    .b({open_n920,\sel8_b6/B2 }),
    .c({id[6],_al_u69_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n37_lutinv,ubus_rdata[6]}),
    .f({\sel8_b6/B2 ,open_n934}),
    .q({open_n938,ubus_rdata[6]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~(~D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0101111100010011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u69|reg8_b6  (
    .a({n36_lutinv,open_n939}),
    .b({n35_lutinv,open_n940}),
    .c({fls_read[6],open_n941}),
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({led_pad[6],ubus_wdata[6]}),
    .f({_al_u69_o,open_n955}),
    .q({open_n959,led_pad[6]}));  // src/rtl/uart/ubus.v(64)
  EG_PHY_PAD #(
    //.LOCATION("T7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u7 (
    .do({open_n961,open_n962,open_n963,led_pad[9]}),
    .opad(led[9]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~B*~(D*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111111001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u71|reg7_b5  (
    .a({open_n977,n39_lutinv}),
    .b({open_n978,\sel8_b5/B2 }),
    .c({id[5],_al_u72_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n37_lutinv,ubus_rdata[5]}),
    .f({\sel8_b5/B2 ,open_n992}),
    .q({open_n996,ubus_rdata[5]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~(~D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0101111100010011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u72|reg8_b5  (
    .a({n36_lutinv,open_n997}),
    .b({n35_lutinv,open_n998}),
    .c({fls_read[5],open_n999}),
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({led_pad[5],ubus_wdata[5]}),
    .f({_al_u72_o,open_n1013}),
    .q({open_n1017,led_pad[5]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~B*~(D*A))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(C*~B*~(D*A))"),
    //.LUTG1("(~C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1110111111001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u74|reg7_b4  (
    .a({open_n1018,n39_lutinv}),
    .b({open_n1019,\sel8_b4/B4 }),
    .c({led_pad[4],_al_u75_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n35_lutinv,ubus_rdata[4]}),
    .f({\sel8_b4/B4 ,open_n1037}),
    .q({open_n1041,ubus_rdata[4]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~B*~(D*A))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("~(C*~B*~(D*A))"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1110111111001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u79|reg7_b3  (
    .a({open_n1042,n39_lutinv}),
    .b({open_n1043,\sel8_b3/B2 }),
    .c({id[3],_al_u80_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n37_lutinv,ubus_rdata[3]}),
    .f({\sel8_b3/B2 ,open_n1061}),
    .q({open_n1065,ubus_rdata[3]}));  // src/rtl/uart/ubus.v(80)
  EG_PHY_PAD #(
    //.LOCATION("R7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u8 (
    .do({open_n1067,open_n1068,open_n1069,led_pad[8]}),
    .opad(led[8]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~(~D*B)*~(C*A))"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~(~D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0101111100010011),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0101111100010011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u80|reg8_b3  (
    .a({n36_lutinv,open_n1083}),
    .b({n35_lutinv,open_n1084}),
    .c({fls_read[3],open_n1085}),
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({led_pad[3],ubus_wdata[3]}),
    .f({_al_u80_o,open_n1103}),
    .q({open_n1107,led_pad[3]}));  // src/rtl/uart/ubus.v(64)
  EG_PHY_PAD #(
    //.LOCATION("P5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u9 (
    .do({open_n1109,open_n1110,open_n1111,led_pad[7]}),
    .opad(led[7]));  // src/rtl/uart/ubus.v(26)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(C*~B*~(D*A))"),
    //.LUT1("(~C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111111001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u92|reg7_b2  (
    .a({open_n1125,n39_lutinv}),
    .b({open_n1126,\sel8_b2/B4 }),
    .c({led_pad[2],_al_u93_o}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n35_lutinv,ubus_rdata[2]}),
    .f({\sel8_b2/B4 ,open_n1140}),
    .q({open_n1144,ubus_rdata[2]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~(C*B)*~(~D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0011111100010101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u99|reg7_b15  (
    .a({n35_lutinv,open_n1145}),
    .b({n37_lutinv,_al_u99_o}),
    .c({id[15],ubus_rdata[15]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({led_pad[15],n39_lutinv}),
    .f({_al_u99_o,open_n1159}),
    .q({open_n1163,ubus_rdata[15]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b1|reg0_b0  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi(ubus_wdata[1:0]),
    .q(sm_bit1[1:0]));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b3|reg0_b2  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi(ubus_wdata[3:2]),
    .q(sm_bit1[3:2]));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg1_b0|reg1_b3  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[4],ubus_wdata[7]}),
    .q({sm_bit2[0],sm_bit2[3]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg1_b1|reg1_b2  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[5],ubus_wdata[6]}),
    .q({sm_bit2[1],sm_bit2[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b0|reg3_b3  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[8],ubus_wdata[15]}),
    .q({sm_bit3[0],sm_bit4[3]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b1|reg3_b2  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[9],ubus_wdata[14]}),
    .q({sm_bit3[1],sm_bit4[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b2|reg3_b1  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[10],ubus_wdata[13]}),
    .q({sm_bit3[2],sm_bit4[1]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b3|reg3_b0  (
    .ce(mux1_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[11],ubus_wdata[12]}),
    .q({sm_bit3[3],sm_bit4[0]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b1|reg4_b2  (
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[1],ubus_wdata[2]}),
    .q({mod_sel[1],mod_sel[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b10|reg5_b0  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[10],ubus_wdata[0]}),
    .q({fls_addr[10],fls_addr[0]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b11|reg5_b2  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[11],ubus_wdata[2]}),
    .q({fls_addr[11],fls_addr[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b12|reg5_b1  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[12],ubus_wdata[1]}),
    .q({fls_addr[12],fls_addr[1]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b13|reg5_b7  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[13],ubus_wdata[7]}),
    .q({fls_addr[13],fls_addr[7]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b14|reg5_b6  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[14],ubus_wdata[6]}),
    .q({fls_addr[14],fls_addr[6]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b15|reg5_b5  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[15],ubus_wdata[5]}),
    .q({fls_addr[15],fls_addr[5]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b16|reg5_b4  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[16],ubus_wdata[4]}),
    .q({fls_addr[16],fls_addr[4]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b17|reg5_b3  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[17],ubus_wdata[3]}),
    .q({fls_addr[17],fls_addr[3]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b18|reg5_b9  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[18],ubus_wdata[9]}),
    .q({fls_addr[18],fls_addr[9]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b19|reg5_b8  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[19],ubus_wdata[8]}),
    .q({fls_addr[19],fls_addr[8]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b20|reg5_b23  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[20],ubus_wdata[23]}),
    .q({fls_addr[20],fls_addr[23]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg5_b21|reg5_b22  (
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[21],ubus_wdata[22]}),
    .q({fls_addr[21],fls_addr[22]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg6_b1|reg6_b2  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[1],ubus_wdata[2]}),
    .q({fls_write[1],fls_write[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg6_b3|reg6_b7  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[3],ubus_wdata[7]}),
    .q({fls_write[3],fls_write[7]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg6_b4|reg6_b6  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({ubus_wdata[4],ubus_wdata[6]}),
    .q({fls_write[4],fls_write[6]}));  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg6_b5 (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({open_n1810,ubus_wdata[5]}),
    .q({open_n1817,fls_write[5]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*D))"),
    //.LUTF1("~(~B*~(C*D))"),
    //.LUTG0("~(~B*~(C*D))"),
    //.LUTG1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b1111110011001100),
    .INIT_LUTG0(16'b1111110011001100),
    .INIT_LUTG1(16'b1111110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b16|reg7_b31  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[16],ubus_rdata[31]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[16],ubus_rdata[31]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*D))"),
    //.LUT1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110011001100),
    .INIT_LUT1(16'b1111110011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b17|reg7_b30  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[17],ubus_rdata[30]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[17],ubus_rdata[30]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*D))"),
    //.LUT1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110011001100),
    .INIT_LUT1(16'b1111110011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b18|reg7_b29  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[18],ubus_rdata[29]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[18],ubus_rdata[29]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*D))"),
    //.LUTF1("~(~B*~(C*D))"),
    //.LUTG0("~(~B*~(C*D))"),
    //.LUTG1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b1111110011001100),
    .INIT_LUTG0(16'b1111110011001100),
    .INIT_LUTG1(16'b1111110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b19|reg7_b28  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[19],ubus_rdata[28]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[19],ubus_rdata[28]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*D))"),
    //.LUTF1("~(~B*~(C*D))"),
    //.LUTG0("~(~B*~(C*D))"),
    //.LUTG1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b1111110011001100),
    .INIT_LUTG0(16'b1111110011001100),
    .INIT_LUTG1(16'b1111110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b20|reg7_b27  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[20],ubus_rdata[27]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[20],ubus_rdata[27]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*D))"),
    //.LUT1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110011001100),
    .INIT_LUT1(16'b1111110011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b21|reg7_b26  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[21],ubus_rdata[26]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[21],ubus_rdata[26]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*D))"),
    //.LUT1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110011001100),
    .INIT_LUT1(16'b1111110011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b22|reg7_b25  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[22],ubus_rdata[25]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[22],ubus_rdata[25]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(80)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*D))"),
    //.LUTF1("~(~B*~(C*D))"),
    //.LUTG0("~(~B*~(C*D))"),
    //.LUTG1("~(~B*~(C*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b1111110011001100),
    .INIT_LUTG0(16'b1111110011001100),
    .INIT_LUTG1(16'b1111110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b23|reg7_b24  (
    .b({n35_lutinv,n35_lutinv}),
    .c({ubus_rdata[23],ubus_rdata[24]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({n39_lutinv,n39_lutinv}),
    .q({ubus_rdata[23],ubus_rdata[24]}));  // src/rtl/uart/ubus.v(80)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b10|reg8_b0  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[10],ubus_wdata[0]}),
    .q({led_pad[10],led_pad[0]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b11|reg8_b2  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[11],ubus_wdata[2]}),
    .q({led_pad[11],led_pad[2]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b12|reg8_b7  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[12],ubus_wdata[7]}),
    .q({led_pad[12],led_pad[7]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b13|reg8_b4  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[13],ubus_wdata[4]}),
    .q({led_pad[13],led_pad[4]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b14|reg8_b9  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[14],ubus_wdata[9]}),
    .q({led_pad[14],led_pad[9]}));  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  // src/rtl/uart/ubus.v(64)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg8_b15|reg8_b8  (
    .ce(mux0_b0_sel_is_3_o),
    .clk(clk),
    .d({ubus_wdata[15],ubus_wdata[8]}),
    .q({led_pad[15],led_pad[8]}));  // src/rtl/uart/ubus.v(64)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    ubus_bken_reg (
    .clk(clk),
    .mi({open_n2173,ubus_ren}),
    .q({open_n2180,ubus_bken}));  // src/rtl/uart/ubus.v(86)

endmodule 

module uprotocol  // src/rtl/uart/uprotocol.v(13)
  (
  clk,
  rx_data,
  rx_en,
  tx_ready,
  ubus_bken,
  ubus_rdata,
  tx_data,
  tx_en,
  ubus_raddr,
  ubus_ren,
  ubus_waddr,
  ubus_wdata,
  ubus_wen
  );

  input clk;  // src/rtl/uart/uprotocol.v(18)
  input [7:0] rx_data;  // src/rtl/uart/uprotocol.v(22)
  input rx_en;  // src/rtl/uart/uprotocol.v(21)
  input tx_ready;  // src/rtl/uart/uprotocol.v(27)
  input ubus_bken;  // src/rtl/uart/uprotocol.v(37)
  input [31:0] ubus_rdata;  // src/rtl/uart/uprotocol.v(38)
  output [7:0] tx_data;  // src/rtl/uart/uprotocol.v(26)
  output tx_en;  // src/rtl/uart/uprotocol.v(25)
  output [31:0] ubus_raddr;  // src/rtl/uart/uprotocol.v(36)
  output ubus_ren;  // src/rtl/uart/uprotocol.v(35)
  output [31:0] ubus_waddr;  // src/rtl/uart/uprotocol.v(31)
  output [31:0] ubus_wdata;  // src/rtl/uart/uprotocol.v(32)
  output ubus_wen;  // src/rtl/uart/uprotocol.v(30)

  parameter CLK_RATE = 50000000;
  // localparam HEAD_0 = "A";
  // localparam HEAD_1 = "B";
  // localparam HEAD_2 = "C";
  // localparam HEAD_3 = "D";
  // localparam HEAD_4 = "E";
  // localparam HEAD_5 = "F";
  wire [31:0] auto_rst_cnt;  // src/rtl/uart/uprotocol.v(51)
  wire [31:0] n4;
  wire [2:0] recv_cnt;  // src/rtl/uart/uprotocol.v(77)
  wire [7:0] reg0_al_b0;  // src/rtl/uart/uprotocol.v(52)
  wire [7:0] reg1_al_b1;  // src/rtl/uart/uprotocol.v(53)
  wire [7:0] reg2_al_b2;  // src/rtl/uart/uprotocol.v(54)
  wire [7:0] reg3_al_b3;  // src/rtl/uart/uprotocol.v(55)
  wire [7:0] reg4_al_b4;  // src/rtl/uart/uprotocol.v(56)
  wire [7:0] reg5_al_b5;  // src/rtl/uart/uprotocol.v(57)
  wire [7:0] reg6_al_b6;  // src/rtl/uart/uprotocol.v(58)
  wire [7:0] reg7_al_b7;  // src/rtl/uart/uprotocol.v(59)
  wire [3:0] send_cnt;  // src/rtl/uart/uprotocol.v(84)
  wire [31:0] tx_buffer0;  // src/rtl/uart/uprotocol.v(85)
  wire [31:0] tx_buffer1;  // src/rtl/uart/uprotocol.v(86)
  wire [2:0] tx_ready_cnt;  // src/rtl/uart/uprotocol.v(83)
  wire _al_n0_en;
  wire _al_n0_en_al_n74;
  wire _al_u100_o;
  wire _al_u101_o;
  wire _al_u102_o;
  wire _al_u103_o;
  wire _al_u104_o;
  wire _al_u105_o;
  wire _al_u106_o;
  wire _al_u108_o;
  wire _al_u109_o;
  wire _al_u110_o;
  wire _al_u111_o;
  wire _al_u112_o;
  wire _al_u113_o;
  wire _al_u114_o;
  wire _al_u115_o;
  wire _al_u117_o;
  wire _al_u118_o;
  wire _al_u119_o;
  wire _al_u120_o;
  wire _al_u121_o;
  wire _al_u122_o;
  wire _al_u123_o;
  wire _al_u124_o;
  wire _al_u125_o;
  wire _al_u127_o;
  wire _al_u128_o;
  wire _al_u129_o;
  wire _al_u130_o;
  wire _al_u131_o;
  wire _al_u132_o;
  wire _al_u133_o;
  wire _al_u134_o;
  wire _al_u136_o;
  wire _al_u137_o;
  wire _al_u138_o;
  wire _al_u139_o;
  wire _al_u140_o;
  wire _al_u141_o;
  wire _al_u142_o;
  wire _al_u143_o;
  wire _al_u145_o;
  wire _al_u146_o;
  wire _al_u147_o;
  wire _al_u148_o;
  wire _al_u149_o;
  wire _al_u150_o;
  wire _al_u151_o;
  wire _al_u152_o;
  wire _al_u154_o;
  wire _al_u155_o;
  wire _al_u156_o;
  wire _al_u157_o;
  wire _al_u158_o;
  wire _al_u159_o;
  wire _al_u160_o;
  wire _al_u161_o;
  wire _al_u162_o;
  wire _al_u164_o;
  wire _al_u165_o;
  wire _al_u166_o;
  wire _al_u167_o;
  wire _al_u168_o;
  wire _al_u169_o;
  wire _al_u170_o;
  wire _al_u171_o;
  wire _al_u173_o;
  wire _al_u174_o;
  wire _al_u176_o;
  wire _al_u178_o;
  wire _al_u179_o;
  wire _al_u181_o;
  wire _al_u183_o;
  wire _al_u184_o;
  wire _al_u186_o;
  wire _al_u188_o;
  wire _al_u189_o;
  wire _al_u191_o;
  wire _al_u193_o;
  wire _al_u194_o;
  wire _al_u196_o;
  wire _al_u198_o;
  wire _al_u199_o;
  wire _al_u201_o;
  wire _al_u204_o;
  wire _al_u205_o;
  wire _al_u207_o;
  wire _al_u208_o;
  wire _al_u209_o;
  wire _al_u210_o;
  wire _al_u211_o;
  wire _al_u212_o;
  wire _al_u213_o;
  wire _al_u214_o;
  wire _al_u215_o;
  wire _al_u216_o;
  wire _al_u98_o;
  wire _al_u99_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c19 ;
  wire \add0/c23 ;
  wire \add0/c27 ;
  wire \add0/c3 ;
  wire \add0/c31 ;
  wire \add0/c7 ;
  wire \add3/c1 ;
  wire \add3/c3 ;
  wire auto_rst;  // src/rtl/uart/uprotocol.v(50)
  wire mux12_b0_sel_is_2_o;
  wire mux1_b0_sel_is_0_o;
  wire mux21_b0_sel_is_0_o;
  wire n0;
  wire n48;
  wire n52;
  wire n60;
  wire n61;
  wire n81;
  wire rd_flag;  // src/rtl/uart/uprotocol.v(69)
  wire rd_flag0;  // src/rtl/uart/uprotocol.v(70)
  wire rd_flag1;  // src/rtl/uart/uprotocol.v(71)
  wire rd_flag2;  // src/rtl/uart/uprotocol.v(72)
  wire rd_flag3;  // src/rtl/uart/uprotocol.v(73)
  wire rd_flag4;  // src/rtl/uart/uprotocol.v(74)
  wire rd_flag5;  // src/rtl/uart/uprotocol.v(75)
  wire rd_mode;  // src/rtl/uart/uprotocol.v(60)
  wire recv_flag;  // src/rtl/uart/uprotocol.v(78)
  wire recv_state;  // src/rtl/uart/uprotocol.v(76)
  wire send_finish;  // src/rtl/uart/uprotocol.v(80)
  wire send_flag;  // src/rtl/uart/uprotocol.v(81)
  wire send_start;  // src/rtl/uart/uprotocol.v(79)
  wire tx_ready_flag;  // src/rtl/uart/uprotocol.v(82)
  wire wt_flag;  // src/rtl/uart/uprotocol.v(62)
  wire wt_flag0;  // src/rtl/uart/uprotocol.v(63)
  wire wt_flag1;  // src/rtl/uart/uprotocol.v(64)
  wire wt_flag2;  // src/rtl/uart/uprotocol.v(65)
  wire wt_flag3;  // src/rtl/uart/uprotocol.v(66)
  wire wt_flag4;  // src/rtl/uart/uprotocol.v(67)
  wire wt_flag5;  // src/rtl/uart/uprotocol.v(68)
  wire wt_mode;  // src/rtl/uart/uprotocol.v(61)

  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTF1("(D*C*~(~B*~A))"),
    //.LUTG0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTG1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110000000100000),
    .INIT_LUTF1(16'b1110000000000000),
    .INIT_LUTG0(16'b1110000000100000),
    .INIT_LUTG1(16'b1110000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u100|reg13_b24  (
    .a({_al_u98_o,tx_buffer1[24]}),
    .b({_al_u99_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[0]}),
    .mi({open_n3,ubus_rdata[24]}),
    .f({_al_u100_o,_al_u99_o}),
    .q({open_n19,tx_buffer1[24]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~C*~(~B*~A))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000111000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u103|reg12_b24  (
    .a({_al_u101_o,tx_buffer0[24]}),
    .b({_al_u102_o,tx_buffer1[0]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n23,ubus_raddr[24]}),
    .f({_al_u103_o,_al_u102_o}),
    .q({open_n39,tx_buffer0[24]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(143)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~C*~(B*~D))"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~C*~(B*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000111100000011),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000111100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u104|wt_flag_reg  (
    .a({open_n40,n0}),
    .b({send_cnt[1],wt_flag3}),
    .c({send_cnt[3],wt_flag4}),
    .clk(clk),
    .d({send_cnt[0],wt_flag5}),
    .f({_al_u104_o,open_n59}),
    .q({open_n63,wt_flag}));  // src/rtl/uart/uprotocol.v(143)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B))"),
    .INIT_LUT0(16'b0000000011001111),
    .MODE("LOGIC"))
    _al_u106 (
    .b({open_n66,send_cnt[2]}),
    .c({open_n67,tx_data[0]}),
    .d({open_n70,send_cnt[0]}),
    .f({open_n84,_al_u106_o}));
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~C*~(~B*~A))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000111000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u110|reg12_b25  (
    .a({_al_u108_o,tx_buffer0[25]}),
    .b({_al_u109_o,tx_buffer1[1]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n93,ubus_raddr[25]}),
    .f({_al_u110_o,_al_u109_o}),
    .q({open_n109,tx_buffer0[25]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTF1("(D*C*~(~B*~A))"),
    //.LUTG0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUTG1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110000000100000),
    .INIT_LUTF1(16'b1110000000000000),
    .INIT_LUTG0(16'b1110000000100000),
    .INIT_LUTG1(16'b1110000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u113|reg13_b25  (
    .a({_al_u111_o,tx_buffer1[25]}),
    .b({_al_u112_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[1]}),
    .mi({open_n113,ubus_rdata[25]}),
    .f({_al_u113_o,_al_u112_o}),
    .q({open_n129,tx_buffer1[25]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(192)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("(~C*~(~A*~(D*~B)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b0000101100001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u115|recv_state_reg  (
    .a({send_cnt[1],open_n130}),
    .b({send_cnt[2],open_n131}),
    .c({send_cnt[3],wt_flag}),
    .ce(_al_n0_en),
    .clk(clk),
    .d({tx_data[1],rd_flag}),
    .sr(auto_rst),
    .f({_al_u115_o,n48}),
    .q({open_n147,recv_state}));  // src/rtl/uart/uprotocol.v(192)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u119|reg13_b26  (
    .a({_al_u117_o,tx_buffer1[26]}),
    .b({_al_u118_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[2]}),
    .mi({open_n158,ubus_rdata[26]}),
    .f({_al_u119_o,_al_u118_o}),
    .q({open_n163,tx_buffer1[26]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u122|reg12_b26  (
    .a({_al_u120_o,tx_buffer0[26]}),
    .b({_al_u121_o,tx_buffer1[2]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n174,ubus_raddr[26]}),
    .f({_al_u122_o,_al_u121_o}),
    .q({open_n179,tx_buffer0[26]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~(D*~B*~A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~(D*~B*~A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u125|rd_flag2_reg  (
    .a({send_cnt[0],open_n180}),
    .b({send_cnt[1],open_n181}),
    .c({send_cnt[2],_al_u189_o}),
    .ce(recv_state),
    .clk(clk),
    .d({tx_data[2],_al_u188_o}),
    .f({_al_u125_o,open_n199}),
    .q({open_n203,rd_flag2}));  // src/rtl/uart/uprotocol.v(157)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u129|reg13_b27  (
    .a({_al_u127_o,tx_buffer1[27]}),
    .b({_al_u128_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[3]}),
    .mi({open_n214,ubus_rdata[27]}),
    .f({_al_u129_o,_al_u128_o}),
    .q({open_n219,tx_buffer1[27]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u132|reg12_b27  (
    .a({_al_u130_o,tx_buffer0[27]}),
    .b({_al_u131_o,tx_buffer1[3]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n230,ubus_raddr[27]}),
    .f({_al_u132_o,_al_u131_o}),
    .q({open_n235,tx_buffer0[27]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(D*C*A))"),
    //.LUT1("(D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001001100110011),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u133|reg12_b3  (
    .a({send_cnt[0],_al_u123_o}),
    .b({send_cnt[1],_al_u133_o}),
    .c({send_cnt[2],tx_buffer0[3]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({tx_data[3],send_cnt[2]}),
    .mi({open_n246,ubus_raddr[3]}),
    .f({_al_u133_o,_al_u134_o}),
    .q({open_n251,tx_buffer0[3]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u138|reg13_b28  (
    .a({_al_u136_o,tx_buffer1[28]}),
    .b({_al_u137_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[4]}),
    .mi({open_n262,ubus_rdata[28]}),
    .f({_al_u138_o,_al_u137_o}),
    .q({open_n267,tx_buffer1[28]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~C*~(~B*~A))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000111000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u141|reg12_b28  (
    .a({_al_u139_o,tx_buffer0[28]}),
    .b({_al_u140_o,tx_buffer1[4]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n271,ubus_raddr[28]}),
    .f({_al_u141_o,_al_u140_o}),
    .q({open_n287,tx_buffer0[28]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(D*C*A))"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(~B*~(D*C*A))"),
    //.LUTG1("(D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001001100110011),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b0001001100110011),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u142|reg12_b4  (
    .a({send_cnt[0],_al_u123_o}),
    .b({send_cnt[1],_al_u142_o}),
    .c({send_cnt[2],tx_buffer0[4]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({tx_data[4],send_cnt[2]}),
    .mi({open_n291,ubus_raddr[4]}),
    .f({_al_u142_o,_al_u143_o}),
    .q({open_n307,tx_buffer0[4]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~C*~(~B*~A))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000111000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u147|reg12_b29  (
    .a({_al_u145_o,tx_buffer0[29]}),
    .b({_al_u146_o,tx_buffer1[5]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n311,ubus_raddr[29]}),
    .f({_al_u147_o,_al_u146_o}),
    .q({open_n327,tx_buffer0[29]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(D*C*A))"),
    //.LUTF1("(D*~C*~B*~A)"),
    //.LUTG0("(~B*~(D*C*A))"),
    //.LUTG1("(D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001001100110011),
    .INIT_LUTF1(16'b0000000100000000),
    .INIT_LUTG0(16'b0001001100110011),
    .INIT_LUTG1(16'b0000000100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u148|reg12_b5  (
    .a({send_cnt[0],_al_u123_o}),
    .b({send_cnt[1],_al_u148_o}),
    .c({send_cnt[2],tx_buffer0[5]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({tx_data[5],send_cnt[2]}),
    .mi({open_n331,ubus_raddr[5]}),
    .f({_al_u148_o,_al_u149_o}),
    .q({open_n347,tx_buffer0[5]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u152|reg13_b29  (
    .a({_al_u150_o,tx_buffer1[29]}),
    .b({_al_u151_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[5]}),
    .mi({open_n358,ubus_rdata[29]}),
    .f({_al_u152_o,_al_u151_o}),
    .q({open_n363,tx_buffer1[29]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u156|reg12_b30  (
    .a({_al_u154_o,tx_buffer0[30]}),
    .b({_al_u155_o,tx_buffer1[6]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n374,ubus_raddr[30]}),
    .f({_al_u156_o,_al_u155_o}),
    .q({open_n379,tx_buffer0[30]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(278)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u158|reg14_b0  (
    .a({send_cnt[0],open_n380}),
    .b({send_cnt[1],open_n381}),
    .c({send_cnt[2],open_n382}),
    .clk(clk),
    .d({tx_data[6],tx_ready_cnt[0]}),
    .sr(tx_ready),
    .f({_al_u158_o,open_n400}),
    .q({open_n404,tx_ready_cnt[0]}));  // src/rtl/uart/uprotocol.v(278)
  // src/rtl/uart/uprotocol.v(323)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~A*~(C*~B))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("~(~D*~A*~(C*~B))"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111110111010),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111111110111010),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u159|reg16_b6  (
    .a({open_n405,_al_u156_o}),
    .b({open_n406,_al_u157_o}),
    .c({send_cnt[3],_al_u159_o}),
    .clk(clk),
    .d({_al_u158_o,_al_u162_o}),
    .f({_al_u159_o,open_n425}),
    .q({open_n429,tx_data[6]}));  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u162|reg13_b30  (
    .a({_al_u160_o,tx_buffer1[30]}),
    .b({_al_u161_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[6]}),
    .mi({open_n440,ubus_rdata[30]}),
    .f({_al_u162_o,_al_u161_o}),
    .q({open_n445,tx_buffer1[30]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(D*C*A))"),
    //.LUT1("(D*~C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001001100110011),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u164|reg12_b7  (
    .a({send_cnt[0],_al_u123_o}),
    .b({send_cnt[1],_al_u164_o}),
    .c({send_cnt[2],tx_buffer0[7]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({tx_data[7],send_cnt[2]}),
    .mi({open_n456,ubus_raddr[7]}),
    .f({_al_u164_o,_al_u165_o}),
    .q({open_n461,tx_buffer0[7]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u168|reg12_b31  (
    .a({_al_u166_o,tx_buffer0[31]}),
    .b({_al_u167_o,tx_buffer1[7]}),
    .c({send_cnt[2],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[3],send_cnt[1]}),
    .mi({open_n472,ubus_raddr[31]}),
    .f({_al_u168_o,_al_u167_o}),
    .q({open_n477,tx_buffer0[31]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    //.LUT1("(D*C*~(~B*~A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110000000100000),
    .INIT_LUT1(16'b1110000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u171|reg13_b31  (
    .a({_al_u169_o,tx_buffer1[31]}),
    .b({_al_u170_o,send_cnt[0]}),
    .c(send_cnt[2:1]),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[3],tx_data[7]}),
    .mi({open_n488,ubus_rdata[31]}),
    .f({_al_u171_o,_al_u170_o}),
    .q({open_n493,tx_buffer1[31]}));  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u204|_al_u123  (
    .b({send_cnt[1],open_n496}),
    .c({tx_en,send_cnt[1]}),
    .d({send_cnt[0],send_cnt[0]}),
    .f({_al_u204_o,_al_u123_o}));
  // src/rtl/uart/uprotocol.v(269)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~B*~D))"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111100001100),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u205|send_finish_reg  (
    .b({send_cnt[2],send_finish}),
    .c({send_cnt[3],ubus_ren}),
    .clk(clk),
    .d({_al_u204_o,_al_u205_o}),
    .sr(auto_rst),
    .f({_al_u205_o,open_n532}),
    .q({open_n536,send_finish}));  // src/rtl/uart/uprotocol.v(269)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u211|reg17_b6  (
    .a({_al_u207_o,auto_rst_cnt[6]}),
    .b({_al_u208_o,auto_rst_cnt[7]}),
    .c({_al_u209_o,auto_rst_cnt[8]}),
    .clk(clk),
    .d({_al_u210_o,auto_rst_cnt[9]}),
    .mi({open_n541,n4[6]}),
    .sr(mux1_b0_sel_is_0_o),
    .f({_al_u211_o,_al_u209_o}),
    .q({open_n556,auto_rst_cnt[6]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u216|reg17_b2  (
    .a({_al_u212_o,auto_rst_cnt[2]}),
    .b({_al_u213_o,auto_rst_cnt[20]}),
    .c({_al_u214_o,auto_rst_cnt[21]}),
    .clk(clk),
    .d({_al_u215_o,auto_rst_cnt[22]}),
    .mi({open_n561,n4[2]}),
    .sr(mux1_b0_sel_is_0_o),
    .f({_al_u216_o,_al_u214_o}),
    .q({open_n576,auto_rst_cnt[2]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(203)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u86|reg8_b0  (
    .c({recv_state,open_n581}),
    .ce(rx_en),
    .clk(clk),
    .d({auto_rst,recv_cnt[0]}),
    .sr(mux12_b0_sel_is_2_o),
    .f({mux12_b0_sel_is_2_o,open_n594}),
    .q({open_n598,recv_cnt[0]}));  // src/rtl/uart/uprotocol.v(203)
  // src/rtl/uart/uprotocol.v(258)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u90|send_start_reg  (
    .c({send_finish,send_finish}),
    .ce(_al_n0_en_al_n74),
    .clk(clk),
    .d({auto_rst,ubus_bken}),
    .mi({open_n606,ubus_bken}),
    .sr(auto_rst),
    .f({mux21_b0_sel_is_0_o,_al_n0_en_al_n74}),
    .q({open_n621,send_start}));  // src/rtl/uart/uprotocol.v(258)
  // src/rtl/uart/uprotocol.v(209)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~B*A)"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010000000000000),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u91|recv_flag_reg  (
    .a({open_n622,rx_en}),
    .b({open_n623,recv_cnt[0]}),
    .c({recv_flag,recv_cnt[1]}),
    .clk(clk),
    .d({n48,recv_cnt[2]}),
    .f({_al_n0_en,open_n638}),
    .q({open_n642,recv_flag}));  // src/rtl/uart/uprotocol.v(209)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u92|reg0_b4  (
    .a({rx_en,reg0_al_b0[4]}),
    .b({rd_flag0,reg0_al_b0[5]}),
    .c({rd_flag1,reg0_al_b0[6]}),
    .ce(rx_en),
    .clk(clk),
    .d({rd_flag2,reg0_al_b0[7]}),
    .mi({open_n653,rx_data[4]}),
    .f({n52,_al_u173_o}),
    .q({open_n658,reg0_al_b0[4]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(137)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u96|wt_flag2_reg  (
    .a({rx_en,open_n659}),
    .b({wt_flag0,open_n660}),
    .c({wt_flag1,_al_u191_o}),
    .ce(recv_state),
    .clk(clk),
    .d({wt_flag2,_al_u188_o}),
    .f({n0,open_n674}),
    .q({open_n678,wt_flag2}));  // src/rtl/uart/uprotocol.v(137)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u11_al_u224  (
    .a({auto_rst_cnt[13],auto_rst_cnt[11]}),
    .b({auto_rst_cnt[14],auto_rst_cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n4[13],n4[11]}),
    .fco(\add0/c15 ),
    .fx({n4[14],n4[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u15_al_u225  (
    .a({auto_rst_cnt[17],auto_rst_cnt[15]}),
    .b({auto_rst_cnt[18],auto_rst_cnt[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c15 ),
    .f({n4[17],n4[15]}),
    .fco(\add0/c19 ),
    .fx({n4[18],n4[16]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u19_al_u226  (
    .a({auto_rst_cnt[21],auto_rst_cnt[19]}),
    .b({auto_rst_cnt[22],auto_rst_cnt[20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c19 ),
    .f({n4[21],n4[19]}),
    .fco(\add0/c23 ),
    .fx({n4[22],n4[20]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y3Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u23_al_u227  (
    .a({auto_rst_cnt[25],auto_rst_cnt[23]}),
    .b({auto_rst_cnt[26],auto_rst_cnt[24]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c23 ),
    .f({n4[25],n4[23]}),
    .fco(\add0/c27 ),
    .fx({n4[26],n4[24]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y3Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u27_al_u228  (
    .a({auto_rst_cnt[29],auto_rst_cnt[27]}),
    .b({auto_rst_cnt[30],auto_rst_cnt[28]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c27 ),
    .f({n4[29],n4[27]}),
    .fco(\add0/c31 ),
    .fx({n4[30],n4[28]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y4Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u31_al_u229  (
    .a({open_n769,auto_rst_cnt[31]}),
    .c(2'b00),
    .d({open_n774,1'b0}),
    .fci(\add0/c31 ),
    .f({open_n791,n4[31]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u222  (
    .a({auto_rst_cnt[5],auto_rst_cnt[3]}),
    .b({auto_rst_cnt[6],auto_rst_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n4[5],n4[3]}),
    .fco(\add0/c7 ),
    .fx({n4[6],n4[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u223  (
    .a({auto_rst_cnt[9],auto_rst_cnt[7]}),
    .b({auto_rst_cnt[10],auto_rst_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n4[9],n4[7]}),
    .fco(\add0/c11 ),
    .fx({n4[10],n4[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u221"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \add0/ucin_al_u221  (
    .a({auto_rst_cnt[1],1'b0}),
    .b({auto_rst_cnt[2],auto_rst_cnt[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n4[1:0]),
    .sr(mux1_b0_sel_is_0_o),
    .f({n4[1],open_n846}),
    .fco(\add0/c3 ),
    .fx({n4[2],n4[0]}),
    .q(auto_rst_cnt[1:0]));
  // src/rtl/uart/uprotocol.v(302)
  // src/rtl/uart/uprotocol.v(105)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~(B*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \auto_rst_reg|tx_en_reg  (
    .a({open_n847,_al_u211_o}),
    .b({open_n848,_al_u216_o}),
    .c({_al_u216_o,rx_en}),
    .clk(clk),
    .d({_al_u211_o,tx_en}),
    .mi({open_n860,send_flag}),
    .f({open_n862,mux1_b0_sel_is_0_o}),
    .q({auto_rst,tx_en}));  // src/rtl/uart/uprotocol.v(302)
  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag0_reg|wt_flag0_reg  (
    .c({_al_u199_o,_al_u201_o}),
    .ce(recv_state),
    .clk(clk),
    .d({_al_u198_o,_al_u198_o}),
    .q({rd_flag0,wt_flag0}));  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag1_reg|wt_flag1_reg  (
    .c({_al_u194_o,_al_u196_o}),
    .ce(recv_state),
    .clk(clk),
    .d({_al_u193_o,_al_u193_o}),
    .q({rd_flag1,wt_flag1}));  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag3_reg|wt_flag3_reg  (
    .c({_al_u186_o,_al_u184_o}),
    .ce(recv_state),
    .clk(clk),
    .d({_al_u183_o,_al_u183_o}),
    .q({rd_flag3,wt_flag3}));  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag4_reg|wt_flag4_reg  (
    .c({_al_u181_o,_al_u179_o}),
    .ce(recv_state),
    .clk(clk),
    .d({_al_u178_o,_al_u178_o}),
    .q({rd_flag4,wt_flag4}));  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(157)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag5_reg|wt_flag5_reg  (
    .c({_al_u176_o,_al_u174_o}),
    .ce(recv_state),
    .clk(clk),
    .d({_al_u173_o,_al_u173_o}),
    .q({rd_flag5,wt_flag5}));  // src/rtl/uart/uprotocol.v(137)
  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(163)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~A*~(~D*C))"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111011111110),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \rd_flag_reg|reg16_b2  (
    .a({n52,_al_u119_o}),
    .b({rd_flag3,_al_u122_o}),
    .c({rd_flag4,_al_u124_o}),
    .clk(clk),
    .d({rd_flag5,_al_u125_o}),
    .q({rd_flag,tx_data[2]}));  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(181)
  // src/rtl/uart/uprotocol.v(172)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("~(~C*~D)"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("~(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b1111111111110000),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b1111111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \rd_mode_reg|wt_mode_reg  (
    .c({rd_mode,wt_mode}),
    .clk(clk),
    .d({rd_flag,wt_flag}),
    .sr(recv_flag),
    .q({rd_mode,wt_mode}));  // src/rtl/uart/uprotocol.v(181)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0000000000000010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b0|reg0_b1  (
    .a({reg0_al_b0[0],reg0_al_b0[0]}),
    .b({reg0_al_b0[1],reg0_al_b0[1]}),
    .c({reg0_al_b0[2],reg0_al_b0[2]}),
    .ce(rx_en),
    .clk(clk),
    .d({reg0_al_b0[3],reg0_al_b0[3]}),
    .mi({rx_data[0],rx_data[1]}),
    .f({_al_u176_o,_al_u174_o}),
    .q({reg0_al_b0[0],reg0_al_b0[1]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b2|reg1_b2  (
    .ce(rx_en),
    .clk(clk),
    .mi({rx_data[2],reg0_al_b0[2]}),
    .q({reg0_al_b0[2],reg1_al_b1[2]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b3|reg1_b3  (
    .ce(rx_en),
    .clk(clk),
    .mi({rx_data[3],reg0_al_b0[3]}),
    .q({reg0_al_b0[3],reg1_al_b1[3]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b5|reg1_b1  (
    .ce(rx_en),
    .clk(clk),
    .mi({rx_data[5],reg0_al_b0[1]}),
    .q({reg0_al_b0[5],reg1_al_b1[1]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b6|reg1_b0  (
    .ce(rx_en),
    .clk(clk),
    .mi({rx_data[6],reg0_al_b0[0]}),
    .q({reg0_al_b0[6],reg1_al_b1[0]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b7|reg1_b7  (
    .ce(rx_en),
    .clk(clk),
    .mi({rx_data[7],reg0_al_b0[7]}),
    .q({reg0_al_b0[7],reg1_al_b1[7]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b0|reg10_b27  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[0],reg4_al_b4[3]}),
    .q({ubus_waddr[0],ubus_waddr[27]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b10|reg10_b26  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[2],reg4_al_b4[2]}),
    .q({ubus_waddr[10],ubus_waddr[26]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b11|reg10_b19  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[3],reg5_al_b5[3]}),
    .q({ubus_waddr[11],ubus_waddr[19]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b12|reg10_b18  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[4],reg5_al_b5[2]}),
    .q({ubus_waddr[12],ubus_waddr[18]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b13|reg11_b9  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[5],reg2_al_b2[1]}),
    .q({ubus_waddr[13],ubus_wdata[9]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b14|reg11_b8  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[6],reg2_al_b2[0]}),
    .q({ubus_waddr[14],ubus_wdata[8]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b15|reg11_b3  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[7],reg3_al_b3[3]}),
    .q({ubus_waddr[15],ubus_wdata[3]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b16|reg10_b17  (
    .a({reg5_al_b5[0],reg5_al_b5[0]}),
    .b({reg5_al_b5[1],reg5_al_b5[1]}),
    .c({reg5_al_b5[2],reg5_al_b5[2]}),
    .ce(n61),
    .clk(clk),
    .d({reg5_al_b5[3],reg5_al_b5[3]}),
    .mi({reg5_al_b5[0],reg5_al_b5[1]}),
    .f({_al_u201_o,_al_u199_o}),
    .q({ubus_waddr[16],ubus_waddr[17]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b1|reg11_b27  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[1],reg0_al_b0[3]}),
    .q({ubus_waddr[1],ubus_wdata[27]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000000010000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b20|reg10_b28  (
    .a({reg5_al_b5[4],reg4_al_b4[4]}),
    .b({reg5_al_b5[5],reg4_al_b4[5]}),
    .c({reg5_al_b5[6],reg4_al_b4[6]}),
    .ce(n61),
    .clk(clk),
    .d({reg5_al_b5[7],reg4_al_b4[7]}),
    .mi({reg5_al_b5[4],reg4_al_b4[4]}),
    .f({_al_u198_o,_al_u193_o}),
    .q({ubus_waddr[20],ubus_waddr[28]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b21|reg11_b26  (
    .ce(n61),
    .clk(clk),
    .mi({reg5_al_b5[5],reg0_al_b0[2]}),
    .q({ubus_waddr[21],ubus_wdata[26]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b22|reg11_b25  (
    .ce(n61),
    .clk(clk),
    .mi({reg5_al_b5[6],reg0_al_b0[1]}),
    .q({ubus_waddr[22],ubus_wdata[25]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b23|reg11_b24  (
    .ce(n61),
    .clk(clk),
    .mi({reg5_al_b5[7],reg0_al_b0[0]}),
    .q({ubus_waddr[23],ubus_wdata[24]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~D*~C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b24|reg10_b25  (
    .a({reg4_al_b4[0],reg4_al_b4[0]}),
    .b({reg4_al_b4[1],reg4_al_b4[1]}),
    .c({reg4_al_b4[2],reg4_al_b4[2]}),
    .ce(n61),
    .clk(clk),
    .d({reg4_al_b4[3],reg4_al_b4[3]}),
    .mi({reg4_al_b4[0],reg4_al_b4[1]}),
    .f({_al_u196_o,_al_u194_o}),
    .q({ubus_waddr[24],ubus_waddr[25]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b29|reg11_b2  (
    .ce(n61),
    .clk(clk),
    .mi({reg4_al_b4[5],reg3_al_b3[2]}),
    .q({ubus_waddr[29],ubus_wdata[2]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b2|reg11_b19  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[2],reg1_al_b1[3]}),
    .q({ubus_waddr[2],ubus_wdata[19]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b30|reg11_b18  (
    .ce(n61),
    .clk(clk),
    .mi({reg4_al_b4[6],reg1_al_b1[2]}),
    .q({ubus_waddr[30],ubus_wdata[18]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b3|reg10_b31  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[3],reg4_al_b4[7]}),
    .q({ubus_waddr[3],ubus_waddr[31]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b4|reg11_b7  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[4],reg3_al_b3[7]}),
    .q({ubus_waddr[4],ubus_wdata[7]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b5|reg11_b6  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[5],reg3_al_b3[6]}),
    .q({ubus_waddr[5],ubus_wdata[6]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b6|reg11_b5  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[6],reg3_al_b3[5]}),
    .q({ubus_waddr[6],ubus_wdata[5]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b7|reg11_b31  (
    .ce(n61),
    .clk(clk),
    .mi({reg7_al_b7[7],reg0_al_b0[7]}),
    .q({ubus_waddr[7],ubus_wdata[31]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b8|reg11_b30  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[0],reg0_al_b0[6]}),
    .q({ubus_waddr[8],ubus_wdata[30]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg10_b9|reg11_b29  (
    .ce(n61),
    .clk(clk),
    .mi({reg6_al_b6[1],reg0_al_b0[5]}),
    .q({ubus_waddr[9],ubus_wdata[29]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b0|reg11_b1  (
    .a({reg3_al_b3[0],reg3_al_b3[0]}),
    .b({reg3_al_b3[1],reg3_al_b3[1]}),
    .c({reg3_al_b3[2],reg3_al_b3[2]}),
    .ce(n61),
    .clk(clk),
    .d({reg3_al_b3[3],reg3_al_b3[3]}),
    .mi({reg3_al_b3[0],reg3_al_b3[1]}),
    .f({_al_u191_o,_al_u189_o}),
    .q({ubus_wdata[0],ubus_wdata[1]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(~D*~C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b10|reg11_b11  (
    .a({reg2_al_b2[0],reg2_al_b2[0]}),
    .b({reg2_al_b2[1],reg2_al_b2[1]}),
    .c({reg2_al_b2[2],reg2_al_b2[2]}),
    .ce(n61),
    .clk(clk),
    .d({reg2_al_b2[3],reg2_al_b2[3]}),
    .mi({reg2_al_b2[2],reg2_al_b2[3]}),
    .f({_al_u186_o,_al_u184_o}),
    .q({ubus_wdata[10],ubus_wdata[11]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(~D*C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b12|reg11_b4  (
    .a({reg2_al_b2[4],reg3_al_b3[4]}),
    .b({reg2_al_b2[5],reg3_al_b3[5]}),
    .c({reg2_al_b2[6],reg3_al_b3[6]}),
    .ce(n61),
    .clk(clk),
    .d({reg2_al_b2[7],reg3_al_b3[7]}),
    .mi({reg2_al_b2[4],reg3_al_b3[4]}),
    .f({_al_u183_o,_al_u188_o}),
    .q({ubus_wdata[12],ubus_wdata[4]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b13|reg11_b28  (
    .ce(n61),
    .clk(clk),
    .mi({reg2_al_b2[5],reg0_al_b0[4]}),
    .q({ubus_wdata[13],ubus_wdata[28]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b14|reg11_b23  (
    .ce(n61),
    .clk(clk),
    .mi({reg2_al_b2[6],reg1_al_b1[7]}),
    .q({ubus_wdata[14],ubus_wdata[23]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b15|reg11_b22  (
    .ce(n61),
    .clk(clk),
    .mi({reg2_al_b2[7],reg1_al_b1[6]}),
    .q({ubus_wdata[15],ubus_wdata[22]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*A)"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("(~D*C*~B*A)"),
    //.LUTG1("(~D*~C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000100000),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b0000000000100000),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b16|reg11_b17  (
    .a({reg1_al_b1[0],reg1_al_b1[0]}),
    .b({reg1_al_b1[1],reg1_al_b1[1]}),
    .c({reg1_al_b1[2],reg1_al_b1[2]}),
    .ce(n61),
    .clk(clk),
    .d({reg1_al_b1[3],reg1_al_b1[3]}),
    .mi({reg1_al_b1[0],reg1_al_b1[1]}),
    .f({_al_u181_o,_al_u179_o}),
    .q({ubus_wdata[16],ubus_wdata[17]}));  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000010000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg11_b20 (
    .a({open_n1917,reg1_al_b1[4]}),
    .b({open_n1918,reg1_al_b1[5]}),
    .c({open_n1919,reg1_al_b1[6]}),
    .ce(n61),
    .clk(clk),
    .d({open_n1920,reg1_al_b1[7]}),
    .mi({open_n1931,reg1_al_b1[4]}),
    .f({open_n1933,_al_u178_o}),
    .q({open_n1937,ubus_wdata[20]}));  // src/rtl/uart/uprotocol.v(233)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg11_b21 (
    .ce(n61),
    .clk(clk),
    .mi({open_n1956,reg1_al_b1[5]}),
    .q({open_n1963,ubus_wdata[21]}));  // src/rtl/uart/uprotocol.v(233)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D*~A)))"),
    //.LUT1("(A*~(D*C*~B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100110000001100),
    .INIT_LUT1(16'b1000101010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b0|reg12_b1  (
    .a({_al_u104_o,tx_buffer0[1]}),
    .b({tx_buffer0[0],send_cnt[0]}),
    .c({send_cnt[1],send_cnt[1]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[2],send_cnt[2]}),
    .mi({ubus_raddr[0],ubus_raddr[1]}),
    .f({_al_u105_o,_al_u114_o}),
    .q({tx_buffer0[0],tx_buffer0[1]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b10|reg12_b17  (
    .a({tx_buffer0[10],tx_buffer0[17]}),
    .b({tx_buffer0[18],tx_buffer0[9]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_raddr[10],ubus_raddr[17]}),
    .f({_al_u120_o,_al_u108_o}),
    .q({tx_buffer0[10],tx_buffer0[17]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b11|reg12_b16  (
    .a({tx_buffer0[11],tx_buffer0[16]}),
    .b({tx_buffer0[19],tx_buffer0[8]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_raddr[11],ubus_raddr[16]}),
    .f({_al_u130_o,_al_u101_o}),
    .q({tx_buffer0[11],tx_buffer0[16]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b12|reg12_b15  (
    .a({tx_buffer0[12],tx_buffer0[15]}),
    .b({tx_buffer0[20],tx_buffer0[23]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_raddr[12],ubus_raddr[15]}),
    .f({_al_u139_o,_al_u166_o}),
    .q({tx_buffer0[12],tx_buffer0[15]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b13|reg12_b14  (
    .a({tx_buffer0[13],tx_buffer0[14]}),
    .b({tx_buffer0[21],tx_buffer0[22]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_ren),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_raddr[13],ubus_raddr[14]}),
    .f({_al_u145_o,_al_u154_o}),
    .q({tx_buffer0[13],tx_buffer0[14]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b18|reg12_b9  (
    .ce(ubus_ren),
    .clk(clk),
    .mi({ubus_raddr[18],ubus_raddr[9]}),
    .q({tx_buffer0[18],tx_buffer0[9]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b19|reg12_b8  (
    .ce(ubus_ren),
    .clk(clk),
    .mi({ubus_raddr[19],ubus_raddr[8]}),
    .q({tx_buffer0[19],tx_buffer0[8]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b20|reg12_b23  (
    .ce(ubus_ren),
    .clk(clk),
    .mi({ubus_raddr[20],ubus_raddr[23]}),
    .q({tx_buffer0[20],tx_buffer0[23]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b21|reg12_b22  (
    .ce(ubus_ren),
    .clk(clk),
    .mi({ubus_raddr[21],ubus_raddr[22]}),
    .q({tx_buffer0[21],tx_buffer0[22]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~C*~(~B*D))"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~C*~(~B*D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000110000001111),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000110000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg12_b2|reg12_b6  (
    .b({tx_buffer0[2],tx_buffer0[6]}),
    .c(send_cnt[3:2]),
    .ce(ubus_ren),
    .clk(clk),
    .d({_al_u123_o,_al_u123_o}),
    .mi({ubus_raddr[2],ubus_raddr[6]}),
    .f({_al_u124_o,_al_u157_o}),
    .q({tx_buffer0[2],tx_buffer0[6]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b0|reg13_b9  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[0],ubus_rdata[9]}),
    .q({tx_buffer1[0],tx_buffer1[9]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b10|reg13_b17  (
    .a({tx_buffer1[10],tx_buffer1[17]}),
    .b({tx_buffer1[18],tx_buffer1[9]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_rdata[10],ubus_rdata[17]}),
    .f({_al_u117_o,_al_u111_o}),
    .q({tx_buffer1[10],tx_buffer1[17]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b11|reg13_b16  (
    .a({tx_buffer1[11],tx_buffer1[16]}),
    .b({tx_buffer1[19],tx_buffer1[8]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_rdata[11],ubus_rdata[16]}),
    .f({_al_u127_o,_al_u98_o}),
    .q({tx_buffer1[11],tx_buffer1[16]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b12|reg13_b15  (
    .a({tx_buffer1[12],tx_buffer1[15]}),
    .b({tx_buffer1[20],tx_buffer1[23]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_rdata[12],ubus_rdata[15]}),
    .f({_al_u136_o,_al_u169_o}),
    .q({tx_buffer1[12],tx_buffer1[15]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b13|reg13_b14  (
    .a({tx_buffer1[13],tx_buffer1[14]}),
    .b({tx_buffer1[21],tx_buffer1[22]}),
    .c({send_cnt[0],send_cnt[0]}),
    .ce(ubus_bken),
    .clk(clk),
    .d({send_cnt[1],send_cnt[1]}),
    .mi({ubus_rdata[13],ubus_rdata[14]}),
    .f({_al_u150_o,_al_u160_o}),
    .q({tx_buffer1[13],tx_buffer1[14]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b18|reg13_b8  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[18],ubus_rdata[8]}),
    .q({tx_buffer1[18],tx_buffer1[8]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b19|reg13_b7  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[19],ubus_rdata[7]}),
    .q({tx_buffer1[19],tx_buffer1[7]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b1|reg13_b6  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[1],ubus_rdata[6]}),
    .q({tx_buffer1[1],tx_buffer1[6]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b20|reg13_b5  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[20],ubus_rdata[5]}),
    .q({tx_buffer1[20],tx_buffer1[5]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b21|reg13_b4  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[21],ubus_rdata[4]}),
    .q({tx_buffer1[21],tx_buffer1[4]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b22|reg13_b3  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[22],ubus_rdata[3]}),
    .q({tx_buffer1[22],tx_buffer1[3]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(247)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg13_b2|reg13_b23  (
    .ce(ubus_bken),
    .clk(clk),
    .mi({ubus_rdata[2],ubus_rdata[23]}),
    .q({tx_buffer1[2],tx_buffer1[23]}));  // src/rtl/uart/uprotocol.v(247)
  // src/rtl/uart/uprotocol.v(278)
  // src/rtl/uart/uprotocol.v(278)
  EG_PHY_MSLICE #(
    //.LUT0("(C@(B*D))"),
    //.LUT1("(C@D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011110011110000),
    .INIT_LUT1(16'b0000111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg14_b1|reg14_b2  (
    .b({open_n2440,tx_ready_cnt[1]}),
    .c({tx_ready_cnt[1],tx_ready_cnt[2]}),
    .clk(clk),
    .d({tx_ready_cnt[0],tx_ready_cnt[0]}),
    .sr(tx_ready),
    .q({tx_ready_cnt[1],tx_ready_cnt[2]}));  // src/rtl/uart/uprotocol.v(278)
  EG_PHY_MSLICE #(
    //.MACRO("reg15_b0|add3/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg15_b0|add3/ucin  (
    .a({send_cnt[0],1'b0}),
    .b({1'b1,open_n2459}),
    .ce(n81),
    .clk(clk),
    .sr(mux21_b0_sel_is_0_o),
    .fco(\add3/c1 ),
    .q({send_cnt[0],open_n2480}));
  EG_PHY_MSLICE #(
    //.MACRO("reg15_b0|add3/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg15_b2|reg15_b1  (
    .a(send_cnt[2:1]),
    .b(2'b00),
    .ce(n81),
    .clk(clk),
    .fci(\add3/c1 ),
    .sr(mux21_b0_sel_is_0_o),
    .fco(\add3/c3 ),
    .q(send_cnt[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("reg15_b0|add3/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    reg15_b3_al_u230 (
    .a({open_n2500,send_cnt[3]}),
    .b({open_n2501,1'b0}),
    .ce(n81),
    .clk(clk),
    .fci(\add3/c3 ),
    .sr(mux21_b0_sel_is_0_o),
    .q({open_n2522,send_cnt[3]}));
  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(323)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~A*~(D*~C))"),
    //.LUT1("~(~B*~A*~(~D*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111111101110),
    .INIT_LUT1(16'b1110111011111110),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg16_b0|reg16_b1  (
    .a({_al_u100_o,_al_u110_o}),
    .b({_al_u103_o,_al_u113_o}),
    .c({_al_u105_o,_al_u114_o}),
    .clk(clk),
    .d({_al_u106_o,_al_u115_o}),
    .q({tx_data[0],tx_data[1]}));  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(323)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~B*~(~D*~A))"),
    //.LUTF1("~(~B*~A*~(~D*~C))"),
    //.LUTG0("~(~C*~B*~(~D*~A))"),
    //.LUTG1("~(~B*~A*~(~D*~C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011111101),
    .INIT_LUTF1(16'b1110111011101111),
    .INIT_LUTG0(16'b1111110011111101),
    .INIT_LUTG1(16'b1110111011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg16_b3|reg16_b7  (
    .a({_al_u129_o,_al_u165_o}),
    .b({_al_u132_o,_al_u168_o}),
    .c({_al_u134_o,_al_u171_o}),
    .clk(clk),
    .d({send_cnt[3],send_cnt[3]}),
    .q({tx_data[3],tx_data[7]}));  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(323)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~A*~(~D*~B))"),
    //.LUTF1("~(~B*~A*~(~D*~C))"),
    //.LUTG0("~(~C*~A*~(~D*~B))"),
    //.LUTG1("~(~B*~A*~(~D*~C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111101011111011),
    .INIT_LUTF1(16'b1110111011101111),
    .INIT_LUTG0(16'b1111101011111011),
    .INIT_LUTG1(16'b1110111011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg16_b4|reg16_b5  (
    .a({_al_u138_o,_al_u147_o}),
    .b({_al_u141_o,_al_u149_o}),
    .c({_al_u143_o,_al_u152_o}),
    .clk(clk),
    .d({send_cnt[3],send_cnt[3]}),
    .q({tx_data[4],tx_data[5]}));  // src/rtl/uart/uprotocol.v(323)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~B*~A)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(D*C*~B*~A)"),
    //.LUTG1("(~D*~C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b0001000000000000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b10|reg17_b30  (
    .a({auto_rst_cnt[0],auto_rst_cnt[30]}),
    .b({auto_rst_cnt[1],auto_rst_cnt[31]}),
    .c({auto_rst_cnt[10],auto_rst_cnt[4]}),
    .clk(clk),
    .d({auto_rst_cnt[11],auto_rst_cnt[5]}),
    .mi({n4[10],n4[30]}),
    .sr(mux1_b0_sel_is_0_o),
    .f({_al_u213_o,_al_u210_o}),
    .q({auto_rst_cnt[10],auto_rst_cnt[30]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b11|reg17_b9  (
    .clk(clk),
    .mi({n4[11],n4[9]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[11],auto_rst_cnt[9]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*~A)"),
    //.LUT1("(D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000100000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b12|reg17_b27  (
    .a({auto_rst_cnt[12],auto_rst_cnt[27]}),
    .b({auto_rst_cnt[13],auto_rst_cnt[28]}),
    .c({auto_rst_cnt[14],auto_rst_cnt[29]}),
    .clk(clk),
    .d({auto_rst_cnt[15],auto_rst_cnt[3]}),
    .mi({n4[12],n4[27]}),
    .sr(mux1_b0_sel_is_0_o),
    .f({_al_u212_o,_al_u207_o}),
    .q({auto_rst_cnt[12],auto_rst_cnt[27]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b13|reg17_b8  (
    .clk(clk),
    .mi({n4[13],n4[8]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[13],auto_rst_cnt[8]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b14|reg17_b7  (
    .clk(clk),
    .mi({n4[14],n4[7]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[14],auto_rst_cnt[7]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b15|reg17_b5  (
    .clk(clk),
    .mi({n4[15],n4[5]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[15],auto_rst_cnt[5]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*A)"),
    //.LUT1("(D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000100000),
    .INIT_LUT1(16'b0000010000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b16|reg17_b23  (
    .a({auto_rst_cnt[16],auto_rst_cnt[23]}),
    .b({auto_rst_cnt[17],auto_rst_cnt[24]}),
    .c({auto_rst_cnt[18],auto_rst_cnt[25]}),
    .clk(clk),
    .d({auto_rst_cnt[19],auto_rst_cnt[26]}),
    .mi({n4[16],n4[23]}),
    .sr(mux1_b0_sel_is_0_o),
    .f({_al_u215_o,_al_u208_o}),
    .q({auto_rst_cnt[16],auto_rst_cnt[23]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b17|reg17_b4  (
    .clk(clk),
    .mi({n4[17],n4[4]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[17],auto_rst_cnt[4]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b18|reg17_b31  (
    .clk(clk),
    .mi({n4[18],n4[31]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[18],auto_rst_cnt[31]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b19|reg17_b3  (
    .clk(clk),
    .mi({n4[19],n4[3]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[19],auto_rst_cnt[3]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b20|reg17_b29  (
    .clk(clk),
    .mi({n4[20],n4[29]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[20],auto_rst_cnt[29]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b21|reg17_b28  (
    .clk(clk),
    .mi({n4[21],n4[28]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[21],auto_rst_cnt[28]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b22|reg17_b26  (
    .clk(clk),
    .mi({n4[22],n4[26]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[22],auto_rst_cnt[26]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(99)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg17_b24|reg17_b25  (
    .clk(clk),
    .mi({n4[24],n4[25]}),
    .sr(mux1_b0_sel_is_0_o),
    .q({auto_rst_cnt[24],auto_rst_cnt[25]}));  // src/rtl/uart/uprotocol.v(99)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg1_b4|reg1_b6  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg0_al_b0[4],reg0_al_b0[6]}),
    .q({reg1_al_b1[4],reg1_al_b1[6]}));  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg1_b5 (
    .ce(rx_en),
    .clk(clk),
    .mi({open_n2953,reg0_al_b0[5]}),
    .q({open_n2971,reg1_al_b1[5]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b0|reg3_b0  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[0],reg2_al_b2[0]}),
    .q({reg2_al_b2[0],reg3_al_b3[0]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b1|reg3_b1  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[1],reg2_al_b2[1]}),
    .q({reg2_al_b2[1],reg3_al_b3[1]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b2|reg3_b2  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[2],reg2_al_b2[2]}),
    .q({reg2_al_b2[2],reg3_al_b3[2]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b3|reg3_b3  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[3],reg2_al_b2[3]}),
    .q({reg2_al_b2[3],reg3_al_b3[3]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b4|reg3_b4  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[4],reg2_al_b2[4]}),
    .q({reg2_al_b2[4],reg3_al_b3[4]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b5|reg3_b5  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[5],reg2_al_b2[5]}),
    .q({reg2_al_b2[5],reg3_al_b3[5]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b6|reg3_b6  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[6],reg2_al_b2[6]}),
    .q({reg2_al_b2[6],reg3_al_b3[6]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg2_b7|reg3_b7  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg1_al_b1[7],reg2_al_b2[7]}),
    .q({reg2_al_b2[7],reg3_al_b3[7]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b0|reg5_b0  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[0],reg4_al_b4[0]}),
    .q({reg4_al_b4[0],reg5_al_b5[0]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b1|reg5_b1  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[1],reg4_al_b4[1]}),
    .q({reg4_al_b4[1],reg5_al_b5[1]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b2|reg5_b2  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[2],reg4_al_b4[2]}),
    .q({reg4_al_b4[2],reg5_al_b5[2]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b3|reg5_b3  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[3],reg4_al_b4[3]}),
    .q({reg4_al_b4[3],reg5_al_b5[3]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b4|reg5_b4  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[4],reg4_al_b4[4]}),
    .q({reg4_al_b4[4],reg5_al_b5[4]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b5|reg5_b5  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[5],reg4_al_b4[5]}),
    .q({reg4_al_b4[5],reg5_al_b5[5]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b6|reg5_b6  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[6],reg4_al_b4[6]}),
    .q({reg4_al_b4[6],reg5_al_b5[6]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b7|reg5_b7  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg3_al_b3[7],reg4_al_b4[7]}),
    .q({reg4_al_b4[7],reg5_al_b5[7]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b0|reg6_b0  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[0],reg5_al_b5[0]}),
    .q({reg7_al_b7[0],reg6_al_b6[0]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b1|reg6_b1  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[1],reg5_al_b5[1]}),
    .q({reg7_al_b7[1],reg6_al_b6[1]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b2|reg6_b2  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[2],reg5_al_b5[2]}),
    .q({reg7_al_b7[2],reg6_al_b6[2]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b3|reg6_b3  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[3],reg5_al_b5[3]}),
    .q({reg7_al_b7[3],reg6_al_b6[3]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b4|reg6_b4  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[4],reg5_al_b5[4]}),
    .q({reg7_al_b7[4],reg6_al_b6[4]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b5|reg6_b5  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[5],reg5_al_b5[5]}),
    .q({reg7_al_b7[5],reg6_al_b6[5]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b6|reg6_b6  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[6],reg5_al_b5[6]}),
    .q({reg7_al_b7[6],reg6_al_b6[6]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(123)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg7_b7|reg6_b7  (
    .ce(rx_en),
    .clk(clk),
    .mi({reg6_al_b6[7],reg5_al_b5[7]}),
    .q({reg7_al_b7[7],reg6_al_b6[7]}));  // src/rtl/uart/uprotocol.v(123)
  // src/rtl/uart/uprotocol.v(203)
  // src/rtl/uart/uprotocol.v(203)
  EG_PHY_LSLICE #(
    //.LUTF0("(C@(B*D))"),
    //.LUTF1("(C@D)"),
    //.LUTG0("(C@(B*D))"),
    //.LUTG1("(C@D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011110011110000),
    .INIT_LUTF1(16'b0000111111110000),
    .INIT_LUTG0(16'b0011110011110000),
    .INIT_LUTG1(16'b0000111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg8_b1|reg8_b2  (
    .b({open_n3598,recv_cnt[1]}),
    .c({recv_cnt[1],recv_cnt[2]}),
    .ce(rx_en),
    .clk(clk),
    .d({recv_cnt[0],recv_cnt[0]}),
    .sr(mux12_b0_sel_is_2_o),
    .q({recv_cnt[1],recv_cnt[2]}));  // src/rtl/uart/uprotocol.v(203)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b0|reg9_b27  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[0],reg4_al_b4[3]}),
    .q({ubus_raddr[0],ubus_raddr[27]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b10|reg9_b26  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[2],reg4_al_b4[2]}),
    .q({ubus_raddr[10],ubus_raddr[26]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b11|reg9_b25  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[3],reg4_al_b4[1]}),
    .q({ubus_raddr[11],ubus_raddr[25]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b12|reg9_b24  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[4],reg4_al_b4[0]}),
    .q({ubus_raddr[12],ubus_raddr[24]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b13|reg9_b19  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[5],reg5_al_b5[3]}),
    .q({ubus_raddr[13],ubus_raddr[19]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b14|reg9_b18  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[6],reg5_al_b5[2]}),
    .q({ubus_raddr[14],ubus_raddr[18]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b15|reg9_b17  (
    .ce(n60),
    .clk(clk),
    .mi({reg6_al_b6[7],reg5_al_b5[1]}),
    .q({ubus_raddr[15],ubus_raddr[17]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b1|reg9_b16  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[1],reg5_al_b5[0]}),
    .q({ubus_raddr[1],ubus_raddr[16]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b20|reg9_b31  (
    .ce(n60),
    .clk(clk),
    .mi({reg5_al_b5[4],reg4_al_b4[7]}),
    .q({ubus_raddr[20],ubus_raddr[31]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b21|reg9_b30  (
    .ce(n60),
    .clk(clk),
    .mi({reg5_al_b5[5],reg4_al_b4[6]}),
    .q({ubus_raddr[21],ubus_raddr[30]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b22|reg9_b29  (
    .ce(n60),
    .clk(clk),
    .mi({reg5_al_b5[6],reg4_al_b4[5]}),
    .q({ubus_raddr[22],ubus_raddr[29]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b23|reg9_b28  (
    .ce(n60),
    .clk(clk),
    .mi({reg5_al_b5[7],reg4_al_b4[4]}),
    .q({ubus_raddr[23],ubus_raddr[28]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b2|reg9_b9  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[2],reg6_al_b6[1]}),
    .q({ubus_raddr[2],ubus_raddr[9]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b3|reg9_b8  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[3],reg6_al_b6[0]}),
    .q({ubus_raddr[3],ubus_raddr[8]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b4|reg9_b7  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[4],reg7_al_b7[7]}),
    .q({ubus_raddr[4],ubus_raddr[7]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(223)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg9_b5|reg9_b6  (
    .ce(n60),
    .clk(clk),
    .mi({reg7_al_b7[5],reg7_al_b7[6]}),
    .q({ubus_raddr[5],ubus_raddr[6]}));  // src/rtl/uart/uprotocol.v(223)
  // src/rtl/uart/uprotocol.v(284)
  // src/rtl/uart/uprotocol.v(302)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \send_flag_reg|tx_ready_flag_reg  (
    .b({open_n4038,tx_ready_cnt[1]}),
    .c({tx_ready_flag,tx_ready_cnt[2]}),
    .clk(clk),
    .d({send_start,tx_ready_cnt[0]}),
    .f({n81,open_n4053}),
    .q({send_flag,tx_ready_flag}));  // src/rtl/uart/uprotocol.v(284)
  // src/rtl/uart/uprotocol.v(216)
  // src/rtl/uart/uprotocol.v(216)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ubus_wen_reg|ubus_ren_reg  (
    .c({wt_mode,recv_flag}),
    .clk(clk),
    .d({recv_flag,rd_mode}),
    .f({n61,n60}),
    .q({ubus_wen,ubus_ren}));  // src/rtl/uart/uprotocol.v(216)

endmodule 

