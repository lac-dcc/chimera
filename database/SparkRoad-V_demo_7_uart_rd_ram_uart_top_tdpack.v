// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Thu Aug  8 15:33:20 2019

`timescale 1ns / 1ps
module uart_top  // source/rtl/uart_top.v(18)
  (
  ext_clk_25m,
  ext_rst_n,
  uart_rx,
  led,
  uart_tx
  );

  input ext_clk_25m;  // source/rtl/uart_top.v(24)
  input ext_rst_n;  // source/rtl/uart_top.v(25)
  input uart_rx;  // source/rtl/uart_top.v(26)
  output led;  // source/rtl/uart_top.v(28)
  output uart_tx;  // source/rtl/uart_top.v(27)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [7:0] ram_output;  // source/rtl/uart_top.v(45)
  wire [7:0] rx_data;  // source/rtl/uart_top.v(40)
  wire bps_start1;  // source/rtl/uart_top.v(38)
  wire bps_start2;  // source/rtl/uart_top.v(38)
  wire clk_25m;  // source/rtl/uart_top.v(32)
  wire clk_bps1;  // source/rtl/uart_top.v(39)
  wire clk_bps2;  // source/rtl/uart_top.v(39)
  wire ext_clk_25m_pad;  // source/rtl/uart_top.v(24)
  wire ext_rst_n_pad;  // source/rtl/uart_top.v(25)
  wire n0;
  wire ram_rw_ce;  // source/rtl/uart_top.v(44)
  wire rx_int;  // source/rtl/uart_top.v(41)
  wire sys_rst_n;  // source/rtl/uart_top.v(35)

  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u0 (
    .ipad(ext_clk_25m),
    .di(ext_clk_25m_pad));  // source/rtl/uart_top.v(24)
  EG_PHY_PAD #(
    //.LOCATION("L12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u1 (
    .ipad(ext_rst_n),
    .di(ext_rst_n_pad));  // source/rtl/uart_top.v(25)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTG0("(~D)"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTG0(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u2 (
    .d({open_n42,ext_rst_n_pad}),
    .f({open_n60,n0}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  my_uart_rx my_uart_rx (
    .clk(clk_25m),
    .clk_bps(clk_bps1),
    .rst_n(sys_rst_n),
    .uart_rx(uart_rx),
    .bps_start(bps_start1),
    .rx_data(rx_data),
    .rx_int(rx_int));  // source/rtl/uart_top.v(78)
  my_uart_tx my_uart_tx (
    .clk(clk_25m),
    .clk_bps(clk_bps2),
    .rst_n(sys_rst_n),
    .rx_data(ram_output),
    .rx_int(ram_rw_ce),
    .bps_start(bps_start2),
    .uart_tx(uart_tx));  // source/rtl/uart_top.v(120)
  speed_setting_1 speed_rx (
    .bps_start(bps_start1),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps1));  // source/rtl/uart_top.v(68)
  speed_setting speed_tx (
    .bps_start(bps_start2),
    .clk(clk_25m),
    .rst_n(sys_rst_n),
    .clk_bps(clk_bps2));  // source/rtl/uart_top.v(111)
  pll_test u_pll_test (
    .refclk(ext_clk_25m_pad),
    .reset(n0),
    .clk0_out(clk_25m),
    .extlock(sys_rst_n));  // source/rtl/uart_top.v(49)
  ram_rw_control u_ram_rw_control (
    .clk_25m(clk_25m),
    .rx_data(rx_data),
    .rx_int(rx_int),
    .sys_rst_n(sys_rst_n),
    .led(led),
    .ram_output(ram_output),
    .ram_rw_ce(ram_rw_ce));  // source/rtl/uart_top.v(92)

endmodule 

module my_uart_rx  // source/rtl/my_uart_rx.v(1)
  (
  clk,
  clk_bps,
  rst_n,
  uart_rx,
  bps_start,
  rx_data,
  rx_int
  );

  input clk;  // source/rtl/my_uart_rx.v(3)
  input clk_bps;  // source/rtl/my_uart_rx.v(8)
  input rst_n;  // source/rtl/my_uart_rx.v(4)
  input uart_rx;  // source/rtl/my_uart_rx.v(5)
  output bps_start;  // source/rtl/my_uart_rx.v(9)
  output [7:0] rx_data;  // source/rtl/my_uart_rx.v(6)
  output rx_int;  // source/rtl/my_uart_rx.v(7)

  wire [3:0] n18;
  wire [3:0] num;  // source/rtl/my_uart_rx.v(38)
  wire [7:0] rx_temp_data;  // source/rtl/my_uart_rx.v(64)
  wire _al_n0_en;
  wire _al_u23_o;
  wire _al_u27_o;
  wire _al_u32_o;
  wire \add0/c1 ;
  wire \add0/c3 ;
  wire mux6_b0_sel_is_3_o;
  wire mux6_b1_sel_is_3_o;
  wire mux6_b2_sel_is_3_o;
  wire mux6_b3_sel_is_3_o;
  wire mux6_b4_sel_is_3_o;
  wire mux6_b5_sel_is_3_o;
  wire mux6_b6_sel_is_3_o;
  wire mux6_b7_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire n10;
  wire n14;
  wire n6_lutinv;
  wire neg_uart_rx;  // source/rtl/my_uart_rx.v(14)
  wire uart_rx0;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx1;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx2;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx3;  // source/rtl/my_uart_rx.v(13)
  wire uart_rx_pad;  // source/rtl/my_uart_rx.v(5)

  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u19|reg0_b1  (
    .b({open_n2,num[0]}),
    .c({n14,num[1]}),
    .ce(mux6_b1_sel_is_3_o),
    .clk(clk),
    .d({n10,_al_u23_o}),
    .mi({open_n6,uart_rx_pad}),
    .sr(rst_n),
    .f({bps_start,mux6_b1_sel_is_3_o}),
    .q({open_n21,rx_temp_data[1]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
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
    .SRMUX("INV"))
    \_al_u21|reg0_b5  (
    .a({num[0],open_n22}),
    .b(num[1:0]),
    .c(num[2:1]),
    .ce(mux6_b5_sel_is_3_o),
    .clk(clk),
    .d({num[3],_al_u27_o}),
    .mi({open_n26,uart_rx_pad}),
    .sr(rst_n),
    .f({n6_lutinv,mux6_b5_sel_is_3_o}),
    .q({open_n41,rx_temp_data[5]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000001000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u23|reg0_b4  (
    .a({clk_bps,open_n42}),
    .b({num[2],num[0]}),
    .c({num[3],num[1]}),
    .ce(mux6_b4_sel_is_3_o),
    .clk(clk),
    .d({rx_int,_al_u27_o}),
    .mi({open_n53,uart_rx_pad}),
    .sr(rst_n),
    .f({_al_u23_o,mux6_b4_sel_is_3_o}),
    .q({open_n57,rx_temp_data[4]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*~C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u27|reg0_b6  (
    .a({clk_bps,open_n58}),
    .b({num[2],num[0]}),
    .c({num[3],num[1]}),
    .ce(mux6_b6_sel_is_3_o),
    .clk(clk),
    .d({rx_int,_al_u27_o}),
    .mi({open_n62,uart_rx_pad}),
    .sr(rst_n),
    .f({_al_u27_o,mux6_b6_sel_is_3_o}),
    .q({open_n77,rx_temp_data[6]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(D*C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0010000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u32|reg0_b3  (
    .a({clk_bps,open_n78}),
    .b({num[2],num[0]}),
    .c({num[3],num[1]}),
    .ce(mux6_b3_sel_is_3_o),
    .clk(clk),
    .d({rx_int,_al_u27_o}),
    .mi({open_n89,uart_rx_pad}),
    .sr(rst_n),
    .f({_al_u32_o,mux6_b3_sel_is_3_o}),
    .q({open_n93,rx_temp_data[3]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
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
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u35|reg0_b2  (
    .b({clk_bps,num[0]}),
    .c({rx_int,num[1]}),
    .ce(mux6_b2_sel_is_3_o),
    .clk(clk),
    .d({n6_lutinv,_al_u23_o}),
    .mi({open_n99,uart_rx_pad}),
    .sr(rst_n),
    .f({mux7_b0_sel_is_3_o,mux6_b2_sel_is_3_o}),
    .q({open_n114,rx_temp_data[2]}));  // source/rtl/my_uart_rx.v(96)
  EG_PHY_PAD #(
    //.LOCATION("B15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u7 (
    .ipad(uart_rx),
    .di(uart_rx_pad));  // source/rtl/my_uart_rx.v(5)
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u0|add0/ucin  (
    .a({num[0],1'b0}),
    .b({1'b1,open_n132}),
    .f({n18[0],open_n152}),
    .fco(\add0/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u2|add0/u1  (
    .a(num[2:1]),
    .b(2'b00),
    .fci(\add0/c1 ),
    .f(n18[2:1]),
    .fco(\add0/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u3_al_u41  (
    .a({open_n179,num[3]}),
    .b({open_n180,1'b0}),
    .fci(\add0/c3 ),
    .f({open_n199,n18[3]}));
  // source/rtl/my_uart_rx.v(57)
  // source/rtl/my_uart_rx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~B*~A)"),
    //.LUTF1("~(~C*~D)"),
    //.LUTG0("(D*C*~B*~A)"),
    //.LUTG1("~(~C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b1111111111110000),
    .INIT_LUTG0(16'b0001000000000000),
    .INIT_LUTG1(16'b1111111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \bps_start_r_reg|rx_int_reg  (
    .a({open_n205,uart_rx0}),
    .b({open_n206,uart_rx1}),
    .c({n6_lutinv,uart_rx2}),
    .ce(_al_n0_en),
    .clk(clk),
    .d({neg_uart_rx,uart_rx3}),
    .mi({neg_uart_rx,open_n210}),
    .sr(rst_n),
    .f({_al_n0_en,neg_uart_rx}),
    .q({n10,rx_int}));  // source/rtl/my_uart_rx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~B*~D)"),
    //.LUTG0("~(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111111100),
    .INIT_LUTG0(16'b1111111111111100),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    i30 (
    .b({open_n227,n6_lutinv}),
    .c({open_n228,n14}),
    .clk(clk),
    .d({open_n230,neg_uart_rx}),
    .sr(rst_n),
    .q({open_n252,n14}));  // source/rtl/my_uart_rx.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg0_b0 (
    .b({open_n255,num[0]}),
    .c({open_n256,num[1]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({open_n257,_al_u23_o}),
    .mi({open_n268,uart_rx_pad}),
    .sr(rst_n),
    .f({open_n269,mux6_b0_sel_is_3_o}),
    .q({open_n273,rx_temp_data[0]}));  // source/rtl/my_uart_rx.v(96)
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
    .SRMUX("INV"))
    reg0_b7 (
    .b({open_n276,num[0]}),
    .c({open_n277,num[1]}),
    .ce(mux6_b7_sel_is_3_o),
    .clk(clk),
    .d({open_n278,_al_u32_o}),
    .mi({open_n289,uart_rx_pad}),
    .sr(rst_n),
    .f({open_n290,mux6_b7_sel_is_3_o}),
    .q({open_n294,rx_temp_data[7]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTF1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100110011110000),
    .INIT_LUTF1(16'b1100110011110000),
    .INIT_LUTG0(16'b1100110011110000),
    .INIT_LUTG1(16'b1100110011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg1_b1  (
    .b(n18[2:1]),
    .c(num[2:1]),
    .ce(rx_int),
    .clk(clk),
    .d({clk_bps,clk_bps}),
    .sr(rst_n),
    .q(num[2:1]));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    //.LUTF0("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    //.LUTF1("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    //.LUTG0("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    //.LUTG1("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1101000111000000),
    .INIT_LUTF1(16'b1101000111000000),
    .INIT_LUTG0(16'b1101000111000000),
    .INIT_LUTG1(16'b1101000111000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b0  (
    .a({n6_lutinv,n6_lutinv}),
    .b({clk_bps,clk_bps}),
    .c({n18[3],n18[0]}),
    .ce(rx_int),
    .clk(clk),
    .d({num[3],num[0]}),
    .sr(rst_n),
    .q({num[3],num[0]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b0|reg2_b7  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({rx_temp_data[0],rx_temp_data[7]}),
    .sr(rst_n),
    .q({rx_data[0],rx_data[7]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b6  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({rx_temp_data[1],rx_temp_data[6]}),
    .sr(rst_n),
    .q({rx_data[1],rx_data[6]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b2|reg2_b5  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({rx_temp_data[2],rx_temp_data[5]}),
    .sr(rst_n),
    .q({rx_data[2],rx_data[5]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(96)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b3|reg2_b4  (
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .mi({rx_temp_data[3],rx_temp_data[4]}),
    .sr(rst_n),
    .q({rx_data[3],rx_data[4]}));  // source/rtl/my_uart_rx.v(96)
  // source/rtl/my_uart_rx.v(31)
  // source/rtl/my_uart_rx.v(31)
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
    \uart_rx1_reg|uart_rx0_reg  (
    .clk(clk),
    .mi({uart_rx0,uart_rx_pad}),
    .sr(rst_n),
    .q({uart_rx1,uart_rx0}));  // source/rtl/my_uart_rx.v(31)
  // source/rtl/my_uart_rx.v(31)
  // source/rtl/my_uart_rx.v(31)
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
    \uart_rx3_reg|uart_rx2_reg  (
    .clk(clk),
    .mi({uart_rx2,uart_rx1}),
    .sr(rst_n),
    .q({uart_rx3,uart_rx2}));  // source/rtl/my_uart_rx.v(31)

endmodule 

module my_uart_tx  // source/rtl/my_uart_tx.v(3)
  (
  clk,
  clk_bps,
  rst_n,
  rx_data,
  rx_int,
  bps_start,
  uart_tx
  );

  input clk;  // source/rtl/my_uart_tx.v(5)
  input clk_bps;  // source/rtl/my_uart_tx.v(10)
  input rst_n;  // source/rtl/my_uart_tx.v(6)
  input [7:0] rx_data;  // source/rtl/my_uart_tx.v(7)
  input rx_int;  // source/rtl/my_uart_tx.v(8)
  output bps_start;  // source/rtl/my_uart_tx.v(11)
  output uart_tx;  // source/rtl/my_uart_tx.v(9)

  wire [3:0] n11;
  wire [3:0] num;  // source/rtl/my_uart_tx.v(38)
  wire [7:0] tx_data;  // source/rtl/my_uart_tx.v(35)
  wire _al_n0_en;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u5_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire _al_u9_o;
  wire \add0/c1 ;
  wire \add0/c3 ;
  wire n12;
  wire n2_lutinv;
  wire n6;
  wire n8;
  wire neg_rx_int;  // source/rtl/my_uart_tx.v(16)
  wire rx_int0;  // source/rtl/my_uart_tx.v(15)
  wire rx_int1;  // source/rtl/my_uart_tx.v(15)
  wire rx_int2;  // source/rtl/my_uart_tx.v(15)
  wire tx_en;  // source/rtl/my_uart_tx.v(37)
  wire u13_sel_is_3_o;

  // source/rtl/my_uart_tx.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u0|i28  (
    .c({n8,n8}),
    .clk(clk),
    .d({n6,_al_n0_en}),
    .sr(rst_n),
    .f({bps_start,open_n17}),
    .q({open_n21,n8}));  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*~A)"),
    //.LUTF1("~(~(~B*~A)*~(C)*~(D)+~(~B*~A)*C*~(D)+~(~(~B*~A))*C*D+~(~B*~A)*C*D)"),
    //.LUTG0("(D*~C*B*~A)"),
    //.LUTG1("~(~(~B*~A)*~(C)*~(D)+~(~B*~A)*C*~(D)+~(~(~B*~A))*C*D+~(~B*~A)*C*D)"),
    .INIT_LUTF0(16'b0000010000000000),
    .INIT_LUTF1(16'b0000111100010001),
    .INIT_LUTG0(16'b0000010000000000),
    .INIT_LUTG1(16'b0000111100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u10|_al_u11  (
    .a({_al_u5_o,num[0]}),
    .b({_al_u8_o,num[1]}),
    .c({_al_u9_o,num[2]}),
    .d({num[3],num[3]}),
    .f({n12,n2_lutinv}));
  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(C*~(~B*~D))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(C*~(~B*~D))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b1111000011000000),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b1111000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u5|reg0_b5  (
    .a({open_n46,tx_data[5]}),
    .b({_al_u4_o,tx_data[6]}),
    .c({num[2],num[0]}),
    .ce(neg_rx_int),
    .clk(clk),
    .d({_al_u3_o,num[1]}),
    .mi({open_n50,rx_data[5]}),
    .sr(rst_n),
    .f({_al_u5_o,_al_u3_o}),
    .q({open_n65,tx_data[5]}));  // source/rtl/my_uart_tx.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u8|_al_u1  (
    .c({_al_u7_o,tx_en}),
    .d({_al_u6_o,clk_bps}),
    .f({_al_u8_o,u13_sel_is_3_o}));
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u0|add0/ucin  (
    .a({num[0],1'b0}),
    .b({1'b1,open_n90}),
    .f({n11[0],open_n110}),
    .fco(\add0/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u2|add0/u1  (
    .a(num[2:1]),
    .b(2'b00),
    .fci(\add0/c1 ),
    .f(n11[2:1]),
    .fco(\add0/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add0/u0|add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add0/u3_al_u19  (
    .a({open_n137,num[3]}),
    .b({open_n138,1'b0}),
    .fci(\add0/c3 ),
    .f({open_n157,n11[3]}));
  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*~(~C*B*A))"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*~(~C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000011110111),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000011110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b7  (
    .a({tx_data[0],tx_data[7]}),
    .b({num[0],num[0]}),
    .c({num[1],num[1]}),
    .ce(neg_rx_int),
    .clk(clk),
    .d({num[2],num[2]}),
    .mi({rx_data[0],rx_data[7]}),
    .sr(rst_n),
    .f({_al_u7_o,_al_u9_o}),
    .q({tx_data[0],tx_data[7]}));  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b1100101000000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b1100101000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b3  (
    .a({tx_data[1],tx_data[3]}),
    .b({tx_data[2],tx_data[4]}),
    .c({num[0],num[0]}),
    .ce(neg_rx_int),
    .clk(clk),
    .d({num[1],num[1]}),
    .mi({rx_data[1],rx_data[3]}),
    .sr(rst_n),
    .f({_al_u6_o,_al_u4_o}),
    .q({tx_data[1],tx_data[3]}));  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b6  (
    .ce(neg_rx_int),
    .clk(clk),
    .mi({rx_data[2],rx_data[6]}),
    .sr(rst_n),
    .q({tx_data[2],tx_data[6]}));  // source/rtl/my_uart_tx.v(57)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg0_b4 (
    .ce(neg_rx_int),
    .clk(clk),
    .mi({open_n235,rx_data[4]}),
    .sr(rst_n),
    .q({open_n252,tx_data[4]}));  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(91)
  // source/rtl/my_uart_tx.v(91)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUT1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011110000),
    .INIT_LUT1(16'b1100110011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg1_b0  (
    .b({n11[2],n11[0]}),
    .c({num[2],num[0]}),
    .ce(tx_en),
    .clk(clk),
    .d({clk_bps,clk_bps}),
    .sr(rst_n),
    .q({num[2],num[0]}));  // source/rtl/my_uart_tx.v(91)
  // source/rtl/my_uart_tx.v(91)
  // source/rtl/my_uart_tx.v(91)
  EG_PHY_LSLICE #(
    //.LUTF0("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    //.LUTF1("((~D*C)*~(B)*~(A)+(~D*C)*B*~(A)+~((~D*C))*B*A+(~D*C)*B*A)"),
    //.LUTG0("((D*~A)*~(C)*~(B)+(D*~A)*C*~(B)+~((D*~A))*C*B+(D*~A)*C*B)"),
    //.LUTG1("((~D*C)*~(B)*~(A)+(~D*C)*B*~(A)+~((~D*C))*B*A+(~D*C)*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1101000111000000),
    .INIT_LUTF1(16'b1000100011011000),
    .INIT_LUTG0(16'b1101000111000000),
    .INIT_LUTG1(16'b1000100011011000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b1  (
    .a({clk_bps,n2_lutinv}),
    .b({n11[3],clk_bps}),
    .c({num[3],n11[1]}),
    .ce(tx_en),
    .clk(clk),
    .d({n2_lutinv,num[1]}),
    .sr(rst_n),
    .q({num[3],num[1]}));  // source/rtl/my_uart_tx.v(91)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    rx_int0_reg (
    .clk(clk),
    .mi({open_n305,rx_int}),
    .sr(rst_n),
    .q({open_n322,rx_int0}));  // source/rtl/my_uart_tx.v(30)
  // source/rtl/my_uart_tx.v(30)
  // source/rtl/my_uart_tx.v(30)
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
    \rx_int1_reg|rx_int2_reg  (
    .clk(clk),
    .mi({rx_int0,rx_int1}),
    .sr(rst_n),
    .q({rx_int1,rx_int2}));  // source/rtl/my_uart_tx.v(30)
  // source/rtl/my_uart_tx.v(57)
  // source/rtl/my_uart_tx.v(57)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \tx_en_reg|bps_start_r_reg  (
    .c({rx_int2,n2_lutinv}),
    .ce(_al_n0_en),
    .clk(clk),
    .d({rx_int1,neg_rx_int}),
    .mi({open_n361,neg_rx_int}),
    .sr(rst_n),
    .f({neg_rx_int,_al_n0_en}),
    .q({tx_en,n6}));  // source/rtl/my_uart_tx.v(57)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C11"),
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
    uart_tx_r_reg_DO (
    .ce(u13_sel_is_3_o),
    .do({open_n365,open_n366,open_n367,n12}),
    .osclk(clk),
    .rst(rst_n),
    .opad(uart_tx));  // source/rtl/my_uart_tx.v(91)

endmodule 

module speed_setting_1  // source/rtl/speed_setting.v(1)
  (
  bps_start,
  clk,
  rst_n,
  clk_bps
  );

  input bps_start;  // source/rtl/speed_setting.v(9)
  input clk;  // source/rtl/speed_setting.v(7)
  input rst_n;  // source/rtl/speed_setting.v(8)
  output clk_bps;  // source/rtl/speed_setting.v(10)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [12:0] cnt;  // source/rtl/speed_setting.v(16)
  wire [12:0] n4;
  wire _al_u1_o;
  wire _al_u2_o;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire \add0/c11 ;
  wire \add0/c3 ;
  wire \add0/c7 ;

  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTG0(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u1 (
    .a({open_n0,cnt[11]}),
    .b({open_n1,cnt[3]}),
    .c({open_n2,cnt[4]}),
    .d({open_n5,cnt[5]}),
    .f({open_n23,_al_u1_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(C*~B*~D)"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"))
    \_al_u2|_al_u8  (
    .a({open_n29,_al_u2_o}),
    .b({cnt[12],_al_u3_o}),
    .c({cnt[2],cnt[8]}),
    .d({cnt[0],cnt[9]}),
    .f({_al_u2_o,_al_u8_o}));
  // source/rtl/speed_setting.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~(B*A))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(D*C*~(B*A))"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3|reg0_b6  (
    .a({open_n50,_al_u7_o}),
    .b({open_n51,_al_u8_o}),
    .c({cnt[7],bps_start}),
    .clk(clk),
    .d({cnt[6],n4[6]}),
    .sr(rst_n),
    .f({_al_u3_o,open_n69}),
    .q({open_n73,cnt[6]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(37)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u4|clk_bps_r_reg  (
    .a({_al_u2_o,_al_u4_o}),
    .b({_al_u3_o,_al_u1_o}),
    .c({cnt[8],cnt[1]}),
    .clk(clk),
    .d({cnt[9],cnt[10]}),
    .sr(rst_n),
    .f({_al_u4_o,open_n87}),
    .q({open_n91,clk_bps}));  // source/rtl/speed_setting.v(37)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(D*~C*B*A)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u6|_al_u7  (
    .a({cnt[11],open_n92}),
    .b({cnt[3],cnt[1]}),
    .c({cnt[4],cnt[10]}),
    .d({cnt[5],_al_u6_o}),
    .f({_al_u6_o,_al_u7_o}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u11_al_u25  (
    .a({open_n117,cnt[11]}),
    .b({open_n118,cnt[12]}),
    .c(2'b00),
    .d({open_n121,1'b0}),
    .e({open_n122,1'b0}),
    .fci(\add0/c11 ),
    .f({open_n137,n4[11]}),
    .fx({open_n139,n4[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u3_al_u23  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n4[5],n4[3]}),
    .fco(\add0/c7 ),
    .fx({n4[6],n4[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u7_al_u24  (
    .a({cnt[9],cnt[7]}),
    .b({cnt[10],cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n4[9],n4[7]}),
    .fco(\add0/c11 ),
    .fx({n4[10],n4[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/ucin_al_u22  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n4[1],open_n195}),
    .fco(\add0/c3 ),
    .fx({n4[2],n4[0]}));
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b9  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[0],n4[9]}),
    .sr(rst_n),
    .q({cnt[0],cnt[9]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b8  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[10],n4[8]}),
    .sr(rst_n),
    .q({cnt[10],cnt[8]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b11|reg0_b5  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[11],n4[5]}),
    .sr(rst_n),
    .q({cnt[11],cnt[5]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b12|reg0_b4  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[12],n4[4]}),
    .sr(rst_n),
    .q({cnt[12],cnt[4]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b3  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[1],n4[3]}),
    .sr(rst_n),
    .q({cnt[1],cnt[3]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~(B*A))"),
    //.LUTF1("(D*C*~(B*A))"),
    //.LUTG0("(D*C*~(B*A))"),
    //.LUTG1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111000000000000),
    .INIT_LUTF1(16'b0111000000000000),
    .INIT_LUTG0(16'b0111000000000000),
    .INIT_LUTG1(16'b0111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b7  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[2],n4[7]}),
    .sr(rst_n),
    .q({cnt[2],cnt[7]}));  // source/rtl/speed_setting.v(27)

endmodule 

module speed_setting  // source/rtl/speed_setting.v(1)
  (
  bps_start,
  clk,
  rst_n,
  clk_bps
  );

  input bps_start;  // source/rtl/speed_setting.v(9)
  input clk;  // source/rtl/speed_setting.v(7)
  input rst_n;  // source/rtl/speed_setting.v(8)
  output clk_bps;  // source/rtl/speed_setting.v(10)

  parameter BPS_SET = 96;
  parameter CLK_PERIORD = 40;
  wire [12:0] cnt;  // source/rtl/speed_setting.v(16)
  wire [12:0] n4;
  wire _al_u1_o;
  wire _al_u2_o;
  wire _al_u3_o;
  wire _al_u4_o;
  wire _al_u6_o;
  wire _al_u7_o;
  wire _al_u8_o;
  wire \add0/c11 ;
  wire \add0/c3 ;
  wire \add0/c7 ;

  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTG0(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u1 (
    .a({open_n0,cnt[11]}),
    .b({open_n1,cnt[3]}),
    .c({open_n2,cnt[4]}),
    .d({open_n5,cnt[5]}),
    .f({open_n23,_al_u1_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(C*~B*~D)"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"))
    \_al_u2|_al_u8  (
    .a({open_n29,_al_u2_o}),
    .b({cnt[12],_al_u3_o}),
    .c({cnt[2],cnt[8]}),
    .d({cnt[0],cnt[9]}),
    .f({_al_u2_o,_al_u8_o}));
  // source/rtl/speed_setting.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~(B*A))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(D*C*~(B*A))"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3|reg0_b6  (
    .a({open_n50,_al_u7_o}),
    .b({open_n51,_al_u8_o}),
    .c({cnt[7],bps_start}),
    .clk(clk),
    .d({cnt[6],n4[6]}),
    .sr(rst_n),
    .f({_al_u3_o,open_n69}),
    .q({open_n73,cnt[6]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(37)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(~D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u4|clk_bps_r_reg  (
    .a({_al_u2_o,_al_u4_o}),
    .b({_al_u3_o,_al_u1_o}),
    .c({cnt[8],cnt[1]}),
    .clk(clk),
    .d({cnt[9],cnt[10]}),
    .sr(rst_n),
    .f({_al_u4_o,open_n87}),
    .q({open_n91,clk_bps}));  // source/rtl/speed_setting.v(37)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(D*~C*B*A)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u6|_al_u7  (
    .a({cnt[11],open_n92}),
    .b({cnt[3],cnt[1]}),
    .c({cnt[4],cnt[10]}),
    .d({cnt[5],_al_u6_o}),
    .f({_al_u6_o,_al_u7_o}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u11_al_u25  (
    .a({open_n117,cnt[11]}),
    .b({open_n118,cnt[12]}),
    .c(2'b00),
    .d({open_n121,1'b0}),
    .e({open_n122,1'b0}),
    .fci(\add0/c11 ),
    .f({open_n137,n4[11]}),
    .fx({open_n139,n4[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u3_al_u23  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n4[5],n4[3]}),
    .fco(\add0/c7 ),
    .fx({n4[6],n4[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
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
    \add0/u7_al_u24  (
    .a({cnt[9],cnt[7]}),
    .b({cnt[10],cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n4[9],n4[7]}),
    .fco(\add0/c11 ),
    .fx({n4[10],n4[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u22"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/ucin_al_u22  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n4[1],open_n195}),
    .fco(\add0/c3 ),
    .fx({n4[2],n4[0]}));
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b9  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[0],n4[9]}),
    .sr(rst_n),
    .q({cnt[0],cnt[9]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b8  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[10],n4[8]}),
    .sr(rst_n),
    .q({cnt[10],cnt[8]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b11|reg0_b5  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[11],n4[5]}),
    .sr(rst_n),
    .q({cnt[11],cnt[5]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b12|reg0_b4  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[12],n4[4]}),
    .sr(rst_n),
    .q({cnt[12],cnt[4]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b3  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[1],n4[3]}),
    .sr(rst_n),
    .q({cnt[1],cnt[3]}));  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  // source/rtl/speed_setting.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*~(B*A))"),
    //.LUTF1("(D*C*~(B*A))"),
    //.LUTG0("(D*C*~(B*A))"),
    //.LUTG1("(D*C*~(B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111000000000000),
    .INIT_LUTF1(16'b0111000000000000),
    .INIT_LUTG0(16'b0111000000000000),
    .INIT_LUTG1(16'b0111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b7  (
    .a({_al_u7_o,_al_u7_o}),
    .b({_al_u8_o,_al_u8_o}),
    .c({bps_start,bps_start}),
    .clk(clk),
    .d({n4[2],n4[7]}),
    .sr(rst_n),
    .q({cnt[2],cnt[7]}));  // source/rtl/speed_setting.v(27)

endmodule 

module pll_test  // al_ip/pll_test.v(24)
  (
  refclk,
  reset,
  clk0_out,
  clk1_out,
  clk2_out,
  extlock
  );

  input refclk;  // al_ip/pll_test.v(31)
  input reset;  // al_ip/pll_test.v(32)
  output clk0_out;  // al_ip/pll_test.v(34)
  output clk1_out;  // al_ip/pll_test.v(35)
  output clk2_out;  // al_ip/pll_test.v(36)
  output extlock;  // al_ip/pll_test.v(33)

  wire clk0_buf;  // al_ip/pll_test.v(38)

  EG_PHY_GCLK bufg_feedback (
    .clki(clk0_buf),
    .clko(clk0_out));  // al_ip/pll_test.v(40)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(39),
    .CLKC0_DIV(40),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(19),
    .CLKC1_DIV(20),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(9),
    .CLKC2_DIV(10),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("ENABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(1),
    .CLKC3_DIV(1),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(1),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("25.000"),
    .FREQ_LOCK_ACCURACY(2),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("ENABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .REFCLK_DIV(1),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    pll_inst (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk0_out),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(refclk),
    .reset(reset),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,clk2_out,clk1_out,clk0_buf}),
    .extlock(extlock));  // al_ip/pll_test.v(71)

endmodule 

module ram_rw_control  // source/rtl/ram_rw_control.v(1)
  (
  clk_25m,
  rx_data,
  rx_int,
  sys_rst_n,
  led,
  ram_output,
  ram_rw_ce
  );

  input clk_25m;  // source/rtl/ram_rw_control.v(3)
  input [7:0] rx_data;  // source/rtl/ram_rw_control.v(6)
  input rx_int;  // source/rtl/ram_rw_control.v(5)
  input sys_rst_n;  // source/rtl/ram_rw_control.v(4)
  output led;  // source/rtl/ram_rw_control.v(9)
  output [7:0] ram_output;  // source/rtl/ram_rw_control.v(8)
  output ram_rw_ce;  // source/rtl/ram_rw_control.v(7)

  wire [7:0] n3;
  wire [7:0] n4;
  wire [7:0] ram_input;  // source/rtl/ram_rw_control.v(18)
  wire [7:0] ram_re_addr;  // source/rtl/ram_rw_control.v(19)
  wire [7:0] ram_wr_addr;  // source/rtl/ram_rw_control.v(19)
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire led_pad;  // source/rtl/ram_rw_control.v(9)
  wire lt0_c1;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire n2;
  wire rx_int0;  // source/rtl/ram_rw_control.v(14)
  wire rx_int1;  // source/rtl/ram_rw_control.v(14)
  wire rx_int2;  // source/rtl/ram_rw_control.v(14)

  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \LED_FLAG_reg|reg2_b3  (
    .b({open_n2,rx_int1}),
    .c({n2,rx_int2}),
    .clk(clk_25m),
    .d({led_pad,rx_data[3]}),
    .sr(sys_rst_n),
    .q({led_pad,ram_re_addr[3]}));  // source/rtl/ram_rw_control.v(86)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u0 (
    .do({open_n22,open_n23,open_n24,led_pad}),
    .opad(led));  // source/rtl/ram_rw_control.v(9)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u11"),
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
    \add0/u3_al_u12  (
    .a({ram_wr_addr[5],ram_wr_addr[3]}),
    .b({ram_wr_addr[6],ram_wr_addr[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n3[5],n3[3]}),
    .fco(\add0/c7 ),
    .fx({n3[6],n3[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u11"),
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
    \add0/u7_al_u13  (
    .a({open_n56,ram_wr_addr[7]}),
    .c(2'b00),
    .d({open_n61,1'b0}),
    .fci(\add0/c7 ),
    .f({open_n78,n3[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u11"),
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
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \add0/ucin_al_u11  (
    .a({ram_wr_addr[1],1'b0}),
    .b({ram_wr_addr[2],ram_wr_addr[0]}),
    .c(2'b00),
    .ce(n2),
    .clk(clk_25m),
    .d(2'b01),
    .e(2'b01),
    .mi(n3[1:0]),
    .sr(sys_rst_n),
    .f({n3[1],open_n96}),
    .fco(\add0/c3 ),
    .fx({n3[2],n3[0]}),
    .q(ram_wr_addr[1:0]));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u14"),
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
    \add1/u3_al_u15  (
    .a({ram_input[5],ram_input[3]}),
    .b({ram_input[6],ram_input[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n4[5],n4[3]}),
    .fco(\add1/c7 ),
    .fx({n4[6],n4[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u14"),
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
    \add1/u7_al_u16  (
    .a({open_n115,ram_input[7]}),
    .c(2'b00),
    .d({open_n120,1'b0}),
    .fci(\add1/c7 ),
    .f({open_n137,n4[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u14"),
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
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \add1/ucin_al_u14  (
    .a({ram_input[1],1'b0}),
    .b({ram_input[2],ram_input[0]}),
    .c(2'b00),
    .ce(n2),
    .clk(clk_25m),
    .d(2'b01),
    .e(2'b01),
    .mi(n4[1:0]),
    .sr(sys_rst_n),
    .f({n4[1],open_n155}),
    .fco(\add1/c3 ),
    .fx({n4[2],n4[0]}),
    .q(ram_input[1:0]));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_0|lt0_cin  (
    .a({ram_wr_addr[0],1'b0}),
    .b({1'b1,open_n156}),
    .fco(lt0_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(ram_wr_addr[2:1]),
    .b(2'b11),
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
    .a(ram_wr_addr[4:3]),
    .b(2'b11),
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
    .a(ram_wr_addr[6:5]),
    .b(2'b11),
    .fci(lt0_c5),
    .fco(lt0_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_cout|lt0_7  (
    .a({1'b0,ram_wr_addr[7]}),
    .b(2'b11),
    .fci(lt0_c7),
    .f({n2,open_n272}));
  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ram_rw_ce_r_reg|reg2_b7  (
    .b({open_n280,rx_int1}),
    .c({rx_int2,rx_int2}),
    .clk(clk_25m),
    .d({rx_int1,rx_data[7]}),
    .sr(sys_rst_n),
    .q({ram_rw_ce,ram_re_addr[7]}));  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b7  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n3[2],n3[7]}),
    .sr(sys_rst_n),
    .q({ram_wr_addr[2],ram_wr_addr[7]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b3|reg0_b6  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n3[3],n3[6]}),
    .sr(sys_rst_n),
    .q({ram_wr_addr[3],ram_wr_addr[6]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b4|reg0_b5  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n3[4],n3[5]}),
    .sr(sys_rst_n),
    .q({ram_wr_addr[4],ram_wr_addr[5]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg1_b7  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n4[2],n4[7]}),
    .sr(sys_rst_n),
    .q({ram_input[2],ram_input[7]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b6  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n4[3],n4[6]}),
    .sr(sys_rst_n),
    .q({ram_input[3],ram_input[6]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(66)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b4|reg1_b5  (
    .ce(n2),
    .clk(clk_25m),
    .mi({n4[4],n4[5]}),
    .sr(sys_rst_n),
    .q({ram_input[4],ram_input[5]}));  // source/rtl/ram_rw_control.v(66)
  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
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
    .SRMUX("INV"))
    \reg2_b0|reg2_b6  (
    .b({rx_int1,rx_int1}),
    .c({rx_int2,rx_int2}),
    .clk(clk_25m),
    .d({rx_data[0],rx_data[6]}),
    .sr(sys_rst_n),
    .q({ram_re_addr[0],ram_re_addr[6]}));  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b5  (
    .b({rx_int1,rx_int1}),
    .c({rx_int2,rx_int2}),
    .clk(clk_25m),
    .d({rx_data[1],rx_data[5]}),
    .sr(sys_rst_n),
    .q({ram_re_addr[1],ram_re_addr[5]}));  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
  // source/rtl/ram_rw_control.v(86)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b2|reg2_b4  (
    .b({rx_int1,rx_int1}),
    .c({rx_int2,rx_int2}),
    .clk(clk_25m),
    .d({rx_data[2],rx_data[4]}),
    .sr(sys_rst_n),
    .q({ram_re_addr[2],ram_re_addr[4]}));  // source/rtl/ram_rw_control.v(86)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    rx_int0_reg (
    .clk(clk_25m),
    .mi({open_n540,rx_int}),
    .sr(sys_rst_n),
    .q({open_n546,rx_int0}));  // source/rtl/ram_rw_control.v(39)
  // source/rtl/ram_rw_control.v(39)
  // source/rtl/ram_rw_control.v(39)
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
    \rx_int1_reg|rx_int2_reg  (
    .clk(clk_25m),
    .mi({rx_int0,rx_int1}),
    .sr(sys_rst_n),
    .q({rx_int1,rx_int2}));  // source/rtl/ram_rw_control.v(39)
  // address_offset=0;data_offset=0;depth=256;width=8;num_section=1;width_per_section=8;section_size=8;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0004"),
    //.WID("0x0004"),
    .CEAMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("0"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("0"),
    .RSTBMUX("0"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uut_Double_RAM/inst_256x8_sub_000000_000  (
    .addra({2'b00,ram_wr_addr,3'b111}),
    .addrb({2'b00,ram_re_addr,3'b111}),
    .ceb(ram_rw_ce),
    .clka(clk_25m),
    .clkb(clk_25m),
    .dia({open_n578,ram_input}),
    .dob({open_n603,ram_output}));

endmodule 

