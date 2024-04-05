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
  wire [3:0] \u_tube_dri/n2 ;
  wire [3:0] \u_tube_dri/sm_seg_num ;  // src/rtl/tube/tube_dri.v(36)
  wire [3:0] \u_tube_dri/ux_rst/cnt ;  // src/rtl/tube/rst.v(20)
  wire [3:0] \u_tube_dri/ux_rst/n1 ;
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
  wire \u_tube_dri/add0/c0 ;
  wire \u_tube_dri/add0/c1 ;
  wire \u_tube_dri/add0/c10 ;
  wire \u_tube_dri/add0/c11 ;
  wire \u_tube_dri/add0/c12 ;
  wire \u_tube_dri/add0/c13 ;
  wire \u_tube_dri/add0/c14 ;
  wire \u_tube_dri/add0/c15 ;
  wire \u_tube_dri/add0/c16 ;
  wire \u_tube_dri/add0/c17 ;
  wire \u_tube_dri/add0/c2 ;
  wire \u_tube_dri/add0/c3 ;
  wire \u_tube_dri/add0/c4 ;
  wire \u_tube_dri/add0/c5 ;
  wire \u_tube_dri/add0/c6 ;
  wire \u_tube_dri/add0/c7 ;
  wire \u_tube_dri/add0/c8 ;
  wire \u_tube_dri/add0/c9 ;
  wire \u_tube_dri/mux1_b0_sel_is_0_o_neg ;
  wire \u_tube_dri/mux1_b1_sel_is_1_o_neg ;
  wire \u_tube_dri/mux1_b2_sel_is_2_o_neg ;
  wire \u_tube_dri/mux1_b3_sel_is_3_o_neg ;
  wire \u_tube_dri/rst_n ;  // src/rtl/tube/tube_dri.v(30)
  wire \u_tube_dri/ux_rst/add0/c0 ;
  wire \u_tube_dri/ux_rst/add0/c1 ;
  wire \u_tube_dri/ux_rst/add0/c2 ;
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
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u20 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .o(\u_tube_dri/mux1_b3_sel_is_3_o_neg ));
  AL_MAP_LUT2 #(
    .EQN("~(B*~A)"),
    .INIT(4'hb))
    _al_u21 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .o(\u_tube_dri/mux1_b2_sel_is_2_o_neg ));
  AL_MAP_LUT4 #(
    .EQN("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h37bf))
    _al_u22 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit3_num[3]),
    .d(sm_bit4_num[3]),
    .o(_al_u22_o));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u23 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .o(\u_tube_dri/mux1_b0_sel_is_0_o_neg ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*A)"),
    .INIT(4'hd))
    _al_u24 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .o(\u_tube_dri/mux1_b1_sel_is_1_o_neg ));
  AL_MAP_LUT4 #(
    .EQN("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'hcdef))
    _al_u25 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit1_num[3]),
    .d(sm_bit2_num[3]),
    .o(_al_u25_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u26 (
    .a(_al_u22_o),
    .b(_al_u25_o),
    .o(\u_tube_dri/n2 [3]));
  AL_MAP_LUT4 #(
    .EQN("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h37bf))
    _al_u27 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit3_num[2]),
    .d(sm_bit4_num[2]),
    .o(_al_u27_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'hcdef))
    _al_u28 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit1_num[2]),
    .d(sm_bit2_num[2]),
    .o(_al_u28_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u29 (
    .a(_al_u27_o),
    .b(_al_u28_o),
    .o(\u_tube_dri/n2 [2]));
  AL_MAP_LUT4 #(
    .EQN("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h37bf))
    _al_u30 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit3_num[1]),
    .d(sm_bit4_num[1]),
    .o(_al_u30_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'hcdef))
    _al_u31 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit1_num[1]),
    .d(sm_bit2_num[1]),
    .o(_al_u31_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u32 (
    .a(_al_u30_o),
    .b(_al_u31_o),
    .o(\u_tube_dri/n2 [1]));
  AL_MAP_LUT4 #(
    .EQN("~(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'h37bf))
    _al_u33 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit3_num[0]),
    .d(sm_bit4_num[0]),
    .o(_al_u33_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'hcdef))
    _al_u34 (
    .a(\u_tube_dri/cnt_w [16]),
    .b(\u_tube_dri/cnt_w [17]),
    .c(sm_bit1_num[0]),
    .d(sm_bit2_num[0]),
    .o(_al_u34_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u35 (
    .a(_al_u33_o),
    .b(_al_u34_o),
    .o(\u_tube_dri/n2 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u36 (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[2]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u37 (
    .a(\u_tube_dri/ux_rst/cnt [0]),
    .b(\u_tube_dri/ux_rst/cnt [1]),
    .c(\u_tube_dri/ux_rst/cnt [2]),
    .d(\u_tube_dri/ux_rst/cnt [3]),
    .o(\u_tube_dri/ux_rst/n0 ));
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
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u0  (
    .a(\u_tube_dri/cnt_w [0]),
    .b(1'b1),
    .c(\u_tube_dri/add0/c0 ),
    .o({\u_tube_dri/add0/c1 ,\u_tube_dri/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u1  (
    .a(\u_tube_dri/cnt_w [1]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c1 ),
    .o({\u_tube_dri/add0/c2 ,\u_tube_dri/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u10  (
    .a(\u_tube_dri/cnt_w [10]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c10 ),
    .o({\u_tube_dri/add0/c11 ,\u_tube_dri/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u11  (
    .a(\u_tube_dri/cnt_w [11]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c11 ),
    .o({\u_tube_dri/add0/c12 ,\u_tube_dri/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u12  (
    .a(\u_tube_dri/cnt_w [12]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c12 ),
    .o({\u_tube_dri/add0/c13 ,\u_tube_dri/n1 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u13  (
    .a(\u_tube_dri/cnt_w [13]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c13 ),
    .o({\u_tube_dri/add0/c14 ,\u_tube_dri/n1 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u14  (
    .a(\u_tube_dri/cnt_w [14]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c14 ),
    .o({\u_tube_dri/add0/c15 ,\u_tube_dri/n1 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u15  (
    .a(\u_tube_dri/cnt_w [15]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c15 ),
    .o({\u_tube_dri/add0/c16 ,\u_tube_dri/n1 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u16  (
    .a(\u_tube_dri/cnt_w [16]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c16 ),
    .o({\u_tube_dri/add0/c17 ,\u_tube_dri/n1 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u17  (
    .a(\u_tube_dri/cnt_w [17]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c17 ),
    .o({open_n268,\u_tube_dri/n1 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u2  (
    .a(\u_tube_dri/cnt_w [2]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c2 ),
    .o({\u_tube_dri/add0/c3 ,\u_tube_dri/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u3  (
    .a(\u_tube_dri/cnt_w [3]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c3 ),
    .o({\u_tube_dri/add0/c4 ,\u_tube_dri/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u4  (
    .a(\u_tube_dri/cnt_w [4]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c4 ),
    .o({\u_tube_dri/add0/c5 ,\u_tube_dri/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u5  (
    .a(\u_tube_dri/cnt_w [5]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c5 ),
    .o({\u_tube_dri/add0/c6 ,\u_tube_dri/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u6  (
    .a(\u_tube_dri/cnt_w [6]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c6 ),
    .o({\u_tube_dri/add0/c7 ,\u_tube_dri/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u7  (
    .a(\u_tube_dri/cnt_w [7]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c7 ),
    .o({\u_tube_dri/add0/c8 ,\u_tube_dri/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u8  (
    .a(\u_tube_dri/cnt_w [8]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c8 ),
    .o({\u_tube_dri/add0/c9 ,\u_tube_dri/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/add0/u9  (
    .a(\u_tube_dri/cnt_w [9]),
    .b(1'b0),
    .c(\u_tube_dri/add0/c9 ),
    .o({\u_tube_dri/add0/c10 ,\u_tube_dri/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_tube_dri/add0/ucin  (
    .a(1'b0),
    .o({\u_tube_dri/add0/c0 ,open_n271}));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*~B*C*~D)"),
    .INIT(16'b0000000000010010))
    \u_tube_dri/mux2_b0_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[0]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*C*~D+~A*B*C*~D)"),
    .INIT(16'b0000000001100000))
    \u_tube_dri/mux2_b1_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[1]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    .INIT(16'b0000000010010010))
    \u_tube_dri/mux2_b3_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[3]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D)"),
    .INIT(16'b0000001010111010))
    \u_tube_dri/mux2_b4_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[4]));
  AL_MAP_LUT4 #(
    .EQN("(A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*B*C*~D)"),
    .INIT(16'b0000000010001110))
    \u_tube_dri/mux2_b5_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~B*~C*~D+A*~B*~C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D)"),
    .INIT(16'b1111110010000011))
    \u_tube_dri/mux2_b6_rom0  (
    .a(\u_tube_dri/sm_seg_num [0]),
    .b(\u_tube_dri/sm_seg_num [1]),
    .c(\u_tube_dri/sm_seg_num [2]),
    .d(\u_tube_dri/sm_seg_num [3]),
    .o(tube_pad[6]));
  reg_ar_as_w1 \u_tube_dri/reg0_b0  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n2 [0]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [0]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b1  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n2 [1]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [1]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b2  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n2 [2]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [2]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg0_b3  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n2 [3]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/sm_seg_num [3]));  // src/rtl/tube/tube_dri.v(76)
  reg_ar_as_w1 \u_tube_dri/reg1_b0  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [0]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [0]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b1  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [1]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [1]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b10  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [10]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [10]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b11  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [11]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [11]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b12  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [12]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [12]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b13  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [13]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [13]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b14  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [14]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [14]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b15  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [15]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [15]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b16  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [16]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [16]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b17  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [17]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [17]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b2  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [2]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [2]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b3  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [3]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [3]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b4  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [4]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [4]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b5  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [5]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [5]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b6  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [6]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [6]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b7  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [7]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [7]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b8  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [8]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [8]));  // src/rtl/tube/tube_dri.v(61)
  reg_ar_as_w1 \u_tube_dri/reg1_b9  (
    .clk(sclk_pad),
    .d(\u_tube_dri/n1 [9]),
    .en(1'b1),
    .reset(~\u_tube_dri/rst_n ),
    .set(1'b0),
    .q(\u_tube_dri/cnt_w [9]));  // src/rtl/tube/tube_dri.v(61)
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
    .do({open_n272,open_n273,open_n274,\u_tube_dri/mux1_b0_sel_is_0_o_neg }),
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
    .do({open_n286,open_n287,open_n288,\u_tube_dri/mux1_b1_sel_is_1_o_neg }),
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
    .do({open_n300,open_n301,open_n302,\u_tube_dri/mux1_b2_sel_is_2_o_neg }),
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
    .do({open_n314,open_n315,open_n316,\u_tube_dri/mux1_b3_sel_is_3_o_neg }),
    .osclk(sclk_pad),
    .rst(\u_tube_dri/rst_n ),
    .opad(tube_sel[3]));  // src/rtl/tube/tube_dri.v(91)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/ux_rst/add0/u0  (
    .a(\u_tube_dri/ux_rst/cnt [0]),
    .b(1'b1),
    .c(\u_tube_dri/ux_rst/add0/c0 ),
    .o({\u_tube_dri/ux_rst/add0/c1 ,\u_tube_dri/ux_rst/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/ux_rst/add0/u1  (
    .a(\u_tube_dri/ux_rst/cnt [1]),
    .b(1'b0),
    .c(\u_tube_dri/ux_rst/add0/c1 ),
    .o({\u_tube_dri/ux_rst/add0/c2 ,\u_tube_dri/ux_rst/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/ux_rst/add0/u2  (
    .a(\u_tube_dri/ux_rst/cnt [2]),
    .b(1'b0),
    .c(\u_tube_dri/ux_rst/add0/c2 ),
    .o({\u_tube_dri/ux_rst/add0/c3 ,\u_tube_dri/ux_rst/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_tube_dri/ux_rst/add0/u3  (
    .a(\u_tube_dri/ux_rst/cnt [3]),
    .b(1'b0),
    .c(\u_tube_dri/ux_rst/add0/c3 ),
    .o({open_n328,\u_tube_dri/ux_rst/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_tube_dri/ux_rst/add0/ucin  (
    .a(1'b0),
    .o({\u_tube_dri/ux_rst/add0/c0 ,open_n331}));
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b0  (
    .clk(sclk_pad),
    .d(\u_tube_dri/ux_rst/n1 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [0]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b1  (
    .clk(sclk_pad),
    .d(\u_tube_dri/ux_rst/n1 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [1]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b2  (
    .clk(sclk_pad),
    .d(\u_tube_dri/ux_rst/n1 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [2]));  // src/rtl/tube/rst.v(28)
  reg_ar_ss_w1 \u_tube_dri/ux_rst/reg0_b3  (
    .clk(sclk_pad),
    .d(\u_tube_dri/ux_rst/n1 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(\u_tube_dri/ux_rst/n0 ),
    .q(\u_tube_dri/ux_rst/cnt [3]));  // src/rtl/tube/rst.v(28)
  reg_ar_as_w1 \u_tube_dri/ux_rst/rst_n_reg  (
    .clk(sclk_pad),
    .d(\u_tube_dri/ux_rst/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_tube_dri/rst_n ));  // src/rtl/tube/rst.v(36)
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
  wire [31:0] \u_flash_read/n4 ;
  wire [2:0] \u_flash_read/phase_cnt ;  // src/rtl/flash/flash_read.v(43)
  wire [7:0] \u_flash_read/rx_reg ;  // src/rtl/flash/flash_read.v(45)
  wire [31:0] \u_flash_read/tx_reg ;  // src/rtl/flash/flash_read.v(44)
  wire [9:0] \u_flash_sector_erase/cnt ;  // src/rtl/flash/flash_sector_erase.v(39)
  wire [6:0] \u_flash_sector_erase/cycle_cnt ;  // src/rtl/flash/flash_sector_erase.v(40)
  wire [9:0] \u_flash_sector_erase/n0 ;
  wire [31:0] \u_flash_sector_erase/n4 ;
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
  wire [39:0] \u_flash_write/n4 ;
  wire [2:0] \u_flash_write/phase_cnt ;  // src/rtl/flash/flash_write.v(42)
  wire [39:0] \u_flash_write/tx_reg ;  // src/rtl/flash/flash_write.v(43)
  wire [9:0] \u_flash_write_enable/cnt ;  // src/rtl/flash/flash_write_enable.v(36)
  wire [6:0] \u_flash_write_enable/cycle_cnt ;  // src/rtl/flash/flash_write_enable.v(37)
  wire [9:0] \u_flash_write_enable/n0 ;
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
  wire n1;
  wire n11;
  wire n13;
  wire n15;
  wire n16;
  wire n20;
  wire n21;
  wire n22;
  wire n24;
  wire n25;
  wire n26;
  wire n3;
  wire n33;
  wire n5;
  wire n7;
  wire n9;
  wire start_erase;  // src/rtl/flash/flash_dri.v(94)
  wire start_frd;  // src/rtl/flash/flash_dri.v(98)
  wire start_id;  // src/rtl/flash/flash_dri.v(99)
  wire start_rd;  // src/rtl/flash/flash_dri.v(97)
  wire start_sector;  // src/rtl/flash/flash_dri.v(95)
  wire start_wen;  // src/rtl/flash/flash_dri.v(92)
  wire start_wfree;  // src/rtl/flash/flash_dri.v(93)
  wire start_wr;  // src/rtl/flash/flash_dri.v(96)
  wire \u_flash_erase/add0/c0 ;
  wire \u_flash_erase/add0/c1 ;
  wire \u_flash_erase/add0/c2 ;
  wire \u_flash_erase/add0/c3 ;
  wire \u_flash_erase/add0/c4 ;
  wire \u_flash_erase/add0/c5 ;
  wire \u_flash_erase/add0/c6 ;
  wire \u_flash_erase/add0/c7 ;
  wire \u_flash_erase/add0/c8 ;
  wire \u_flash_erase/add0/c9 ;
  wire \u_flash_erase/n2 ;
  wire \u_flash_erase/n5 ;
  wire \u_flash_erase/n6 ;
  wire \u_flash_erase/sft_wen ;  // src/rtl/flash/flash_erase.v(40)
  wire \u_flash_id/add0/c0 ;
  wire \u_flash_id/add0/c1 ;
  wire \u_flash_id/add0/c2 ;
  wire \u_flash_id/add0/c3 ;
  wire \u_flash_id/add0/c4 ;
  wire \u_flash_id/add0/c5 ;
  wire \u_flash_id/add0/c6 ;
  wire \u_flash_id/add0/c7 ;
  wire \u_flash_id/add0/c8 ;
  wire \u_flash_id/add0/c9 ;
  wire \u_flash_id/byte_flag ;  // src/rtl/flash/flash_id.v(44)
  wire \u_flash_id/lt0_c0 ;
  wire \u_flash_id/lt0_c1 ;
  wire \u_flash_id/lt0_c2 ;
  wire \u_flash_id/lt0_c3 ;
  wire \u_flash_id/lt0_c4 ;
  wire \u_flash_id/lt0_c5 ;
  wire \u_flash_id/lt0_c6 ;
  wire \u_flash_id/lt0_c7 ;
  wire \u_flash_id/lt1_c0 ;
  wire \u_flash_id/lt1_c1 ;
  wire \u_flash_id/lt1_c2 ;
  wire \u_flash_id/lt1_c3 ;
  wire \u_flash_id/lt1_c4 ;
  wire \u_flash_id/lt1_c5 ;
  wire \u_flash_id/lt1_c6 ;
  wire \u_flash_id/lt1_c7 ;
  wire \u_flash_id/n10 ;
  wire \u_flash_id/n14 ;
  wire \u_flash_id/n17 ;
  wire \u_flash_id/n2 ;
  wire \u_flash_id/n5 ;
  wire \u_flash_id/n7 ;
  wire \u_flash_id/n9 ;
  wire \u_flash_id/sft_ren ;  // src/rtl/flash/flash_id.v(43)
  wire \u_flash_id/sft_wen ;  // src/rtl/flash/flash_id.v(42)
  wire \u_flash_read/add0/c0 ;
  wire \u_flash_read/add0/c1 ;
  wire \u_flash_read/add0/c2 ;
  wire \u_flash_read/add0/c3 ;
  wire \u_flash_read/add0/c4 ;
  wire \u_flash_read/add0/c5 ;
  wire \u_flash_read/add0/c6 ;
  wire \u_flash_read/add0/c7 ;
  wire \u_flash_read/add0/c8 ;
  wire \u_flash_read/add0/c9 ;
  wire \u_flash_read/byte_flag ;  // src/rtl/flash/flash_read.v(48)
  wire \u_flash_read/lt0_c0 ;
  wire \u_flash_read/lt0_c1 ;
  wire \u_flash_read/lt0_c2 ;
  wire \u_flash_read/lt0_c3 ;
  wire \u_flash_read/lt0_c4 ;
  wire \u_flash_read/lt0_c5 ;
  wire \u_flash_read/lt0_c6 ;
  wire \u_flash_read/lt0_c7 ;
  wire \u_flash_read/n12 ;
  wire \u_flash_read/n15 ;
  wire \u_flash_read/n2 ;
  wire \u_flash_read/n5 ;
  wire \u_flash_read/n7 ;
  wire \u_flash_read/n8 ;
  wire \u_flash_read/sft_ren ;  // src/rtl/flash/flash_read.v(47)
  wire \u_flash_read/sft_wen ;  // src/rtl/flash/flash_read.v(46)
  wire \u_flash_sector_erase/add0/c0 ;
  wire \u_flash_sector_erase/add0/c1 ;
  wire \u_flash_sector_erase/add0/c2 ;
  wire \u_flash_sector_erase/add0/c3 ;
  wire \u_flash_sector_erase/add0/c4 ;
  wire \u_flash_sector_erase/add0/c5 ;
  wire \u_flash_sector_erase/add0/c6 ;
  wire \u_flash_sector_erase/add0/c7 ;
  wire \u_flash_sector_erase/add0/c8 ;
  wire \u_flash_sector_erase/add0/c9 ;
  wire \u_flash_sector_erase/n2 ;
  wire \u_flash_sector_erase/n5 ;
  wire \u_flash_sector_erase/n6 ;
  wire \u_flash_sector_erase/sft_wen ;  // src/rtl/flash/flash_sector_erase.v(43)
  wire \u_flash_wait_free/add0/c0 ;
  wire \u_flash_wait_free/add0/c1 ;
  wire \u_flash_wait_free/add0/c10 ;
  wire \u_flash_wait_free/add0/c11 ;
  wire \u_flash_wait_free/add0/c12 ;
  wire \u_flash_wait_free/add0/c13 ;
  wire \u_flash_wait_free/add0/c14 ;
  wire \u_flash_wait_free/add0/c15 ;
  wire \u_flash_wait_free/add0/c16 ;
  wire \u_flash_wait_free/add0/c17 ;
  wire \u_flash_wait_free/add0/c18 ;
  wire \u_flash_wait_free/add0/c19 ;
  wire \u_flash_wait_free/add0/c2 ;
  wire \u_flash_wait_free/add0/c20 ;
  wire \u_flash_wait_free/add0/c21 ;
  wire \u_flash_wait_free/add0/c22 ;
  wire \u_flash_wait_free/add0/c23 ;
  wire \u_flash_wait_free/add0/c24 ;
  wire \u_flash_wait_free/add0/c25 ;
  wire \u_flash_wait_free/add0/c26 ;
  wire \u_flash_wait_free/add0/c27 ;
  wire \u_flash_wait_free/add0/c28 ;
  wire \u_flash_wait_free/add0/c29 ;
  wire \u_flash_wait_free/add0/c3 ;
  wire \u_flash_wait_free/add0/c30 ;
  wire \u_flash_wait_free/add0/c31 ;
  wire \u_flash_wait_free/add0/c4 ;
  wire \u_flash_wait_free/add0/c5 ;
  wire \u_flash_wait_free/add0/c6 ;
  wire \u_flash_wait_free/add0/c7 ;
  wire \u_flash_wait_free/add0/c8 ;
  wire \u_flash_wait_free/add0/c9 ;
  wire \u_flash_wait_free/byte_flag ;  // src/rtl/flash/flash_wait_free.v(43)
  wire \u_flash_wait_free/fls_busy ;  // src/rtl/flash/flash_wait_free.v(44)
  wire \u_flash_wait_free/lt0_c0 ;
  wire \u_flash_wait_free/lt0_c1 ;
  wire \u_flash_wait_free/lt0_c10 ;
  wire \u_flash_wait_free/lt0_c11 ;
  wire \u_flash_wait_free/lt0_c12 ;
  wire \u_flash_wait_free/lt0_c13 ;
  wire \u_flash_wait_free/lt0_c14 ;
  wire \u_flash_wait_free/lt0_c15 ;
  wire \u_flash_wait_free/lt0_c16 ;
  wire \u_flash_wait_free/lt0_c17 ;
  wire \u_flash_wait_free/lt0_c18 ;
  wire \u_flash_wait_free/lt0_c19 ;
  wire \u_flash_wait_free/lt0_c2 ;
  wire \u_flash_wait_free/lt0_c20 ;
  wire \u_flash_wait_free/lt0_c21 ;
  wire \u_flash_wait_free/lt0_c22 ;
  wire \u_flash_wait_free/lt0_c23 ;
  wire \u_flash_wait_free/lt0_c24 ;
  wire \u_flash_wait_free/lt0_c25 ;
  wire \u_flash_wait_free/lt0_c26 ;
  wire \u_flash_wait_free/lt0_c27 ;
  wire \u_flash_wait_free/lt0_c28 ;
  wire \u_flash_wait_free/lt0_c29 ;
  wire \u_flash_wait_free/lt0_c3 ;
  wire \u_flash_wait_free/lt0_c4 ;
  wire \u_flash_wait_free/lt0_c5 ;
  wire \u_flash_wait_free/lt0_c6 ;
  wire \u_flash_wait_free/lt0_c7 ;
  wire \u_flash_wait_free/lt0_c8 ;
  wire \u_flash_wait_free/lt0_c9 ;
  wire \u_flash_wait_free/n12 ;
  wire \u_flash_wait_free/n18 ;
  wire \u_flash_wait_free/n2 ;
  wire \u_flash_wait_free/n5 ;
  wire \u_flash_wait_free/n7 ;
  wire \u_flash_wait_free/n8 ;
  wire \u_flash_wait_free/sft_ren ;  // src/rtl/flash/flash_wait_free.v(42)
  wire \u_flash_wait_free/sft_wen ;  // src/rtl/flash/flash_wait_free.v(41)
  wire \u_flash_write/add0/c0 ;
  wire \u_flash_write/add0/c1 ;
  wire \u_flash_write/add0/c2 ;
  wire \u_flash_write/add0/c3 ;
  wire \u_flash_write/add0/c4 ;
  wire \u_flash_write/add0/c5 ;
  wire \u_flash_write/add0/c6 ;
  wire \u_flash_write/add0/c7 ;
  wire \u_flash_write/add0/c8 ;
  wire \u_flash_write/add0/c9 ;
  wire \u_flash_write/n2 ;
  wire \u_flash_write/n5 ;
  wire \u_flash_write/n6 ;
  wire \u_flash_write/sft_wen ;  // src/rtl/flash/flash_write.v(44)
  wire \u_flash_write_enable/add0/c0 ;
  wire \u_flash_write_enable/add0/c1 ;
  wire \u_flash_write_enable/add0/c2 ;
  wire \u_flash_write_enable/add0/c3 ;
  wire \u_flash_write_enable/add0/c4 ;
  wire \u_flash_write_enable/add0/c5 ;
  wire \u_flash_write_enable/add0/c6 ;
  wire \u_flash_write_enable/add0/c7 ;
  wire \u_flash_write_enable/add0/c8 ;
  wire \u_flash_write_enable/add0/c9 ;
  wire \u_flash_write_enable/n2 ;
  wire \u_flash_write_enable/n5 ;
  wire \u_flash_write_enable/n6 ;
  wire \u_flash_write_enable/sft_wen ;  // src/rtl/flash/flash_write_enable.v(40)

  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u100 (
    .a(_al_u99_o),
    .b(fls_addr[14]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [14]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u101 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [12]),
    .c(\u_flash_sector_erase/tx_reg [13]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u101_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u102 (
    .a(_al_u101_o),
    .b(fls_addr[13]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [13]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u103 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [11]),
    .c(\u_flash_sector_erase/tx_reg [12]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u103_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u104 (
    .a(_al_u103_o),
    .b(fls_addr[12]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [12]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u105 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [10]),
    .c(\u_flash_sector_erase/tx_reg [11]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u105_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u106 (
    .a(_al_u105_o),
    .b(fls_addr[11]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [11]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .INIT(16'h0511))
    _al_u107 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [10]),
    .c(\u_flash_sector_erase/tx_reg [9]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u107_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u108 (
    .a(_al_u107_o),
    .b(fls_addr[10]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u109 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [0]),
    .c(\u_flash_sector_erase/tx_reg [1]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u109_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u110 (
    .a(_al_u109_o),
    .b(fls_addr[1]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [1]));
  AL_MAP_LUT4 #(
    .EQN("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    .INIT(16'h88b8))
    _al_u111 (
    .a(fls_addr[0]),
    .b(start_sector),
    .c(\u_flash_sector_erase/tx_reg [0]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(\u_flash_sector_erase/n4 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u112 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [8]),
    .c(\u_flash_write/tx_reg [9]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u112_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u113 (
    .a(_al_u112_o),
    .b(fls_addr[1]),
    .c(start_wr),
    .o(\u_flash_write/n4 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u114 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [7]),
    .c(\u_flash_write/tx_reg [8]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u114_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u115 (
    .a(_al_u114_o),
    .b(fls_addr[0]),
    .c(start_wr),
    .o(\u_flash_write/n4 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u116 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [6]),
    .c(\u_flash_write/tx_reg [7]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u116_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u117 (
    .a(_al_u116_o),
    .b(fls_write[7]),
    .c(start_wr),
    .o(\u_flash_write/n4 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u118 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [5]),
    .c(\u_flash_write/tx_reg [6]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u118_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u119 (
    .a(_al_u118_o),
    .b(fls_write[6]),
    .c(start_wr),
    .o(\u_flash_write/n4 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u120 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [4]),
    .c(\u_flash_write/tx_reg [5]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u120_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u121 (
    .a(_al_u120_o),
    .b(fls_write[5]),
    .c(start_wr),
    .o(\u_flash_write/n4 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u122 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [3]),
    .c(\u_flash_write/tx_reg [4]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u122_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u123 (
    .a(_al_u122_o),
    .b(fls_write[4]),
    .c(start_wr),
    .o(\u_flash_write/n4 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u124 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [30]),
    .c(\u_flash_write/tx_reg [31]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u124_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u125 (
    .a(_al_u124_o),
    .b(fls_addr[23]),
    .c(start_wr),
    .o(\u_flash_write/n4 [31]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u126 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [29]),
    .c(\u_flash_write/tx_reg [30]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u126_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u127 (
    .a(_al_u126_o),
    .b(fls_addr[22]),
    .c(start_wr),
    .o(\u_flash_write/n4 [30]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u128 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [2]),
    .c(\u_flash_write/tx_reg [3]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u128_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u129 (
    .a(_al_u128_o),
    .b(fls_write[3]),
    .c(start_wr),
    .o(\u_flash_write/n4 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u130 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [28]),
    .c(\u_flash_write/tx_reg [29]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u130_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u131 (
    .a(_al_u130_o),
    .b(fls_addr[21]),
    .c(start_wr),
    .o(\u_flash_write/n4 [29]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u132 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [27]),
    .c(\u_flash_write/tx_reg [28]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u132_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u133 (
    .a(_al_u132_o),
    .b(fls_addr[20]),
    .c(start_wr),
    .o(\u_flash_write/n4 [28]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u134 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [26]),
    .c(\u_flash_write/tx_reg [27]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u134_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u135 (
    .a(_al_u134_o),
    .b(fls_addr[19]),
    .c(start_wr),
    .o(\u_flash_write/n4 [27]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u136 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [25]),
    .c(\u_flash_write/tx_reg [26]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u136_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u137 (
    .a(_al_u136_o),
    .b(fls_addr[18]),
    .c(start_wr),
    .o(\u_flash_write/n4 [26]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u138 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [24]),
    .c(\u_flash_write/tx_reg [25]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u138_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u139 (
    .a(_al_u138_o),
    .b(fls_addr[17]),
    .c(start_wr),
    .o(\u_flash_write/n4 [25]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u140 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [23]),
    .c(\u_flash_write/tx_reg [24]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u140_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u141 (
    .a(_al_u140_o),
    .b(fls_addr[16]),
    .c(start_wr),
    .o(\u_flash_write/n4 [24]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u142 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [22]),
    .c(\u_flash_write/tx_reg [23]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u142_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u143 (
    .a(_al_u142_o),
    .b(fls_addr[15]),
    .c(start_wr),
    .o(\u_flash_write/n4 [23]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u144 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [21]),
    .c(\u_flash_write/tx_reg [22]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u144_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u145 (
    .a(_al_u144_o),
    .b(fls_addr[14]),
    .c(start_wr),
    .o(\u_flash_write/n4 [22]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u146 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [20]),
    .c(\u_flash_write/tx_reg [21]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u146_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u147 (
    .a(_al_u146_o),
    .b(fls_addr[13]),
    .c(start_wr),
    .o(\u_flash_write/n4 [21]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u148 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [19]),
    .c(\u_flash_write/tx_reg [20]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u148_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u149 (
    .a(_al_u148_o),
    .b(fls_addr[12]),
    .c(start_wr),
    .o(\u_flash_write/n4 [20]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u150 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [1]),
    .c(\u_flash_write/tx_reg [2]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u150_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u151 (
    .a(_al_u150_o),
    .b(fls_write[2]),
    .c(start_wr),
    .o(\u_flash_write/n4 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u152 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [18]),
    .c(\u_flash_write/tx_reg [19]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u152_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u153 (
    .a(_al_u152_o),
    .b(fls_addr[11]),
    .c(start_wr),
    .o(\u_flash_write/n4 [19]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u154 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [17]),
    .c(\u_flash_write/tx_reg [18]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u154_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u155 (
    .a(_al_u154_o),
    .b(fls_addr[10]),
    .c(start_wr),
    .o(\u_flash_write/n4 [18]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u156 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [16]),
    .c(\u_flash_write/tx_reg [17]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u156_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u157 (
    .a(_al_u156_o),
    .b(fls_addr[9]),
    .c(start_wr),
    .o(\u_flash_write/n4 [17]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u158 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [15]),
    .c(\u_flash_write/tx_reg [16]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u158_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u159 (
    .a(_al_u158_o),
    .b(fls_addr[8]),
    .c(start_wr),
    .o(\u_flash_write/n4 [16]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u160 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [14]),
    .c(\u_flash_write/tx_reg [15]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u160_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u161 (
    .a(_al_u160_o),
    .b(fls_addr[7]),
    .c(start_wr),
    .o(\u_flash_write/n4 [15]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u162 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [13]),
    .c(\u_flash_write/tx_reg [14]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u162_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u163 (
    .a(_al_u162_o),
    .b(fls_addr[6]),
    .c(start_wr),
    .o(\u_flash_write/n4 [14]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u164 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [12]),
    .c(\u_flash_write/tx_reg [13]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u164_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u165 (
    .a(_al_u164_o),
    .b(fls_addr[5]),
    .c(start_wr),
    .o(\u_flash_write/n4 [13]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u166 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [11]),
    .c(\u_flash_write/tx_reg [12]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u166_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u167 (
    .a(_al_u166_o),
    .b(fls_addr[4]),
    .c(start_wr),
    .o(\u_flash_write/n4 [12]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u168 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [10]),
    .c(\u_flash_write/tx_reg [11]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u168_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u169 (
    .a(_al_u168_o),
    .b(fls_addr[3]),
    .c(start_wr),
    .o(\u_flash_write/n4 [11]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .INIT(16'h0511))
    _al_u170 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [10]),
    .c(\u_flash_write/tx_reg [9]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u170_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u171 (
    .a(_al_u170_o),
    .b(fls_addr[2]),
    .c(start_wr),
    .o(\u_flash_write/n4 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u172 (
    .a(start_wr),
    .b(\u_flash_write/tx_reg [0]),
    .c(\u_flash_write/tx_reg [1]),
    .d(\u_flash_write/sft_wen ),
    .o(_al_u172_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u173 (
    .a(_al_u172_o),
    .b(fls_write[1]),
    .c(start_wr),
    .o(\u_flash_write/n4 [1]));
  AL_MAP_LUT4 #(
    .EQN("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    .INIT(16'h88b8))
    _al_u174 (
    .a(fls_write[0]),
    .b(start_wr),
    .c(\u_flash_write/tx_reg [0]),
    .d(\u_flash_write/sft_wen ),
    .o(\u_flash_write/n4 [0]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u175 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_ncs_rd),
    .o(_al_u175_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u176 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .o(_al_u176_o));
  AL_MAP_LUT4 #(
    .EQN("(B*A*~(~D*C))"),
    .INIT(16'h8808))
    _al_u177 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_ncs_sector),
    .o(_al_u177_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(~D*~C)))"),
    .INIT(16'h1115))
    _al_u178 (
    .a(_al_u175_o),
    .b(_al_u177_o),
    .c(mod_sel[0]),
    .d(fls_ncs_id),
    .o(_al_u178_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u179 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_ncs_frd),
    .o(_al_u179_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u18 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [8]),
    .c(\u_flash_read/tx_reg [9]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u18_o));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u180 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .o(_al_u180_o));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u181 (
    .a(_al_u180_o),
    .b(mod_sel[0]),
    .c(fls_ncs_erase),
    .d(fls_ncs_wr),
    .o(_al_u181_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u182 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .o(_al_u182_o));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u183 (
    .a(_al_u182_o),
    .b(mod_sel[0]),
    .c(fls_ncs_wfree),
    .d(fls_ncs_wen),
    .o(_al_u183_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*~C*~B*A)"),
    .INIT(16'hfffd))
    _al_u184 (
    .a(_al_u178_o),
    .b(_al_u181_o),
    .c(_al_u183_o),
    .d(_al_u179_o),
    .o(n25));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u185 (
    .a(_al_u182_o),
    .b(mod_sel[0]),
    .c(fls_sck_wfree),
    .d(fls_sck_wen),
    .o(_al_u185_o));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u186 (
    .a(_al_u176_o),
    .b(mod_sel[0]),
    .c(fls_sck_id),
    .d(fls_sck_sector),
    .o(_al_u186_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u187 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sck_rd),
    .o(_al_u187_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u188 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sck_frd),
    .o(_al_u188_o));
  AL_MAP_LUT4 #(
    .EQN("(B*~A*~(~D*C))"),
    .INIT(16'h4404))
    _al_u189 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sck_wr),
    .o(_al_u189_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u19 (
    .a(_al_u18_o),
    .b(fls_addr[9]),
    .c(start_rd),
    .o(\u_flash_read/n4 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(~D*~C)))"),
    .INIT(16'h1115))
    _al_u190 (
    .a(_al_u188_o),
    .b(_al_u189_o),
    .c(mod_sel[0]),
    .d(fls_sck_erase),
    .o(_al_u190_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*C*~B*~A)"),
    .INIT(16'hffef))
    _al_u191 (
    .a(_al_u185_o),
    .b(_al_u186_o),
    .c(_al_u190_o),
    .d(_al_u187_o),
    .o(n24));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u192 (
    .a(_al_u182_o),
    .b(mod_sel[0]),
    .c(fls_sdo_wfree),
    .d(fls_sdo_wen),
    .o(_al_u192_o));
  AL_MAP_LUT4 #(
    .EQN("(A*(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B))"),
    .INIT(16'ha820))
    _al_u193 (
    .a(_al_u176_o),
    .b(mod_sel[0]),
    .c(fls_sdo_id),
    .d(fls_sdo_sector),
    .o(_al_u193_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u194 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sdo_frd),
    .o(_al_u194_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u195 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sdo_rd),
    .o(_al_u195_o));
  AL_MAP_LUT4 #(
    .EQN("(B*~A*~(~D*C))"),
    .INIT(16'h4404))
    _al_u196 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(fls_sdo_wr),
    .o(_al_u196_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(~D*~C)))"),
    .INIT(16'h1115))
    _al_u197 (
    .a(_al_u195_o),
    .b(_al_u196_o),
    .c(mod_sel[0]),
    .d(fls_sdo_erase),
    .o(_al_u197_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*C*~B*~A)"),
    .INIT(16'hffef))
    _al_u198 (
    .a(_al_u192_o),
    .b(_al_u193_o),
    .c(_al_u197_o),
    .d(_al_u194_o),
    .o(n26));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u199 (
    .a(_al_u182_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n1));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u20 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [7]),
    .c(\u_flash_read/tx_reg [8]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u20_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u200 (
    .a(_al_u182_o),
    .b(fls_sdi),
    .c(mod_sel[0]),
    .o(n16));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u201 (
    .a(_al_u182_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n3));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u202 (
    .a(fls_sck_erase),
    .b(\u_flash_erase/phase_cnt [0]),
    .c(\u_flash_erase/phase_cnt [1]),
    .o(\u_flash_erase/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u203 (
    .a(fls_sck_id),
    .b(\u_flash_id/phase_cnt [0]),
    .c(\u_flash_id/phase_cnt [1]),
    .o(\u_flash_id/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u204 (
    .a(fls_sck_rd),
    .b(\u_flash_read/phase_cnt [0]),
    .c(\u_flash_read/phase_cnt [1]),
    .o(\u_flash_read/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u205 (
    .a(fls_sck_sector),
    .b(\u_flash_sector_erase/phase_cnt [0]),
    .c(\u_flash_sector_erase/phase_cnt [1]),
    .o(\u_flash_sector_erase/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u206 (
    .a(fls_sck_wfree),
    .b(\u_flash_wait_free/phase_cnt [0]),
    .c(\u_flash_wait_free/phase_cnt [1]),
    .o(\u_flash_wait_free/n5 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u207 (
    .a(\u_flash_wait_free/fls_busy ),
    .b(fls_sck_wfree),
    .c(\u_flash_wait_free/phase_cnt [0]),
    .d(\u_flash_wait_free/phase_cnt [1]),
    .o(\u_flash_wait_free/n18 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u208 (
    .a(fls_sck_wr),
    .b(\u_flash_write/phase_cnt [0]),
    .c(\u_flash_write/phase_cnt [1]),
    .o(\u_flash_write/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u209 (
    .a(fls_sck_wen),
    .b(\u_flash_write_enable/phase_cnt [0]),
    .c(\u_flash_write_enable/phase_cnt [1]),
    .o(\u_flash_write_enable/n5 ));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u21 (
    .a(_al_u20_o),
    .b(fls_addr[8]),
    .c(start_rd),
    .o(\u_flash_read/n4 [8]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u210 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(start),
    .o(n11));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*A)"),
    .INIT(16'h0800))
    _al_u211 (
    .a(fls_sdi),
    .b(mod_sel[2]),
    .c(mod_sel[1]),
    .d(mod_sel[0]),
    .o(n21));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u212 (
    .a(mod_sel[2]),
    .b(mod_sel[1]),
    .c(mod_sel[0]),
    .d(start),
    .o(n9));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u213 (
    .a(fls_sdi),
    .b(mod_sel[2]),
    .c(mod_sel[1]),
    .d(mod_sel[0]),
    .o(n20));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u214 (
    .a(_al_u176_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n15));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u215 (
    .a(_al_u176_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n13));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u216 (
    .a(_al_u176_o),
    .b(fls_sdi),
    .c(mod_sel[0]),
    .o(n22));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u217 (
    .a(_al_u180_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n7));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u218 (
    .a(_al_u180_o),
    .b(mod_sel[0]),
    .c(start),
    .o(n5));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u219 (
    .a(\u_flash_erase/cycle_cnt [0]),
    .b(\u_flash_erase/cycle_cnt [1]),
    .c(\u_flash_erase/cycle_cnt [2]),
    .d(\u_flash_erase/cycle_cnt [3]),
    .o(_al_u219_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u22 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [6]),
    .c(\u_flash_read/tx_reg [7]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u22_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u220 (
    .a(_al_u219_o),
    .b(\u_flash_erase/cycle_cnt [4]),
    .c(\u_flash_erase/cycle_cnt [5]),
    .d(\u_flash_erase/cycle_cnt [6]),
    .o(\u_flash_erase/n6 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u221 (
    .a(\u_flash_id/cycle_cnt [0]),
    .b(\u_flash_id/cycle_cnt [1]),
    .c(\u_flash_id/cycle_cnt [2]),
    .d(\u_flash_id/cycle_cnt [3]),
    .o(_al_u221_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u222 (
    .a(_al_u221_o),
    .b(\u_flash_id/cycle_cnt [4]),
    .c(\u_flash_id/cycle_cnt [5]),
    .d(\u_flash_id/cycle_cnt [6]),
    .o(\u_flash_id/n17 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u223 (
    .a(\u_flash_read/cycle_cnt [0]),
    .b(\u_flash_read/cycle_cnt [1]),
    .c(\u_flash_read/cycle_cnt [2]),
    .d(\u_flash_read/cycle_cnt [3]),
    .o(_al_u223_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u224 (
    .a(_al_u223_o),
    .b(\u_flash_read/cycle_cnt [4]),
    .c(\u_flash_read/cycle_cnt [5]),
    .d(\u_flash_read/cycle_cnt [6]),
    .o(\u_flash_read/n15 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    _al_u225 (
    .a(fls_sck_rd),
    .b(\u_flash_read/n7 ),
    .c(\u_flash_read/phase_cnt [0]),
    .d(\u_flash_read/phase_cnt [1]),
    .o(\u_flash_read/n8 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u226 (
    .a(\u_flash_sector_erase/cycle_cnt [0]),
    .b(\u_flash_sector_erase/cycle_cnt [1]),
    .c(\u_flash_sector_erase/cycle_cnt [2]),
    .d(\u_flash_sector_erase/cycle_cnt [3]),
    .o(_al_u226_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u227 (
    .a(_al_u226_o),
    .b(\u_flash_sector_erase/cycle_cnt [4]),
    .c(\u_flash_sector_erase/cycle_cnt [5]),
    .d(\u_flash_sector_erase/cycle_cnt [6]),
    .o(\u_flash_sector_erase/n6 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    _al_u228 (
    .a(fls_sck_wfree),
    .b(\u_flash_wait_free/n7 ),
    .c(\u_flash_wait_free/phase_cnt [0]),
    .d(\u_flash_wait_free/phase_cnt [1]),
    .o(\u_flash_wait_free/n8 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u229 (
    .a(\u_flash_write/cycle_cnt [0]),
    .b(\u_flash_write/cycle_cnt [1]),
    .c(\u_flash_write/cycle_cnt [2]),
    .d(\u_flash_write/cycle_cnt [3]),
    .o(_al_u229_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u23 (
    .a(_al_u22_o),
    .b(fls_addr[7]),
    .c(start_rd),
    .o(\u_flash_read/n4 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u230 (
    .a(_al_u229_o),
    .b(\u_flash_write/cycle_cnt [4]),
    .c(\u_flash_write/cycle_cnt [5]),
    .d(\u_flash_write/cycle_cnt [6]),
    .o(\u_flash_write/n6 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u231 (
    .a(\u_flash_write_enable/cycle_cnt [0]),
    .b(\u_flash_write_enable/cycle_cnt [1]),
    .c(\u_flash_write_enable/cycle_cnt [2]),
    .d(\u_flash_write_enable/cycle_cnt [3]),
    .o(_al_u231_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u232 (
    .a(_al_u231_o),
    .b(\u_flash_write_enable/cycle_cnt [4]),
    .c(\u_flash_write_enable/cycle_cnt [5]),
    .d(\u_flash_write_enable/cycle_cnt [6]),
    .o(\u_flash_write_enable/n6 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u233 (
    .a(fls_sck_id),
    .b(\u_flash_id/n7 ),
    .c(\u_flash_id/cycle_cnt [0]),
    .d(\u_flash_id/cycle_cnt [1]),
    .o(_al_u233_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u234 (
    .a(_al_u233_o),
    .b(\u_flash_id/cycle_cnt [2]),
    .c(\u_flash_id/phase_cnt [0]),
    .d(\u_flash_id/phase_cnt [1]),
    .o(\u_flash_id/n14 ));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u235 (
    .a(\u_flash_id/n9 ),
    .b(\u_flash_id/phase_cnt [0]),
    .c(\u_flash_id/phase_cnt [1]),
    .o(_al_u235_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u236 (
    .a(_al_u235_o),
    .b(fls_sck_id),
    .c(\u_flash_id/n7 ),
    .o(\u_flash_id/n10 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u237 (
    .a(fls_sck_rd),
    .b(\u_flash_read/n7 ),
    .c(\u_flash_read/cycle_cnt [0]),
    .d(\u_flash_read/cycle_cnt [1]),
    .o(_al_u237_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u238 (
    .a(_al_u237_o),
    .b(\u_flash_read/cycle_cnt [2]),
    .c(\u_flash_read/phase_cnt [0]),
    .d(\u_flash_read/phase_cnt [1]),
    .o(\u_flash_read/n12 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u239 (
    .a(fls_sck_wfree),
    .b(\u_flash_wait_free/n7 ),
    .c(\u_flash_wait_free/cycle_cnt [0]),
    .d(\u_flash_wait_free/cycle_cnt [1]),
    .o(_al_u239_o));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u24 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [5]),
    .c(\u_flash_read/tx_reg [6]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u24_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u240 (
    .a(_al_u239_o),
    .b(\u_flash_wait_free/cycle_cnt [2]),
    .c(\u_flash_wait_free/phase_cnt [0]),
    .d(\u_flash_wait_free/phase_cnt [1]),
    .o(\u_flash_wait_free/n12 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u241 (
    .a(busy_sector),
    .b(busy_wfree),
    .c(busy_wr),
    .d(busy_wen),
    .o(_al_u241_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u242 (
    .a(busy_erase),
    .b(busy_frd),
    .c(busy_id),
    .d(busy_rd),
    .o(_al_u242_o));
  AL_MAP_LUT2 #(
    .EQN("~(B*A)"),
    .INIT(4'h7))
    _al_u243 (
    .a(_al_u241_o),
    .b(_al_u242_o),
    .o(n33));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u244 (
    .a(busy_erase),
    .o(\u_flash_erase/n2 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u245 (
    .a(busy_id),
    .o(\u_flash_id/n2 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u246 (
    .a(busy_rd),
    .o(\u_flash_read/n2 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u247 (
    .a(busy_sector),
    .o(\u_flash_sector_erase/n2 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u248 (
    .a(busy_wfree),
    .o(\u_flash_wait_free/n2 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u249 (
    .a(busy_wr),
    .o(\u_flash_write/n2 ));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u25 (
    .a(_al_u24_o),
    .b(fls_addr[6]),
    .c(start_rd),
    .o(\u_flash_read/n4 [6]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u250 (
    .a(busy_wen),
    .o(\u_flash_write_enable/n2 ));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u26 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [4]),
    .c(\u_flash_read/tx_reg [5]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u26_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u27 (
    .a(_al_u26_o),
    .b(fls_addr[5]),
    .c(start_rd),
    .o(\u_flash_read/n4 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u28 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [3]),
    .c(\u_flash_read/tx_reg [4]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u28_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u29 (
    .a(_al_u28_o),
    .b(fls_addr[4]),
    .c(start_rd),
    .o(\u_flash_read/n4 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u30 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [2]),
    .c(\u_flash_read/tx_reg [3]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u30_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u31 (
    .a(_al_u30_o),
    .b(fls_addr[3]),
    .c(start_rd),
    .o(\u_flash_read/n4 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u32 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [22]),
    .c(\u_flash_read/tx_reg [23]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u32_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u33 (
    .a(_al_u32_o),
    .b(fls_addr[23]),
    .c(start_rd),
    .o(\u_flash_read/n4 [23]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u34 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [21]),
    .c(\u_flash_read/tx_reg [22]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u34_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u35 (
    .a(_al_u34_o),
    .b(fls_addr[22]),
    .c(start_rd),
    .o(\u_flash_read/n4 [22]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u36 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [20]),
    .c(\u_flash_read/tx_reg [21]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u36_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u37 (
    .a(_al_u36_o),
    .b(fls_addr[21]),
    .c(start_rd),
    .o(\u_flash_read/n4 [21]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u38 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [19]),
    .c(\u_flash_read/tx_reg [20]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u38_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u39 (
    .a(_al_u38_o),
    .b(fls_addr[20]),
    .c(start_rd),
    .o(\u_flash_read/n4 [20]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u40 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [1]),
    .c(\u_flash_read/tx_reg [2]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u40_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u41 (
    .a(_al_u40_o),
    .b(fls_addr[2]),
    .c(start_rd),
    .o(\u_flash_read/n4 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u42 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [18]),
    .c(\u_flash_read/tx_reg [19]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u42_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u43 (
    .a(_al_u42_o),
    .b(fls_addr[19]),
    .c(start_rd),
    .o(\u_flash_read/n4 [19]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u44 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [17]),
    .c(\u_flash_read/tx_reg [18]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u44_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u45 (
    .a(_al_u44_o),
    .b(fls_addr[18]),
    .c(start_rd),
    .o(\u_flash_read/n4 [18]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u46 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [16]),
    .c(\u_flash_read/tx_reg [17]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u46_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u47 (
    .a(_al_u46_o),
    .b(fls_addr[17]),
    .c(start_rd),
    .o(\u_flash_read/n4 [17]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u48 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [15]),
    .c(\u_flash_read/tx_reg [16]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u48_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u49 (
    .a(_al_u48_o),
    .b(fls_addr[16]),
    .c(start_rd),
    .o(\u_flash_read/n4 [16]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u50 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [14]),
    .c(\u_flash_read/tx_reg [15]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u50_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u51 (
    .a(_al_u50_o),
    .b(fls_addr[15]),
    .c(start_rd),
    .o(\u_flash_read/n4 [15]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u52 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [13]),
    .c(\u_flash_read/tx_reg [14]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u52_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u53 (
    .a(_al_u52_o),
    .b(fls_addr[14]),
    .c(start_rd),
    .o(\u_flash_read/n4 [14]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u54 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [12]),
    .c(\u_flash_read/tx_reg [13]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u54_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u55 (
    .a(_al_u54_o),
    .b(fls_addr[13]),
    .c(start_rd),
    .o(\u_flash_read/n4 [13]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u56 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [11]),
    .c(\u_flash_read/tx_reg [12]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u56_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u57 (
    .a(_al_u56_o),
    .b(fls_addr[12]),
    .c(start_rd),
    .o(\u_flash_read/n4 [12]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u58 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [10]),
    .c(\u_flash_read/tx_reg [11]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u58_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u59 (
    .a(_al_u58_o),
    .b(fls_addr[11]),
    .c(start_rd),
    .o(\u_flash_read/n4 [11]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .INIT(16'h0511))
    _al_u60 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [10]),
    .c(\u_flash_read/tx_reg [9]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u60_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u61 (
    .a(_al_u60_o),
    .b(fls_addr[10]),
    .c(start_rd),
    .o(\u_flash_read/n4 [10]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u62 (
    .a(start_rd),
    .b(\u_flash_read/tx_reg [0]),
    .c(\u_flash_read/tx_reg [1]),
    .d(\u_flash_read/sft_wen ),
    .o(_al_u62_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u63 (
    .a(_al_u62_o),
    .b(fls_addr[1]),
    .c(start_rd),
    .o(\u_flash_read/n4 [1]));
  AL_MAP_LUT4 #(
    .EQN("((~D*C)*~(A)*~(B)+(~D*C)*A*~(B)+~((~D*C))*A*B+(~D*C)*A*B)"),
    .INIT(16'h88b8))
    _al_u64 (
    .a(fls_addr[0]),
    .b(start_rd),
    .c(\u_flash_read/tx_reg [0]),
    .d(\u_flash_read/sft_wen ),
    .o(\u_flash_read/n4 [0]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u65 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [8]),
    .c(\u_flash_sector_erase/tx_reg [9]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u65_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u66 (
    .a(_al_u65_o),
    .b(fls_addr[9]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [9]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u67 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [7]),
    .c(\u_flash_sector_erase/tx_reg [8]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u67_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u68 (
    .a(_al_u67_o),
    .b(fls_addr[8]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [8]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u69 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [6]),
    .c(\u_flash_sector_erase/tx_reg [7]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u69_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u70 (
    .a(_al_u69_o),
    .b(fls_addr[7]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u71 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [5]),
    .c(\u_flash_sector_erase/tx_reg [6]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u71_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u72 (
    .a(_al_u71_o),
    .b(fls_addr[6]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [6]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u73 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [4]),
    .c(\u_flash_sector_erase/tx_reg [5]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u73_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u74 (
    .a(_al_u73_o),
    .b(fls_addr[5]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [5]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u75 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [3]),
    .c(\u_flash_sector_erase/tx_reg [4]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u75_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u76 (
    .a(_al_u75_o),
    .b(fls_addr[4]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [4]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u77 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [2]),
    .c(\u_flash_sector_erase/tx_reg [3]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u77_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u78 (
    .a(_al_u77_o),
    .b(fls_addr[3]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [3]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u79 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [22]),
    .c(\u_flash_sector_erase/tx_reg [23]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u79_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u80 (
    .a(_al_u79_o),
    .b(fls_addr[23]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [23]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u81 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [21]),
    .c(\u_flash_sector_erase/tx_reg [22]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u81_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u82 (
    .a(_al_u81_o),
    .b(fls_addr[22]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [22]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u83 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [20]),
    .c(\u_flash_sector_erase/tx_reg [21]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u83_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u84 (
    .a(_al_u83_o),
    .b(fls_addr[21]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [21]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u85 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [19]),
    .c(\u_flash_sector_erase/tx_reg [20]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u85_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u86 (
    .a(_al_u85_o),
    .b(fls_addr[20]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [20]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u87 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [1]),
    .c(\u_flash_sector_erase/tx_reg [2]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u87_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u88 (
    .a(_al_u87_o),
    .b(fls_addr[2]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u89 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [18]),
    .c(\u_flash_sector_erase/tx_reg [19]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u89_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u90 (
    .a(_al_u89_o),
    .b(fls_addr[19]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [19]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u91 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [17]),
    .c(\u_flash_sector_erase/tx_reg [18]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u91_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u92 (
    .a(_al_u91_o),
    .b(fls_addr[18]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [18]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u93 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [16]),
    .c(\u_flash_sector_erase/tx_reg [17]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u93_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u94 (
    .a(_al_u93_o),
    .b(fls_addr[17]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [17]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u95 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [15]),
    .c(\u_flash_sector_erase/tx_reg [16]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u95_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u96 (
    .a(_al_u95_o),
    .b(fls_addr[16]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [16]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u97 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [14]),
    .c(\u_flash_sector_erase/tx_reg [15]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u97_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u98 (
    .a(_al_u97_o),
    .b(fls_addr[15]),
    .c(start_sector),
    .o(\u_flash_sector_erase/n4 [15]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D))"),
    .INIT(16'h1105))
    _al_u99 (
    .a(start_sector),
    .b(\u_flash_sector_erase/tx_reg [13]),
    .c(\u_flash_sector_erase/tx_reg [14]),
    .d(\u_flash_sector_erase/sft_wen ),
    .o(_al_u99_o));
  reg_ar_as_w1 busy_reg (
    .clk(clk),
    .d(n33),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(busy));  // src/rtl/flash/flash_dri.v(332)
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
    .do({open_n0,open_n1,open_n2,n25}),
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
    .do({open_n15,open_n16,open_n17,n24}),
    .osclk(clk),
    .opad(fls_sck));  // src/rtl/flash/flash_dri.v(296)
  reg_ar_as_w1 fls_sdi_frd_reg (
    .clk(clk),
    .d(n21),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_frd));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_id_reg (
    .clk(clk),
    .d(n22),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_id));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_rd_reg (
    .clk(clk),
    .d(n20),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_rd));  // src/rtl/flash/flash_dri.v(281)
  reg_ar_as_w1 fls_sdi_wfree_reg (
    .clk(clk),
    .d(n16),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdi_wfree));  // src/rtl/flash/flash_dri.v(281)
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
    .do({open_n30,open_n31,open_n32,n26}),
    .osclk(clk),
    .opad(fls_sdo));  // src/rtl/flash/flash_dri.v(326)
  reg_ar_as_w1 start_erase_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_erase));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_frd_reg (
    .clk(clk),
    .d(n11),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_frd));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_id_reg (
    .clk(clk),
    .d(n13),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_id));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_rd_reg (
    .clk(clk),
    .d(n9),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_rd));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_sector_reg (
    .clk(clk),
    .d(n15),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_sector));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wen_reg (
    .clk(clk),
    .d(n3),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wen));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wfree_reg (
    .clk(clk),
    .d(n1),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wfree));  // src/rtl/flash/flash_dri.v(268)
  reg_ar_as_w1 start_wr_reg (
    .clk(clk),
    .d(n7),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(start_wr));  // src/rtl/flash/flash_dri.v(268)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u0  (
    .a(\u_flash_erase/cnt [0]),
    .b(1'b1),
    .c(\u_flash_erase/add0/c0 ),
    .o({\u_flash_erase/add0/c1 ,\u_flash_erase/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u1  (
    .a(\u_flash_erase/cnt [1]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c1 ),
    .o({\u_flash_erase/add0/c2 ,\u_flash_erase/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u2  (
    .a(\u_flash_erase/cnt [2]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c2 ),
    .o({\u_flash_erase/add0/c3 ,\u_flash_erase/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u3  (
    .a(\u_flash_erase/cnt [3]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c3 ),
    .o({\u_flash_erase/add0/c4 ,\u_flash_erase/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u4  (
    .a(\u_flash_erase/cnt [4]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c4 ),
    .o({\u_flash_erase/add0/c5 ,\u_flash_erase/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u5  (
    .a(\u_flash_erase/cnt [5]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c5 ),
    .o({\u_flash_erase/add0/c6 ,\u_flash_erase/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u6  (
    .a(\u_flash_erase/cnt [6]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c6 ),
    .o({\u_flash_erase/add0/c7 ,\u_flash_erase/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u7  (
    .a(\u_flash_erase/cnt [7]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c7 ),
    .o({\u_flash_erase/add0/c8 ,\u_flash_erase/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u8  (
    .a(\u_flash_erase/cnt [8]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c8 ),
    .o({\u_flash_erase/add0/c9 ,\u_flash_erase/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_erase/add0/u9  (
    .a(\u_flash_erase/cnt [9]),
    .b(1'b0),
    .c(\u_flash_erase/add0/c9 ),
    .o({open_n45,\u_flash_erase/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_erase/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_erase/add0/c0 ,open_n48}));
  reg_ar_ss_w1 \u_flash_erase/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_erase/n6 ),
    .reset(1'b0),
    .set(start_erase),
    .q(busy_erase));  // src/rtl/flash/flash_erase.v(120)
  reg_ar_as_w1 \u_flash_erase/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_erase/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_erase));  // src/rtl/flash/flash_erase.v(84)
  reg_ar_as_w1 \u_flash_erase/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_erase/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_erase));  // src/rtl/flash/flash_erase.v(75)
  reg_ar_as_w1 \u_flash_erase/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_erase));  // src/rtl/flash/flash_erase.v(111)
  reg_ar_as_w1 \u_flash_erase/reg0_b0  (
    .clk(clk),
    .d(\u_flash_erase/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [0]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b1  (
    .clk(clk),
    .d(\u_flash_erase/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [1]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b2  (
    .clk(clk),
    .d(\u_flash_erase/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [2]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b3  (
    .clk(clk),
    .d(\u_flash_erase/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [3]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b4  (
    .clk(clk),
    .d(\u_flash_erase/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [4]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b5  (
    .clk(clk),
    .d(\u_flash_erase/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [5]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg0_b6  (
    .clk(clk),
    .d(\u_flash_erase/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/cycle_cnt [6]));  // src/rtl/flash/flash_erase.v(63)
  reg_ar_as_w1 \u_flash_erase/reg1_b0  (
    .clk(clk),
    .d(\u_flash_erase/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/phase_cnt [0]));  // src/rtl/flash/flash_erase.v(69)
  reg_ar_as_w1 \u_flash_erase/reg1_b1  (
    .clk(clk),
    .d(\u_flash_erase/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/phase_cnt [1]));  // src/rtl/flash/flash_erase.v(69)
  reg_ar_ss_w1 \u_flash_erase/reg2_b0  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [0]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b1  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [0]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [1]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b2  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [1]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [2]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b3  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [2]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [3]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b4  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [3]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [4]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg2_b5  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [4]),
    .en(\u_flash_erase/sft_wen ),
    .reset(start_erase),
    .set(1'b0),
    .q(\u_flash_erase/tx_reg [5]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b6  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [5]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [6]));  // src/rtl/flash/flash_erase.v(93)
  reg_ar_ss_w1 \u_flash_erase/reg2_b7  (
    .clk(clk),
    .d(\u_flash_erase/tx_reg [6]),
    .en(\u_flash_erase/sft_wen ),
    .reset(1'b0),
    .set(start_erase),
    .q(\u_flash_erase/tx_reg [7]));  // src/rtl/flash/flash_erase.v(93)
  reg_sr_as_w1 \u_flash_erase/reg3_b0  (
    .clk(clk),
    .d(\u_flash_erase/n0 [0]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [0]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b1  (
    .clk(clk),
    .d(\u_flash_erase/n0 [1]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [1]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b2  (
    .clk(clk),
    .d(\u_flash_erase/n0 [2]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [2]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b3  (
    .clk(clk),
    .d(\u_flash_erase/n0 [3]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [3]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b4  (
    .clk(clk),
    .d(\u_flash_erase/n0 [4]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [4]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b5  (
    .clk(clk),
    .d(\u_flash_erase/n0 [5]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [5]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b6  (
    .clk(clk),
    .d(\u_flash_erase/n0 [6]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [6]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b7  (
    .clk(clk),
    .d(\u_flash_erase/n0 [7]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [7]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b8  (
    .clk(clk),
    .d(\u_flash_erase/n0 [8]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [8]));  // src/rtl/flash/flash_erase.v(57)
  reg_sr_as_w1 \u_flash_erase/reg3_b9  (
    .clk(clk),
    .d(\u_flash_erase/n0 [9]),
    .en(1'b1),
    .reset(~busy_erase),
    .set(1'b0),
    .q(\u_flash_erase/cnt [9]));  // src/rtl/flash/flash_erase.v(57)
  reg_ar_as_w1 \u_flash_erase/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_erase/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_erase/sft_wen ));  // src/rtl/flash/flash_erase.v(99)
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
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u0  (
    .a(\u_flash_id/cnt [0]),
    .b(1'b1),
    .c(\u_flash_id/add0/c0 ),
    .o({\u_flash_id/add0/c1 ,\u_flash_id/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u1  (
    .a(\u_flash_id/cnt [1]),
    .b(1'b0),
    .c(\u_flash_id/add0/c1 ),
    .o({\u_flash_id/add0/c2 ,\u_flash_id/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u2  (
    .a(\u_flash_id/cnt [2]),
    .b(1'b0),
    .c(\u_flash_id/add0/c2 ),
    .o({\u_flash_id/add0/c3 ,\u_flash_id/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u3  (
    .a(\u_flash_id/cnt [3]),
    .b(1'b0),
    .c(\u_flash_id/add0/c3 ),
    .o({\u_flash_id/add0/c4 ,\u_flash_id/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u4  (
    .a(\u_flash_id/cnt [4]),
    .b(1'b0),
    .c(\u_flash_id/add0/c4 ),
    .o({\u_flash_id/add0/c5 ,\u_flash_id/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u5  (
    .a(\u_flash_id/cnt [5]),
    .b(1'b0),
    .c(\u_flash_id/add0/c5 ),
    .o({\u_flash_id/add0/c6 ,\u_flash_id/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u6  (
    .a(\u_flash_id/cnt [6]),
    .b(1'b0),
    .c(\u_flash_id/add0/c6 ),
    .o({\u_flash_id/add0/c7 ,\u_flash_id/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u7  (
    .a(\u_flash_id/cnt [7]),
    .b(1'b0),
    .c(\u_flash_id/add0/c7 ),
    .o({\u_flash_id/add0/c8 ,\u_flash_id/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u8  (
    .a(\u_flash_id/cnt [8]),
    .b(1'b0),
    .c(\u_flash_id/add0/c8 ),
    .o({\u_flash_id/add0/c9 ,\u_flash_id/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_id/add0/u9  (
    .a(\u_flash_id/cnt [9]),
    .b(1'b0),
    .c(\u_flash_id/add0/c9 ),
    .o({open_n49,\u_flash_id/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_id/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_id/add0/c0 ,open_n52}));
  reg_ar_ss_w1 \u_flash_id/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_id/n17 ),
    .reset(1'b0),
    .set(start_id),
    .q(busy_id));  // src/rtl/flash/flash_id.v(144)
  reg_ar_as_w1 \u_flash_id/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_id/n14 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/byte_flag ));  // src/rtl/flash/flash_id.v(115)
  reg_ar_as_w1 \u_flash_id/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_id/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_id));  // src/rtl/flash/flash_id.v(88)
  reg_ar_as_w1 \u_flash_id/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_id/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_id));  // src/rtl/flash/flash_id.v(79)
  reg_ar_as_w1 \u_flash_id/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_id));  // src/rtl/flash/flash_id.v(121)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_0  (
    .a(1'b1),
    .b(\u_flash_id/cycle_cnt [0]),
    .c(\u_flash_id/lt0_c0 ),
    .o({\u_flash_id/lt0_c1 ,open_n53}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_1  (
    .a(1'b1),
    .b(\u_flash_id/cycle_cnt [1]),
    .c(\u_flash_id/lt0_c1 ),
    .o({\u_flash_id/lt0_c2 ,open_n54}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_2  (
    .a(1'b1),
    .b(\u_flash_id/cycle_cnt [2]),
    .c(\u_flash_id/lt0_c2 ),
    .o({\u_flash_id/lt0_c3 ,open_n55}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_3  (
    .a(1'b1),
    .b(\u_flash_id/cycle_cnt [3]),
    .c(\u_flash_id/lt0_c3 ),
    .o({\u_flash_id/lt0_c4 ,open_n56}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_4  (
    .a(1'b1),
    .b(\u_flash_id/cycle_cnt [4]),
    .c(\u_flash_id/lt0_c4 ),
    .o({\u_flash_id/lt0_c5 ,open_n57}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_5  (
    .a(1'b0),
    .b(\u_flash_id/cycle_cnt [5]),
    .c(\u_flash_id/lt0_c5 ),
    .o({\u_flash_id/lt0_c6 ,open_n58}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_6  (
    .a(1'b0),
    .b(\u_flash_id/cycle_cnt [6]),
    .c(\u_flash_id/lt0_c6 ),
    .o({\u_flash_id/lt0_c7 ,open_n59}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_flash_id/lt0_cin  (
    .a(1'b0),
    .o({\u_flash_id/lt0_c0 ,open_n62}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_flash_id/lt0_c7 ),
    .o({open_n63,\u_flash_id/n7 }));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_0  (
    .a(\u_flash_id/cycle_cnt [0]),
    .b(1'b0),
    .c(\u_flash_id/lt1_c0 ),
    .o({\u_flash_id/lt1_c1 ,open_n64}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_1  (
    .a(\u_flash_id/cycle_cnt [1]),
    .b(1'b0),
    .c(\u_flash_id/lt1_c1 ),
    .o({\u_flash_id/lt1_c2 ,open_n65}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_2  (
    .a(\u_flash_id/cycle_cnt [2]),
    .b(1'b0),
    .c(\u_flash_id/lt1_c2 ),
    .o({\u_flash_id/lt1_c3 ,open_n66}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_3  (
    .a(\u_flash_id/cycle_cnt [3]),
    .b(1'b0),
    .c(\u_flash_id/lt1_c3 ),
    .o({\u_flash_id/lt1_c4 ,open_n67}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_4  (
    .a(\u_flash_id/cycle_cnt [4]),
    .b(1'b1),
    .c(\u_flash_id/lt1_c4 ),
    .o({\u_flash_id/lt1_c5 ,open_n68}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_5  (
    .a(\u_flash_id/cycle_cnt [5]),
    .b(1'b1),
    .c(\u_flash_id/lt1_c5 ),
    .o({\u_flash_id/lt1_c6 ,open_n69}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_6  (
    .a(\u_flash_id/cycle_cnt [6]),
    .b(1'b0),
    .c(\u_flash_id/lt1_c6 ),
    .o({\u_flash_id/lt1_c7 ,open_n70}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_flash_id/lt1_cin  (
    .a(1'b0),
    .o({\u_flash_id/lt1_c0 ,open_n73}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_id/lt1_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_flash_id/lt1_c7 ),
    .o({open_n74,\u_flash_id/n9 }));
  reg_ar_as_w1 \u_flash_id/reg0_b0  (
    .clk(clk),
    .d(\u_flash_id/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [0]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b1  (
    .clk(clk),
    .d(\u_flash_id/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [1]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b2  (
    .clk(clk),
    .d(\u_flash_id/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [2]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b3  (
    .clk(clk),
    .d(\u_flash_id/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [3]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b4  (
    .clk(clk),
    .d(\u_flash_id/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [4]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b5  (
    .clk(clk),
    .d(\u_flash_id/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [5]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg0_b6  (
    .clk(clk),
    .d(\u_flash_id/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/cycle_cnt [6]));  // src/rtl/flash/flash_id.v(67)
  reg_ar_as_w1 \u_flash_id/reg1_b0  (
    .clk(clk),
    .d(\u_flash_id/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/phase_cnt [0]));  // src/rtl/flash/flash_id.v(73)
  reg_ar_as_w1 \u_flash_id/reg1_b1  (
    .clk(clk),
    .d(\u_flash_id/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/phase_cnt [1]));  // src/rtl/flash/flash_id.v(73)
  reg_ar_ss_w1 \u_flash_id/reg2_b28  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_id/sft_wen ),
    .reset(1'b0),
    .set(start_id),
    .q(\u_flash_id/tx_reg [28]));  // src/rtl/flash/flash_id.v(97)
  reg_sr_as_w1 \u_flash_id/reg2_b29  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [28]),
    .en(\u_flash_id/sft_wen ),
    .reset(start_id),
    .set(1'b0),
    .q(\u_flash_id/tx_reg [29]));  // src/rtl/flash/flash_id.v(97)
  reg_sr_as_w1 \u_flash_id/reg2_b30  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [29]),
    .en(\u_flash_id/sft_wen ),
    .reset(start_id),
    .set(1'b0),
    .q(\u_flash_id/tx_reg [30]));  // src/rtl/flash/flash_id.v(97)
  reg_ar_ss_w1 \u_flash_id/reg2_b31  (
    .clk(clk),
    .d(\u_flash_id/tx_reg [30]),
    .en(\u_flash_id/sft_wen ),
    .reset(1'b0),
    .set(start_id),
    .q(\u_flash_id/tx_reg [31]));  // src/rtl/flash/flash_id.v(97)
  reg_ar_as_w1 \u_flash_id/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_id),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [0]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b1  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [0]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [1]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b2  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [1]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [2]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b3  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [2]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [3]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b4  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [3]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [4]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b5  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [4]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [5]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b6  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [5]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [6]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg3_b7  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [6]),
    .en(\u_flash_id/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/rx_reg [7]));  // src/rtl/flash/flash_id.v(128)
  reg_ar_as_w1 \u_flash_id/reg4_b0  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [0]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[0]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b1  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [1]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[1]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b10  (
    .clk(clk),
    .d(id[2]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[10]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b11  (
    .clk(clk),
    .d(id[3]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[11]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b12  (
    .clk(clk),
    .d(id[4]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[12]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b13  (
    .clk(clk),
    .d(id[5]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[13]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b14  (
    .clk(clk),
    .d(id[6]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[14]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b15  (
    .clk(clk),
    .d(id[7]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[15]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b2  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [2]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[2]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b3  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [3]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[3]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b4  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [4]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[4]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b5  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [5]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[5]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b6  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [6]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[6]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b7  (
    .clk(clk),
    .d(\u_flash_id/rx_reg [7]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[7]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b8  (
    .clk(clk),
    .d(id[0]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[8]));  // src/rtl/flash/flash_id.v(135)
  reg_ar_as_w1 \u_flash_id/reg4_b9  (
    .clk(clk),
    .d(id[1]),
    .en(\u_flash_id/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(id[9]));  // src/rtl/flash/flash_id.v(135)
  reg_sr_as_w1 \u_flash_id/reg5_b0  (
    .clk(clk),
    .d(\u_flash_id/n0 [0]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [0]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b1  (
    .clk(clk),
    .d(\u_flash_id/n0 [1]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [1]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b2  (
    .clk(clk),
    .d(\u_flash_id/n0 [2]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [2]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b3  (
    .clk(clk),
    .d(\u_flash_id/n0 [3]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [3]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b4  (
    .clk(clk),
    .d(\u_flash_id/n0 [4]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [4]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b5  (
    .clk(clk),
    .d(\u_flash_id/n0 [5]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [5]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b6  (
    .clk(clk),
    .d(\u_flash_id/n0 [6]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [6]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b7  (
    .clk(clk),
    .d(\u_flash_id/n0 [7]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [7]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b8  (
    .clk(clk),
    .d(\u_flash_id/n0 [8]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [8]));  // src/rtl/flash/flash_id.v(61)
  reg_sr_as_w1 \u_flash_id/reg5_b9  (
    .clk(clk),
    .d(\u_flash_id/n0 [9]),
    .en(1'b1),
    .reset(~busy_id),
    .set(1'b0),
    .q(\u_flash_id/cnt [9]));  // src/rtl/flash/flash_id.v(61)
  reg_ar_as_w1 \u_flash_id/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_id/n10 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/sft_ren ));  // src/rtl/flash/flash_id.v(109)
  reg_ar_as_w1 \u_flash_id/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_id/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_id/sft_wen ));  // src/rtl/flash/flash_id.v(103)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u0  (
    .a(\u_flash_read/cnt [0]),
    .b(1'b1),
    .c(\u_flash_read/add0/c0 ),
    .o({\u_flash_read/add0/c1 ,\u_flash_read/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u1  (
    .a(\u_flash_read/cnt [1]),
    .b(1'b0),
    .c(\u_flash_read/add0/c1 ),
    .o({\u_flash_read/add0/c2 ,\u_flash_read/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u2  (
    .a(\u_flash_read/cnt [2]),
    .b(1'b0),
    .c(\u_flash_read/add0/c2 ),
    .o({\u_flash_read/add0/c3 ,\u_flash_read/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u3  (
    .a(\u_flash_read/cnt [3]),
    .b(1'b0),
    .c(\u_flash_read/add0/c3 ),
    .o({\u_flash_read/add0/c4 ,\u_flash_read/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u4  (
    .a(\u_flash_read/cnt [4]),
    .b(1'b0),
    .c(\u_flash_read/add0/c4 ),
    .o({\u_flash_read/add0/c5 ,\u_flash_read/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u5  (
    .a(\u_flash_read/cnt [5]),
    .b(1'b0),
    .c(\u_flash_read/add0/c5 ),
    .o({\u_flash_read/add0/c6 ,\u_flash_read/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u6  (
    .a(\u_flash_read/cnt [6]),
    .b(1'b0),
    .c(\u_flash_read/add0/c6 ),
    .o({\u_flash_read/add0/c7 ,\u_flash_read/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u7  (
    .a(\u_flash_read/cnt [7]),
    .b(1'b0),
    .c(\u_flash_read/add0/c7 ),
    .o({\u_flash_read/add0/c8 ,\u_flash_read/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u8  (
    .a(\u_flash_read/cnt [8]),
    .b(1'b0),
    .c(\u_flash_read/add0/c8 ),
    .o({\u_flash_read/add0/c9 ,\u_flash_read/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_read/add0/u9  (
    .a(\u_flash_read/cnt [9]),
    .b(1'b0),
    .c(\u_flash_read/add0/c9 ),
    .o({open_n75,\u_flash_read/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_read/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_read/add0/c0 ,open_n78}));
  reg_ar_ss_w1 \u_flash_read/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_read/n15 ),
    .reset(1'b0),
    .set(start_rd),
    .q(busy_rd));  // src/rtl/flash/flash_read.v(154)
  reg_ar_as_w1 \u_flash_read/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_read/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/byte_flag ));  // src/rtl/flash/flash_read.v(119)
  reg_ar_as_w1 \u_flash_read/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_read/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_rd));  // src/rtl/flash/flash_read.v(92)
  reg_ar_as_w1 \u_flash_read/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_read/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_rd));  // src/rtl/flash/flash_read.v(83)
  reg_ar_as_w1 \u_flash_read/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_rd));  // src/rtl/flash/flash_read.v(125)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_0  (
    .a(1'b1),
    .b(\u_flash_read/cycle_cnt [0]),
    .c(\u_flash_read/lt0_c0 ),
    .o({\u_flash_read/lt0_c1 ,open_n79}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_1  (
    .a(1'b1),
    .b(\u_flash_read/cycle_cnt [1]),
    .c(\u_flash_read/lt0_c1 ),
    .o({\u_flash_read/lt0_c2 ,open_n80}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_2  (
    .a(1'b1),
    .b(\u_flash_read/cycle_cnt [2]),
    .c(\u_flash_read/lt0_c2 ),
    .o({\u_flash_read/lt0_c3 ,open_n81}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_3  (
    .a(1'b1),
    .b(\u_flash_read/cycle_cnt [3]),
    .c(\u_flash_read/lt0_c3 ),
    .o({\u_flash_read/lt0_c4 ,open_n82}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_4  (
    .a(1'b1),
    .b(\u_flash_read/cycle_cnt [4]),
    .c(\u_flash_read/lt0_c4 ),
    .o({\u_flash_read/lt0_c5 ,open_n83}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_5  (
    .a(1'b0),
    .b(\u_flash_read/cycle_cnt [5]),
    .c(\u_flash_read/lt0_c5 ),
    .o({\u_flash_read/lt0_c6 ,open_n84}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_6  (
    .a(1'b0),
    .b(\u_flash_read/cycle_cnt [6]),
    .c(\u_flash_read/lt0_c6 ),
    .o({\u_flash_read/lt0_c7 ,open_n85}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_flash_read/lt0_cin  (
    .a(1'b0),
    .o({\u_flash_read/lt0_c0 ,open_n88}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_read/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_flash_read/lt0_c7 ),
    .o({open_n89,\u_flash_read/n7 }));
  reg_ar_as_w1 \u_flash_read/reg0_b0  (
    .clk(clk),
    .d(\u_flash_read/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [0]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b1  (
    .clk(clk),
    .d(\u_flash_read/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [1]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b2  (
    .clk(clk),
    .d(\u_flash_read/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [2]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b3  (
    .clk(clk),
    .d(\u_flash_read/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [3]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b4  (
    .clk(clk),
    .d(\u_flash_read/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [4]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b5  (
    .clk(clk),
    .d(\u_flash_read/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [5]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg0_b6  (
    .clk(clk),
    .d(\u_flash_read/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/cycle_cnt [6]));  // src/rtl/flash/flash_read.v(71)
  reg_ar_as_w1 \u_flash_read/reg1_b0  (
    .clk(clk),
    .d(\u_flash_read/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/phase_cnt [0]));  // src/rtl/flash/flash_read.v(77)
  reg_ar_as_w1 \u_flash_read/reg1_b1  (
    .clk(clk),
    .d(\u_flash_read/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/phase_cnt [1]));  // src/rtl/flash/flash_read.v(77)
  reg_ar_as_w1 \u_flash_read/reg2_b0  (
    .clk(clk),
    .d(\u_flash_read/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [0]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b1  (
    .clk(clk),
    .d(\u_flash_read/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [1]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b10  (
    .clk(clk),
    .d(\u_flash_read/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [10]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b11  (
    .clk(clk),
    .d(\u_flash_read/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [11]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b12  (
    .clk(clk),
    .d(\u_flash_read/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [12]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b13  (
    .clk(clk),
    .d(\u_flash_read/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [13]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b14  (
    .clk(clk),
    .d(\u_flash_read/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [14]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b15  (
    .clk(clk),
    .d(\u_flash_read/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [15]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b16  (
    .clk(clk),
    .d(\u_flash_read/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [16]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b17  (
    .clk(clk),
    .d(\u_flash_read/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [17]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b18  (
    .clk(clk),
    .d(\u_flash_read/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [18]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b19  (
    .clk(clk),
    .d(\u_flash_read/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [19]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b2  (
    .clk(clk),
    .d(\u_flash_read/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [2]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b20  (
    .clk(clk),
    .d(\u_flash_read/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [20]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b21  (
    .clk(clk),
    .d(\u_flash_read/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [21]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b22  (
    .clk(clk),
    .d(\u_flash_read/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [22]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b23  (
    .clk(clk),
    .d(\u_flash_read/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [23]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_ss_w1 \u_flash_read/reg2_b24  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [23]),
    .en(\u_flash_read/sft_wen ),
    .reset(1'b0),
    .set(start_rd),
    .q(\u_flash_read/tx_reg [24]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_ss_w1 \u_flash_read/reg2_b25  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [24]),
    .en(\u_flash_read/sft_wen ),
    .reset(1'b0),
    .set(start_rd),
    .q(\u_flash_read/tx_reg [25]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b26  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [25]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [26]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b27  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [26]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [27]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b28  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [27]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [28]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b29  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [28]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [29]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b3  (
    .clk(clk),
    .d(\u_flash_read/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [3]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b30  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [29]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [30]));  // src/rtl/flash/flash_read.v(101)
  reg_sr_as_w1 \u_flash_read/reg2_b31  (
    .clk(clk),
    .d(\u_flash_read/tx_reg [30]),
    .en(\u_flash_read/sft_wen ),
    .reset(start_rd),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [31]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b4  (
    .clk(clk),
    .d(\u_flash_read/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [4]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b5  (
    .clk(clk),
    .d(\u_flash_read/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [5]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b6  (
    .clk(clk),
    .d(\u_flash_read/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [6]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b7  (
    .clk(clk),
    .d(\u_flash_read/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [7]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b8  (
    .clk(clk),
    .d(\u_flash_read/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [8]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg2_b9  (
    .clk(clk),
    .d(\u_flash_read/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/tx_reg [9]));  // src/rtl/flash/flash_read.v(101)
  reg_ar_as_w1 \u_flash_read/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_rd),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [0]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b1  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [0]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [1]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b2  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [1]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [2]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b3  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [2]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [3]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b4  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [3]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [4]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b5  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [4]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [5]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b6  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [5]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [6]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg3_b7  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [6]),
    .en(\u_flash_read/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/rx_reg [7]));  // src/rtl/flash/flash_read.v(132)
  reg_ar_as_w1 \u_flash_read/reg4_b0  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [0]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[0]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b1  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [1]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[1]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b2  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [2]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[2]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b3  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [3]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[3]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b4  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [4]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[4]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b5  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [5]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[5]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b6  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [6]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[6]));  // src/rtl/flash/flash_read.v(145)
  reg_ar_as_w1 \u_flash_read/reg4_b7  (
    .clk(clk),
    .d(\u_flash_read/rx_reg [7]),
    .en(\u_flash_read/byte_flag ),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_read[7]));  // src/rtl/flash/flash_read.v(145)
  reg_sr_as_w1 \u_flash_read/reg5_b0  (
    .clk(clk),
    .d(\u_flash_read/n0 [0]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [0]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b1  (
    .clk(clk),
    .d(\u_flash_read/n0 [1]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [1]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b2  (
    .clk(clk),
    .d(\u_flash_read/n0 [2]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [2]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b3  (
    .clk(clk),
    .d(\u_flash_read/n0 [3]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [3]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b4  (
    .clk(clk),
    .d(\u_flash_read/n0 [4]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [4]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b5  (
    .clk(clk),
    .d(\u_flash_read/n0 [5]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [5]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b6  (
    .clk(clk),
    .d(\u_flash_read/n0 [6]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [6]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b7  (
    .clk(clk),
    .d(\u_flash_read/n0 [7]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [7]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b8  (
    .clk(clk),
    .d(\u_flash_read/n0 [8]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [8]));  // src/rtl/flash/flash_read.v(65)
  reg_sr_as_w1 \u_flash_read/reg5_b9  (
    .clk(clk),
    .d(\u_flash_read/n0 [9]),
    .en(1'b1),
    .reset(~busy_rd),
    .set(1'b0),
    .q(\u_flash_read/cnt [9]));  // src/rtl/flash/flash_read.v(65)
  reg_ar_as_w1 \u_flash_read/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_read/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/sft_ren ));  // src/rtl/flash/flash_read.v(113)
  reg_ar_as_w1 \u_flash_read/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_read/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_read/sft_wen ));  // src/rtl/flash/flash_read.v(107)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u0  (
    .a(\u_flash_sector_erase/cnt [0]),
    .b(1'b1),
    .c(\u_flash_sector_erase/add0/c0 ),
    .o({\u_flash_sector_erase/add0/c1 ,\u_flash_sector_erase/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u1  (
    .a(\u_flash_sector_erase/cnt [1]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c1 ),
    .o({\u_flash_sector_erase/add0/c2 ,\u_flash_sector_erase/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u2  (
    .a(\u_flash_sector_erase/cnt [2]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c2 ),
    .o({\u_flash_sector_erase/add0/c3 ,\u_flash_sector_erase/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u3  (
    .a(\u_flash_sector_erase/cnt [3]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c3 ),
    .o({\u_flash_sector_erase/add0/c4 ,\u_flash_sector_erase/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u4  (
    .a(\u_flash_sector_erase/cnt [4]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c4 ),
    .o({\u_flash_sector_erase/add0/c5 ,\u_flash_sector_erase/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u5  (
    .a(\u_flash_sector_erase/cnt [5]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c5 ),
    .o({\u_flash_sector_erase/add0/c6 ,\u_flash_sector_erase/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u6  (
    .a(\u_flash_sector_erase/cnt [6]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c6 ),
    .o({\u_flash_sector_erase/add0/c7 ,\u_flash_sector_erase/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u7  (
    .a(\u_flash_sector_erase/cnt [7]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c7 ),
    .o({\u_flash_sector_erase/add0/c8 ,\u_flash_sector_erase/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u8  (
    .a(\u_flash_sector_erase/cnt [8]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c8 ),
    .o({\u_flash_sector_erase/add0/c9 ,\u_flash_sector_erase/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_sector_erase/add0/u9  (
    .a(\u_flash_sector_erase/cnt [9]),
    .b(1'b0),
    .c(\u_flash_sector_erase/add0/c9 ),
    .o({open_n90,\u_flash_sector_erase/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_sector_erase/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_sector_erase/add0/c0 ,open_n93}));
  reg_ar_ss_w1 \u_flash_sector_erase/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_sector_erase/n6 ),
    .reset(1'b0),
    .set(start_sector),
    .q(busy_sector));  // src/rtl/flash/flash_sector_erase.v(116)
  reg_ar_as_w1 \u_flash_sector_erase/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_sector));  // src/rtl/flash/flash_sector_erase.v(86)
  reg_ar_as_w1 \u_flash_sector_erase/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_sector));  // src/rtl/flash/flash_sector_erase.v(77)
  reg_ar_as_w1 \u_flash_sector_erase/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_sector));  // src/rtl/flash/flash_sector_erase.v(107)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [0]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [1]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [2]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [3]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [4]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [5]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg0_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/cycle_cnt [6]));  // src/rtl/flash/flash_sector_erase.v(65)
  reg_ar_as_w1 \u_flash_sector_erase/reg1_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/phase_cnt [0]));  // src/rtl/flash/flash_sector_erase.v(71)
  reg_ar_as_w1 \u_flash_sector_erase/reg1_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/phase_cnt [1]));  // src/rtl/flash/flash_sector_erase.v(71)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [0]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [1]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b10  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [10]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b11  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [11]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b12  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [12]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b13  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [13]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b14  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [14]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b15  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [15]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b16  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [16]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b17  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [17]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b18  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [18]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b19  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [19]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [2]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b20  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [20]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b21  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [21]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b22  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [22]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b23  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [23]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b24  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [23]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [24]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b25  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [24]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [25]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b26  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [25]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [26]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b27  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [26]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [27]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b28  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [27]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [28]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_ss_w1 \u_flash_sector_erase/reg2_b29  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [28]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(1'b0),
    .set(start_sector),
    .q(\u_flash_sector_erase/tx_reg [29]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [3]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b30  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [29]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [30]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg2_b31  (
    .clk(clk),
    .d(\u_flash_sector_erase/tx_reg [30]),
    .en(\u_flash_sector_erase/sft_wen ),
    .reset(start_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [31]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [4]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [5]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [6]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b7  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [7]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b8  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [8]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_ar_as_w1 \u_flash_sector_erase/reg2_b9  (
    .clk(clk),
    .d(\u_flash_sector_erase/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/tx_reg [9]));  // src/rtl/flash/flash_sector_erase.v(95)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b0  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [0]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [0]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b1  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [1]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [1]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b2  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [2]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [2]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b3  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [3]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [3]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b4  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [4]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [4]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b5  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [5]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [5]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b6  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [6]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [6]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b7  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [7]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [7]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b8  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [8]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [8]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_sr_as_w1 \u_flash_sector_erase/reg3_b9  (
    .clk(clk),
    .d(\u_flash_sector_erase/n0 [9]),
    .en(1'b1),
    .reset(~busy_sector),
    .set(1'b0),
    .q(\u_flash_sector_erase/cnt [9]));  // src/rtl/flash/flash_sector_erase.v(59)
  reg_ar_as_w1 \u_flash_sector_erase/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_sector_erase/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_sector_erase/sft_wen ));  // src/rtl/flash/flash_sector_erase.v(101)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u0  (
    .a(\u_flash_wait_free/cnt [0]),
    .b(1'b1),
    .c(\u_flash_wait_free/add0/c0 ),
    .o({\u_flash_wait_free/add0/c1 ,\u_flash_wait_free/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u1  (
    .a(\u_flash_wait_free/cnt [1]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c1 ),
    .o({\u_flash_wait_free/add0/c2 ,\u_flash_wait_free/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u10  (
    .a(\u_flash_wait_free/cnt [10]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c10 ),
    .o({\u_flash_wait_free/add0/c11 ,\u_flash_wait_free/n0 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u11  (
    .a(\u_flash_wait_free/cnt [11]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c11 ),
    .o({\u_flash_wait_free/add0/c12 ,\u_flash_wait_free/n0 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u12  (
    .a(\u_flash_wait_free/cnt [12]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c12 ),
    .o({\u_flash_wait_free/add0/c13 ,\u_flash_wait_free/n0 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u13  (
    .a(\u_flash_wait_free/cnt [13]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c13 ),
    .o({\u_flash_wait_free/add0/c14 ,\u_flash_wait_free/n0 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u14  (
    .a(\u_flash_wait_free/cnt [14]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c14 ),
    .o({\u_flash_wait_free/add0/c15 ,\u_flash_wait_free/n0 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u15  (
    .a(\u_flash_wait_free/cnt [15]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c15 ),
    .o({\u_flash_wait_free/add0/c16 ,\u_flash_wait_free/n0 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u16  (
    .a(\u_flash_wait_free/cnt [16]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c16 ),
    .o({\u_flash_wait_free/add0/c17 ,\u_flash_wait_free/n0 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u17  (
    .a(\u_flash_wait_free/cnt [17]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c17 ),
    .o({\u_flash_wait_free/add0/c18 ,\u_flash_wait_free/n0 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u18  (
    .a(\u_flash_wait_free/cnt [18]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c18 ),
    .o({\u_flash_wait_free/add0/c19 ,\u_flash_wait_free/n0 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u19  (
    .a(\u_flash_wait_free/cnt [19]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c19 ),
    .o({\u_flash_wait_free/add0/c20 ,\u_flash_wait_free/n0 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u2  (
    .a(\u_flash_wait_free/cnt [2]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c2 ),
    .o({\u_flash_wait_free/add0/c3 ,\u_flash_wait_free/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u20  (
    .a(\u_flash_wait_free/cnt [20]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c20 ),
    .o({\u_flash_wait_free/add0/c21 ,\u_flash_wait_free/n0 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u21  (
    .a(\u_flash_wait_free/cnt [21]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c21 ),
    .o({\u_flash_wait_free/add0/c22 ,\u_flash_wait_free/n0 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u22  (
    .a(\u_flash_wait_free/cnt [22]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c22 ),
    .o({\u_flash_wait_free/add0/c23 ,\u_flash_wait_free/n0 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u23  (
    .a(\u_flash_wait_free/cnt [23]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c23 ),
    .o({\u_flash_wait_free/add0/c24 ,\u_flash_wait_free/n0 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u24  (
    .a(\u_flash_wait_free/cnt [24]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c24 ),
    .o({\u_flash_wait_free/add0/c25 ,\u_flash_wait_free/n0 [24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u25  (
    .a(\u_flash_wait_free/cnt [25]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c25 ),
    .o({\u_flash_wait_free/add0/c26 ,\u_flash_wait_free/n0 [25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u26  (
    .a(\u_flash_wait_free/cnt [26]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c26 ),
    .o({\u_flash_wait_free/add0/c27 ,\u_flash_wait_free/n0 [26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u27  (
    .a(\u_flash_wait_free/cnt [27]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c27 ),
    .o({\u_flash_wait_free/add0/c28 ,\u_flash_wait_free/n0 [27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u28  (
    .a(\u_flash_wait_free/cnt [28]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c28 ),
    .o({\u_flash_wait_free/add0/c29 ,\u_flash_wait_free/n0 [28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u29  (
    .a(\u_flash_wait_free/cnt [29]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c29 ),
    .o({\u_flash_wait_free/add0/c30 ,\u_flash_wait_free/n0 [29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u3  (
    .a(\u_flash_wait_free/cnt [3]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c3 ),
    .o({\u_flash_wait_free/add0/c4 ,\u_flash_wait_free/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u30  (
    .a(\u_flash_wait_free/cnt [30]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c30 ),
    .o({\u_flash_wait_free/add0/c31 ,\u_flash_wait_free/n0 [30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u31  (
    .a(\u_flash_wait_free/cnt [31]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c31 ),
    .o({open_n94,\u_flash_wait_free/n0 [31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u4  (
    .a(\u_flash_wait_free/cnt [4]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c4 ),
    .o({\u_flash_wait_free/add0/c5 ,\u_flash_wait_free/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u5  (
    .a(\u_flash_wait_free/cnt [5]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c5 ),
    .o({\u_flash_wait_free/add0/c6 ,\u_flash_wait_free/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u6  (
    .a(\u_flash_wait_free/cnt [6]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c6 ),
    .o({\u_flash_wait_free/add0/c7 ,\u_flash_wait_free/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u7  (
    .a(\u_flash_wait_free/cnt [7]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c7 ),
    .o({\u_flash_wait_free/add0/c8 ,\u_flash_wait_free/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u8  (
    .a(\u_flash_wait_free/cnt [8]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c8 ),
    .o({\u_flash_wait_free/add0/c9 ,\u_flash_wait_free/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_wait_free/add0/u9  (
    .a(\u_flash_wait_free/cnt [9]),
    .b(1'b0),
    .c(\u_flash_wait_free/add0/c9 ),
    .o({\u_flash_wait_free/add0/c10 ,\u_flash_wait_free/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_wait_free/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_wait_free/add0/c0 ,open_n97}));
  reg_ar_ss_w1 \u_flash_wait_free/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_wait_free/n18 ),
    .reset(1'b0),
    .set(start_wfree),
    .q(busy_wfree));  // src/rtl/flash/flash_wait_free.v(147)
  reg_ar_as_w1 \u_flash_wait_free/byte_flag_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n12 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/byte_flag ));  // src/rtl/flash/flash_wait_free.v(116)
  reg_ar_ss_w1 \u_flash_wait_free/fls_busy_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/rx_reg [0]),
    .en(\u_flash_wait_free/byte_flag ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/fls_busy ));  // src/rtl/flash/flash_wait_free.v(138)
  reg_ar_as_w1 \u_flash_wait_free/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wfree));  // src/rtl/flash/flash_wait_free.v(89)
  reg_ar_as_w1 \u_flash_wait_free/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wfree));  // src/rtl/flash/flash_wait_free.v(80)
  reg_ar_as_w1 \u_flash_wait_free/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wfree));  // src/rtl/flash/flash_wait_free.v(122)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_0  (
    .a(1'b1),
    .b(\u_flash_wait_free/cycle_cnt [0]),
    .c(\u_flash_wait_free/lt0_c0 ),
    .o({\u_flash_wait_free/lt0_c1 ,open_n98}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_1  (
    .a(1'b1),
    .b(\u_flash_wait_free/cycle_cnt [1]),
    .c(\u_flash_wait_free/lt0_c1 ),
    .o({\u_flash_wait_free/lt0_c2 ,open_n99}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_10  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [10]),
    .c(\u_flash_wait_free/lt0_c10 ),
    .o({\u_flash_wait_free/lt0_c11 ,open_n100}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_11  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [11]),
    .c(\u_flash_wait_free/lt0_c11 ),
    .o({\u_flash_wait_free/lt0_c12 ,open_n101}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_12  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [12]),
    .c(\u_flash_wait_free/lt0_c12 ),
    .o({\u_flash_wait_free/lt0_c13 ,open_n102}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_13  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [13]),
    .c(\u_flash_wait_free/lt0_c13 ),
    .o({\u_flash_wait_free/lt0_c14 ,open_n103}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_14  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [14]),
    .c(\u_flash_wait_free/lt0_c14 ),
    .o({\u_flash_wait_free/lt0_c15 ,open_n104}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_15  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [15]),
    .c(\u_flash_wait_free/lt0_c15 ),
    .o({\u_flash_wait_free/lt0_c16 ,open_n105}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_16  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [16]),
    .c(\u_flash_wait_free/lt0_c16 ),
    .o({\u_flash_wait_free/lt0_c17 ,open_n106}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_17  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [17]),
    .c(\u_flash_wait_free/lt0_c17 ),
    .o({\u_flash_wait_free/lt0_c18 ,open_n107}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_18  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [18]),
    .c(\u_flash_wait_free/lt0_c18 ),
    .o({\u_flash_wait_free/lt0_c19 ,open_n108}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_19  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [19]),
    .c(\u_flash_wait_free/lt0_c19 ),
    .o({\u_flash_wait_free/lt0_c20 ,open_n109}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_2  (
    .a(1'b1),
    .b(\u_flash_wait_free/cycle_cnt [2]),
    .c(\u_flash_wait_free/lt0_c2 ),
    .o({\u_flash_wait_free/lt0_c3 ,open_n110}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_20  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [20]),
    .c(\u_flash_wait_free/lt0_c20 ),
    .o({\u_flash_wait_free/lt0_c21 ,open_n111}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_21  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [21]),
    .c(\u_flash_wait_free/lt0_c21 ),
    .o({\u_flash_wait_free/lt0_c22 ,open_n112}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_22  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [22]),
    .c(\u_flash_wait_free/lt0_c22 ),
    .o({\u_flash_wait_free/lt0_c23 ,open_n113}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_23  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [23]),
    .c(\u_flash_wait_free/lt0_c23 ),
    .o({\u_flash_wait_free/lt0_c24 ,open_n114}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_24  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [24]),
    .c(\u_flash_wait_free/lt0_c24 ),
    .o({\u_flash_wait_free/lt0_c25 ,open_n115}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_25  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [25]),
    .c(\u_flash_wait_free/lt0_c25 ),
    .o({\u_flash_wait_free/lt0_c26 ,open_n116}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_26  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [26]),
    .c(\u_flash_wait_free/lt0_c26 ),
    .o({\u_flash_wait_free/lt0_c27 ,open_n117}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_27  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [27]),
    .c(\u_flash_wait_free/lt0_c27 ),
    .o({\u_flash_wait_free/lt0_c28 ,open_n118}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_28  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [28]),
    .c(\u_flash_wait_free/lt0_c28 ),
    .o({\u_flash_wait_free/lt0_c29 ,open_n119}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_3  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [3]),
    .c(\u_flash_wait_free/lt0_c3 ),
    .o({\u_flash_wait_free/lt0_c4 ,open_n120}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_4  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [4]),
    .c(\u_flash_wait_free/lt0_c4 ),
    .o({\u_flash_wait_free/lt0_c5 ,open_n121}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_5  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [5]),
    .c(\u_flash_wait_free/lt0_c5 ),
    .o({\u_flash_wait_free/lt0_c6 ,open_n122}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_6  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [6]),
    .c(\u_flash_wait_free/lt0_c6 ),
    .o({\u_flash_wait_free/lt0_c7 ,open_n123}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_7  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [7]),
    .c(\u_flash_wait_free/lt0_c7 ),
    .o({\u_flash_wait_free/lt0_c8 ,open_n124}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_8  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [8]),
    .c(\u_flash_wait_free/lt0_c8 ),
    .o({\u_flash_wait_free/lt0_c9 ,open_n125}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_9  (
    .a(1'b0),
    .b(\u_flash_wait_free/cycle_cnt [9]),
    .c(\u_flash_wait_free/lt0_c9 ),
    .o({\u_flash_wait_free/lt0_c10 ,open_n126}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    \u_flash_wait_free/lt0_cin  (
    .a(1'b0),
    .o({\u_flash_wait_free/lt0_c0 ,open_n129}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    \u_flash_wait_free/lt0_cout  (
    .a(1'b0),
    .b(1'b1),
    .c(\u_flash_wait_free/lt0_c29 ),
    .o({open_n130,\u_flash_wait_free/n7 }));
  reg_ar_as_w1 \u_flash_wait_free/reg0_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [0]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [1]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b10  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [10]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b11  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [11]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b12  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [12]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b13  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [13]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b14  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [14]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b15  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [15]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b16  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [16]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b17  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [17]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b18  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [18]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b19  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [19]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [2]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b20  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [20]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b21  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [21]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b22  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [22]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b23  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [23]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b24  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [24]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b25  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [25]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b26  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [26]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b27  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [27]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b28  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [28]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [3]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [4]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [5]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [6]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [7]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b8  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [8]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg0_b9  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/cycle_cnt [9]));  // src/rtl/flash/flash_wait_free.v(68)
  reg_ar_as_w1 \u_flash_wait_free/reg1_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/phase_cnt [0]));  // src/rtl/flash/flash_wait_free.v(74)
  reg_ar_as_w1 \u_flash_wait_free/reg1_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/phase_cnt [1]));  // src/rtl/flash/flash_wait_free.v(74)
  reg_ar_ss_w1 \u_flash_wait_free/reg2_b0  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/tx_reg [0]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [0]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [1]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_ar_ss_w1 \u_flash_wait_free/reg2_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [1]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(1'b0),
    .set(start_wfree),
    .q(\u_flash_wait_free/tx_reg [2]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [2]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [3]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [3]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [4]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [4]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [5]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [5]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [6]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_sr_as_w1 \u_flash_wait_free/reg2_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/tx_reg [6]),
    .en(\u_flash_wait_free/sft_wen ),
    .reset(start_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/tx_reg [7]));  // src/rtl/flash/flash_wait_free.v(98)
  reg_ar_as_w1 \u_flash_wait_free/reg3_b0  (
    .clk(clk),
    .d(fls_sdi_wfree),
    .en(\u_flash_wait_free/sft_ren ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/rx_reg [0]));  // src/rtl/flash/flash_wait_free.v(129)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b0  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [0]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [0]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b1  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [1]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [1]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b10  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [10]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [10]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b11  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [11]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [11]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b12  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [12]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [12]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b13  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [13]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [13]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b14  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [14]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [14]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b15  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [15]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [15]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b16  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [16]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [16]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b17  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [17]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [17]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b18  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [18]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [18]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b19  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [19]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [19]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b2  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [2]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [2]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b20  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [20]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [20]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b21  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [21]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [21]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b22  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [22]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [22]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b23  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [23]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [23]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b24  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [24]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [24]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b25  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [25]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [25]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b26  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [26]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [26]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b27  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [27]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [27]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b28  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [28]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [28]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b29  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [29]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [29]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b3  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [3]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [3]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b30  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [30]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [30]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b31  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [31]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [31]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b4  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [4]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [4]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b5  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [5]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [5]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b6  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [6]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [6]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b7  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [7]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [7]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b8  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [8]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [8]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_sr_as_w1 \u_flash_wait_free/reg4_b9  (
    .clk(clk),
    .d(\u_flash_wait_free/n0 [9]),
    .en(1'b1),
    .reset(~busy_wfree),
    .set(1'b0),
    .q(\u_flash_wait_free/cnt [9]));  // src/rtl/flash/flash_wait_free.v(62)
  reg_ar_as_w1 \u_flash_wait_free/sft_ren_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n8 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/sft_ren ));  // src/rtl/flash/flash_wait_free.v(110)
  reg_ar_as_w1 \u_flash_wait_free/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_wait_free/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_wait_free/sft_wen ));  // src/rtl/flash/flash_wait_free.v(104)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u0  (
    .a(\u_flash_write/cnt [0]),
    .b(1'b1),
    .c(\u_flash_write/add0/c0 ),
    .o({\u_flash_write/add0/c1 ,\u_flash_write/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u1  (
    .a(\u_flash_write/cnt [1]),
    .b(1'b0),
    .c(\u_flash_write/add0/c1 ),
    .o({\u_flash_write/add0/c2 ,\u_flash_write/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u2  (
    .a(\u_flash_write/cnt [2]),
    .b(1'b0),
    .c(\u_flash_write/add0/c2 ),
    .o({\u_flash_write/add0/c3 ,\u_flash_write/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u3  (
    .a(\u_flash_write/cnt [3]),
    .b(1'b0),
    .c(\u_flash_write/add0/c3 ),
    .o({\u_flash_write/add0/c4 ,\u_flash_write/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u4  (
    .a(\u_flash_write/cnt [4]),
    .b(1'b0),
    .c(\u_flash_write/add0/c4 ),
    .o({\u_flash_write/add0/c5 ,\u_flash_write/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u5  (
    .a(\u_flash_write/cnt [5]),
    .b(1'b0),
    .c(\u_flash_write/add0/c5 ),
    .o({\u_flash_write/add0/c6 ,\u_flash_write/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u6  (
    .a(\u_flash_write/cnt [6]),
    .b(1'b0),
    .c(\u_flash_write/add0/c6 ),
    .o({\u_flash_write/add0/c7 ,\u_flash_write/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u7  (
    .a(\u_flash_write/cnt [7]),
    .b(1'b0),
    .c(\u_flash_write/add0/c7 ),
    .o({\u_flash_write/add0/c8 ,\u_flash_write/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u8  (
    .a(\u_flash_write/cnt [8]),
    .b(1'b0),
    .c(\u_flash_write/add0/c8 ),
    .o({\u_flash_write/add0/c9 ,\u_flash_write/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write/add0/u9  (
    .a(\u_flash_write/cnt [9]),
    .b(1'b0),
    .c(\u_flash_write/add0/c9 ),
    .o({open_n131,\u_flash_write/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_write/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_write/add0/c0 ,open_n134}));
  reg_ar_ss_w1 \u_flash_write/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write/n6 ),
    .reset(1'b0),
    .set(start_wr),
    .q(busy_wr));  // src/rtl/flash/flash_write.v(124)
  reg_ar_as_w1 \u_flash_write/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_write/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wr));  // src/rtl/flash/flash_write.v(88)
  reg_ar_as_w1 \u_flash_write/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_write/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wr));  // src/rtl/flash/flash_write.v(79)
  reg_ar_as_w1 \u_flash_write/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [39]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wr));  // src/rtl/flash/flash_write.v(115)
  reg_ar_as_w1 \u_flash_write/reg0_b0  (
    .clk(clk),
    .d(\u_flash_write/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [0]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b1  (
    .clk(clk),
    .d(\u_flash_write/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [1]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b2  (
    .clk(clk),
    .d(\u_flash_write/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [2]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b3  (
    .clk(clk),
    .d(\u_flash_write/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [3]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b4  (
    .clk(clk),
    .d(\u_flash_write/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [4]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b5  (
    .clk(clk),
    .d(\u_flash_write/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [5]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg0_b6  (
    .clk(clk),
    .d(\u_flash_write/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/cycle_cnt [6]));  // src/rtl/flash/flash_write.v(67)
  reg_ar_as_w1 \u_flash_write/reg1_b0  (
    .clk(clk),
    .d(\u_flash_write/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/phase_cnt [0]));  // src/rtl/flash/flash_write.v(73)
  reg_ar_as_w1 \u_flash_write/reg1_b1  (
    .clk(clk),
    .d(\u_flash_write/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/phase_cnt [1]));  // src/rtl/flash/flash_write.v(73)
  reg_ar_as_w1 \u_flash_write/reg2_b0  (
    .clk(clk),
    .d(\u_flash_write/n4 [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [0]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b1  (
    .clk(clk),
    .d(\u_flash_write/n4 [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [1]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b10  (
    .clk(clk),
    .d(\u_flash_write/n4 [10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [10]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b11  (
    .clk(clk),
    .d(\u_flash_write/n4 [11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [11]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b12  (
    .clk(clk),
    .d(\u_flash_write/n4 [12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [12]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b13  (
    .clk(clk),
    .d(\u_flash_write/n4 [13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [13]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b14  (
    .clk(clk),
    .d(\u_flash_write/n4 [14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [14]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b15  (
    .clk(clk),
    .d(\u_flash_write/n4 [15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [15]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b16  (
    .clk(clk),
    .d(\u_flash_write/n4 [16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [16]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b17  (
    .clk(clk),
    .d(\u_flash_write/n4 [17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [17]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b18  (
    .clk(clk),
    .d(\u_flash_write/n4 [18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [18]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b19  (
    .clk(clk),
    .d(\u_flash_write/n4 [19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [19]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b2  (
    .clk(clk),
    .d(\u_flash_write/n4 [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [2]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b20  (
    .clk(clk),
    .d(\u_flash_write/n4 [20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [20]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b21  (
    .clk(clk),
    .d(\u_flash_write/n4 [21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [21]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b22  (
    .clk(clk),
    .d(\u_flash_write/n4 [22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [22]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b23  (
    .clk(clk),
    .d(\u_flash_write/n4 [23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [23]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b24  (
    .clk(clk),
    .d(\u_flash_write/n4 [24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [24]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b25  (
    .clk(clk),
    .d(\u_flash_write/n4 [25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [25]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b26  (
    .clk(clk),
    .d(\u_flash_write/n4 [26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [26]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b27  (
    .clk(clk),
    .d(\u_flash_write/n4 [27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [27]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b28  (
    .clk(clk),
    .d(\u_flash_write/n4 [28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [28]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b29  (
    .clk(clk),
    .d(\u_flash_write/n4 [29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [29]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b3  (
    .clk(clk),
    .d(\u_flash_write/n4 [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [3]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b30  (
    .clk(clk),
    .d(\u_flash_write/n4 [30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [30]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b31  (
    .clk(clk),
    .d(\u_flash_write/n4 [31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [31]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b32  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [31]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [32]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_ss_w1 \u_flash_write/reg2_b33  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [32]),
    .en(\u_flash_write/sft_wen ),
    .reset(1'b0),
    .set(start_wr),
    .q(\u_flash_write/tx_reg [33]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b34  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [33]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [34]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b35  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [34]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [35]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b36  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [35]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [36]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b37  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [36]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [37]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b38  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [37]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [38]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg2_b39  (
    .clk(clk),
    .d(\u_flash_write/tx_reg [38]),
    .en(\u_flash_write/sft_wen ),
    .reset(start_wr),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [39]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b4  (
    .clk(clk),
    .d(\u_flash_write/n4 [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [4]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b5  (
    .clk(clk),
    .d(\u_flash_write/n4 [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [5]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b6  (
    .clk(clk),
    .d(\u_flash_write/n4 [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [6]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b7  (
    .clk(clk),
    .d(\u_flash_write/n4 [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [7]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b8  (
    .clk(clk),
    .d(\u_flash_write/n4 [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [8]));  // src/rtl/flash/flash_write.v(97)
  reg_ar_as_w1 \u_flash_write/reg2_b9  (
    .clk(clk),
    .d(\u_flash_write/n4 [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/tx_reg [9]));  // src/rtl/flash/flash_write.v(97)
  reg_sr_as_w1 \u_flash_write/reg3_b0  (
    .clk(clk),
    .d(\u_flash_write/n0 [0]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [0]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b1  (
    .clk(clk),
    .d(\u_flash_write/n0 [1]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [1]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b2  (
    .clk(clk),
    .d(\u_flash_write/n0 [2]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [2]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b3  (
    .clk(clk),
    .d(\u_flash_write/n0 [3]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [3]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b4  (
    .clk(clk),
    .d(\u_flash_write/n0 [4]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [4]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b5  (
    .clk(clk),
    .d(\u_flash_write/n0 [5]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [5]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b6  (
    .clk(clk),
    .d(\u_flash_write/n0 [6]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [6]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b7  (
    .clk(clk),
    .d(\u_flash_write/n0 [7]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [7]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b8  (
    .clk(clk),
    .d(\u_flash_write/n0 [8]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [8]));  // src/rtl/flash/flash_write.v(61)
  reg_sr_as_w1 \u_flash_write/reg3_b9  (
    .clk(clk),
    .d(\u_flash_write/n0 [9]),
    .en(1'b1),
    .reset(~busy_wr),
    .set(1'b0),
    .q(\u_flash_write/cnt [9]));  // src/rtl/flash/flash_write.v(61)
  reg_ar_as_w1 \u_flash_write/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_write/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write/sft_wen ));  // src/rtl/flash/flash_write.v(103)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u0  (
    .a(\u_flash_write_enable/cnt [0]),
    .b(1'b1),
    .c(\u_flash_write_enable/add0/c0 ),
    .o({\u_flash_write_enable/add0/c1 ,\u_flash_write_enable/n0 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u1  (
    .a(\u_flash_write_enable/cnt [1]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c1 ),
    .o({\u_flash_write_enable/add0/c2 ,\u_flash_write_enable/n0 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u2  (
    .a(\u_flash_write_enable/cnt [2]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c2 ),
    .o({\u_flash_write_enable/add0/c3 ,\u_flash_write_enable/n0 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u3  (
    .a(\u_flash_write_enable/cnt [3]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c3 ),
    .o({\u_flash_write_enable/add0/c4 ,\u_flash_write_enable/n0 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u4  (
    .a(\u_flash_write_enable/cnt [4]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c4 ),
    .o({\u_flash_write_enable/add0/c5 ,\u_flash_write_enable/n0 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u5  (
    .a(\u_flash_write_enable/cnt [5]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c5 ),
    .o({\u_flash_write_enable/add0/c6 ,\u_flash_write_enable/n0 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u6  (
    .a(\u_flash_write_enable/cnt [6]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c6 ),
    .o({\u_flash_write_enable/add0/c7 ,\u_flash_write_enable/n0 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u7  (
    .a(\u_flash_write_enable/cnt [7]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c7 ),
    .o({\u_flash_write_enable/add0/c8 ,\u_flash_write_enable/n0 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u8  (
    .a(\u_flash_write_enable/cnt [8]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c8 ),
    .o({\u_flash_write_enable/add0/c9 ,\u_flash_write_enable/n0 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_flash_write_enable/add0/u9  (
    .a(\u_flash_write_enable/cnt [9]),
    .b(1'b0),
    .c(\u_flash_write_enable/add0/c9 ),
    .o({open_n135,\u_flash_write_enable/n0 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_flash_write_enable/add0/ucin  (
    .a(1'b0),
    .o({\u_flash_write_enable/add0/c0 ,open_n138}));
  reg_ar_ss_w1 \u_flash_write_enable/busy_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write_enable/n6 ),
    .reset(1'b0),
    .set(start_wen),
    .q(busy_wen));  // src/rtl/flash/flash_write_enable.v(120)
  reg_ar_as_w1 \u_flash_write_enable/fls_ncs_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/n2 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs_wen));  // src/rtl/flash/flash_write_enable.v(84)
  reg_ar_as_w1 \u_flash_write_enable/fls_sck_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck_wen));  // src/rtl/flash/flash_write_enable.v(75)
  reg_ar_as_w1 \u_flash_write_enable/fls_sdo_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo_wen));  // src/rtl/flash/flash_write_enable.v(111)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [0]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [1]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [2]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [3]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [4]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [5]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg0_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/cycle_cnt [6]));  // src/rtl/flash/flash_write_enable.v(63)
  reg_ar_as_w1 \u_flash_write_enable/reg1_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/phase_cnt [0]));  // src/rtl/flash/flash_write_enable.v(69)
  reg_ar_as_w1 \u_flash_write_enable/reg1_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/cnt [1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/phase_cnt [1]));  // src/rtl/flash/flash_write_enable.v(69)
  reg_ar_ss_w1 \u_flash_write_enable/reg2_b1  (
    .clk(clk),
    .d(1'b0),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(1'b0),
    .set(start_wen),
    .q(\u_flash_write_enable/tx_reg [1]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_ar_ss_w1 \u_flash_write_enable/reg2_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [1]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(1'b0),
    .set(start_wen),
    .q(\u_flash_write_enable/tx_reg [2]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [2]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [3]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [3]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [4]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [4]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [5]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [5]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [6]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg2_b7  (
    .clk(clk),
    .d(\u_flash_write_enable/tx_reg [6]),
    .en(\u_flash_write_enable/sft_wen ),
    .reset(start_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/tx_reg [7]));  // src/rtl/flash/flash_write_enable.v(93)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b0  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [0]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [0]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b1  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [1]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [1]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b2  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [2]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [2]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b3  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [3]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [3]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b4  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [4]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [4]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b5  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [5]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [5]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b6  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [6]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [6]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b7  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [7]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [7]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b8  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [8]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [8]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_sr_as_w1 \u_flash_write_enable/reg3_b9  (
    .clk(clk),
    .d(\u_flash_write_enable/n0 [9]),
    .en(1'b1),
    .reset(~busy_wen),
    .set(1'b0),
    .q(\u_flash_write_enable/cnt [9]));  // src/rtl/flash/flash_write_enable.v(57)
  reg_ar_as_w1 \u_flash_write_enable/sft_wen_reg  (
    .clk(clk),
    .d(\u_flash_write_enable/n5 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_flash_write_enable/sft_wen ));  // src/rtl/flash/flash_write_enable.v(99)

endmodule 

module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule 

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

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
  wire [3:0] \u_uart_tx/n10 ;
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
  wire \u_uart_tx/add0/c0 ;
  wire \u_uart_tx/add0/c1 ;
  wire \u_uart_tx/add0/c10 ;
  wire \u_uart_tx/add0/c11 ;
  wire \u_uart_tx/add0/c12 ;
  wire \u_uart_tx/add0/c13 ;
  wire \u_uart_tx/add0/c14 ;
  wire \u_uart_tx/add0/c15 ;
  wire \u_uart_tx/add0/c16 ;
  wire \u_uart_tx/add0/c17 ;
  wire \u_uart_tx/add0/c18 ;
  wire \u_uart_tx/add0/c19 ;
  wire \u_uart_tx/add0/c2 ;
  wire \u_uart_tx/add0/c20 ;
  wire \u_uart_tx/add0/c21 ;
  wire \u_uart_tx/add0/c22 ;
  wire \u_uart_tx/add0/c23 ;
  wire \u_uart_tx/add0/c24 ;
  wire \u_uart_tx/add0/c25 ;
  wire \u_uart_tx/add0/c26 ;
  wire \u_uart_tx/add0/c27 ;
  wire \u_uart_tx/add0/c28 ;
  wire \u_uart_tx/add0/c29 ;
  wire \u_uart_tx/add0/c3 ;
  wire \u_uart_tx/add0/c30 ;
  wire \u_uart_tx/add0/c31 ;
  wire \u_uart_tx/add0/c4 ;
  wire \u_uart_tx/add0/c5 ;
  wire \u_uart_tx/add0/c6 ;
  wire \u_uart_tx/add0/c7 ;
  wire \u_uart_tx/add0/c8 ;
  wire \u_uart_tx/add0/c9 ;
  wire \u_uart_tx/add1/c0 ;
  wire \u_uart_tx/add1/c1 ;
  wire \u_uart_tx/add1/c2 ;
  wire \u_uart_tx/add1/c3 ;
  wire \u_uart_tx/clk_en ;  // src/rtl/uart/uart_tx.v(26)
  wire \u_uart_tx/mux1_b0_sel_is_1_o ;
  wire \u_uart_tx/n0 ;
  wire \u_uart_tx/n13 ;
  wire \u_uart_tx/n4 ;
  wire \u_uart_tx/n7 ;
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
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u32 (
    .a(\u_uart_tx/start ),
    .b(tx_en),
    .o(\u_uart_tx/n8 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u33 (
    .a(\u_uart_tx/cnt [0]),
    .b(\u_uart_tx/cnt [1]),
    .c(\u_uart_tx/cnt [2]),
    .d(\u_uart_tx/cnt [3]),
    .o(\u_uart_tx/n4 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u34 (
    .a(\u_uart_tx/data [2]),
    .b(\u_uart_tx/data [3]),
    .c(\u_uart_tx/cnt [0]),
    .d(\u_uart_tx/cnt [1]),
    .o(_al_u34_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u35 (
    .a(\u_uart_tx/data [4]),
    .b(\u_uart_tx/cnt [0]),
    .c(\u_uart_tx/cnt [1]),
    .o(_al_u35_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u36 (
    .a(\u_uart_tx/cnt [0]),
    .b(\u_uart_tx/cnt [1]),
    .o(_al_u36_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~(C*B*A))"),
    .INIT(16'h7f00))
    _al_u37 (
    .a(\u_uart_tx/data [5]),
    .b(\u_uart_tx/cnt [0]),
    .c(\u_uart_tx/cnt [1]),
    .d(\u_uart_tx/cnt [2]),
    .o(_al_u37_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    _al_u38 (
    .a(_al_u34_o),
    .b(_al_u35_o),
    .c(_al_u37_o),
    .o(_al_u38_o));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(C*~A))"),
    .INIT(8'h23))
    _al_u39 (
    .a(\u_uart_tx/data [0]),
    .b(\u_uart_tx/cnt [0]),
    .c(\u_uart_tx/cnt [1]),
    .o(_al_u39_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*B*A))"),
    .INIT(16'h007f))
    _al_u40 (
    .a(\u_uart_tx/data [1]),
    .b(\u_uart_tx/cnt [0]),
    .c(\u_uart_tx/cnt [1]),
    .d(\u_uart_tx/cnt [2]),
    .o(_al_u40_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*~A))"),
    .INIT(8'h0b))
    _al_u41 (
    .a(_al_u39_o),
    .b(_al_u40_o),
    .c(\u_uart_tx/cnt [3]),
    .o(_al_u41_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~(~D*~(~B*~A)))"),
    .INIT(16'h0fef))
    _al_u42 (
    .a(_al_u36_o),
    .b(\u_uart_tx/cnt [2]),
    .c(\u_uart_tx/cnt [3]),
    .d(tx_pad),
    .o(_al_u42_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u43 (
    .a(\u_uart_tx/cnt [1]),
    .b(\u_uart_tx/cnt [2]),
    .o(_al_u43_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D))"),
    .INIT(16'h0a22))
    _al_u44 (
    .a(_al_u43_o),
    .b(\u_uart_tx/data [6]),
    .c(\u_uart_tx/data [7]),
    .d(\u_uart_tx/cnt [0]),
    .o(_al_u44_o));
  AL_MAP_LUT4 #(
    .EQN("~(~(~D*~C)*~(B*~A))"),
    .INIT(16'h444f))
    _al_u45 (
    .a(_al_u38_o),
    .b(_al_u41_o),
    .c(_al_u42_o),
    .d(_al_u44_o),
    .o(\u_uart_tx/n13 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u46 (
    .a(\u_uart_tx/clk_cnt [27]),
    .b(\u_uart_tx/clk_cnt [28]),
    .c(\u_uart_tx/clk_cnt [29]),
    .d(\u_uart_tx/clk_cnt [3]),
    .o(_al_u46_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u47 (
    .a(\u_uart_tx/clk_cnt [23]),
    .b(\u_uart_tx/clk_cnt [24]),
    .c(\u_uart_tx/clk_cnt [25]),
    .d(\u_uart_tx/clk_cnt [26]),
    .o(_al_u47_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u48 (
    .a(\u_uart_tx/clk_cnt [6]),
    .b(\u_uart_tx/clk_cnt [7]),
    .c(\u_uart_tx/clk_cnt [8]),
    .d(\u_uart_tx/clk_cnt [9]),
    .o(_al_u48_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u49 (
    .a(\u_uart_tx/clk_cnt [30]),
    .b(\u_uart_tx/clk_cnt [31]),
    .c(\u_uart_tx/clk_cnt [4]),
    .d(\u_uart_tx/clk_cnt [5]),
    .o(_al_u49_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u50 (
    .a(_al_u46_o),
    .b(_al_u47_o),
    .c(_al_u48_o),
    .d(_al_u49_o),
    .o(_al_u50_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u51 (
    .a(\u_uart_tx/clk_cnt [12]),
    .b(\u_uart_tx/clk_cnt [13]),
    .c(\u_uart_tx/clk_cnt [14]),
    .d(\u_uart_tx/clk_cnt [15]),
    .o(_al_u51_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u52 (
    .a(\u_uart_tx/clk_cnt [0]),
    .b(\u_uart_tx/clk_cnt [1]),
    .c(\u_uart_tx/clk_cnt [10]),
    .d(\u_uart_tx/clk_cnt [11]),
    .o(_al_u52_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u53 (
    .a(\u_uart_tx/clk_cnt [2]),
    .b(\u_uart_tx/clk_cnt [20]),
    .c(\u_uart_tx/clk_cnt [21]),
    .d(\u_uart_tx/clk_cnt [22]),
    .o(_al_u53_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u54 (
    .a(\u_uart_tx/clk_cnt [16]),
    .b(\u_uart_tx/clk_cnt [17]),
    .c(\u_uart_tx/clk_cnt [18]),
    .d(\u_uart_tx/clk_cnt [19]),
    .o(_al_u54_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u55 (
    .a(_al_u51_o),
    .b(_al_u52_o),
    .c(_al_u53_o),
    .d(_al_u54_o),
    .o(_al_u55_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u56 (
    .a(_al_u50_o),
    .b(_al_u55_o),
    .o(\u_uart_tx/n0 ));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u57 (
    .a(_al_u50_o),
    .b(_al_u55_o),
    .c(\u_uart_tx/start ),
    .o(\u_uart_tx/mux1_b0_sel_is_1_o ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u58 (
    .a(\u_uart_tx/start ),
    .o(\u_uart_tx/n7 ));
  \uart_rx(CLK_RATE=24000000)  u_uart_rx (
    .clk(clk),
    .rx(rx),
    .rx_data(rx_data),
    .rx_en(rx_en));  // src/rtl/uart/uart.v(60)
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u0  (
    .a(\u_uart_tx/clk_cnt [0]),
    .b(1'b1),
    .c(\u_uart_tx/add0/c0 ),
    .o({\u_uart_tx/add0/c1 ,\u_uart_tx/n1 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u1  (
    .a(\u_uart_tx/clk_cnt [1]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c1 ),
    .o({\u_uart_tx/add0/c2 ,\u_uart_tx/n1 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u10  (
    .a(\u_uart_tx/clk_cnt [10]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c10 ),
    .o({\u_uart_tx/add0/c11 ,\u_uart_tx/n1 [10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u11  (
    .a(\u_uart_tx/clk_cnt [11]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c11 ),
    .o({\u_uart_tx/add0/c12 ,\u_uart_tx/n1 [11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u12  (
    .a(\u_uart_tx/clk_cnt [12]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c12 ),
    .o({\u_uart_tx/add0/c13 ,\u_uart_tx/n1 [12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u13  (
    .a(\u_uart_tx/clk_cnt [13]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c13 ),
    .o({\u_uart_tx/add0/c14 ,\u_uart_tx/n1 [13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u14  (
    .a(\u_uart_tx/clk_cnt [14]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c14 ),
    .o({\u_uart_tx/add0/c15 ,\u_uart_tx/n1 [14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u15  (
    .a(\u_uart_tx/clk_cnt [15]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c15 ),
    .o({\u_uart_tx/add0/c16 ,\u_uart_tx/n1 [15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u16  (
    .a(\u_uart_tx/clk_cnt [16]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c16 ),
    .o({\u_uart_tx/add0/c17 ,\u_uart_tx/n1 [16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u17  (
    .a(\u_uart_tx/clk_cnt [17]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c17 ),
    .o({\u_uart_tx/add0/c18 ,\u_uart_tx/n1 [17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u18  (
    .a(\u_uart_tx/clk_cnt [18]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c18 ),
    .o({\u_uart_tx/add0/c19 ,\u_uart_tx/n1 [18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u19  (
    .a(\u_uart_tx/clk_cnt [19]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c19 ),
    .o({\u_uart_tx/add0/c20 ,\u_uart_tx/n1 [19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u2  (
    .a(\u_uart_tx/clk_cnt [2]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c2 ),
    .o({\u_uart_tx/add0/c3 ,\u_uart_tx/n1 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u20  (
    .a(\u_uart_tx/clk_cnt [20]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c20 ),
    .o({\u_uart_tx/add0/c21 ,\u_uart_tx/n1 [20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u21  (
    .a(\u_uart_tx/clk_cnt [21]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c21 ),
    .o({\u_uart_tx/add0/c22 ,\u_uart_tx/n1 [21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u22  (
    .a(\u_uart_tx/clk_cnt [22]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c22 ),
    .o({\u_uart_tx/add0/c23 ,\u_uart_tx/n1 [22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u23  (
    .a(\u_uart_tx/clk_cnt [23]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c23 ),
    .o({\u_uart_tx/add0/c24 ,\u_uart_tx/n1 [23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u24  (
    .a(\u_uart_tx/clk_cnt [24]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c24 ),
    .o({\u_uart_tx/add0/c25 ,\u_uart_tx/n1 [24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u25  (
    .a(\u_uart_tx/clk_cnt [25]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c25 ),
    .o({\u_uart_tx/add0/c26 ,\u_uart_tx/n1 [25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u26  (
    .a(\u_uart_tx/clk_cnt [26]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c26 ),
    .o({\u_uart_tx/add0/c27 ,\u_uart_tx/n1 [26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u27  (
    .a(\u_uart_tx/clk_cnt [27]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c27 ),
    .o({\u_uart_tx/add0/c28 ,\u_uart_tx/n1 [27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u28  (
    .a(\u_uart_tx/clk_cnt [28]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c28 ),
    .o({\u_uart_tx/add0/c29 ,\u_uart_tx/n1 [28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u29  (
    .a(\u_uart_tx/clk_cnt [29]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c29 ),
    .o({\u_uart_tx/add0/c30 ,\u_uart_tx/n1 [29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u3  (
    .a(\u_uart_tx/clk_cnt [3]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c3 ),
    .o({\u_uart_tx/add0/c4 ,\u_uart_tx/n1 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u30  (
    .a(\u_uart_tx/clk_cnt [30]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c30 ),
    .o({\u_uart_tx/add0/c31 ,\u_uart_tx/n1 [30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u31  (
    .a(\u_uart_tx/clk_cnt [31]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c31 ),
    .o({open_n17,\u_uart_tx/n1 [31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u4  (
    .a(\u_uart_tx/clk_cnt [4]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c4 ),
    .o({\u_uart_tx/add0/c5 ,\u_uart_tx/n1 [4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u5  (
    .a(\u_uart_tx/clk_cnt [5]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c5 ),
    .o({\u_uart_tx/add0/c6 ,\u_uart_tx/n1 [5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u6  (
    .a(\u_uart_tx/clk_cnt [6]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c6 ),
    .o({\u_uart_tx/add0/c7 ,\u_uart_tx/n1 [6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u7  (
    .a(\u_uart_tx/clk_cnt [7]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c7 ),
    .o({\u_uart_tx/add0/c8 ,\u_uart_tx/n1 [7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u8  (
    .a(\u_uart_tx/clk_cnt [8]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c8 ),
    .o({\u_uart_tx/add0/c9 ,\u_uart_tx/n1 [8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add0/u9  (
    .a(\u_uart_tx/clk_cnt [9]),
    .b(1'b0),
    .c(\u_uart_tx/add0/c9 ),
    .o({\u_uart_tx/add0/c10 ,\u_uart_tx/n1 [9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart_tx/add0/ucin  (
    .a(1'b0),
    .o({\u_uart_tx/add0/c0 ,open_n20}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add1/u0  (
    .a(\u_uart_tx/cnt [0]),
    .b(1'b1),
    .c(\u_uart_tx/add1/c0 ),
    .o({\u_uart_tx/add1/c1 ,\u_uart_tx/n10 [0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add1/u1  (
    .a(\u_uart_tx/cnt [1]),
    .b(1'b0),
    .c(\u_uart_tx/add1/c1 ),
    .o({\u_uart_tx/add1/c2 ,\u_uart_tx/n10 [1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add1/u2  (
    .a(\u_uart_tx/cnt [2]),
    .b(1'b0),
    .c(\u_uart_tx/add1/c2 ),
    .o({\u_uart_tx/add1/c3 ,\u_uart_tx/n10 [2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \u_uart_tx/add1/u3  (
    .a(\u_uart_tx/cnt [3]),
    .b(1'b0),
    .c(\u_uart_tx/add1/c3 ),
    .o({open_n21,\u_uart_tx/n10 [3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \u_uart_tx/add1/ucin  (
    .a(1'b0),
    .o({\u_uart_tx/add1/c0 ,open_n24}));
  reg_ar_as_w1 \u_uart_tx/clk_en_reg  (
    .clk(clk),
    .d(\u_uart_tx/n0 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/clk_en ));  // src/rtl/uart/uart_tx.v(47)
  reg_ar_as_w1 \u_uart_tx/reg0_b0  (
    .clk(clk),
    .d(tx_data[0]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [0]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b1  (
    .clk(clk),
    .d(tx_data[1]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [1]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b2  (
    .clk(clk),
    .d(tx_data[2]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [2]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b3  (
    .clk(clk),
    .d(tx_data[3]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [3]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b4  (
    .clk(clk),
    .d(tx_data[4]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [4]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b5  (
    .clk(clk),
    .d(tx_data[5]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [5]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b6  (
    .clk(clk),
    .d(tx_data[6]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [6]));  // src/rtl/uart/uart_tx.v(63)
  reg_ar_as_w1 \u_uart_tx/reg0_b7  (
    .clk(clk),
    .d(tx_data[7]),
    .en(\u_uart_tx/n8 ),
    .reset(1'b0),
    .set(1'b0),
    .q(\u_uart_tx/data [7]));  // src/rtl/uart/uart_tx.v(63)
  reg_sr_as_w1 \u_uart_tx/reg1_b0  (
    .clk(clk),
    .d(\u_uart_tx/n10 [0]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [0]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b1  (
    .clk(clk),
    .d(\u_uart_tx/n10 [1]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [1]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b2  (
    .clk(clk),
    .d(\u_uart_tx/n10 [2]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [2]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg1_b3  (
    .clk(clk),
    .d(\u_uart_tx/n10 [3]),
    .en(\u_uart_tx/clk_en ),
    .reset(~\u_uart_tx/start ),
    .set(1'b0),
    .q(\u_uart_tx/cnt [3]));  // src/rtl/uart/uart_tx.v(72)
  reg_sr_as_w1 \u_uart_tx/reg2_b0  (
    .clk(clk),
    .d(\u_uart_tx/n1 [0]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [0]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b1  (
    .clk(clk),
    .d(\u_uart_tx/n1 [1]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [1]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b10  (
    .clk(clk),
    .d(\u_uart_tx/n1 [10]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [10]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b11  (
    .clk(clk),
    .d(\u_uart_tx/n1 [11]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [11]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b12  (
    .clk(clk),
    .d(\u_uart_tx/n1 [12]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [12]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b13  (
    .clk(clk),
    .d(\u_uart_tx/n1 [13]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [13]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b14  (
    .clk(clk),
    .d(\u_uart_tx/n1 [14]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [14]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b15  (
    .clk(clk),
    .d(\u_uart_tx/n1 [15]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [15]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b16  (
    .clk(clk),
    .d(\u_uart_tx/n1 [16]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [16]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b17  (
    .clk(clk),
    .d(\u_uart_tx/n1 [17]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [17]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b18  (
    .clk(clk),
    .d(\u_uart_tx/n1 [18]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [18]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b19  (
    .clk(clk),
    .d(\u_uart_tx/n1 [19]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [19]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b2  (
    .clk(clk),
    .d(\u_uart_tx/n1 [2]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [2]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b20  (
    .clk(clk),
    .d(\u_uart_tx/n1 [20]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [20]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b21  (
    .clk(clk),
    .d(\u_uart_tx/n1 [21]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [21]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b22  (
    .clk(clk),
    .d(\u_uart_tx/n1 [22]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [22]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b23  (
    .clk(clk),
    .d(\u_uart_tx/n1 [23]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [23]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b24  (
    .clk(clk),
    .d(\u_uart_tx/n1 [24]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [24]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b25  (
    .clk(clk),
    .d(\u_uart_tx/n1 [25]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [25]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b26  (
    .clk(clk),
    .d(\u_uart_tx/n1 [26]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [26]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b27  (
    .clk(clk),
    .d(\u_uart_tx/n1 [27]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [27]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b28  (
    .clk(clk),
    .d(\u_uart_tx/n1 [28]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [28]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b29  (
    .clk(clk),
    .d(\u_uart_tx/n1 [29]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [29]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b3  (
    .clk(clk),
    .d(\u_uart_tx/n1 [3]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [3]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b30  (
    .clk(clk),
    .d(\u_uart_tx/n1 [30]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [30]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b31  (
    .clk(clk),
    .d(\u_uart_tx/n1 [31]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [31]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b4  (
    .clk(clk),
    .d(\u_uart_tx/n1 [4]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [4]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b5  (
    .clk(clk),
    .d(\u_uart_tx/n1 [5]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [5]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b6  (
    .clk(clk),
    .d(\u_uart_tx/n1 [6]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [6]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b7  (
    .clk(clk),
    .d(\u_uart_tx/n1 [7]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [7]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b8  (
    .clk(clk),
    .d(\u_uart_tx/n1 [8]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [8]));  // src/rtl/uart/uart_tx.v(41)
  reg_sr_as_w1 \u_uart_tx/reg2_b9  (
    .clk(clk),
    .d(\u_uart_tx/n1 [9]),
    .en(1'b1),
    .reset(~\u_uart_tx/mux1_b0_sel_is_1_o ),
    .set(1'b0),
    .q(\u_uart_tx/clk_cnt [9]));  // src/rtl/uart/uart_tx.v(41)
  reg_ar_ss_w1 \u_uart_tx/start_reg  (
    .clk(clk),
    .d(1'b0),
    .en(\u_uart_tx/n4 ),
    .reset(1'b0),
    .set(tx_en),
    .q(\u_uart_tx/start ));  // src/rtl/uart/uart_tx.v(56)
  reg_sr_as_w1 \u_uart_tx/tx_ready_reg  (
    .clk(clk),
    .d(\u_uart_tx/n7 ),
    .en(1'b1),
    .reset(tx_en),
    .set(1'b0),
    .q(tx_ready));  // src/rtl/uart/uart_tx.v(99)
  reg_ar_as_w1 \u_uart_tx/tx_reg  (
    .clk(clk),
    .d(\u_uart_tx/n13 ),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_pad));  // src/rtl/uart/uart_tx.v(90)
  ubus u_ubus (
    .busy(busy),
    .clk(clk),
    .fls_read(fls_read),
    .id(id),
    .ubus_raddr(ubus_raddr),
    .ubus_ren(ubus_ren),
    .ubus_waddr(ubus_waddr),
    .ubus_wdata({open_n25,open_n26,open_n27,open_n28,open_n29,open_n30,open_n31,open_n32,ubus_wdata[23:0]}),
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
    .ubus_wdata({open_n33,open_n34,open_n35,open_n36,open_n37,open_n38,open_n39,open_n40,ubus_wdata[23:0]}),
    .ubus_wen(ubus_wen));  // src/rtl/uart/uart.v(91)

endmodule 

module reg_sr_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

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
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c13 ;
  wire \add0/c14 ;
  wire \add0/c15 ;
  wire \add0/c16 ;
  wire \add0/c17 ;
  wire \add0/c18 ;
  wire \add0/c19 ;
  wire \add0/c2 ;
  wire \add0/c20 ;
  wire \add0/c21 ;
  wire \add0/c22 ;
  wire \add0/c23 ;
  wire \add0/c24 ;
  wire \add0/c25 ;
  wire \add0/c26 ;
  wire \add0/c27 ;
  wire \add0/c28 ;
  wire \add0/c29 ;
  wire \add0/c3 ;
  wire \add0/c30 ;
  wire \add0/c31 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire \add1/c0 ;
  wire \add1/c1 ;
  wire \add1/c10 ;
  wire \add1/c11 ;
  wire \add1/c12 ;
  wire \add1/c13 ;
  wire \add1/c14 ;
  wire \add1/c15 ;
  wire \add1/c16 ;
  wire \add1/c17 ;
  wire \add1/c18 ;
  wire \add1/c19 ;
  wire \add1/c2 ;
  wire \add1/c20 ;
  wire \add1/c21 ;
  wire \add1/c22 ;
  wire \add1/c23 ;
  wire \add1/c3 ;
  wire \add1/c4 ;
  wire \add1/c5 ;
  wire \add1/c6 ;
  wire \add1/c7 ;
  wire \add1/c8 ;
  wire \add1/c9 ;
  wire byte_flag;  // src/rtl/flash/flash_fast_read.v(48)
  wire lt0_c0;
  wire lt0_c1;
  wire lt0_c10;
  wire lt0_c11;
  wire lt0_c12;
  wire lt0_c13;
  wire lt0_c14;
  wire lt0_c15;
  wire lt0_c16;
  wire lt0_c17;
  wire lt0_c18;
  wire lt0_c19;
  wire lt0_c2;
  wire lt0_c20;
  wire lt0_c21;
  wire lt0_c22;
  wire lt0_c23;
  wire lt0_c24;
  wire lt0_c25;
  wire lt0_c26;
  wire lt0_c27;
  wire lt0_c28;
  wire lt0_c29;
  wire lt0_c3;
  wire lt0_c4;
  wire lt0_c5;
  wire lt0_c6;
  wire lt0_c7;
  wire lt0_c8;
  wire lt0_c9;
  wire n12;
  wire n18;
  wire n2;
  wire n5;
  wire n7;
  wire n8;
  wire sft_ren;  // src/rtl/flash/flash_fast_read.v(47)
  wire sft_wen;  // src/rtl/flash/flash_fast_read.v(46)

  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u10 (
    .a(_al_u9_o),
    .b(cycle_cnt[7]),
    .c(cycle_cnt[8]),
    .d(cycle_cnt[9]),
    .o(_al_u10_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u11 (
    .a(cycle_cnt[0]),
    .b(cycle_cnt[1]),
    .o(_al_u11_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u12 (
    .a(cycle_cnt[10]),
    .b(cycle_cnt[11]),
    .c(cycle_cnt[12]),
    .d(cycle_cnt[13]),
    .o(_al_u12_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u13 (
    .a(cycle_cnt[18]),
    .b(cycle_cnt[19]),
    .c(cycle_cnt[2]),
    .d(cycle_cnt[20]),
    .o(_al_u13_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u14 (
    .a(cycle_cnt[14]),
    .b(cycle_cnt[15]),
    .c(cycle_cnt[16]),
    .d(cycle_cnt[17]),
    .o(_al_u14_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u15 (
    .a(_al_u11_o),
    .b(_al_u12_o),
    .c(_al_u13_o),
    .d(_al_u14_o),
    .o(_al_u15_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u16 (
    .a(_al_u10_o),
    .b(_al_u15_o),
    .c(_al_u7_o),
    .d(_al_u8_o),
    .o(n18));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u17 (
    .a(busy),
    .o(n2));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u3 (
    .a(fls_sck),
    .b(phase_cnt[0]),
    .c(phase_cnt[1]),
    .o(n5));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    _al_u4 (
    .a(fls_sck),
    .b(n7),
    .c(phase_cnt[0]),
    .d(phase_cnt[1]),
    .o(n8));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u5 (
    .a(fls_sck),
    .b(n7),
    .c(cycle_cnt[0]),
    .d(cycle_cnt[1]),
    .o(_al_u5_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    _al_u6 (
    .a(_al_u5_o),
    .b(cycle_cnt[2]),
    .c(phase_cnt[0]),
    .d(phase_cnt[1]),
    .o(n12));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u7 (
    .a(cycle_cnt[25]),
    .b(cycle_cnt[26]),
    .c(cycle_cnt[27]),
    .d(cycle_cnt[28]),
    .o(_al_u7_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u8 (
    .a(cycle_cnt[21]),
    .b(cycle_cnt[22]),
    .c(cycle_cnt[23]),
    .d(cycle_cnt[24]),
    .o(_al_u8_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u9 (
    .a(cycle_cnt[3]),
    .b(cycle_cnt[4]),
    .c(cycle_cnt[5]),
    .d(cycle_cnt[6]),
    .o(_al_u9_o));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n0[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n0[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n0[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n0[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n0[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(cnt[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n0[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(cnt[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n0[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(cnt[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n0[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(cnt[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n0[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(cnt[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n0[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(cnt[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n0[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(cnt[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n0[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n0[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(cnt[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n0[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(cnt[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n0[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(cnt[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n0[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(cnt[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n0[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(cnt[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({\add0/c25 ,n0[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u25  (
    .a(cnt[25]),
    .b(1'b0),
    .c(\add0/c25 ),
    .o({\add0/c26 ,n0[25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u26  (
    .a(cnt[26]),
    .b(1'b0),
    .c(\add0/c26 ),
    .o({\add0/c27 ,n0[26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u27  (
    .a(cnt[27]),
    .b(1'b0),
    .c(\add0/c27 ),
    .o({\add0/c28 ,n0[27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u28  (
    .a(cnt[28]),
    .b(1'b0),
    .c(\add0/c28 ),
    .o({\add0/c29 ,n0[28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u29  (
    .a(cnt[29]),
    .b(1'b0),
    .c(\add0/c29 ),
    .o({\add0/c30 ,n0[29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n0[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u30  (
    .a(cnt[30]),
    .b(1'b0),
    .c(\add0/c30 ),
    .o({\add0/c31 ,n0[30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u31  (
    .a(cnt[31]),
    .b(1'b0),
    .c(\add0/c31 ),
    .o({open_n0,n0[31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n0[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n0[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n0[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n0[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n0[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n0[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u0  (
    .a(addr[0]),
    .b(1'b1),
    .c(\add1/c0 ),
    .o({\add1/c1 ,n15[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u1  (
    .a(addr[1]),
    .b(1'b0),
    .c(\add1/c1 ),
    .o({\add1/c2 ,n15[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u10  (
    .a(addr[10]),
    .b(1'b0),
    .c(\add1/c10 ),
    .o({\add1/c11 ,n15[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u11  (
    .a(addr[11]),
    .b(1'b0),
    .c(\add1/c11 ),
    .o({\add1/c12 ,n15[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u12  (
    .a(addr[12]),
    .b(1'b0),
    .c(\add1/c12 ),
    .o({\add1/c13 ,n15[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u13  (
    .a(addr[13]),
    .b(1'b0),
    .c(\add1/c13 ),
    .o({\add1/c14 ,n15[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u14  (
    .a(addr[14]),
    .b(1'b0),
    .c(\add1/c14 ),
    .o({\add1/c15 ,n15[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u15  (
    .a(addr[15]),
    .b(1'b0),
    .c(\add1/c15 ),
    .o({\add1/c16 ,n15[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u16  (
    .a(addr[16]),
    .b(1'b0),
    .c(\add1/c16 ),
    .o({\add1/c17 ,n15[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u17  (
    .a(addr[17]),
    .b(1'b0),
    .c(\add1/c17 ),
    .o({\add1/c18 ,n15[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u18  (
    .a(addr[18]),
    .b(1'b0),
    .c(\add1/c18 ),
    .o({\add1/c19 ,n15[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u19  (
    .a(addr[19]),
    .b(1'b0),
    .c(\add1/c19 ),
    .o({\add1/c20 ,n15[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u2  (
    .a(addr[2]),
    .b(1'b0),
    .c(\add1/c2 ),
    .o({\add1/c3 ,n15[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u20  (
    .a(addr[20]),
    .b(1'b0),
    .c(\add1/c20 ),
    .o({\add1/c21 ,n15[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u21  (
    .a(addr[21]),
    .b(1'b0),
    .c(\add1/c21 ),
    .o({\add1/c22 ,n15[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u22  (
    .a(addr[22]),
    .b(1'b0),
    .c(\add1/c22 ),
    .o({\add1/c23 ,n15[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u23  (
    .a(addr[23]),
    .b(1'b0),
    .c(\add1/c23 ),
    .o({open_n4,n15[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u3  (
    .a(addr[3]),
    .b(1'b0),
    .c(\add1/c3 ),
    .o({\add1/c4 ,n15[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u4  (
    .a(addr[4]),
    .b(1'b0),
    .c(\add1/c4 ),
    .o({\add1/c5 ,n15[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u5  (
    .a(addr[5]),
    .b(1'b0),
    .c(\add1/c5 ),
    .o({\add1/c6 ,n15[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u6  (
    .a(addr[6]),
    .b(1'b0),
    .c(\add1/c6 ),
    .o({\add1/c7 ,n15[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u7  (
    .a(addr[7]),
    .b(1'b0),
    .c(\add1/c7 ),
    .o({\add1/c8 ,n15[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u8  (
    .a(addr[8]),
    .b(1'b0),
    .c(\add1/c8 ),
    .o({\add1/c9 ,n15[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u9  (
    .a(addr[9]),
    .b(1'b0),
    .c(\add1/c9 ),
    .o({\add1/c10 ,n15[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add1/ucin  (
    .a(1'b0),
    .o({\add1/c0 ,open_n7}));
  reg_ar_ss_w1 busy_reg (
    .clk(clk),
    .d(1'b0),
    .en(n18),
    .reset(1'b0),
    .set(start),
    .q(busy));  // src/rtl/flash/flash_fast_read.v(163)
  reg_ar_as_w1 byte_flag_reg (
    .clk(clk),
    .d(n12),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(byte_flag));  // src/rtl/flash/flash_fast_read.v(119)
  reg_ar_as_w1 dout_en_reg (
    .clk(clk),
    .d(byte_flag),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(dout_en));  // src/rtl/flash/flash_fast_read.v(138)
  reg_ar_as_w1 fls_ncs_reg (
    .clk(clk),
    .d(n2),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_ncs));  // src/rtl/flash/flash_fast_read.v(92)
  reg_ar_as_w1 fls_sck_reg (
    .clk(clk),
    .d(cnt[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sck));  // src/rtl/flash/flash_fast_read.v(83)
  reg_ar_as_w1 fls_sdo_reg (
    .clk(clk),
    .d(tx_reg[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_sdo));  // src/rtl/flash/flash_fast_read.v(125)
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_0 (
    .a(1'b1),
    .b(cycle_cnt[0]),
    .c(lt0_c0),
    .o({lt0_c1,open_n8}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_1 (
    .a(1'b1),
    .b(cycle_cnt[1]),
    .c(lt0_c1),
    .o({lt0_c2,open_n9}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_10 (
    .a(1'b0),
    .b(cycle_cnt[10]),
    .c(lt0_c10),
    .o({lt0_c11,open_n10}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_11 (
    .a(1'b0),
    .b(cycle_cnt[11]),
    .c(lt0_c11),
    .o({lt0_c12,open_n11}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_12 (
    .a(1'b0),
    .b(cycle_cnt[12]),
    .c(lt0_c12),
    .o({lt0_c13,open_n12}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_13 (
    .a(1'b0),
    .b(cycle_cnt[13]),
    .c(lt0_c13),
    .o({lt0_c14,open_n13}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_14 (
    .a(1'b0),
    .b(cycle_cnt[14]),
    .c(lt0_c14),
    .o({lt0_c15,open_n14}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_15 (
    .a(1'b0),
    .b(cycle_cnt[15]),
    .c(lt0_c15),
    .o({lt0_c16,open_n15}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_16 (
    .a(1'b0),
    .b(cycle_cnt[16]),
    .c(lt0_c16),
    .o({lt0_c17,open_n16}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_17 (
    .a(1'b0),
    .b(cycle_cnt[17]),
    .c(lt0_c17),
    .o({lt0_c18,open_n17}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_18 (
    .a(1'b0),
    .b(cycle_cnt[18]),
    .c(lt0_c18),
    .o({lt0_c19,open_n18}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_19 (
    .a(1'b0),
    .b(cycle_cnt[19]),
    .c(lt0_c19),
    .o({lt0_c20,open_n19}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_2 (
    .a(1'b1),
    .b(cycle_cnt[2]),
    .c(lt0_c2),
    .o({lt0_c3,open_n20}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_20 (
    .a(1'b0),
    .b(cycle_cnt[20]),
    .c(lt0_c20),
    .o({lt0_c21,open_n21}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_21 (
    .a(1'b0),
    .b(cycle_cnt[21]),
    .c(lt0_c21),
    .o({lt0_c22,open_n22}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_22 (
    .a(1'b0),
    .b(cycle_cnt[22]),
    .c(lt0_c22),
    .o({lt0_c23,open_n23}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_23 (
    .a(1'b0),
    .b(cycle_cnt[23]),
    .c(lt0_c23),
    .o({lt0_c24,open_n24}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_24 (
    .a(1'b0),
    .b(cycle_cnt[24]),
    .c(lt0_c24),
    .o({lt0_c25,open_n25}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_25 (
    .a(1'b0),
    .b(cycle_cnt[25]),
    .c(lt0_c25),
    .o({lt0_c26,open_n26}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_26 (
    .a(1'b0),
    .b(cycle_cnt[26]),
    .c(lt0_c26),
    .o({lt0_c27,open_n27}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_27 (
    .a(1'b0),
    .b(cycle_cnt[27]),
    .c(lt0_c27),
    .o({lt0_c28,open_n28}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_28 (
    .a(1'b0),
    .b(cycle_cnt[28]),
    .c(lt0_c28),
    .o({lt0_c29,open_n29}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_3 (
    .a(1'b0),
    .b(cycle_cnt[3]),
    .c(lt0_c3),
    .o({lt0_c4,open_n30}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_4 (
    .a(1'b0),
    .b(cycle_cnt[4]),
    .c(lt0_c4),
    .o({lt0_c5,open_n31}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_5 (
    .a(1'b1),
    .b(cycle_cnt[5]),
    .c(lt0_c5),
    .o({lt0_c6,open_n32}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_6 (
    .a(1'b0),
    .b(cycle_cnt[6]),
    .c(lt0_c6),
    .o({lt0_c7,open_n33}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_7 (
    .a(1'b0),
    .b(cycle_cnt[7]),
    .c(lt0_c7),
    .o({lt0_c8,open_n34}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_8 (
    .a(1'b0),
    .b(cycle_cnt[8]),
    .c(lt0_c8),
    .o({lt0_c9,open_n35}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_9 (
    .a(1'b0),
    .b(cycle_cnt[9]),
    .c(lt0_c9),
    .o({lt0_c10,open_n36}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    lt0_cin (
    .a(1'b0),
    .o({lt0_c0,open_n39}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    lt0_cout (
    .a(1'b0),
    .b(1'b1),
    .c(lt0_c29),
    .o({open_n40,n7}));
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(cnt[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[0]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(cnt[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[1]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b10 (
    .clk(clk),
    .d(cnt[13]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[10]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b11 (
    .clk(clk),
    .d(cnt[14]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[11]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b12 (
    .clk(clk),
    .d(cnt[15]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[12]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b13 (
    .clk(clk),
    .d(cnt[16]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[13]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b14 (
    .clk(clk),
    .d(cnt[17]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[14]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b15 (
    .clk(clk),
    .d(cnt[18]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[15]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b16 (
    .clk(clk),
    .d(cnt[19]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[16]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b17 (
    .clk(clk),
    .d(cnt[20]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[17]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b18 (
    .clk(clk),
    .d(cnt[21]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[18]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b19 (
    .clk(clk),
    .d(cnt[22]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[19]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(cnt[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[2]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b20 (
    .clk(clk),
    .d(cnt[23]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[20]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b21 (
    .clk(clk),
    .d(cnt[24]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[21]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b22 (
    .clk(clk),
    .d(cnt[25]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[22]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b23 (
    .clk(clk),
    .d(cnt[26]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[23]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b24 (
    .clk(clk),
    .d(cnt[27]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[24]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b25 (
    .clk(clk),
    .d(cnt[28]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[25]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b26 (
    .clk(clk),
    .d(cnt[29]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[26]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b27 (
    .clk(clk),
    .d(cnt[30]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[27]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b28 (
    .clk(clk),
    .d(cnt[31]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[28]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(cnt[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[3]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(cnt[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[4]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(cnt[8]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[5]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(cnt[9]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[6]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(cnt[10]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[7]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b8 (
    .clk(clk),
    .d(cnt[11]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[8]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg0_b9 (
    .clk(clk),
    .d(cnt[12]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(cycle_cnt[9]));  // src/rtl/flash/flash_fast_read.v(71)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(cnt[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(phase_cnt[0]));  // src/rtl/flash/flash_fast_read.v(77)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(cnt[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(phase_cnt[1]));  // src/rtl/flash/flash_fast_read.v(77)
  reg_ar_ss_w1 reg2_b24 (
    .clk(clk),
    .d(1'b0),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[24]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_ss_w1 reg2_b25 (
    .clk(clk),
    .d(tx_reg[24]),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[25]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b26 (
    .clk(clk),
    .d(tx_reg[25]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[26]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_ss_w1 reg2_b27 (
    .clk(clk),
    .d(tx_reg[26]),
    .en(sft_wen),
    .reset(1'b0),
    .set(start),
    .q(tx_reg[27]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b28 (
    .clk(clk),
    .d(tx_reg[27]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[28]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b29 (
    .clk(clk),
    .d(tx_reg[28]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[29]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b30 (
    .clk(clk),
    .d(tx_reg[29]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[30]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_sr_as_w1 reg2_b31 (
    .clk(clk),
    .d(tx_reg[30]),
    .en(sft_wen),
    .reset(start),
    .set(1'b0),
    .q(tx_reg[31]));  // src/rtl/flash/flash_fast_read.v(101)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(fls_sdi),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[0]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(rx_reg[0]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[1]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(rx_reg[1]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[2]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(rx_reg[2]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[3]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(rx_reg[3]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[4]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(rx_reg[4]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[5]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(rx_reg[5]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[6]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(rx_reg[6]),
    .en(sft_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_reg[7]));  // src/rtl/flash/flash_fast_read.v(132)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(rx_reg[0]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[0]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(rx_reg[1]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[1]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(rx_reg[2]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[2]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(rx_reg[3]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[3]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(rx_reg[4]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[4]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk),
    .d(rx_reg[5]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[5]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk),
    .d(rx_reg[6]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[6]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk),
    .d(rx_reg[7]),
    .en(byte_flag),
    .reset(1'b0),
    .set(1'b0),
    .q(dout[7]));  // src/rtl/flash/flash_fast_read.v(145)
  reg_ar_ss_w1 reg5_b0 (
    .clk(clk),
    .d(n15[0]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[0]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b1 (
    .clk(clk),
    .d(n15[1]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[1]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b10 (
    .clk(clk),
    .d(n15[10]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[10]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b11 (
    .clk(clk),
    .d(n15[11]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[11]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b12 (
    .clk(clk),
    .d(n15[12]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[12]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b13 (
    .clk(clk),
    .d(n15[13]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[13]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b14 (
    .clk(clk),
    .d(n15[14]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[14]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b15 (
    .clk(clk),
    .d(n15[15]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[15]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b16 (
    .clk(clk),
    .d(n15[16]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[16]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b17 (
    .clk(clk),
    .d(n15[17]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[17]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b18 (
    .clk(clk),
    .d(n15[18]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[18]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b19 (
    .clk(clk),
    .d(n15[19]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[19]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b2 (
    .clk(clk),
    .d(n15[2]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[2]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b20 (
    .clk(clk),
    .d(n15[20]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[20]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b21 (
    .clk(clk),
    .d(n15[21]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[21]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b22 (
    .clk(clk),
    .d(n15[22]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[22]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b23 (
    .clk(clk),
    .d(n15[23]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[23]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b3 (
    .clk(clk),
    .d(n15[3]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[3]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b4 (
    .clk(clk),
    .d(n15[4]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[4]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b5 (
    .clk(clk),
    .d(n15[5]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[5]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b6 (
    .clk(clk),
    .d(n15[6]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[6]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b7 (
    .clk(clk),
    .d(n15[7]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[7]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b8 (
    .clk(clk),
    .d(n15[8]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[8]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_ar_ss_w1 reg5_b9 (
    .clk(clk),
    .d(n15[9]),
    .en(byte_flag),
    .reset(1'b0),
    .set(start),
    .q(addr[9]));  // src/rtl/flash/flash_fast_read.v(154)
  reg_sr_as_w1 reg6_b0 (
    .clk(clk),
    .d(n0[0]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[0]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b1 (
    .clk(clk),
    .d(n0[1]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[1]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b10 (
    .clk(clk),
    .d(n0[10]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[10]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b11 (
    .clk(clk),
    .d(n0[11]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[11]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b12 (
    .clk(clk),
    .d(n0[12]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[12]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b13 (
    .clk(clk),
    .d(n0[13]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[13]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b14 (
    .clk(clk),
    .d(n0[14]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[14]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b15 (
    .clk(clk),
    .d(n0[15]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[15]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b16 (
    .clk(clk),
    .d(n0[16]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[16]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b17 (
    .clk(clk),
    .d(n0[17]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[17]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b18 (
    .clk(clk),
    .d(n0[18]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[18]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b19 (
    .clk(clk),
    .d(n0[19]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[19]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b2 (
    .clk(clk),
    .d(n0[2]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[2]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b20 (
    .clk(clk),
    .d(n0[20]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[20]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b21 (
    .clk(clk),
    .d(n0[21]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[21]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b22 (
    .clk(clk),
    .d(n0[22]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[22]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b23 (
    .clk(clk),
    .d(n0[23]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[23]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b24 (
    .clk(clk),
    .d(n0[24]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[24]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b25 (
    .clk(clk),
    .d(n0[25]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[25]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b26 (
    .clk(clk),
    .d(n0[26]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[26]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b27 (
    .clk(clk),
    .d(n0[27]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[27]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b28 (
    .clk(clk),
    .d(n0[28]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[28]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b29 (
    .clk(clk),
    .d(n0[29]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[29]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b3 (
    .clk(clk),
    .d(n0[3]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[3]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b30 (
    .clk(clk),
    .d(n0[30]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[30]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b31 (
    .clk(clk),
    .d(n0[31]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[31]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b4 (
    .clk(clk),
    .d(n0[4]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[4]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b5 (
    .clk(clk),
    .d(n0[5]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[5]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b6 (
    .clk(clk),
    .d(n0[6]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[6]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b7 (
    .clk(clk),
    .d(n0[7]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[7]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b8 (
    .clk(clk),
    .d(n0[8]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[8]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_sr_as_w1 reg6_b9 (
    .clk(clk),
    .d(n0[9]),
    .en(1'b1),
    .reset(~busy),
    .set(1'b0),
    .q(cnt[9]));  // src/rtl/flash/flash_fast_read.v(65)
  reg_ar_as_w1 sft_ren_reg (
    .clk(clk),
    .d(n8),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_ren));  // src/rtl/flash/flash_fast_read.v(113)
  reg_ar_as_w1 sft_wen_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(sft_wen));  // src/rtl/flash/flash_fast_read.v(107)

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
  wire [3:0] n13;
  wire [31:0] n7;
  wire [31:0] n8;
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
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c13 ;
  wire \add0/c14 ;
  wire \add0/c15 ;
  wire \add0/c16 ;
  wire \add0/c17 ;
  wire \add0/c18 ;
  wire \add0/c19 ;
  wire \add0/c2 ;
  wire \add0/c20 ;
  wire \add0/c21 ;
  wire \add0/c22 ;
  wire \add0/c23 ;
  wire \add0/c24 ;
  wire \add0/c25 ;
  wire \add0/c26 ;
  wire \add0/c27 ;
  wire \add0/c28 ;
  wire \add0/c29 ;
  wire \add0/c3 ;
  wire \add0/c30 ;
  wire \add0/c31 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire \add1/c0 ;
  wire \add1/c1 ;
  wire \add1/c2 ;
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
  wire n28;
  wire n5;
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
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u40 (
    .a(rx_d[0]),
    .b(rx_d[1]),
    .o(n0));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u41 (
    .a(cnt[0]),
    .b(cnt[1]),
    .c(cnt[2]),
    .d(cnt[3]),
    .o(n1));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u42 (
    .a(clk_en),
    .b(cnt[2]),
    .c(cnt[3]),
    .o(_al_u42_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u43 (
    .a(_al_u42_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b0_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u44 (
    .a(_al_u42_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b2_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u45 (
    .a(_al_u42_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b1_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u46 (
    .a(clk_en),
    .b(cnt[2]),
    .c(cnt[3]),
    .o(_al_u46_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u47 (
    .a(_al_u46_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b6_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u48 (
    .a(_al_u46_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b5_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    _al_u49 (
    .a(_al_u46_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b4_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u50 (
    .a(_al_u46_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b3_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u51 (
    .a(clk_en),
    .b(cnt[2]),
    .c(cnt[3]),
    .o(_al_u51_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u52 (
    .a(_al_u51_o),
    .b(cnt[0]),
    .c(cnt[1]),
    .o(mux4_b7_sel_is_3_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u53 (
    .a(n1),
    .b(start),
    .o(n28));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u54 (
    .a(clk_cnt[27]),
    .b(clk_cnt[28]),
    .c(clk_cnt[29]),
    .d(clk_cnt[3]),
    .o(_al_u54_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u55 (
    .a(clk_cnt[23]),
    .b(clk_cnt[24]),
    .c(clk_cnt[25]),
    .d(clk_cnt[26]),
    .o(_al_u55_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u56 (
    .a(clk_cnt[6]),
    .b(clk_cnt[7]),
    .c(clk_cnt[8]),
    .d(clk_cnt[9]),
    .o(_al_u56_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u57 (
    .a(clk_cnt[30]),
    .b(clk_cnt[31]),
    .c(clk_cnt[4]),
    .d(clk_cnt[5]),
    .o(_al_u57_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u58 (
    .a(_al_u54_o),
    .b(_al_u55_o),
    .c(_al_u56_o),
    .d(_al_u57_o),
    .o(_al_u58_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u59 (
    .a(clk_cnt[12]),
    .b(clk_cnt[13]),
    .c(clk_cnt[14]),
    .d(clk_cnt[15]),
    .o(_al_u59_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u60 (
    .a(clk_cnt[0]),
    .b(clk_cnt[1]),
    .c(clk_cnt[10]),
    .d(clk_cnt[11]),
    .o(_al_u60_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u61 (
    .a(clk_cnt[2]),
    .b(clk_cnt[20]),
    .c(clk_cnt[21]),
    .d(clk_cnt[22]),
    .o(_al_u61_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u62 (
    .a(clk_cnt[16]),
    .b(clk_cnt[17]),
    .c(clk_cnt[18]),
    .d(clk_cnt[19]),
    .o(_al_u62_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u63 (
    .a(_al_u59_o),
    .b(_al_u60_o),
    .c(_al_u61_o),
    .d(_al_u62_o),
    .o(_al_u63_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u64 (
    .a(_al_u58_o),
    .b(_al_u63_o),
    .o(n5));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u65 (
    .a(_al_u58_o),
    .b(_al_u63_o),
    .c(n7[6]),
    .o(n8[6]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u66 (
    .a(_al_u58_o),
    .b(_al_u63_o),
    .c(n7[5]),
    .o(n8[5]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u67 (
    .a(_al_u58_o),
    .b(_al_u63_o),
    .c(n7[3]),
    .o(n8[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    _al_u68 (
    .a(_al_u58_o),
    .b(_al_u63_o),
    .c(start),
    .o(mux1_b0_sel_is_1_o));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(clk_cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n7[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(clk_cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n7[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(clk_cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n7[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(clk_cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n7[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(clk_cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n7[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(clk_cnt[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n7[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(clk_cnt[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n7[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(clk_cnt[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n7[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(clk_cnt[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n7[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(clk_cnt[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n7[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(clk_cnt[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n7[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(clk_cnt[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n7[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(clk_cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n7[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(clk_cnt[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n7[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(clk_cnt[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n7[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(clk_cnt[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n7[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(clk_cnt[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n7[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(clk_cnt[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({\add0/c25 ,n7[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u25  (
    .a(clk_cnt[25]),
    .b(1'b0),
    .c(\add0/c25 ),
    .o({\add0/c26 ,n7[25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u26  (
    .a(clk_cnt[26]),
    .b(1'b0),
    .c(\add0/c26 ),
    .o({\add0/c27 ,n7[26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u27  (
    .a(clk_cnt[27]),
    .b(1'b0),
    .c(\add0/c27 ),
    .o({\add0/c28 ,n7[27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u28  (
    .a(clk_cnt[28]),
    .b(1'b0),
    .c(\add0/c28 ),
    .o({\add0/c29 ,n7[28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u29  (
    .a(clk_cnt[29]),
    .b(1'b0),
    .c(\add0/c29 ),
    .o({\add0/c30 ,n7[29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(clk_cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n7[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u30  (
    .a(clk_cnt[30]),
    .b(1'b0),
    .c(\add0/c30 ),
    .o({\add0/c31 ,n7[30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u31  (
    .a(clk_cnt[31]),
    .b(1'b0),
    .c(\add0/c31 ),
    .o({open_n17,n7[31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(clk_cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n7[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(clk_cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n7[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(clk_cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n7[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(clk_cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n7[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(clk_cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n7[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(clk_cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n7[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n20}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u0  (
    .a(cnt[0]),
    .b(1'b1),
    .c(\add1/c0 ),
    .o({\add1/c1 ,n13[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u1  (
    .a(cnt[1]),
    .b(1'b0),
    .c(\add1/c1 ),
    .o({\add1/c2 ,n13[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u2  (
    .a(cnt[2]),
    .b(1'b0),
    .c(\add1/c2 ),
    .o({\add1/c3 ,n13[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add1/u3  (
    .a(cnt[3]),
    .b(1'b0),
    .c(\add1/c3 ),
    .o({open_n21,n13[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add1/ucin  (
    .a(1'b0),
    .o({\add1/c0 ,open_n24}));
  reg_ar_as_w1 clk_en_reg (
    .clk(clk),
    .d(n5),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_en));  // src/rtl/uart/uart_rx.v(61)
  reg_sr_as_w1 reg0_b0 (
    .clk(clk),
    .d(n7[0]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[0]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b1 (
    .clk(clk),
    .d(n7[1]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[1]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b10 (
    .clk(clk),
    .d(n7[10]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[10]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b11 (
    .clk(clk),
    .d(n7[11]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[11]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b12 (
    .clk(clk),
    .d(n7[12]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[12]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b13 (
    .clk(clk),
    .d(n7[13]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[13]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b14 (
    .clk(clk),
    .d(n7[14]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[14]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b15 (
    .clk(clk),
    .d(n7[15]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[15]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b16 (
    .clk(clk),
    .d(n7[16]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[16]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b17 (
    .clk(clk),
    .d(n7[17]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[17]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b18 (
    .clk(clk),
    .d(n7[18]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[18]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b19 (
    .clk(clk),
    .d(n7[19]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[19]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b2 (
    .clk(clk),
    .d(n7[2]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[2]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b20 (
    .clk(clk),
    .d(n7[20]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[20]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b21 (
    .clk(clk),
    .d(n7[21]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[21]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b22 (
    .clk(clk),
    .d(n7[22]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[22]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b23 (
    .clk(clk),
    .d(n7[23]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[23]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b24 (
    .clk(clk),
    .d(n7[24]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[24]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b25 (
    .clk(clk),
    .d(n7[25]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[25]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b26 (
    .clk(clk),
    .d(n7[26]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[26]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b27 (
    .clk(clk),
    .d(n7[27]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[27]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b28 (
    .clk(clk),
    .d(n7[28]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[28]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b29 (
    .clk(clk),
    .d(n7[29]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[29]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b3 (
    .clk(clk),
    .d(n8[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[3]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b30 (
    .clk(clk),
    .d(n7[30]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[30]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b31 (
    .clk(clk),
    .d(n7[31]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[31]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b4 (
    .clk(clk),
    .d(n7[4]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[4]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b5 (
    .clk(clk),
    .d(n8[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[5]));  // src/rtl/uart/uart_rx.v(55)
  reg_ar_ss_w1 reg0_b6 (
    .clk(clk),
    .d(n8[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(~start),
    .q(clk_cnt[6]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b7 (
    .clk(clk),
    .d(n7[7]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[7]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b8 (
    .clk(clk),
    .d(n7[8]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[8]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg0_b9 (
    .clk(clk),
    .d(n7[9]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_1_o),
    .set(1'b0),
    .q(clk_cnt[9]));  // src/rtl/uart/uart_rx.v(55)
  reg_sr_as_w1 reg1_b0 (
    .clk(clk),
    .d(n13[0]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[0]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b1 (
    .clk(clk),
    .d(n13[1]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[1]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b2 (
    .clk(clk),
    .d(n13[2]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[2]));  // src/rtl/uart/uart_rx.v(70)
  reg_sr_as_w1 reg1_b3 (
    .clk(clk),
    .d(n13[3]),
    .en(clk_en),
    .reset(~start),
    .set(1'b0),
    .q(cnt[3]));  // src/rtl/uart/uart_rx.v(70)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[0]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b1_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[1]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b2_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[2]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b3_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[3]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b4_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[4]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b5_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[5]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b6_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[6]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk),
    .d(rx_pad),
    .en(mux4_b7_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(data[7]));  // src/rtl/uart/uart_rx.v(86)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(data[0]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[0]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(data[1]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[1]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(data[2]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[2]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(data[3]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[3]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(data[4]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[4]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(data[5]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[5]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(data[6]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[6]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(data[7]),
    .en(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_data[7]));  // src/rtl/uart/uart_rx.v(99)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(rx_pad),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_d[0]));  // src/rtl/uart/uart_rx.v(35)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(rx_d[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_d[1]));  // src/rtl/uart/uart_rx.v(35)
  reg_ar_as_w1 rx_en_reg (
    .clk(clk),
    .d(n28),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rx_en));  // src/rtl/uart/uart_rx.v(92)
  reg_ar_ss_w1 start_reg (
    .clk(clk),
    .d(1'b0),
    .en(n1),
    .reset(1'b0),
    .set(n0),
    .q(start));  // src/rtl/uart/uart_rx.v(44)

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
  wire [31:0] n0;
  wire [31:0] n40;
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
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u100 (
    .a(n39_lutinv),
    .b(_al_u99_o),
    .c(ubus_rdata[15]),
    .o(n40[15]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u101 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[14]),
    .d(led_pad[14]),
    .o(_al_u101_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u102 (
    .a(n39_lutinv),
    .b(_al_u101_o),
    .c(ubus_rdata[14]),
    .o(n40[14]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u103 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[13]),
    .d(led_pad[13]),
    .o(_al_u103_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u104 (
    .a(n39_lutinv),
    .b(_al_u103_o),
    .c(ubus_rdata[13]),
    .o(n40[13]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u105 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[12]),
    .d(led_pad[12]),
    .o(_al_u105_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u106 (
    .a(n39_lutinv),
    .b(_al_u105_o),
    .c(ubus_rdata[12]),
    .o(n40[12]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u107 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[11]),
    .d(led_pad[11]),
    .o(_al_u107_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u108 (
    .a(n39_lutinv),
    .b(_al_u107_o),
    .c(ubus_rdata[11]),
    .o(n40[11]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u109 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[10]),
    .d(led_pad[10]),
    .o(_al_u109_o));
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
    .do({open_n35,open_n36,open_n37,led_pad[5]}),
    .opad(led[5]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u110 (
    .a(n39_lutinv),
    .b(_al_u109_o),
    .c(ubus_rdata[10]),
    .o(n40[10]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u111 (
    .a(n37_lutinv),
    .b(id[1]),
    .o(\sel8_b1/B2 ));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(C*A))"),
    .INIT(16'h5f13))
    _al_u112 (
    .a(n36_lutinv),
    .b(n35_lutinv),
    .c(fls_read[1]),
    .d(led_pad[1]),
    .o(_al_u112_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u113 (
    .a(n39_lutinv),
    .b(\sel8_b1/B2 ),
    .c(_al_u112_o),
    .d(ubus_rdata[1]),
    .o(n40[1]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u114 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[0]),
    .d(led_pad[0]),
    .o(_al_u114_o));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(D*A))"),
    .INIT(16'h153f))
    _al_u115 (
    .a(n36_lutinv),
    .b(n38_lutinv),
    .c(busy),
    .d(fls_read[0]),
    .o(_al_u115_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*B*~(D*A))"),
    .INIT(16'hbf3f))
    _al_u116 (
    .a(n39_lutinv),
    .b(_al_u114_o),
    .c(_al_u115_o),
    .d(ubus_rdata[0]),
    .o(n40[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u117 (
    .a(ubus_wdata[15]),
    .o(n0[15]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u118 (
    .a(ubus_wdata[14]),
    .o(n0[14]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u119 (
    .a(ubus_wdata[13]),
    .o(n0[13]));
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
    .do({open_n52,open_n53,open_n54,led_pad[4]}),
    .opad(led[4]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u120 (
    .a(ubus_wdata[12]),
    .o(n0[12]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u121 (
    .a(ubus_wdata[11]),
    .o(n0[11]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u122 (
    .a(ubus_wdata[10]),
    .o(n0[10]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u123 (
    .a(ubus_wdata[9]),
    .o(n0[9]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u124 (
    .a(ubus_wdata[8]),
    .o(n0[8]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u125 (
    .a(ubus_wdata[7]),
    .o(n0[7]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u126 (
    .a(ubus_wdata[6]),
    .o(n0[6]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u127 (
    .a(ubus_wdata[5]),
    .o(n0[5]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u128 (
    .a(ubus_wdata[4]),
    .o(n0[4]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u129 (
    .a(ubus_wdata[3]),
    .o(n0[3]));
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
    .do({open_n69,open_n70,open_n71,led_pad[3]}),
    .opad(led[3]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u130 (
    .a(ubus_wdata[2]),
    .o(n0[2]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u131 (
    .a(ubus_wdata[1]),
    .o(n0[1]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u132 (
    .a(ubus_wdata[0]),
    .o(n0[0]));
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
    .do({open_n86,open_n87,open_n88,led_pad[2]}),
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
    .do({open_n103,open_n104,open_n105,led_pad[1]}),
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
    .do({open_n120,open_n121,open_n122,led_pad[0]}),
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
    .do({open_n137,open_n138,open_n139,led_pad[14]}),
    .opad(led[14]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u23 (
    .a(ubus_waddr[27]),
    .b(ubus_waddr[26]),
    .c(ubus_waddr[25]),
    .d(ubus_waddr[24]),
    .o(_al_u23_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u24 (
    .a(ubus_waddr[31]),
    .b(ubus_waddr[30]),
    .c(ubus_waddr[29]),
    .d(ubus_waddr[28]),
    .o(_al_u24_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u25 (
    .a(ubus_waddr[19]),
    .b(ubus_waddr[18]),
    .c(ubus_waddr[17]),
    .d(ubus_waddr[16]),
    .o(_al_u25_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u26 (
    .a(ubus_waddr[23]),
    .b(ubus_waddr[22]),
    .c(ubus_waddr[21]),
    .d(ubus_waddr[20]),
    .o(_al_u26_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u27 (
    .a(_al_u23_o),
    .b(_al_u24_o),
    .c(_al_u25_o),
    .d(_al_u26_o),
    .o(_al_u27_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u28 (
    .a(ubus_waddr[11]),
    .b(ubus_waddr[10]),
    .c(ubus_waddr[9]),
    .d(ubus_waddr[8]),
    .o(_al_u28_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u29 (
    .a(ubus_waddr[15]),
    .b(ubus_waddr[14]),
    .c(ubus_waddr[13]),
    .d(ubus_waddr[12]),
    .o(_al_u29_o));
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
    .do({open_n154,open_n155,open_n156,led_pad[13]}),
    .opad(led[13]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u30 (
    .a(_al_u28_o),
    .b(_al_u29_o),
    .o(_al_u30_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u31 (
    .a(ubus_waddr[7]),
    .b(ubus_waddr[6]),
    .c(ubus_waddr[5]),
    .d(ubus_waddr[4]),
    .o(_al_u31_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u32 (
    .a(ubus_waddr[3]),
    .b(ubus_waddr[2]),
    .c(ubus_waddr[1]),
    .d(ubus_waddr[0]),
    .o(_al_u32_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u33 (
    .a(_al_u27_o),
    .b(_al_u30_o),
    .c(_al_u31_o),
    .d(_al_u32_o),
    .o(n3));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    _al_u34 (
    .a(_al_u31_o),
    .b(ubus_waddr[3]),
    .c(ubus_waddr[2]),
    .d(ubus_wen),
    .o(_al_u34_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u35 (
    .a(_al_u27_o),
    .b(_al_u30_o),
    .c(_al_u34_o),
    .o(_al_u35_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u36 (
    .a(_al_u35_o),
    .b(ubus_waddr[1]),
    .c(ubus_waddr[0]),
    .o(mux0_b0_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u37 (
    .a(_al_u31_o),
    .b(ubus_waddr[3]),
    .c(ubus_waddr[2]),
    .d(ubus_wen),
    .o(_al_u37_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u38 (
    .a(_al_u27_o),
    .b(_al_u30_o),
    .c(_al_u37_o),
    .o(_al_u38_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    _al_u39 (
    .a(_al_u38_o),
    .b(ubus_waddr[1]),
    .c(ubus_waddr[0]),
    .o(mux6_b0_sel_is_3_o));
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
    .do({open_n171,open_n172,open_n173,led_pad[12]}),
    .opad(led[12]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u40 (
    .a(_al_u35_o),
    .b(ubus_waddr[1]),
    .c(ubus_waddr[0]),
    .o(mux5_b0_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u41 (
    .a(_al_u38_o),
    .b(ubus_waddr[1]),
    .c(ubus_waddr[0]),
    .o(mux7_b0_sel_is_3_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u42 (
    .a(_al_u35_o),
    .b(ubus_waddr[1]),
    .c(ubus_waddr[0]),
    .o(mux1_b0_sel_is_3_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u43 (
    .a(ubus_raddr[27]),
    .b(ubus_raddr[26]),
    .c(ubus_raddr[25]),
    .d(ubus_raddr[24]),
    .o(_al_u43_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u44 (
    .a(ubus_raddr[31]),
    .b(ubus_raddr[30]),
    .c(ubus_raddr[29]),
    .d(ubus_raddr[28]),
    .o(_al_u44_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u45 (
    .a(ubus_raddr[19]),
    .b(ubus_raddr[18]),
    .c(ubus_raddr[17]),
    .d(ubus_raddr[16]),
    .o(_al_u45_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u46 (
    .a(ubus_raddr[23]),
    .b(ubus_raddr[22]),
    .c(ubus_raddr[21]),
    .d(ubus_raddr[20]),
    .o(_al_u46_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u47 (
    .a(_al_u43_o),
    .b(_al_u44_o),
    .c(_al_u45_o),
    .d(_al_u46_o),
    .o(_al_u47_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u48 (
    .a(ubus_raddr[11]),
    .b(ubus_raddr[10]),
    .c(ubus_raddr[9]),
    .d(ubus_raddr[8]),
    .o(_al_u48_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u49 (
    .a(ubus_raddr[15]),
    .b(ubus_raddr[14]),
    .c(ubus_raddr[13]),
    .d(ubus_raddr[12]),
    .o(_al_u49_o));
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
    .do({open_n188,open_n189,open_n190,led_pad[11]}),
    .opad(led[11]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u50 (
    .a(_al_u48_o),
    .b(_al_u49_o),
    .o(_al_u50_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u51 (
    .a(ubus_raddr[7]),
    .b(ubus_raddr[6]),
    .c(ubus_raddr[5]),
    .d(ubus_raddr[4]),
    .o(_al_u51_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    _al_u52 (
    .a(ubus_raddr[3]),
    .b(ubus_raddr[2]),
    .c(ubus_raddr[1]),
    .d(ubus_raddr[0]),
    .o(_al_u52_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u53 (
    .a(_al_u47_o),
    .b(_al_u50_o),
    .c(_al_u51_o),
    .d(_al_u52_o),
    .o(n36_lutinv));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u54 (
    .a(ubus_raddr[3]),
    .b(ubus_raddr[2]),
    .c(ubus_raddr[1]),
    .d(ubus_raddr[0]),
    .o(_al_u54_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u55 (
    .a(_al_u47_o),
    .b(_al_u50_o),
    .c(_al_u51_o),
    .d(_al_u54_o),
    .o(n35_lutinv));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    _al_u56 (
    .a(ubus_raddr[3]),
    .b(ubus_raddr[2]),
    .c(ubus_raddr[1]),
    .d(ubus_raddr[0]),
    .o(_al_u56_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u57 (
    .a(_al_u47_o),
    .b(_al_u50_o),
    .c(_al_u51_o),
    .d(_al_u56_o),
    .o(n37_lutinv));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u58 (
    .a(ubus_raddr[3]),
    .b(ubus_raddr[2]),
    .c(ubus_raddr[1]),
    .d(ubus_raddr[0]),
    .o(_al_u58_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u59 (
    .a(_al_u47_o),
    .b(_al_u50_o),
    .c(_al_u51_o),
    .d(_al_u58_o),
    .o(n38_lutinv));
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
    .do({open_n205,open_n206,open_n207,led_pad[10]}),
    .opad(led[10]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u60 (
    .a(n36_lutinv),
    .b(n35_lutinv),
    .c(n37_lutinv),
    .d(n38_lutinv),
    .o(n39_lutinv));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u61 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[9]),
    .d(led_pad[9]),
    .o(_al_u61_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u62 (
    .a(n39_lutinv),
    .b(_al_u61_o),
    .c(ubus_rdata[9]),
    .o(n40[9]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u63 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[8]),
    .d(led_pad[8]),
    .o(_al_u63_o));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*A))"),
    .INIT(8'hb3))
    _al_u64 (
    .a(n39_lutinv),
    .b(_al_u63_o),
    .c(ubus_rdata[8]),
    .o(n40[8]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u65 (
    .a(n35_lutinv),
    .b(led_pad[7]),
    .o(\sel8_b7/B4 ));
  AL_MAP_LUT4 #(
    .EQN("(~(D*B)*~(C*A))"),
    .INIT(16'h135f))
    _al_u66 (
    .a(n36_lutinv),
    .b(n37_lutinv),
    .c(fls_read[7]),
    .d(id[7]),
    .o(_al_u66_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u67 (
    .a(n39_lutinv),
    .b(\sel8_b7/B4 ),
    .c(_al_u66_o),
    .d(ubus_rdata[7]),
    .o(n40[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u68 (
    .a(n37_lutinv),
    .b(id[6]),
    .o(\sel8_b6/B2 ));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(C*A))"),
    .INIT(16'h5f13))
    _al_u69 (
    .a(n36_lutinv),
    .b(n35_lutinv),
    .c(fls_read[6]),
    .d(led_pad[6]),
    .o(_al_u69_o));
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
    .do({open_n222,open_n223,open_n224,led_pad[9]}),
    .opad(led[9]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u70 (
    .a(n39_lutinv),
    .b(\sel8_b6/B2 ),
    .c(_al_u69_o),
    .d(ubus_rdata[6]),
    .o(n40[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u71 (
    .a(n37_lutinv),
    .b(id[5]),
    .o(\sel8_b5/B2 ));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(C*A))"),
    .INIT(16'h5f13))
    _al_u72 (
    .a(n36_lutinv),
    .b(n35_lutinv),
    .c(fls_read[5]),
    .d(led_pad[5]),
    .o(_al_u72_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u73 (
    .a(n39_lutinv),
    .b(\sel8_b5/B2 ),
    .c(_al_u72_o),
    .d(ubus_rdata[5]),
    .o(n40[5]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u74 (
    .a(n35_lutinv),
    .b(led_pad[4]),
    .o(\sel8_b4/B4 ));
  AL_MAP_LUT4 #(
    .EQN("(~(D*B)*~(C*A))"),
    .INIT(16'h135f))
    _al_u75 (
    .a(n36_lutinv),
    .b(n37_lutinv),
    .c(fls_read[4]),
    .d(id[4]),
    .o(_al_u75_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u76 (
    .a(n39_lutinv),
    .b(\sel8_b4/B4 ),
    .c(_al_u75_o),
    .d(ubus_rdata[4]),
    .o(n40[4]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u77 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[31]),
    .o(n40[31]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u78 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[30]),
    .o(n40[30]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u79 (
    .a(n37_lutinv),
    .b(id[3]),
    .o(\sel8_b3/B2 ));
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
    .do({open_n239,open_n240,open_n241,led_pad[8]}),
    .opad(led[8]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT4 #(
    .EQN("(~(~D*B)*~(C*A))"),
    .INIT(16'h5f13))
    _al_u80 (
    .a(n36_lutinv),
    .b(n35_lutinv),
    .c(fls_read[3]),
    .d(led_pad[3]),
    .o(_al_u80_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u81 (
    .a(n39_lutinv),
    .b(\sel8_b3/B2 ),
    .c(_al_u80_o),
    .d(ubus_rdata[3]),
    .o(n40[3]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u82 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[29]),
    .o(n40[29]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u83 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[28]),
    .o(n40[28]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u84 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[27]),
    .o(n40[27]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u85 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[26]),
    .o(n40[26]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u86 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[25]),
    .o(n40[25]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u87 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[24]),
    .o(n40[24]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u88 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[23]),
    .o(n40[23]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u89 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[22]),
    .o(n40[22]));
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
    .do({open_n256,open_n257,open_n258,led_pad[7]}),
    .opad(led[7]));  // src/rtl/uart/ubus.v(26)
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u90 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[21]),
    .o(n40[21]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u91 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[20]),
    .o(n40[20]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    _al_u92 (
    .a(n35_lutinv),
    .b(led_pad[2]),
    .o(\sel8_b2/B4 ));
  AL_MAP_LUT4 #(
    .EQN("(~(D*B)*~(C*A))"),
    .INIT(16'h135f))
    _al_u93 (
    .a(n36_lutinv),
    .b(n37_lutinv),
    .c(fls_read[2]),
    .d(id[2]),
    .o(_al_u93_o));
  AL_MAP_LUT4 #(
    .EQN("~(C*~B*~(D*A))"),
    .INIT(16'hefcf))
    _al_u94 (
    .a(n39_lutinv),
    .b(\sel8_b2/B4 ),
    .c(_al_u93_o),
    .d(ubus_rdata[2]),
    .o(n40[2]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u95 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[19]),
    .o(n40[19]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u96 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[18]),
    .o(n40[18]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u97 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[17]),
    .o(n40[17]));
  AL_MAP_LUT3 #(
    .EQN("~(~B*~(C*A))"),
    .INIT(8'hec))
    _al_u98 (
    .a(n39_lutinv),
    .b(n35_lutinv),
    .c(ubus_rdata[16]),
    .o(n40[16]));
  AL_MAP_LUT4 #(
    .EQN("(~(C*B)*~(~D*A))"),
    .INIT(16'h3f15))
    _al_u99 (
    .a(n35_lutinv),
    .b(n37_lutinv),
    .c(id[15]),
    .d(led_pad[15]),
    .o(_al_u99_o));
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit1[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit2[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(ubus_wdata[8]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(ubus_wdata[9]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(ubus_wdata[10]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(ubus_wdata[11]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit3[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(ubus_wdata[12]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(ubus_wdata[13]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(ubus_wdata[14]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(ubus_wdata[15]),
    .en(mux1_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(sm_bit4[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux5_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(mod_sel[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b10 (
    .clk(clk),
    .d(ubus_wdata[10]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[10]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b11 (
    .clk(clk),
    .d(ubus_wdata[11]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[11]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b12 (
    .clk(clk),
    .d(ubus_wdata[12]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[12]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b13 (
    .clk(clk),
    .d(ubus_wdata[13]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[13]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b14 (
    .clk(clk),
    .d(ubus_wdata[14]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[14]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b15 (
    .clk(clk),
    .d(ubus_wdata[15]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[15]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b16 (
    .clk(clk),
    .d(ubus_wdata[16]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[16]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b17 (
    .clk(clk),
    .d(ubus_wdata[17]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[17]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b18 (
    .clk(clk),
    .d(ubus_wdata[18]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[18]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b19 (
    .clk(clk),
    .d(ubus_wdata[19]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[19]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b20 (
    .clk(clk),
    .d(ubus_wdata[20]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[20]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b21 (
    .clk(clk),
    .d(ubus_wdata[21]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[21]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b22 (
    .clk(clk),
    .d(ubus_wdata[22]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[22]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b23 (
    .clk(clk),
    .d(ubus_wdata[23]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[23]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b4 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b5 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b6 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b7 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b8 (
    .clk(clk),
    .d(ubus_wdata[8]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[8]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg5_b9 (
    .clk(clk),
    .d(ubus_wdata[9]),
    .en(mux6_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_addr[9]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk),
    .d(ubus_wdata[1]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk),
    .d(ubus_wdata[2]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk),
    .d(ubus_wdata[3]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk),
    .d(ubus_wdata[4]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk),
    .d(ubus_wdata[5]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk),
    .d(ubus_wdata[6]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk),
    .d(ubus_wdata[7]),
    .en(mux7_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(fls_write[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk),
    .d(n40[0]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[0]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk),
    .d(n40[1]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[1]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b10 (
    .clk(clk),
    .d(n40[10]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[10]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b11 (
    .clk(clk),
    .d(n40[11]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[11]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b12 (
    .clk(clk),
    .d(n40[12]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[12]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b13 (
    .clk(clk),
    .d(n40[13]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[13]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b14 (
    .clk(clk),
    .d(n40[14]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[14]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b15 (
    .clk(clk),
    .d(n40[15]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[15]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b16 (
    .clk(clk),
    .d(n40[16]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[16]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b17 (
    .clk(clk),
    .d(n40[17]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[17]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b18 (
    .clk(clk),
    .d(n40[18]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[18]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b19 (
    .clk(clk),
    .d(n40[19]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[19]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk),
    .d(n40[2]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[2]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b20 (
    .clk(clk),
    .d(n40[20]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[20]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b21 (
    .clk(clk),
    .d(n40[21]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[21]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b22 (
    .clk(clk),
    .d(n40[22]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[22]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b23 (
    .clk(clk),
    .d(n40[23]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[23]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b24 (
    .clk(clk),
    .d(n40[24]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[24]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b25 (
    .clk(clk),
    .d(n40[25]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[25]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b26 (
    .clk(clk),
    .d(n40[26]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[26]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b27 (
    .clk(clk),
    .d(n40[27]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[27]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b28 (
    .clk(clk),
    .d(n40[28]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[28]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b29 (
    .clk(clk),
    .d(n40[29]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[29]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk),
    .d(n40[3]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[3]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b30 (
    .clk(clk),
    .d(n40[30]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[30]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b31 (
    .clk(clk),
    .d(n40[31]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[31]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk),
    .d(n40[4]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[4]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk),
    .d(n40[5]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[5]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk),
    .d(n40[6]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[6]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk),
    .d(n40[7]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[7]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b8 (
    .clk(clk),
    .d(n40[8]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[8]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg7_b9 (
    .clk(clk),
    .d(n40[9]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_rdata[9]));  // src/rtl/uart/ubus.v(80)
  reg_ar_as_w1 reg8_b0 (
    .clk(clk),
    .d(n0[0]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[0]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b1 (
    .clk(clk),
    .d(n0[1]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[1]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b10 (
    .clk(clk),
    .d(n0[10]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[10]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b11 (
    .clk(clk),
    .d(n0[11]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[11]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b12 (
    .clk(clk),
    .d(n0[12]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[12]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b13 (
    .clk(clk),
    .d(n0[13]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[13]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b14 (
    .clk(clk),
    .d(n0[14]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[14]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b15 (
    .clk(clk),
    .d(n0[15]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[15]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b2 (
    .clk(clk),
    .d(n0[2]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[2]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b3 (
    .clk(clk),
    .d(n0[3]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[3]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b4 (
    .clk(clk),
    .d(n0[4]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[4]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b5 (
    .clk(clk),
    .d(n0[5]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[5]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b6 (
    .clk(clk),
    .d(n0[6]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[6]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b7 (
    .clk(clk),
    .d(n0[7]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[7]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b8 (
    .clk(clk),
    .d(n0[8]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[8]));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 reg8_b9 (
    .clk(clk),
    .d(n0[9]),
    .en(mux0_b0_sel_is_3_o),
    .reset(1'b0),
    .set(1'b0),
    .q(led_pad[9]));  // src/rtl/uart/ubus.v(64)
  reg_sr_as_w1 start_reg (
    .clk(clk),
    .d(ubus_wdata[0]),
    .en(n3),
    .reset(~ubus_wen),
    .set(1'b0),
    .q(start));  // src/rtl/uart/ubus.v(64)
  reg_ar_as_w1 ubus_bken_reg (
    .clk(clk),
    .d(ubus_ren),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_bken));  // src/rtl/uart/ubus.v(86)

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
  wire [2:0] n54;
  wire [2:0] n78;
  wire [3:0] n83;
  wire [7:0] n88;
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
  wire \add0/c0 ;
  wire \add0/c1 ;
  wire \add0/c10 ;
  wire \add0/c11 ;
  wire \add0/c12 ;
  wire \add0/c13 ;
  wire \add0/c14 ;
  wire \add0/c15 ;
  wire \add0/c16 ;
  wire \add0/c17 ;
  wire \add0/c18 ;
  wire \add0/c19 ;
  wire \add0/c2 ;
  wire \add0/c20 ;
  wire \add0/c21 ;
  wire \add0/c22 ;
  wire \add0/c23 ;
  wire \add0/c24 ;
  wire \add0/c25 ;
  wire \add0/c26 ;
  wire \add0/c27 ;
  wire \add0/c28 ;
  wire \add0/c29 ;
  wire \add0/c3 ;
  wire \add0/c30 ;
  wire \add0/c31 ;
  wire \add0/c4 ;
  wire \add0/c5 ;
  wire \add0/c6 ;
  wire \add0/c7 ;
  wire \add0/c8 ;
  wire \add0/c9 ;
  wire \add3/c0 ;
  wire \add3/c1 ;
  wire \add3/c2 ;
  wire \add3/c3 ;
  wire auto_rst;  // src/rtl/uart/uprotocol.v(50)
  wire mux12_b0_sel_is_2_o;
  wire mux1_b0_sel_is_0_o;
  wire mux21_b0_sel_is_0_o;
  wire n0;
  wire n17;
  wire n18;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n29;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n36;
  wire n43;
  wire n48;
  wire n52;
  wire n59;
  wire n60;
  wire n61;
  wire n75;
  wire n80;
  wire n81;
  wire rd_flag;  // src/rtl/uart/uprotocol.v(69)
  wire rd_flag0;  // src/rtl/uart/uprotocol.v(70)
  wire rd_flag1;  // src/rtl/uart/uprotocol.v(71)
  wire rd_flag2;  // src/rtl/uart/uprotocol.v(72)
  wire rd_flag3;  // src/rtl/uart/uprotocol.v(73)
  wire rd_flag4;  // src/rtl/uart/uprotocol.v(74)
  wire rd_flag5;  // src/rtl/uart/uprotocol.v(75)
  wire rd_mode;  // src/rtl/uart/uprotocol.v(60)
  wire rd_mode_d;
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
  wire wt_mode_d;

  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u100 (
    .a(_al_u98_o),
    .b(_al_u99_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u100_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h00ac))
    _al_u101 (
    .a(tx_buffer0[16]),
    .b(tx_buffer0[8]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u101_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u102 (
    .a(tx_buffer0[24]),
    .b(tx_buffer1[0]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u102_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u103 (
    .a(_al_u101_o),
    .b(_al_u102_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u103_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*~A))"),
    .INIT(8'h0b))
    _al_u104 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[3]),
    .o(_al_u104_o));
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*C*~B))"),
    .INIT(16'h8aaa))
    _al_u105 (
    .a(_al_u104_o),
    .b(tx_buffer0[0]),
    .c(send_cnt[1]),
    .d(send_cnt[2]),
    .o(_al_u105_o));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(C*~B))"),
    .INIT(8'h45))
    _al_u106 (
    .a(send_cnt[0]),
    .b(send_cnt[2]),
    .c(tx_data[0]),
    .o(_al_u106_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~A*~(~D*C))"),
    .INIT(16'heefe))
    _al_u107 (
    .a(_al_u100_o),
    .b(_al_u103_o),
    .c(_al_u105_o),
    .d(_al_u106_o),
    .o(n88[0]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h00ac))
    _al_u108 (
    .a(tx_buffer0[17]),
    .b(tx_buffer0[9]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u108_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u109 (
    .a(tx_buffer0[25]),
    .b(tx_buffer1[1]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u109_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u110 (
    .a(_al_u108_o),
    .b(_al_u109_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u110_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h00ac))
    _al_u111 (
    .a(tx_buffer1[17]),
    .b(tx_buffer1[9]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u111_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u112 (
    .a(tx_buffer1[25]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[1]),
    .o(_al_u112_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u113 (
    .a(_al_u111_o),
    .b(_al_u112_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u113_o));
  AL_MAP_LUT4 #(
    .EQN("(B*~(C*~(D*~A)))"),
    .INIT(16'h4c0c))
    _al_u114 (
    .a(tx_buffer0[1]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(send_cnt[2]),
    .o(_al_u114_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~A*~(D*~B)))"),
    .INIT(16'h0b0a))
    _al_u115 (
    .a(send_cnt[1]),
    .b(send_cnt[2]),
    .c(send_cnt[3]),
    .d(tx_data[1]),
    .o(_al_u115_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~A*~(D*~C))"),
    .INIT(16'hefee))
    _al_u116 (
    .a(_al_u110_o),
    .b(_al_u113_o),
    .c(_al_u114_o),
    .d(_al_u115_o),
    .o(n88[1]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u117 (
    .a(tx_buffer1[10]),
    .b(tx_buffer1[18]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u117_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u118 (
    .a(tx_buffer1[26]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[2]),
    .o(_al_u118_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u119 (
    .a(_al_u117_o),
    .b(_al_u118_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u119_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u120 (
    .a(tx_buffer0[10]),
    .b(tx_buffer0[18]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u120_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u121 (
    .a(tx_buffer0[26]),
    .b(tx_buffer1[2]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u121_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u122 (
    .a(_al_u120_o),
    .b(_al_u121_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u122_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u123 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .o(_al_u123_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(~B*A))"),
    .INIT(8'h0d))
    _al_u124 (
    .a(_al_u123_o),
    .b(tx_buffer0[2]),
    .c(send_cnt[3]),
    .o(_al_u124_o));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(D*~B*~A))"),
    .INIT(16'h0e0f))
    _al_u125 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[2]),
    .o(_al_u125_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~A*~(~D*C))"),
    .INIT(16'heefe))
    _al_u126 (
    .a(_al_u119_o),
    .b(_al_u122_o),
    .c(_al_u124_o),
    .d(_al_u125_o),
    .o(n88[2]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u127 (
    .a(tx_buffer1[11]),
    .b(tx_buffer1[19]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u127_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u128 (
    .a(tx_buffer1[27]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[3]),
    .o(_al_u128_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u129 (
    .a(_al_u127_o),
    .b(_al_u128_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u129_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u130 (
    .a(tx_buffer0[11]),
    .b(tx_buffer0[19]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u130_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u131 (
    .a(tx_buffer0[27]),
    .b(tx_buffer1[3]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u131_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u132 (
    .a(_al_u130_o),
    .b(_al_u131_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u132_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u133 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[3]),
    .o(_al_u133_o));
  AL_MAP_LUT4 #(
    .EQN("(~B*~(D*C*A))"),
    .INIT(16'h1333))
    _al_u134 (
    .a(_al_u123_o),
    .b(_al_u133_o),
    .c(tx_buffer0[3]),
    .d(send_cnt[2]),
    .o(_al_u134_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~A*~(~D*~C))"),
    .INIT(16'heeef))
    _al_u135 (
    .a(_al_u129_o),
    .b(_al_u132_o),
    .c(_al_u134_o),
    .d(send_cnt[3]),
    .o(n88[3]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u136 (
    .a(tx_buffer1[12]),
    .b(tx_buffer1[20]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u136_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u137 (
    .a(tx_buffer1[28]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[4]),
    .o(_al_u137_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u138 (
    .a(_al_u136_o),
    .b(_al_u137_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u138_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u139 (
    .a(tx_buffer0[12]),
    .b(tx_buffer0[20]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u139_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u140 (
    .a(tx_buffer0[28]),
    .b(tx_buffer1[4]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u140_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u141 (
    .a(_al_u139_o),
    .b(_al_u140_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u141_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u142 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[4]),
    .o(_al_u142_o));
  AL_MAP_LUT4 #(
    .EQN("(~B*~(D*C*A))"),
    .INIT(16'h1333))
    _al_u143 (
    .a(_al_u123_o),
    .b(_al_u142_o),
    .c(tx_buffer0[4]),
    .d(send_cnt[2]),
    .o(_al_u143_o));
  AL_MAP_LUT4 #(
    .EQN("~(~B*~A*~(~D*~C))"),
    .INIT(16'heeef))
    _al_u144 (
    .a(_al_u138_o),
    .b(_al_u141_o),
    .c(_al_u143_o),
    .d(send_cnt[3]),
    .o(n88[4]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u145 (
    .a(tx_buffer0[13]),
    .b(tx_buffer0[21]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u145_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u146 (
    .a(tx_buffer0[29]),
    .b(tx_buffer1[5]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u146_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u147 (
    .a(_al_u145_o),
    .b(_al_u146_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u147_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u148 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[5]),
    .o(_al_u148_o));
  AL_MAP_LUT4 #(
    .EQN("(~B*~(D*C*A))"),
    .INIT(16'h1333))
    _al_u149 (
    .a(_al_u123_o),
    .b(_al_u148_o),
    .c(tx_buffer0[5]),
    .d(send_cnt[2]),
    .o(_al_u149_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u150 (
    .a(tx_buffer1[13]),
    .b(tx_buffer1[21]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u150_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u151 (
    .a(tx_buffer1[29]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[5]),
    .o(_al_u151_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u152 (
    .a(_al_u150_o),
    .b(_al_u151_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u152_o));
  AL_MAP_LUT4 #(
    .EQN("~(~C*~A*~(~D*~B))"),
    .INIT(16'hfafb))
    _al_u153 (
    .a(_al_u147_o),
    .b(_al_u149_o),
    .c(_al_u152_o),
    .d(send_cnt[3]),
    .o(n88[5]));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u154 (
    .a(tx_buffer0[14]),
    .b(tx_buffer0[22]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u154_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u155 (
    .a(tx_buffer0[30]),
    .b(tx_buffer1[6]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u155_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u156 (
    .a(_al_u154_o),
    .b(_al_u155_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u156_o));
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    _al_u157 (
    .a(_al_u123_o),
    .b(tx_buffer0[6]),
    .c(send_cnt[2]),
    .o(_al_u157_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    _al_u158 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[6]),
    .o(_al_u158_o));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u159 (
    .a(_al_u158_o),
    .b(send_cnt[3]),
    .o(_al_u159_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u160 (
    .a(tx_buffer1[14]),
    .b(tx_buffer1[22]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u160_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u161 (
    .a(tx_buffer1[30]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[6]),
    .o(_al_u161_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u162 (
    .a(_al_u160_o),
    .b(_al_u161_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u162_o));
  AL_MAP_LUT4 #(
    .EQN("~(~D*~A*~(C*~B))"),
    .INIT(16'hffba))
    _al_u163 (
    .a(_al_u156_o),
    .b(_al_u157_o),
    .c(_al_u159_o),
    .d(_al_u162_o),
    .o(n88[6]));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u164 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(send_cnt[2]),
    .d(tx_data[7]),
    .o(_al_u164_o));
  AL_MAP_LUT4 #(
    .EQN("(~B*~(D*C*A))"),
    .INIT(16'h1333))
    _al_u165 (
    .a(_al_u123_o),
    .b(_al_u164_o),
    .c(tx_buffer0[7]),
    .d(send_cnt[2]),
    .o(_al_u165_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u166 (
    .a(tx_buffer0[15]),
    .b(tx_buffer0[23]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u166_o));
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    _al_u167 (
    .a(tx_buffer0[31]),
    .b(tx_buffer1[7]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u167_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~(~B*~A))"),
    .INIT(16'h0e00))
    _al_u168 (
    .a(_al_u166_o),
    .b(_al_u167_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u168_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'h00ca))
    _al_u169 (
    .a(tx_buffer1[15]),
    .b(tx_buffer1[23]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u169_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u170 (
    .a(tx_buffer1[31]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[7]),
    .o(_al_u170_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    _al_u171 (
    .a(_al_u169_o),
    .b(_al_u170_o),
    .c(send_cnt[2]),
    .d(send_cnt[3]),
    .o(_al_u171_o));
  AL_MAP_LUT4 #(
    .EQN("~(~C*~B*~(~D*~A))"),
    .INIT(16'hfcfd))
    _al_u172 (
    .a(_al_u165_o),
    .b(_al_u168_o),
    .c(_al_u171_o),
    .d(send_cnt[3]),
    .o(n88[7]));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u173 (
    .a(reg0_al_b0[4]),
    .b(reg0_al_b0[5]),
    .c(reg0_al_b0[6]),
    .d(reg0_al_b0[7]),
    .o(_al_u173_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    _al_u174 (
    .a(reg0_al_b0[0]),
    .b(reg0_al_b0[1]),
    .c(reg0_al_b0[2]),
    .d(reg0_al_b0[3]),
    .o(_al_u174_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u175 (
    .a(_al_u173_o),
    .b(_al_u174_o),
    .o(n22));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u176 (
    .a(reg0_al_b0[0]),
    .b(reg0_al_b0[1]),
    .c(reg0_al_b0[2]),
    .d(reg0_al_b0[3]),
    .o(_al_u176_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u177 (
    .a(_al_u173_o),
    .b(_al_u176_o),
    .o(n36));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u178 (
    .a(reg1_al_b1[4]),
    .b(reg1_al_b1[5]),
    .c(reg1_al_b1[6]),
    .d(reg1_al_b1[7]),
    .o(_al_u178_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u179 (
    .a(reg1_al_b1[0]),
    .b(reg1_al_b1[1]),
    .c(reg1_al_b1[2]),
    .d(reg1_al_b1[3]),
    .o(_al_u179_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u180 (
    .a(_al_u178_o),
    .b(_al_u179_o),
    .o(n21));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u181 (
    .a(reg1_al_b1[0]),
    .b(reg1_al_b1[1]),
    .c(reg1_al_b1[2]),
    .d(reg1_al_b1[3]),
    .o(_al_u181_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u182 (
    .a(_al_u178_o),
    .b(_al_u181_o),
    .o(n35));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u183 (
    .a(reg2_al_b2[4]),
    .b(reg2_al_b2[5]),
    .c(reg2_al_b2[6]),
    .d(reg2_al_b2[7]),
    .o(_al_u183_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u184 (
    .a(reg2_al_b2[0]),
    .b(reg2_al_b2[1]),
    .c(reg2_al_b2[2]),
    .d(reg2_al_b2[3]),
    .o(_al_u184_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u185 (
    .a(_al_u183_o),
    .b(_al_u184_o),
    .o(n20));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u186 (
    .a(reg2_al_b2[0]),
    .b(reg2_al_b2[1]),
    .c(reg2_al_b2[2]),
    .d(reg2_al_b2[3]),
    .o(_al_u186_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u187 (
    .a(_al_u183_o),
    .b(_al_u186_o),
    .o(n34));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u188 (
    .a(reg3_al_b3[4]),
    .b(reg3_al_b3[5]),
    .c(reg3_al_b3[6]),
    .d(reg3_al_b3[7]),
    .o(_al_u188_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u189 (
    .a(reg3_al_b3[0]),
    .b(reg3_al_b3[1]),
    .c(reg3_al_b3[2]),
    .d(reg3_al_b3[3]),
    .o(_al_u189_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u190 (
    .a(_al_u188_o),
    .b(_al_u189_o),
    .o(n33));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u191 (
    .a(reg3_al_b3[0]),
    .b(reg3_al_b3[1]),
    .c(reg3_al_b3[2]),
    .d(reg3_al_b3[3]),
    .o(_al_u191_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u192 (
    .a(_al_u188_o),
    .b(_al_u191_o),
    .o(n19));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u193 (
    .a(reg4_al_b4[4]),
    .b(reg4_al_b4[5]),
    .c(reg4_al_b4[6]),
    .d(reg4_al_b4[7]),
    .o(_al_u193_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u194 (
    .a(reg4_al_b4[0]),
    .b(reg4_al_b4[1]),
    .c(reg4_al_b4[2]),
    .d(reg4_al_b4[3]),
    .o(_al_u194_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u195 (
    .a(_al_u193_o),
    .b(_al_u194_o),
    .o(n32));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    _al_u196 (
    .a(reg4_al_b4[0]),
    .b(reg4_al_b4[1]),
    .c(reg4_al_b4[2]),
    .d(reg4_al_b4[3]),
    .o(_al_u196_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u197 (
    .a(_al_u193_o),
    .b(_al_u196_o),
    .o(n18));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    _al_u198 (
    .a(reg5_al_b5[4]),
    .b(reg5_al_b5[5]),
    .c(reg5_al_b5[6]),
    .d(reg5_al_b5[7]),
    .o(_al_u198_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    _al_u199 (
    .a(reg5_al_b5[0]),
    .b(reg5_al_b5[1]),
    .c(reg5_al_b5[2]),
    .d(reg5_al_b5[3]),
    .o(_al_u199_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u200 (
    .a(_al_u198_o),
    .b(_al_u199_o),
    .o(n31));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u201 (
    .a(reg5_al_b5[0]),
    .b(reg5_al_b5[1]),
    .c(reg5_al_b5[2]),
    .d(reg5_al_b5[3]),
    .o(_al_u201_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u202 (
    .a(_al_u198_o),
    .b(_al_u201_o),
    .o(n17));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    _al_u203 (
    .a(rx_en),
    .b(recv_cnt[0]),
    .c(recv_cnt[1]),
    .d(recv_cnt[2]),
    .o(n59));
  AL_MAP_LUT3 #(
    .EQN("(C*B*~A)"),
    .INIT(8'h40))
    _al_u204 (
    .a(send_cnt[0]),
    .b(send_cnt[1]),
    .c(tx_en),
    .o(_al_u204_o));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u205 (
    .a(_al_u204_o),
    .b(send_cnt[2]),
    .c(send_cnt[3]),
    .o(_al_u205_o));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(~B*~A))"),
    .INIT(8'h0e))
    _al_u206 (
    .a(_al_u205_o),
    .b(send_finish),
    .c(ubus_ren),
    .o(n75));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    _al_u207 (
    .a(auto_rst_cnt[27]),
    .b(auto_rst_cnt[28]),
    .c(auto_rst_cnt[29]),
    .d(auto_rst_cnt[3]),
    .o(_al_u207_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*A)"),
    .INIT(16'h0020))
    _al_u208 (
    .a(auto_rst_cnt[23]),
    .b(auto_rst_cnt[24]),
    .c(auto_rst_cnt[25]),
    .d(auto_rst_cnt[26]),
    .o(_al_u208_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    _al_u209 (
    .a(auto_rst_cnt[6]),
    .b(auto_rst_cnt[7]),
    .c(auto_rst_cnt[8]),
    .d(auto_rst_cnt[9]),
    .o(_al_u209_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*~A)"),
    .INIT(16'h1000))
    _al_u210 (
    .a(auto_rst_cnt[30]),
    .b(auto_rst_cnt[31]),
    .c(auto_rst_cnt[4]),
    .d(auto_rst_cnt[5]),
    .o(_al_u210_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u211 (
    .a(_al_u207_o),
    .b(_al_u208_o),
    .c(_al_u209_o),
    .d(_al_u210_o),
    .o(_al_u211_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u212 (
    .a(auto_rst_cnt[12]),
    .b(auto_rst_cnt[13]),
    .c(auto_rst_cnt[14]),
    .d(auto_rst_cnt[15]),
    .o(_al_u212_o));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    _al_u213 (
    .a(auto_rst_cnt[0]),
    .b(auto_rst_cnt[1]),
    .c(auto_rst_cnt[10]),
    .d(auto_rst_cnt[11]),
    .o(_al_u213_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u214 (
    .a(auto_rst_cnt[2]),
    .b(auto_rst_cnt[20]),
    .c(auto_rst_cnt[21]),
    .d(auto_rst_cnt[22]),
    .o(_al_u214_o));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    _al_u215 (
    .a(auto_rst_cnt[16]),
    .b(auto_rst_cnt[17]),
    .c(auto_rst_cnt[18]),
    .d(auto_rst_cnt[19]),
    .o(_al_u215_o));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u216 (
    .a(_al_u212_o),
    .b(_al_u213_o),
    .c(_al_u214_o),
    .d(_al_u215_o),
    .o(_al_u216_o));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u217 (
    .a(_al_u211_o),
    .b(_al_u216_o),
    .o(n2));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~(B*A))"),
    .INIT(16'h0007))
    _al_u218 (
    .a(_al_u211_o),
    .b(_al_u216_o),
    .c(rx_en),
    .d(tx_en),
    .o(mux1_b0_sel_is_0_o));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u219 (
    .a(tx_ready_cnt[0]),
    .o(n78[0]));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    _al_u220 (
    .a(recv_cnt[0]),
    .o(n54[0]));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u79 (
    .a(rd_flag),
    .b(rd_mode),
    .o(rd_mode_d));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u80 (
    .a(rd_mode),
    .b(recv_flag),
    .o(n60));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u81 (
    .a(ubus_bken),
    .b(send_finish),
    .o(_al_n0_en_al_n74));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u82 (
    .a(send_start),
    .b(tx_ready_flag),
    .o(n81));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u83 (
    .a(rd_flag),
    .b(wt_flag),
    .o(n48));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u84 (
    .a(wt_flag),
    .b(wt_mode),
    .o(wt_mode_d));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    _al_u85 (
    .a(recv_flag),
    .b(wt_mode),
    .o(n61));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    _al_u86 (
    .a(auto_rst),
    .b(recv_state),
    .o(mux12_b0_sel_is_2_o));
  AL_MAP_LUT2 #(
    .EQN("(B@A)"),
    .INIT(4'h6))
    _al_u87 (
    .a(tx_ready_cnt[0]),
    .b(tx_ready_cnt[1]),
    .o(n78[1]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    _al_u88 (
    .a(tx_ready_cnt[0]),
    .b(tx_ready_cnt[1]),
    .c(tx_ready_cnt[2]),
    .o(n80));
  AL_MAP_LUT2 #(
    .EQN("(B@A)"),
    .INIT(4'h6))
    _al_u89 (
    .a(recv_cnt[0]),
    .b(recv_cnt[1]),
    .o(n54[1]));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    _al_u90 (
    .a(auto_rst),
    .b(send_finish),
    .o(mux21_b0_sel_is_0_o));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    _al_u91 (
    .a(n48),
    .b(recv_flag),
    .o(_al_n0_en));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u92 (
    .a(rx_en),
    .b(rd_flag0),
    .c(rd_flag1),
    .d(rd_flag2),
    .o(n52));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u93 (
    .a(n52),
    .b(rd_flag3),
    .c(rd_flag4),
    .d(rd_flag5),
    .o(n43));
  AL_MAP_LUT3 #(
    .EQN("(C@(B*A))"),
    .INIT(8'h78))
    _al_u94 (
    .a(tx_ready_cnt[0]),
    .b(tx_ready_cnt[1]),
    .c(tx_ready_cnt[2]),
    .o(n78[2]));
  AL_MAP_LUT3 #(
    .EQN("(C@(B*A))"),
    .INIT(8'h78))
    _al_u95 (
    .a(recv_cnt[0]),
    .b(recv_cnt[1]),
    .c(recv_cnt[2]),
    .o(n54[2]));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u96 (
    .a(rx_en),
    .b(wt_flag0),
    .c(wt_flag1),
    .d(wt_flag2),
    .o(n0));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    _al_u97 (
    .a(n0),
    .b(wt_flag3),
    .c(wt_flag4),
    .d(wt_flag5),
    .o(n29));
  AL_MAP_LUT4 #(
    .EQN("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT(16'h00ac))
    _al_u98 (
    .a(tx_buffer1[16]),
    .b(tx_buffer1[8]),
    .c(send_cnt[0]),
    .d(send_cnt[1]),
    .o(_al_u98_o));
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'he020))
    _al_u99 (
    .a(tx_buffer1[24]),
    .b(send_cnt[0]),
    .c(send_cnt[1]),
    .d(tx_data[0]),
    .o(_al_u99_o));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u0  (
    .a(auto_rst_cnt[0]),
    .b(1'b1),
    .c(\add0/c0 ),
    .o({\add0/c1 ,n4[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u1  (
    .a(auto_rst_cnt[1]),
    .b(1'b0),
    .c(\add0/c1 ),
    .o({\add0/c2 ,n4[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u10  (
    .a(auto_rst_cnt[10]),
    .b(1'b0),
    .c(\add0/c10 ),
    .o({\add0/c11 ,n4[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u11  (
    .a(auto_rst_cnt[11]),
    .b(1'b0),
    .c(\add0/c11 ),
    .o({\add0/c12 ,n4[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u12  (
    .a(auto_rst_cnt[12]),
    .b(1'b0),
    .c(\add0/c12 ),
    .o({\add0/c13 ,n4[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u13  (
    .a(auto_rst_cnt[13]),
    .b(1'b0),
    .c(\add0/c13 ),
    .o({\add0/c14 ,n4[13]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u14  (
    .a(auto_rst_cnt[14]),
    .b(1'b0),
    .c(\add0/c14 ),
    .o({\add0/c15 ,n4[14]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u15  (
    .a(auto_rst_cnt[15]),
    .b(1'b0),
    .c(\add0/c15 ),
    .o({\add0/c16 ,n4[15]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u16  (
    .a(auto_rst_cnt[16]),
    .b(1'b0),
    .c(\add0/c16 ),
    .o({\add0/c17 ,n4[16]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u17  (
    .a(auto_rst_cnt[17]),
    .b(1'b0),
    .c(\add0/c17 ),
    .o({\add0/c18 ,n4[17]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u18  (
    .a(auto_rst_cnt[18]),
    .b(1'b0),
    .c(\add0/c18 ),
    .o({\add0/c19 ,n4[18]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u19  (
    .a(auto_rst_cnt[19]),
    .b(1'b0),
    .c(\add0/c19 ),
    .o({\add0/c20 ,n4[19]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u2  (
    .a(auto_rst_cnt[2]),
    .b(1'b0),
    .c(\add0/c2 ),
    .o({\add0/c3 ,n4[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u20  (
    .a(auto_rst_cnt[20]),
    .b(1'b0),
    .c(\add0/c20 ),
    .o({\add0/c21 ,n4[20]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u21  (
    .a(auto_rst_cnt[21]),
    .b(1'b0),
    .c(\add0/c21 ),
    .o({\add0/c22 ,n4[21]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u22  (
    .a(auto_rst_cnt[22]),
    .b(1'b0),
    .c(\add0/c22 ),
    .o({\add0/c23 ,n4[22]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u23  (
    .a(auto_rst_cnt[23]),
    .b(1'b0),
    .c(\add0/c23 ),
    .o({\add0/c24 ,n4[23]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u24  (
    .a(auto_rst_cnt[24]),
    .b(1'b0),
    .c(\add0/c24 ),
    .o({\add0/c25 ,n4[24]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u25  (
    .a(auto_rst_cnt[25]),
    .b(1'b0),
    .c(\add0/c25 ),
    .o({\add0/c26 ,n4[25]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u26  (
    .a(auto_rst_cnt[26]),
    .b(1'b0),
    .c(\add0/c26 ),
    .o({\add0/c27 ,n4[26]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u27  (
    .a(auto_rst_cnt[27]),
    .b(1'b0),
    .c(\add0/c27 ),
    .o({\add0/c28 ,n4[27]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u28  (
    .a(auto_rst_cnt[28]),
    .b(1'b0),
    .c(\add0/c28 ),
    .o({\add0/c29 ,n4[28]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u29  (
    .a(auto_rst_cnt[29]),
    .b(1'b0),
    .c(\add0/c29 ),
    .o({\add0/c30 ,n4[29]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u3  (
    .a(auto_rst_cnt[3]),
    .b(1'b0),
    .c(\add0/c3 ),
    .o({\add0/c4 ,n4[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u30  (
    .a(auto_rst_cnt[30]),
    .b(1'b0),
    .c(\add0/c30 ),
    .o({\add0/c31 ,n4[30]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u31  (
    .a(auto_rst_cnt[31]),
    .b(1'b0),
    .c(\add0/c31 ),
    .o({open_n0,n4[31]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u4  (
    .a(auto_rst_cnt[4]),
    .b(1'b0),
    .c(\add0/c4 ),
    .o({\add0/c5 ,n4[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u5  (
    .a(auto_rst_cnt[5]),
    .b(1'b0),
    .c(\add0/c5 ),
    .o({\add0/c6 ,n4[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u6  (
    .a(auto_rst_cnt[6]),
    .b(1'b0),
    .c(\add0/c6 ),
    .o({\add0/c7 ,n4[6]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u7  (
    .a(auto_rst_cnt[7]),
    .b(1'b0),
    .c(\add0/c7 ),
    .o({\add0/c8 ,n4[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u8  (
    .a(auto_rst_cnt[8]),
    .b(1'b0),
    .c(\add0/c8 ),
    .o({\add0/c9 ,n4[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add0/u9  (
    .a(auto_rst_cnt[9]),
    .b(1'b0),
    .c(\add0/c9 ),
    .o({\add0/c10 ,n4[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add0/ucin  (
    .a(1'b0),
    .o({\add0/c0 ,open_n3}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u0  (
    .a(send_cnt[0]),
    .b(1'b1),
    .c(\add3/c0 ),
    .o({\add3/c1 ,n83[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u1  (
    .a(send_cnt[1]),
    .b(1'b0),
    .c(\add3/c1 ),
    .o({\add3/c2 ,n83[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u2  (
    .a(send_cnt[2]),
    .b(1'b0),
    .c(\add3/c2 ),
    .o({\add3/c3 ,n83[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD"))
    \add3/u3  (
    .a(send_cnt[3]),
    .b(1'b0),
    .c(\add3/c3 ),
    .o({open_n4,n83[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("ADD_CARRY"))
    \add3/ucin  (
    .a(1'b0),
    .o({\add3/c0 ,open_n7}));
  reg_ar_as_w1 auto_rst_reg (
    .clk(clk),
    .d(n2),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(auto_rst));  // src/rtl/uart/uprotocol.v(105)
  reg_ar_as_w1 rd_flag0_reg (
    .clk(clk),
    .d(n31),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag0));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag1_reg (
    .clk(clk),
    .d(n32),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag1));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag2_reg (
    .clk(clk),
    .d(n33),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag2));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag3_reg (
    .clk(clk),
    .d(n34),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag3));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag4_reg (
    .clk(clk),
    .d(n35),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag4));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag5_reg (
    .clk(clk),
    .d(n36),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag5));  // src/rtl/uart/uprotocol.v(157)
  reg_ar_as_w1 rd_flag_reg (
    .clk(clk),
    .d(n43),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(rd_flag));  // src/rtl/uart/uprotocol.v(163)
  reg_sr_as_w1 rd_mode_reg (
    .clk(clk),
    .d(rd_mode_d),
    .en(1'b1),
    .reset(recv_flag),
    .set(1'b0),
    .q(rd_mode));  // src/rtl/uart/uprotocol.v(172)
  reg_ar_as_w1 recv_flag_reg (
    .clk(clk),
    .d(n59),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(recv_flag));  // src/rtl/uart/uprotocol.v(209)
  reg_sr_as_w1 recv_state_reg (
    .clk(clk),
    .d(n48),
    .en(_al_n0_en),
    .reset(auto_rst),
    .set(1'b0),
    .q(recv_state));  // src/rtl/uart/uprotocol.v(192)
  reg_ar_as_w1 reg0_b0 (
    .clk(clk),
    .d(rx_data[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b1 (
    .clk(clk),
    .d(rx_data[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b2 (
    .clk(clk),
    .d(rx_data[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b3 (
    .clk(clk),
    .d(rx_data[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b4 (
    .clk(clk),
    .d(rx_data[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b5 (
    .clk(clk),
    .d(rx_data[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b6 (
    .clk(clk),
    .d(rx_data[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg0_b7 (
    .clk(clk),
    .d(rx_data[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg0_al_b0[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg10_b0 (
    .clk(clk),
    .d(reg7_al_b7[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[0]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b1 (
    .clk(clk),
    .d(reg7_al_b7[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[1]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b10 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[10]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b11 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[11]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b12 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[12]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b13 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[13]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b14 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[14]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b15 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[15]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b16 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[16]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b17 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[17]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b18 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[18]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b19 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[19]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b2 (
    .clk(clk),
    .d(reg7_al_b7[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[2]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b20 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[20]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b21 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[21]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b22 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[22]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b23 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[23]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b24 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[24]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b25 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[25]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b26 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[26]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b27 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[27]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b28 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[28]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b29 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[29]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b3 (
    .clk(clk),
    .d(reg7_al_b7[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[3]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b30 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[30]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b31 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[31]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b4 (
    .clk(clk),
    .d(reg7_al_b7[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[4]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b5 (
    .clk(clk),
    .d(reg7_al_b7[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[5]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b6 (
    .clk(clk),
    .d(reg7_al_b7[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[6]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b7 (
    .clk(clk),
    .d(reg7_al_b7[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[7]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b8 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[8]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg10_b9 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_waddr[9]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b0 (
    .clk(clk),
    .d(reg3_al_b3[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[0]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b1 (
    .clk(clk),
    .d(reg3_al_b3[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[1]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b10 (
    .clk(clk),
    .d(reg2_al_b2[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[10]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b11 (
    .clk(clk),
    .d(reg2_al_b2[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[11]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b12 (
    .clk(clk),
    .d(reg2_al_b2[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[12]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b13 (
    .clk(clk),
    .d(reg2_al_b2[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[13]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b14 (
    .clk(clk),
    .d(reg2_al_b2[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[14]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b15 (
    .clk(clk),
    .d(reg2_al_b2[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[15]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b16 (
    .clk(clk),
    .d(reg1_al_b1[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[16]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b17 (
    .clk(clk),
    .d(reg1_al_b1[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[17]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b18 (
    .clk(clk),
    .d(reg1_al_b1[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[18]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b19 (
    .clk(clk),
    .d(reg1_al_b1[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[19]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b2 (
    .clk(clk),
    .d(reg3_al_b3[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[2]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b20 (
    .clk(clk),
    .d(reg1_al_b1[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[20]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b21 (
    .clk(clk),
    .d(reg1_al_b1[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[21]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b22 (
    .clk(clk),
    .d(reg1_al_b1[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[22]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b23 (
    .clk(clk),
    .d(reg1_al_b1[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[23]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b24 (
    .clk(clk),
    .d(reg0_al_b0[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[24]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b25 (
    .clk(clk),
    .d(reg0_al_b0[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[25]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b26 (
    .clk(clk),
    .d(reg0_al_b0[2]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[26]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b27 (
    .clk(clk),
    .d(reg0_al_b0[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[27]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b28 (
    .clk(clk),
    .d(reg0_al_b0[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[28]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b29 (
    .clk(clk),
    .d(reg0_al_b0[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[29]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b3 (
    .clk(clk),
    .d(reg3_al_b3[3]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[3]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b30 (
    .clk(clk),
    .d(reg0_al_b0[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[30]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b31 (
    .clk(clk),
    .d(reg0_al_b0[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[31]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b4 (
    .clk(clk),
    .d(reg3_al_b3[4]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[4]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b5 (
    .clk(clk),
    .d(reg3_al_b3[5]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[5]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b6 (
    .clk(clk),
    .d(reg3_al_b3[6]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[6]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b7 (
    .clk(clk),
    .d(reg3_al_b3[7]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[7]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b8 (
    .clk(clk),
    .d(reg2_al_b2[0]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[8]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg11_b9 (
    .clk(clk),
    .d(reg2_al_b2[1]),
    .en(n61),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wdata[9]));  // src/rtl/uart/uprotocol.v(233)
  reg_ar_as_w1 reg12_b0 (
    .clk(clk),
    .d(ubus_raddr[0]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[0]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b1 (
    .clk(clk),
    .d(ubus_raddr[1]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[1]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b10 (
    .clk(clk),
    .d(ubus_raddr[10]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[10]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b11 (
    .clk(clk),
    .d(ubus_raddr[11]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[11]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b12 (
    .clk(clk),
    .d(ubus_raddr[12]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[12]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b13 (
    .clk(clk),
    .d(ubus_raddr[13]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[13]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b14 (
    .clk(clk),
    .d(ubus_raddr[14]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[14]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b15 (
    .clk(clk),
    .d(ubus_raddr[15]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[15]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b16 (
    .clk(clk),
    .d(ubus_raddr[16]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[16]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b17 (
    .clk(clk),
    .d(ubus_raddr[17]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[17]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b18 (
    .clk(clk),
    .d(ubus_raddr[18]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[18]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b19 (
    .clk(clk),
    .d(ubus_raddr[19]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[19]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b2 (
    .clk(clk),
    .d(ubus_raddr[2]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[2]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b20 (
    .clk(clk),
    .d(ubus_raddr[20]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[20]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b21 (
    .clk(clk),
    .d(ubus_raddr[21]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[21]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b22 (
    .clk(clk),
    .d(ubus_raddr[22]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[22]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b23 (
    .clk(clk),
    .d(ubus_raddr[23]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[23]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b24 (
    .clk(clk),
    .d(ubus_raddr[24]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[24]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b25 (
    .clk(clk),
    .d(ubus_raddr[25]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[25]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b26 (
    .clk(clk),
    .d(ubus_raddr[26]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[26]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b27 (
    .clk(clk),
    .d(ubus_raddr[27]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[27]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b28 (
    .clk(clk),
    .d(ubus_raddr[28]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[28]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b29 (
    .clk(clk),
    .d(ubus_raddr[29]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[29]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b3 (
    .clk(clk),
    .d(ubus_raddr[3]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[3]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b30 (
    .clk(clk),
    .d(ubus_raddr[30]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[30]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b31 (
    .clk(clk),
    .d(ubus_raddr[31]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[31]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b4 (
    .clk(clk),
    .d(ubus_raddr[4]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[4]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b5 (
    .clk(clk),
    .d(ubus_raddr[5]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[5]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b6 (
    .clk(clk),
    .d(ubus_raddr[6]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[6]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b7 (
    .clk(clk),
    .d(ubus_raddr[7]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[7]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b8 (
    .clk(clk),
    .d(ubus_raddr[8]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[8]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg12_b9 (
    .clk(clk),
    .d(ubus_raddr[9]),
    .en(ubus_ren),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer0[9]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b0 (
    .clk(clk),
    .d(ubus_rdata[0]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[0]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b1 (
    .clk(clk),
    .d(ubus_rdata[1]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[1]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b10 (
    .clk(clk),
    .d(ubus_rdata[10]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[10]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b11 (
    .clk(clk),
    .d(ubus_rdata[11]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[11]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b12 (
    .clk(clk),
    .d(ubus_rdata[12]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[12]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b13 (
    .clk(clk),
    .d(ubus_rdata[13]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[13]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b14 (
    .clk(clk),
    .d(ubus_rdata[14]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[14]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b15 (
    .clk(clk),
    .d(ubus_rdata[15]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[15]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b16 (
    .clk(clk),
    .d(ubus_rdata[16]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[16]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b17 (
    .clk(clk),
    .d(ubus_rdata[17]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[17]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b18 (
    .clk(clk),
    .d(ubus_rdata[18]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[18]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b19 (
    .clk(clk),
    .d(ubus_rdata[19]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[19]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b2 (
    .clk(clk),
    .d(ubus_rdata[2]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[2]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b20 (
    .clk(clk),
    .d(ubus_rdata[20]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[20]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b21 (
    .clk(clk),
    .d(ubus_rdata[21]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[21]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b22 (
    .clk(clk),
    .d(ubus_rdata[22]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[22]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b23 (
    .clk(clk),
    .d(ubus_rdata[23]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[23]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b24 (
    .clk(clk),
    .d(ubus_rdata[24]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[24]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b25 (
    .clk(clk),
    .d(ubus_rdata[25]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[25]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b26 (
    .clk(clk),
    .d(ubus_rdata[26]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[26]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b27 (
    .clk(clk),
    .d(ubus_rdata[27]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[27]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b28 (
    .clk(clk),
    .d(ubus_rdata[28]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[28]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b29 (
    .clk(clk),
    .d(ubus_rdata[29]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[29]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b3 (
    .clk(clk),
    .d(ubus_rdata[3]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[3]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b30 (
    .clk(clk),
    .d(ubus_rdata[30]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[30]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b31 (
    .clk(clk),
    .d(ubus_rdata[31]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[31]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b4 (
    .clk(clk),
    .d(ubus_rdata[4]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[4]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b5 (
    .clk(clk),
    .d(ubus_rdata[5]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[5]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b6 (
    .clk(clk),
    .d(ubus_rdata[6]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[6]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b7 (
    .clk(clk),
    .d(ubus_rdata[7]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[7]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b8 (
    .clk(clk),
    .d(ubus_rdata[8]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[8]));  // src/rtl/uart/uprotocol.v(247)
  reg_ar_as_w1 reg13_b9 (
    .clk(clk),
    .d(ubus_rdata[9]),
    .en(ubus_bken),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_buffer1[9]));  // src/rtl/uart/uprotocol.v(247)
  reg_sr_as_w1 reg14_b0 (
    .clk(clk),
    .d(n78[0]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[0]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg14_b1 (
    .clk(clk),
    .d(n78[1]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[1]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg14_b2 (
    .clk(clk),
    .d(n78[2]),
    .en(1'b1),
    .reset(~tx_ready),
    .set(1'b0),
    .q(tx_ready_cnt[2]));  // src/rtl/uart/uprotocol.v(278)
  reg_sr_as_w1 reg15_b0 (
    .clk(clk),
    .d(n83[0]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[0]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b1 (
    .clk(clk),
    .d(n83[1]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[1]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b2 (
    .clk(clk),
    .d(n83[2]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[2]));  // src/rtl/uart/uprotocol.v(295)
  reg_sr_as_w1 reg15_b3 (
    .clk(clk),
    .d(n83[3]),
    .en(n81),
    .reset(~mux21_b0_sel_is_0_o),
    .set(1'b0),
    .q(send_cnt[3]));  // src/rtl/uart/uprotocol.v(295)
  reg_ar_as_w1 reg16_b0 (
    .clk(clk),
    .d(n88[0]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[0]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b1 (
    .clk(clk),
    .d(n88[1]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[1]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b2 (
    .clk(clk),
    .d(n88[2]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[2]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b3 (
    .clk(clk),
    .d(n88[3]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[3]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b4 (
    .clk(clk),
    .d(n88[4]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[4]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b5 (
    .clk(clk),
    .d(n88[5]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[5]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b6 (
    .clk(clk),
    .d(n88[6]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[6]));  // src/rtl/uart/uprotocol.v(323)
  reg_ar_as_w1 reg16_b7 (
    .clk(clk),
    .d(n88[7]),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_data[7]));  // src/rtl/uart/uprotocol.v(323)
  reg_sr_as_w1 reg17_b0 (
    .clk(clk),
    .d(n4[0]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[0]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b1 (
    .clk(clk),
    .d(n4[1]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[1]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b10 (
    .clk(clk),
    .d(n4[10]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[10]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b11 (
    .clk(clk),
    .d(n4[11]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[11]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b12 (
    .clk(clk),
    .d(n4[12]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[12]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b13 (
    .clk(clk),
    .d(n4[13]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[13]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b14 (
    .clk(clk),
    .d(n4[14]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[14]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b15 (
    .clk(clk),
    .d(n4[15]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[15]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b16 (
    .clk(clk),
    .d(n4[16]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[16]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b17 (
    .clk(clk),
    .d(n4[17]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[17]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b18 (
    .clk(clk),
    .d(n4[18]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[18]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b19 (
    .clk(clk),
    .d(n4[19]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[19]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b2 (
    .clk(clk),
    .d(n4[2]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[2]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b20 (
    .clk(clk),
    .d(n4[20]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[20]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b21 (
    .clk(clk),
    .d(n4[21]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[21]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b22 (
    .clk(clk),
    .d(n4[22]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[22]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b23 (
    .clk(clk),
    .d(n4[23]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[23]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b24 (
    .clk(clk),
    .d(n4[24]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[24]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b25 (
    .clk(clk),
    .d(n4[25]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[25]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b26 (
    .clk(clk),
    .d(n4[26]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[26]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b27 (
    .clk(clk),
    .d(n4[27]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[27]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b28 (
    .clk(clk),
    .d(n4[28]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[28]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b29 (
    .clk(clk),
    .d(n4[29]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[29]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b3 (
    .clk(clk),
    .d(n4[3]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[3]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b30 (
    .clk(clk),
    .d(n4[30]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[30]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b31 (
    .clk(clk),
    .d(n4[31]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[31]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b4 (
    .clk(clk),
    .d(n4[4]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[4]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b5 (
    .clk(clk),
    .d(n4[5]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[5]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b6 (
    .clk(clk),
    .d(n4[6]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[6]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b7 (
    .clk(clk),
    .d(n4[7]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[7]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b8 (
    .clk(clk),
    .d(n4[8]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[8]));  // src/rtl/uart/uprotocol.v(99)
  reg_sr_as_w1 reg17_b9 (
    .clk(clk),
    .d(n4[9]),
    .en(1'b1),
    .reset(~mux1_b0_sel_is_0_o),
    .set(1'b0),
    .q(auto_rst_cnt[9]));  // src/rtl/uart/uprotocol.v(99)
  reg_ar_as_w1 reg1_b0 (
    .clk(clk),
    .d(reg0_al_b0[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b1 (
    .clk(clk),
    .d(reg0_al_b0[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b2 (
    .clk(clk),
    .d(reg0_al_b0[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b3 (
    .clk(clk),
    .d(reg0_al_b0[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b4 (
    .clk(clk),
    .d(reg0_al_b0[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b5 (
    .clk(clk),
    .d(reg0_al_b0[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b6 (
    .clk(clk),
    .d(reg0_al_b0[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg1_b7 (
    .clk(clk),
    .d(reg0_al_b0[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg1_al_b1[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b0 (
    .clk(clk),
    .d(reg1_al_b1[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b1 (
    .clk(clk),
    .d(reg1_al_b1[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b2 (
    .clk(clk),
    .d(reg1_al_b1[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b3 (
    .clk(clk),
    .d(reg1_al_b1[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b4 (
    .clk(clk),
    .d(reg1_al_b1[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b5 (
    .clk(clk),
    .d(reg1_al_b1[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b6 (
    .clk(clk),
    .d(reg1_al_b1[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg2_b7 (
    .clk(clk),
    .d(reg1_al_b1[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg2_al_b2[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b0 (
    .clk(clk),
    .d(reg2_al_b2[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b1 (
    .clk(clk),
    .d(reg2_al_b2[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b2 (
    .clk(clk),
    .d(reg2_al_b2[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b3 (
    .clk(clk),
    .d(reg2_al_b2[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b4 (
    .clk(clk),
    .d(reg2_al_b2[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b5 (
    .clk(clk),
    .d(reg2_al_b2[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b6 (
    .clk(clk),
    .d(reg2_al_b2[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg3_b7 (
    .clk(clk),
    .d(reg2_al_b2[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg3_al_b3[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b0 (
    .clk(clk),
    .d(reg3_al_b3[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b1 (
    .clk(clk),
    .d(reg3_al_b3[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b2 (
    .clk(clk),
    .d(reg3_al_b3[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b3 (
    .clk(clk),
    .d(reg3_al_b3[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b4 (
    .clk(clk),
    .d(reg3_al_b3[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b5 (
    .clk(clk),
    .d(reg3_al_b3[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b6 (
    .clk(clk),
    .d(reg3_al_b3[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg4_b7 (
    .clk(clk),
    .d(reg3_al_b3[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg4_al_b4[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b0 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b1 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b2 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b3 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b4 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b5 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b6 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg5_b7 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg5_al_b5[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b0 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b1 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b2 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b3 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b4 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b5 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b6 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg6_b7 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg6_al_b6[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b0 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[0]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b1 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[1]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b2 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[2]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b3 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[3]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b4 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[4]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b5 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[5]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b6 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[6]));  // src/rtl/uart/uprotocol.v(123)
  reg_ar_as_w1 reg7_b7 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(rx_en),
    .reset(1'b0),
    .set(1'b0),
    .q(reg7_al_b7[7]));  // src/rtl/uart/uprotocol.v(123)
  reg_sr_as_w1 reg8_b0 (
    .clk(clk),
    .d(n54[0]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[0]));  // src/rtl/uart/uprotocol.v(203)
  reg_sr_as_w1 reg8_b1 (
    .clk(clk),
    .d(n54[1]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[1]));  // src/rtl/uart/uprotocol.v(203)
  reg_sr_as_w1 reg8_b2 (
    .clk(clk),
    .d(n54[2]),
    .en(rx_en),
    .reset(~mux12_b0_sel_is_2_o),
    .set(1'b0),
    .q(recv_cnt[2]));  // src/rtl/uart/uprotocol.v(203)
  reg_ar_as_w1 reg9_b0 (
    .clk(clk),
    .d(reg7_al_b7[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[0]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b1 (
    .clk(clk),
    .d(reg7_al_b7[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[1]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b10 (
    .clk(clk),
    .d(reg6_al_b6[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[10]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b11 (
    .clk(clk),
    .d(reg6_al_b6[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[11]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b12 (
    .clk(clk),
    .d(reg6_al_b6[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[12]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b13 (
    .clk(clk),
    .d(reg6_al_b6[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[13]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b14 (
    .clk(clk),
    .d(reg6_al_b6[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[14]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b15 (
    .clk(clk),
    .d(reg6_al_b6[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[15]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b16 (
    .clk(clk),
    .d(reg5_al_b5[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[16]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b17 (
    .clk(clk),
    .d(reg5_al_b5[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[17]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b18 (
    .clk(clk),
    .d(reg5_al_b5[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[18]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b19 (
    .clk(clk),
    .d(reg5_al_b5[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[19]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b2 (
    .clk(clk),
    .d(reg7_al_b7[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[2]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b20 (
    .clk(clk),
    .d(reg5_al_b5[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[20]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b21 (
    .clk(clk),
    .d(reg5_al_b5[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[21]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b22 (
    .clk(clk),
    .d(reg5_al_b5[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[22]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b23 (
    .clk(clk),
    .d(reg5_al_b5[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[23]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b24 (
    .clk(clk),
    .d(reg4_al_b4[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[24]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b25 (
    .clk(clk),
    .d(reg4_al_b4[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[25]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b26 (
    .clk(clk),
    .d(reg4_al_b4[2]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[26]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b27 (
    .clk(clk),
    .d(reg4_al_b4[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[27]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b28 (
    .clk(clk),
    .d(reg4_al_b4[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[28]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b29 (
    .clk(clk),
    .d(reg4_al_b4[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[29]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b3 (
    .clk(clk),
    .d(reg7_al_b7[3]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[3]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b30 (
    .clk(clk),
    .d(reg4_al_b4[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[30]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b31 (
    .clk(clk),
    .d(reg4_al_b4[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[31]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b4 (
    .clk(clk),
    .d(reg7_al_b7[4]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[4]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b5 (
    .clk(clk),
    .d(reg7_al_b7[5]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[5]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b6 (
    .clk(clk),
    .d(reg7_al_b7[6]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[6]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b7 (
    .clk(clk),
    .d(reg7_al_b7[7]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[7]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b8 (
    .clk(clk),
    .d(reg6_al_b6[0]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[8]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_as_w1 reg9_b9 (
    .clk(clk),
    .d(reg6_al_b6[1]),
    .en(n60),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_raddr[9]));  // src/rtl/uart/uprotocol.v(223)
  reg_ar_ss_w1 send_finish_reg (
    .clk(clk),
    .d(n75),
    .en(1'b1),
    .reset(1'b0),
    .set(auto_rst),
    .q(send_finish));  // src/rtl/uart/uprotocol.v(269)
  reg_ar_as_w1 send_flag_reg (
    .clk(clk),
    .d(n81),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(send_flag));  // src/rtl/uart/uprotocol.v(302)
  reg_sr_as_w1 send_start_reg (
    .clk(clk),
    .d(ubus_bken),
    .en(_al_n0_en_al_n74),
    .reset(auto_rst),
    .set(1'b0),
    .q(send_start));  // src/rtl/uart/uprotocol.v(258)
  reg_ar_as_w1 tx_en_reg (
    .clk(clk),
    .d(send_flag),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_en));  // src/rtl/uart/uprotocol.v(302)
  reg_ar_as_w1 tx_ready_flag_reg (
    .clk(clk),
    .d(n80),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(tx_ready_flag));  // src/rtl/uart/uprotocol.v(284)
  reg_ar_as_w1 ubus_ren_reg (
    .clk(clk),
    .d(n60),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_ren));  // src/rtl/uart/uprotocol.v(216)
  reg_ar_as_w1 ubus_wen_reg (
    .clk(clk),
    .d(n61),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(ubus_wen));  // src/rtl/uart/uprotocol.v(216)
  reg_ar_as_w1 wt_flag0_reg (
    .clk(clk),
    .d(n17),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag0));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag1_reg (
    .clk(clk),
    .d(n18),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag1));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag2_reg (
    .clk(clk),
    .d(n19),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag2));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag3_reg (
    .clk(clk),
    .d(n20),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag3));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag4_reg (
    .clk(clk),
    .d(n21),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag4));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag5_reg (
    .clk(clk),
    .d(n22),
    .en(~recv_state),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag5));  // src/rtl/uart/uprotocol.v(137)
  reg_ar_as_w1 wt_flag_reg (
    .clk(clk),
    .d(n29),
    .en(1'b1),
    .reset(1'b0),
    .set(1'b0),
    .q(wt_flag));  // src/rtl/uart/uprotocol.v(143)
  reg_sr_as_w1 wt_mode_reg (
    .clk(clk),
    .d(wt_mode_d),
    .en(1'b1),
    .reset(recv_flag),
    .set(1'b0),
    .q(wt_mode));  // src/rtl/uart/uprotocol.v(181)

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

