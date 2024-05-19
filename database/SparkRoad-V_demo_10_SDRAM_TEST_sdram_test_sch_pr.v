// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.3.949
// Fri Aug  9 19:51:46 2019

`timescale 1ns / 1ps
module sdram_control  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(1)
  (
  CLKIN,
  rst_n,
  sm_bit,
  sm_seg,
  test_error_led,
  test_io
  );

  input CLKIN;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(2)
  input rst_n;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(3)
  output [3:0] sm_bit;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(7)
  output [7:0] sm_seg;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  output test_error_led;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(5)
  output test_io;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(4)

  parameter mode_register = 11'b00000110111;
  parameter reg1_register = 13'b0000100101111;
  parameter reg2_register = 12'b110000110101;
  wire [31:0] SD_DQ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(40)
  wire [8:0] burst_cnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(12)
  wire [8:0] burst_cnt1;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(13)
  wire [7:0] datacnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(23)
  wire [15:0] error_cnt;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(25)
  wire [7:0] fifo_q;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(22)
  wire [15:0] n1;
  wire [8:0] n29;
  wire [7:0] n34;
  wire [12:0] n36;
  wire [8:0] n52;
  wire [12:0] n54;
  wire [7:0] n65;
  wire [31:0] \neq0/diff ;
  wire [20:0] rd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(15)
  wire [1:0] rd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(16)
  wire [1:0] reset_step;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(11)
  wire [20:0] sd_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(21)
  wire [2:0] sd_cmd;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(19)
  wire [31:0] sd_dataout;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(26)
  wire [31:0] sd_dq_int;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(31)
  wire [2:0] sd_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(10)
  wire [7:0] sm_seg_pad;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  wire [3:0] \u2_al_u0/n14 ;
  wire [1:0] \u2_al_u0/n17 ;
  wire [3:0] \u2_al_u0/n19 ;
  wire [2:0] \u2_al_u0/n2 ;
  wire [2:0] \u2_al_u0/n21 ;
  wire [2:0] \u2_al_u0/n24 ;
  wire [2:0] \u2_al_u0/n25 ;
  wire [3:0] \u2_al_u0/n27 ;
  wire [3:0] \u2_al_u0/n29 ;
  wire [3:0] \u2_al_u0/n8 ;
  wire [31:0] \u_sdram/DQIN ;  // ../sdr_sdram.v(46)
  wire [31:0] \u_sdram/DQOUT ;  // ../sdr_sdram.v(48)
  wire [1:0] \u_sdram/IBA ;  // ../sdr_sdram.v(40)
  wire [10:0] \u_sdram/ISA ;  // ../sdr_sdram.v(39)
  wire [20:0] \u_sdram/saddr ;  // ../sdr_sdram.v(50)
  wire [1:0] \u_sdram/sc_rc ;  // ../sdr_sdram.v(52)
  wire [7:0] \u_sdram/ux_command/command_delay ;  // ../Command.v(54)
  wire [3:0] \u_sdram/ux_command/rp_shift ;  // ../Command.v(60)
  wire [3:0] \u_sdram/ux_command/rw_shift ;  // ../Command.v(55)
  wire [31:0] \u_sdram/ux_data_path/DIN1 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(16)
  wire [24:0] \ux_seg/cnt ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(27)
  wire [17:0] \ux_seg/cnt_w ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(33)
  wire [17:0] \ux_seg/n13 ;
  wire [24:0] \ux_seg/n2 ;
  wire [3:0] \ux_seg/sm_bit1_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(28)
  wire [3:0] \ux_seg/sm_bit2_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(29)
  wire [3:0] \ux_seg/sm_bit3_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(30)
  wire [3:0] \ux_seg/sm_seg_num ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(36)
  wire [20:0] wr_addr;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(14)
  wire [1:0] wr_state;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(17)
  wire CLKIN_pad;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(2)
  wire _al_n0_en;
  wire _al_u263_o;
  wire _al_u264_o;
  wire _al_u265_o;
  wire _al_u266_o;
  wire _al_u267_o;
  wire _al_u268_o;
  wire _al_u269_o;
  wire _al_u270_o;
  wire _al_u271_o;
  wire _al_u272_o;
  wire _al_u273_o;
  wire _al_u274_o;
  wire _al_u275_o;
  wire _al_u276_o;
  wire _al_u277_o;
  wire _al_u278_o;
  wire _al_u280_o;
  wire _al_u344_o;
  wire _al_u368_o;
  wire _al_u372_o;
  wire _al_u374_o;
  wire _al_u375_o;
  wire _al_u376_o;
  wire _al_u377_o;
  wire _al_u378_o;
  wire _al_u379_o;
  wire _al_u380_o;
  wire _al_u381_o;
  wire _al_u383_o;
  wire _al_u384_o;
  wire _al_u385_o;
  wire _al_u386_o;
  wire _al_u388_o;
  wire _al_u389_o;
  wire _al_u391_o;
  wire _al_u392_o;
  wire _al_u393_o;
  wire _al_u395_o;
  wire _al_u396_o;
  wire _al_u398_o;
  wire _al_u399_o;
  wire _al_u400_o;
  wire _al_u401_o;
  wire _al_u403_o;
  wire _al_u404_o;
  wire _al_u406_o;
  wire _al_u408_o;
  wire _al_u410_o;
  wire _al_u412_o;
  wire _al_u414_o;
  wire _al_u416_o;
  wire _al_u418_o;
  wire _al_u420_o;
  wire _al_u422_o;
  wire _al_u424_o;
  wire _al_u426_o;
  wire _al_u428_o;
  wire _al_u430_o;
  wire _al_u432_o;
  wire _al_u434_o;
  wire _al_u435_o;
  wire _al_u436_o;
  wire _al_u437_o;
  wire _al_u439_o;
  wire _al_u440_o;
  wire _al_u441_o;
  wire _al_u453_o;
  wire _al_u454_o;
  wire _al_u455_o;
  wire _al_u456_o;
  wire _al_u476_o;
  wire _al_u477_o;
  wire _al_u478_o;
  wire _al_u479_o;
  wire _al_u480_o;
  wire _al_u481_o;
  wire _al_u510_o;
  wire _al_u512_o;
  wire _al_u517_o;
  wire _al_u518_o;
  wire _al_u519_o;
  wire _al_u521_o;
  wire _al_u522_o;
  wire _al_u523_o;
  wire _al_u537_o;
  wire _al_u538_o;
  wire _al_u539_o;
  wire _al_u541_o;
  wire _al_u542_o;
  wire _al_u543_o;
  wire _al_u544_o;
  wire _al_u546_o;
  wire _al_u549_o;
  wire _al_u550_o;
  wire _al_u556_o;
  wire _al_u557_o;
  wire _al_u560_o;
  wire _al_u561_o;
  wire _al_u565_o;
  wire _al_u566_o;
  wire _al_u567_o;
  wire _al_u568_o;
  wire _al_u569_o;
  wire _al_u570_o;
  wire _al_u571_o;
  wire _al_u572_o;
  wire _al_u573_o;
  wire _al_u574_o;
  wire _al_u576_o;
  wire _al_u577_o;
  wire _al_u578_o;
  wire _al_u579_o;
  wire _al_u580_o;
  wire _al_u582_o;
  wire _al_u583_o;
  wire _al_u593_o;
  wire _al_u594_o;
  wire _al_u596_o;
  wire _al_u597_o;
  wire _al_u607_o;
  wire _al_u616_o;
  wire _al_u621_o;
  wire _al_u626_o;
  wire \add0/c11 ;
  wire \add0/c15 ;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add10/c1 ;
  wire \add10/c3 ;
  wire \add10/c5 ;
  wire \add10/c7 ;
  wire \add4/c3 ;
  wire \add4/c7 ;
  wire \add5/c1 ;
  wire \add5/c3 ;
  wire \add5/c5 ;
  wire \add5/c7 ;
  wire \add6/c11 ;
  wire \add6/c3 ;
  wire \add6/c7 ;
  wire \add8/c1 ;
  wire \add8/c3 ;
  wire \add8/c5 ;
  wire \add8/c7 ;
  wire \add9/c11 ;
  wire \add9/c3 ;
  wire \add9/c7 ;
  wire clk_200m /* synthesis keep 1 */ ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(29)
  wire lt0_c1;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire lt0_c9;
  wire lt1_c1;
  wire lt1_c3;
  wire lt1_c5;
  wire lt1_c7;
  wire lt1_c9;
  wire lt2_c1;
  wire lt2_c3;
  wire lt2_c5;
  wire lt2_c7;
  wire lt2_c9;
  wire n35_lutinv;
  wire n5;
  wire n51;
  wire n53_lutinv;
  wire n64;
  wire n68;
  wire n80;
  wire n81;
  wire n82;
  wire rst_n_pad;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(3)
  wire sd_clk_int /* synthesis keep 1 */ ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(30)
  wire sd_cmd_ack;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(20)
  wire sel8_b0_sel_is_3_o;
  wire test_error_led_pad;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(5)
  wire test_error_tmp;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(24)
  wire u26_sel_is_2_o;
  wire \u2_al_u0/add0/c1 ;
  wire \u2_al_u0/add0/c3 ;
  wire \u2_al_u0/add1/c1 ;
  wire \u2_al_u0/add1/c3 ;
  wire \u2_al_u0/add2/c1 ;
  wire \u2_al_u0/add2/c3 ;
  wire \u2_al_u0/add3/c1 ;
  wire \u2_al_u0/add3/c3 ;
  wire \u2_al_u0/add4/c1 ;
  wire \u2_al_u0/add4/c3 ;
  wire \u2_al_u0/add5/c1 ;
  wire \u2_al_u0/add5/c3 ;
  wire \u2_al_u0/add6/c1 ;
  wire \u2_al_u0/add6/c3 ;
  wire \u2_al_u0/n0_lutinv ;
  wire \u2_al_u0/n1 ;
  wire \u2_al_u0/n10 ;
  wire \u2_al_u0/n11 ;
  wire \u2_al_u0/n12 ;
  wire \u2_al_u0/n15 ;
  wire \u2_al_u0/n16 ;
  wire \u2_al_u0/n20 ;
  wire \u2_al_u0/n23 ;
  wire \u2_al_u0/n3 ;
  wire \u2_al_u0/n4 ;
  wire \u2_al_u0/n5 ;
  wire \u2_al_u0/n6 ;
  wire \u2_al_u0/n9 ;
  wire \u_sdram/ICAS_N ;  // ../sdr_sdram.v(44)
  wire \u_sdram/ICS_N ;  // ../sdr_sdram.v(41)
  wire \u_sdram/IRAS_N ;  // ../sdr_sdram.v(43)
  wire \u_sdram/IWE_N ;  // ../sdr_sdram.v(45)
  wire \u_sdram/cm_ack ;  // ../sdr_sdram.v(62)
  wire \u_sdram/load_mode ;  // ../sdr_sdram.v(56)
  wire \u_sdram/oe ;  // ../sdr_sdram.v(61)
  wire \u_sdram/precharge ;  // ../sdr_sdram.v(60)
  wire \u_sdram/reada ;  // ../sdr_sdram.v(58)
  wire \u_sdram/ux_command/bankclose ;  // ../Command.v(65)
  wire \u_sdram/ux_command/command_done ;  // ../Command.v(53)
  wire \u_sdram/ux_command/do_load_mode ;  // ../Command.v(52)
  wire \u_sdram/ux_command/do_precharge ;  // ../Command.v(51)
  wire \u_sdram/ux_command/do_reada ;  // ../Command.v(48)
  wire \u_sdram/ux_command/do_rw ;  // ../Command.v(58)
  wire \u_sdram/ux_command/do_writea ;  // ../Command.v(49)
  wire \u_sdram/ux_command/n17 ;
  wire \u_sdram/ux_command/n19 ;
  wire \u_sdram/ux_command/n24 ;
  wire \u_sdram/ux_command/n61 ;
  wire \u_sdram/ux_command/oe1 ;  // ../Command.v(59)
  wire \u_sdram/ux_command/rp_done ;  // ../Command.v(61)
  wire \u_sdram/ux_command/rw_flag ;  // ../Command.v(57)
  wire \u_sdram/ux_control/LOAD_REG1 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(36)
  wire \u_sdram/ux_control/LOAD_REG2 ;  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(37)
  wire \u_sdram/writea ;  // ../sdr_sdram.v(59)
  wire \u_sys_pll/clk0_buf ;  // al_ip/pll1.v(31)
  wire \ux_seg/add0/c11 ;
  wire \ux_seg/add0/c15 ;
  wire \ux_seg/add0/c19 ;
  wire \ux_seg/add0/c23 ;
  wire \ux_seg/add0/c3 ;
  wire \ux_seg/add0/c7 ;
  wire \ux_seg/add1/c11 ;
  wire \ux_seg/add1/c15 ;
  wire \ux_seg/add1/c3 ;
  wire \ux_seg/add1/c7 ;
  wire \ux_seg/mux11_b0_sel_is_0_o_neg ;
  wire \ux_seg/mux11_b1_sel_is_1_o_neg ;
  wire \ux_seg/mux11_b2_sel_is_2_o_neg ;
  wire \ux_seg/mux11_b3_sel_is_3_o_neg ;
  wire \ux_seg/mux5_b0_sel_is_2_o ;
  wire \ux_seg/n12_lutinv ;
  wire \ux_seg/n1_lutinv ;

  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S67"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A0_u_sdram/reg3_b0_DO  (
    .ce(1'b1),
    .do({open_n0,open_n1,open_n2,\u_sdram/ISA [0]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S68"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A10_u_sdram/reg3_b10_DO  (
    .ce(1'b1),
    .do({open_n16,open_n17,open_n18,\u_sdram/ISA [10]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S66"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A1_u_sdram/reg3_b1_DO  (
    .ce(1'b1),
    .do({open_n32,open_n33,open_n34,\u_sdram/ISA [1]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S65"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A2_u_sdram/reg3_b2_DO  (
    .ce(1'b1),
    .do({open_n48,open_n49,open_n50,\u_sdram/ISA [2]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S64"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A3_u_sdram/reg3_b3_DO  (
    .ce(1'b1),
    .do({open_n64,open_n65,open_n66,\u_sdram/ISA [3]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S28"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A4_u_sdram/reg3_b4_DO  (
    .ce(1'b1),
    .do({open_n80,open_n81,open_n82,\u_sdram/ISA [4]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S27"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A5_u_sdram/reg3_b5_DO  (
    .ce(1'b1),
    .do({open_n96,open_n97,open_n98,\u_sdram/ISA [5]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S26"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A6_u_sdram/reg3_b6_DO  (
    .ce(1'b1),
    .do({open_n112,open_n113,open_n114,\u_sdram/ISA [6]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S25"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A7_u_sdram/reg3_b7_DO  (
    .ce(1'b1),
    .do({open_n128,open_n129,open_n130,\u_sdram/ISA [7]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S24"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A8_u_sdram/reg3_b8_DO  (
    .ce(1'b1),
    .do({open_n144,open_n145,open_n146,\u_sdram/ISA [8]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S23"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_A9_u_sdram/reg3_b9_DO  (
    .ce(1'b1),
    .do({open_n160,open_n161,open_n162,\u_sdram/ISA [9]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S69"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_BA0_u_sdram/reg0_b0_DO  (
    .ce(1'b1),
    .do({open_n176,open_n177,open_n178,\u_sdram/IBA [0]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S70"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_BA1_u_sdram/reg0_b1_DO  (
    .ce(1'b1),
    .do({open_n192,open_n193,open_n194,\u_sdram/IBA [1]}),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S20"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_CASN_u_sdram/CAS_N_reg_DO  (
    .ce(1'b1),
    .do({open_n208,open_n209,open_n210,\u_sdram/ICAS_N }),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.LOCATION("S18"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_CKE (
    .do({open_n225,open_n226,open_n227,1'b1}));  // al_ip/SDRAM.v(29)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S73"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("DDRX1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    S64_CK_ODDR_0_DO (
    .do({open_n243,open_n244,2'b10}),
    .osclk(sd_clk_int),
    .rst(1'b0));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(99)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S22"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_CSN_u_sdram/CS_N_reg_DO  (
    .ce(1'b1),
    .do({open_n257,open_n258,open_n259,\u_sdram/ICS_N }),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.LOCATION("S14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_DM0 (
    .do({open_n274,open_n275,open_n276,1'b0}));  // al_ip/SDRAM.v(29)
  EG_PHY_PAD #(
    //.LOCATION("S76"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_DM1 (
    .do({open_n292,open_n293,open_n294,1'b0}));  // al_ip/SDRAM.v(29)
  EG_PHY_PAD #(
    //.LOCATION("S29"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_DM2 (
    .do({open_n310,open_n311,open_n312,1'b0}));  // al_ip/SDRAM.v(29)
  EG_PHY_PAD #(
    //.LOCATION("S61"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_DM3 (
    .do({open_n328,open_n329,open_n330,1'b0}));  // al_ip/SDRAM.v(29)
  EG_PHY_PAD #(
    //.LOCATION("S1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ0 (
    .do({open_n346,open_n347,open_n348,\u_sdram/DQOUT [0]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[0]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ1 (
    .do({open_n362,open_n363,open_n364,\u_sdram/DQOUT [1]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[1]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S82"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ10reg11_b10_IN (
    .ce(n5),
    .do({open_n377,open_n378,open_n379,\u_sdram/DQOUT [10]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n386,open_n387,open_n388,sd_dq_int[10]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S83"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ11reg11_b11_IN (
    .ce(n5),
    .do({open_n391,open_n392,open_n393,\u_sdram/DQOUT [11]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n400,open_n401,open_n402,sd_dq_int[11]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S84"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ12reg11_b12_IN (
    .ce(n5),
    .do({open_n405,open_n406,open_n407,\u_sdram/DQOUT [12]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n414,open_n415,open_n416,sd_dq_int[12]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S85"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ13reg11_b13_IN (
    .ce(n5),
    .do({open_n419,open_n420,open_n421,\u_sdram/DQOUT [13]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n428,open_n429,open_n430,sd_dq_int[13]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S88"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ14reg11_b14_IN (
    .ce(n5),
    .do({open_n433,open_n434,open_n435,\u_sdram/DQOUT [14]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n442,open_n443,open_n444,sd_dq_int[14]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S89"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ15reg11_b15_IN (
    .ce(n5),
    .do({open_n447,open_n448,open_n449,\u_sdram/DQOUT [15]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n456,open_n457,open_n458,sd_dq_int[15]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S42"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ16reg11_b16_IN (
    .ce(n5),
    .do({open_n461,open_n462,open_n463,\u_sdram/DQOUT [0]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n470,open_n471,open_n472,sd_dq_int[16]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S41"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ17reg11_b17_IN (
    .ce(n5),
    .do({open_n475,open_n476,open_n477,\u_sdram/DQOUT [1]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n484,open_n485,open_n486,sd_dq_int[17]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S38"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ18reg11_b18_IN (
    .ce(n5),
    .do({open_n489,open_n490,open_n491,\u_sdram/DQOUT [10]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n498,open_n499,open_n500,sd_dq_int[18]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S37"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ19reg11_b19_IN (
    .ce(n5),
    .do({open_n503,open_n504,open_n505,\u_sdram/DQOUT [11]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n512,open_n513,open_n514,sd_dq_int[19]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ2 (
    .do({open_n518,open_n519,open_n520,\u_sdram/DQOUT [10]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[2]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S36"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ20reg11_b20_IN (
    .ce(n5),
    .do({open_n533,open_n534,open_n535,\u_sdram/DQOUT [12]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n542,open_n543,open_n544,sd_dq_int[20]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S35"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ21reg11_b21_IN (
    .ce(n5),
    .do({open_n547,open_n548,open_n549,\u_sdram/DQOUT [13]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n556,open_n557,open_n558,sd_dq_int[21]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S32"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ22reg11_b22_IN (
    .ce(n5),
    .do({open_n561,open_n562,open_n563,\u_sdram/DQOUT [14]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n570,open_n571,open_n572,sd_dq_int[22]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S31"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ23reg11_b23_IN (
    .ce(n5),
    .do({open_n575,open_n576,open_n577,\u_sdram/DQOUT [15]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n584,open_n585,open_n586,sd_dq_int[23]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S59"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ24reg11_b24_IN (
    .ce(n5),
    .do({open_n589,open_n590,open_n591,\u_sdram/DQOUT [0]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n598,open_n599,open_n600,sd_dq_int[24]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S58"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ25reg11_b25_IN (
    .ce(n5),
    .do({open_n603,open_n604,open_n605,\u_sdram/DQOUT [1]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n612,open_n613,open_n614,sd_dq_int[25]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S55"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ26reg11_b26_IN (
    .ce(n5),
    .do({open_n617,open_n618,open_n619,\u_sdram/DQOUT [10]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n626,open_n627,open_n628,sd_dq_int[26]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S54"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ27reg11_b27_IN (
    .ce(n5),
    .do({open_n631,open_n632,open_n633,\u_sdram/DQOUT [11]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n640,open_n641,open_n642,sd_dq_int[27]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S53"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ28reg11_b28_IN (
    .ce(n5),
    .do({open_n645,open_n646,open_n647,\u_sdram/DQOUT [12]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n654,open_n655,open_n656,sd_dq_int[28]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S52"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ29reg11_b29_IN (
    .ce(n5),
    .do({open_n659,open_n660,open_n661,\u_sdram/DQOUT [13]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n668,open_n669,open_n670,sd_dq_int[29]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ3 (
    .do({open_n674,open_n675,open_n676,\u_sdram/DQOUT [11]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[3]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S49"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ30reg11_b30_IN (
    .ce(n5),
    .do({open_n689,open_n690,open_n691,\u_sdram/DQOUT [14]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n698,open_n699,open_n700,sd_dq_int[30]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S48"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ31reg11_b31_IN (
    .ce(n5),
    .do({open_n703,open_n704,open_n705,\u_sdram/DQOUT [15]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n712,open_n713,open_n714,sd_dq_int[31]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ4 (
    .do({open_n718,open_n719,open_n720,\u_sdram/DQOUT [12]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[4]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ5 (
    .do({open_n734,open_n735,open_n736,\u_sdram/DQOUT [13]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[5]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ6 (
    .do({open_n750,open_n751,open_n752,\u_sdram/DQOUT [14]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[6]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.LOCATION("S12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ7 (
    .do({open_n766,open_n767,open_n768,\u_sdram/DQOUT [15]}),
    .ts(\u_sdram/oe ),
    .di(SD_DQ[7]));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S78"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ8reg11_b8_IN (
    .ce(n5),
    .do({open_n781,open_n782,open_n783,\u_sdram/DQOUT [0]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n790,open_n791,open_n792,sd_dq_int[8]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S79"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("INV"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    S64_DQ9reg11_b9_IN (
    .ce(n5),
    .do({open_n795,open_n796,open_n797,\u_sdram/DQOUT [1]}),
    .ipclk(clk_200m),
    .ts(\u_sdram/oe ),
    .diq({open_n804,open_n805,open_n806,sd_dq_int[9]}));  // ../sdr_sdram.v(90)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S21"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_RASN_u_sdram/RAS_N_reg_DO  (
    .ce(1'b1),
    .do({open_n809,open_n810,open_n811,\u_sdram/IRAS_N }),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("S19"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
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
    \S64_WEN_u_sdram/WE_N_reg_DO  (
    .ce(1'b1),
    .do({open_n825,open_n826,open_n827,\u_sdram/IWE_N }),
    .osclk(clk_200m));  // ../sdr_sdram.v(88)
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u231 (
    .ipad(CLKIN),
    .di(CLKIN_pad));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(2)
  EG_PHY_PAD #(
    //.LOCATION("H14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u232 (
    .ipad(rst_n),
    .di(rst_n_pad));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(3)
  EG_PHY_PAD #(
    //.LOCATION("A2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u233 (
    .do({open_n876,open_n877,open_n878,1'b1}),
    .opad(sm_seg[7]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("B2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u234 (
    .do({open_n893,open_n894,open_n895,sm_seg_pad[6]}),
    .opad(sm_seg[6]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("D3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u235 (
    .do({open_n910,open_n911,open_n912,sm_seg_pad[5]}),
    .opad(sm_seg[5]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("F5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u236 (
    .do({open_n927,open_n928,open_n929,sm_seg_pad[4]}),
    .opad(sm_seg[4]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("E4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u237 (
    .do({open_n944,open_n945,open_n946,sm_seg_pad[3]}),
    .opad(sm_seg[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("F4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u238 (
    .do({open_n961,open_n962,open_n963,sm_seg_pad[2]}),
    .opad(sm_seg[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("B3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u239 (
    .do({open_n978,open_n979,open_n980,sm_seg_pad[1]}),
    .opad(sm_seg[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("E3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u240 (
    .do({open_n995,open_n996,open_n997,sm_seg_pad[0]}),
    .opad(sm_seg[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(6)
  EG_PHY_PAD #(
    //.LOCATION("M3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u241 (
    .do({open_n1012,open_n1013,open_n1014,test_error_led_pad}),
    .opad(test_error_led));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(5)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("~A*~C*~D*~B+~A*C*D*~B+~A*~C*~D*B+~A*C*D*B"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("A*~C*~D*~B+A*C*D*~B+A*~C*~D*B+A*C*D*B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0101000000000101),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b1010000000001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u263|reg10_b4  (
    .a({datacnt[0],n64}),
    .b({open_n1028,n65[4]}),
    .c({datacnt[4],datacnt[4]}),
    .ce(n82),
    .clk(clk_200m),
    .d({sd_dq_int[20],rd_state[0]}),
    .e({sd_dq_int[16],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u263_o,open_n1043}),
    .q({open_n1047,datacnt[4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("D*~C*~B*~A+D*C*B*~A"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("D*~C*~B*A+D*C*B*A"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0100000100000000),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b1000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u264|reg10_b3  (
    .a({datacnt[3],n64}),
    .b({datacnt[7],n65[3]}),
    .c({sd_dq_int[15],datacnt[3]}),
    .ce(n82),
    .clk(clk_200m),
    .d({_al_u263_o,rd_state[0]}),
    .e({sd_dq_int[27],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u264_o,open_n1062}),
    .q({open_n1066,datacnt[3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+A*~(B)*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("~D*~B*~C*~A+~D*B*C*~A+~D*~B*~C*A+~D*B*C*A"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+A*~(B)*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("D*~B*~C*~A+D*B*C*~A+D*~B*~C*A+D*B*C*A"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0000000011000011),
    .INIT_LUTG0(16'b0000000010111000),
    .INIT_LUTG1(16'b1100001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u265|reg10_b7  (
    .a({open_n1067,n65[7]}),
    .b({sd_dq_int[23],n64}),
    .c({datacnt[7],datacnt[7]}),
    .ce(n82),
    .clk(clk_200m),
    .d({datacnt[4],rd_state[0]}),
    .e({sd_dq_int[12],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u265_o,open_n1082}),
    .q({open_n1086,datacnt[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A)"),
    //.LUTF1("0"),
    //.LUTG0("(C*~A)"),
    //.LUTG1("~A*C*D*~B+A*C*D*~B+~A*C*D*B+A*C*D*B"),
    .INIT_LUTF0(16'b0101000001010000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0101000001010000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u267|_al_u560  (
    .a({open_n1087,_al_u542_o}),
    .c({_al_u266_o,rd_addr[12]}),
    .d({_al_u265_o,open_n1092}),
    .e({_al_u264_o,open_n1093}),
    .f({_al_u267_o,_al_u560_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("(~A*~B)"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D"),
    //.LUTG1("(~A*~B)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111111110),
    .INIT_LUTF1(16'b0001000100010001),
    .INIT_LUTG0(16'b0111111111111111),
    .INIT_LUTG1(16'b0001000100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u270|reg11_b5  (
    .a({_al_u269_o,sd_dq_int[5]}),
    .b({_al_u268_o,sd_dq_int[21]}),
    .c({open_n1114,sd_dq_int[29]}),
    .ce(n5),
    .clk(clk_200m),
    .d({open_n1115,datacnt[5]}),
    .e({open_n1116,sd_dq_int[13]}),
    .mi({open_n1118,SD_DQ[5]}),
    .f({_al_u270_o,_al_u269_o}),
    .q({open_n1134,sd_dq_int[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("~D*~B*~C*~A+D*~B*C*~A+~D*~B*~C*A+D*~B*C*A"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("~D*B*~C*~A+D*B*C*~A+~D*B*~C*A+D*B*C*A"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0011000000000011),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b1100000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u271|reg10_b2  (
    .a({open_n1135,n64}),
    .b({datacnt[0],n65[2]}),
    .c({sd_dq_int[26],datacnt[2]}),
    .ce(n82),
    .clk(clk_200m),
    .d({datacnt[2],rd_state[0]}),
    .e({sd_dq_int[8],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u271_o,open_n1150}),
    .q({open_n1154,datacnt[2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+A*~D*C*B+~A*D*C*B+A*D*C*B"),
    //.LUTF1("~A*C*~B*D+~A*C*B*D"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+~A*~D*C*B+A*~D*C*B+~A*D*C*B"),
    //.LUTG1("0"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111110101010),
    .INIT_LUTF1(16'b0101000000000000),
    .INIT_LUTG0(16'b0101010111111111),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u275|reg11_b7  (
    .a({_al_u274_o,sd_dq_int[7]}),
    .c({_al_u272_o,open_n1157}),
    .ce(n5),
    .clk(clk_200m),
    .d({_al_u271_o,datacnt[7]}),
    .e({_al_u273_o,sd_dq_int[31]}),
    .mi({open_n1159,SD_DQ[7]}),
    .f({_al_u275_o,_al_u274_o}),
    .q({open_n1175,sd_dq_int[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("A*~D*~C*~B+A*D*C*~B"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("A*~D*~C*B+A*D*C*B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0010000000000010),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b1000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u277|reg10_b6  (
    .a({_al_u276_o,n64}),
    .b({datacnt[3],n65[6]}),
    .c({datacnt[6],datacnt[6]}),
    .ce(n82),
    .clk(clk_200m),
    .d({sd_dq_int[14],rd_state[0]}),
    .e({sd_dq_int[19],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u277_o,open_n1190}),
    .q({open_n1194,datacnt[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(B@D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0011001111001100),
    .MODE("LOGIC"))
    \_al_u279|_al_u456  (
    .a({open_n1195,\ux_seg/cnt_w [0]}),
    .b({datacnt[3],\ux_seg/cnt_w [1]}),
    .c({open_n1196,\ux_seg/cnt_w [10]}),
    .d({sd_dq_int[11],\ux_seg/cnt_w [11]}),
    .f({\neq0/diff [11],_al_u456_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~D)"),
    //.LUT1("~(D*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000010101010),
    .INIT_LUT1(16'b0101010111111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u304|ux_seg/reg4_b17  (
    .a({\ux_seg/cnt_w [16],\ux_seg/n13 [17]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/cnt_w [17],\ux_seg/n12_lutinv }),
    .sr(rst_n_pad),
    .f({\ux_seg/mux11_b3_sel_is_3_o_neg ,open_n1234}),
    .q({open_n1238,\ux_seg/cnt_w [17]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A"),
    //.LUTG0("~A*~B*~C*~D+~A*B*~C*~D+~A*~B*~C*D+~A*B*~C*D"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000010100000101),
    .INIT_LUTG0(16'b0000010100000101),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u324|_al_u323  (
    .a({sd_state[0],sd_state[1]}),
    .c(2'b00),
    .e(sd_state[1:0]),
    .f({n80,n81}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("~(B*~D)"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    //.LUTG1("~(B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1111111100110011),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b1111111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u335|ux_seg/reg4_b16  (
    .b({\ux_seg/cnt_w [17],open_n1267}),
    .clk(CLKIN_pad),
    .d({\ux_seg/cnt_w [16],\ux_seg/n12_lutinv }),
    .e({open_n1271,\ux_seg/n13 [16]}),
    .sr(rst_n_pad),
    .f({\ux_seg/mux11_b2_sel_is_2_o_neg ,open_n1286}),
    .q({open_n1290,\ux_seg/cnt_w [16]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*A)"),
    //.LUTF1("~(~C*A)"),
    //.LUTG0("(~B*A)"),
    //.LUTG1("~(~C*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000100010),
    .INIT_LUTF1(16'b1111010111110101),
    .INIT_LUTG0(16'b0010001000100010),
    .INIT_LUTG1(16'b1111010111110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u336|ux_seg/reg2_b0  (
    .a({\ux_seg/cnt_w [16],\u2_al_u0/n29 [3]}),
    .b({open_n1291,_al_u626_o}),
    .c({\ux_seg/cnt_w [17],open_n1292}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .f({\ux_seg/mux11_b1_sel_is_1_o_neg ,open_n1312}),
    .q({open_n1316,\ux_seg/sm_bit3_num [0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~B*~C*~D+~A*~B*C*~D+A*B*C*~D)"),
    //.LUT1("~(~C*~B)"),
    .INIT_LUT0(16'b0000000010010010),
    .INIT_LUT1(16'b1111110011111100),
    .MODE("LOGIC"))
    \_al_u337|ux_seg/mux12_b3_rom0  (
    .a({open_n1317,\ux_seg/sm_seg_num [0]}),
    .b({\ux_seg/cnt_w [16],\ux_seg/sm_seg_num [1]}),
    .c({\ux_seg/cnt_w [17],\ux_seg/sm_seg_num [2]}),
    .d({open_n1320,\ux_seg/sm_seg_num [3]}),
    .f({\ux_seg/mux11_b0_sel_is_0_o_neg ,sm_seg_pad[3]}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~B*~C*~D+A*~B*~C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D)"),
    //.LUT1("(~D*~A*B*~C)"),
    .INIT_LUT0(16'b1111110010000011),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u338|ux_seg/mux12_b6_rom0  (
    .a({\ux_seg/sm_seg_num [2],\ux_seg/sm_seg_num [0]}),
    .b({\ux_seg/sm_seg_num [1],\ux_seg/sm_seg_num [1]}),
    .c({\ux_seg/sm_seg_num [0],\ux_seg/sm_seg_num [2]}),
    .d({\ux_seg/sm_seg_num [3],\ux_seg/sm_seg_num [3]}),
    .f({sm_seg_pad[2],sm_seg_pad[6]}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("0"),
    //.LUTG0("A*~B*~C*~D+A*~B*C*~D+A*~B*~C*D+A*~B*C*D"),
    //.LUTG1("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111100000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0010001000100010),
    .INIT_LUTG1(16'b1100110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u345|reg9_b4  (
    .a({open_n1359,n34[4]}),
    .b({_al_u344_o,wr_state[0]}),
    .ce(n81),
    .clk(clk_200m),
    .d({open_n1362,fifo_q[4]}),
    .e({n81,wr_state[1]}),
    .sr(rst_n_pad),
    .f({sel8_b0_sel_is_3_o,open_n1377}),
    .q({open_n1381,fifo_q[4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)"),
    //.LUT1("(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B)"),
    .INIT_LUT0(16'b1111101001010000),
    .INIT_LUT1(16'b1110111000100010),
    .MODE("LOGIC"))
    \_al_u363|_al_u516  (
    .a({sd_dataout[5],_al_u512_o}),
    .b({\u2_al_u0/n0_lutinv ,open_n1382}),
    .c({open_n1383,\u2_al_u0/n8 [1]}),
    .d({\u2_al_u0/n2 [0],\u2_al_u0/n6 }),
    .f({\u2_al_u0/n6 ,\u2_al_u0/n11 }));
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~D*C*B+A*~D*C*B+~A*D*C*B+A*D*C*B"),
    //.LUTF1("(C*B)"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+~A*~D*C*B+A*~D*C*B+~A*D*C*B+A*D*C*B"),
    //.LUTG1("(C*B)"),
    .INIT_LUTF0(16'b1100000011000000),
    .INIT_LUTF1(16'b1100000011000000),
    .INIT_LUTG0(16'b1100111111001111),
    .INIT_LUTG1(16'b1100000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u366|_al_u364  (
    .b({\u2_al_u0/n1 ,\u2_al_u0/n2 [1]}),
    .c({\u2_al_u0/n0_lutinv ,\u2_al_u0/n0_lutinv }),
    .e({open_n1410,sd_dataout[6]}),
    .f({\u2_al_u0/n3 ,\u2_al_u0/n5 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~0*D*C*B*A)"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG0("(~1*D*C*B*A)"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u372|_al_u567  (
    .a({rd_state[1],_al_u565_o}),
    .b({open_n1431,_al_u566_o}),
    .c({open_n1432,burst_cnt1[0]}),
    .d({open_n1435,burst_cnt1[1]}),
    .e({rd_state[0],rd_state[0]}),
    .f({_al_u372_o,_al_u567_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(0*B)*~(~(~D*~C)*A))"),
    //.LUT1("(~(1*B)*~(~(~A*~C)*D))"),
    .INIT_LUT0(16'b0101010101011111),
    .INIT_LUT1(16'b0000000100110011),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u377 (
    .a({sd_addr[8],_al_u374_o}),
    .b({_al_u375_o,_al_u375_o}),
    .c({_al_u376_o,_al_u376_o}),
    .d({_al_u374_o,sd_addr[8]}),
    .mi({open_n1468,wr_addr[8]}),
    .fx({open_n1473,_al_u377_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*A*D)"),
    //.LUT1("(~C*~A*~B)"),
    .INIT_LUT0(16'b0000001000000000),
    .INIT_LUT1(16'b0000000100000001),
    .MODE("LOGIC"))
    \_al_u378|_al_u432  (
    .a({rd_state[0],sd_state[1]}),
    .b({sd_state[0],1'b0}),
    .c({rd_state[1],rd_addr[0]}),
    .d({open_n1478,_al_u378_o}),
    .f({_al_u378_o,_al_u432_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~A*B)"),
    //.LUTF1("(B*~(~C*~A))"),
    //.LUTG0("(~C*~A*B)"),
    //.LUTG1("(B*~(~C*~A))"),
    .INIT_LUTF0(16'b0000010000000100),
    .INIT_LUTF1(16'b1100100011001000),
    .INIT_LUTG0(16'b0000010000000100),
    .INIT_LUTG1(16'b1100100011001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u380|_al_u375  (
    .a({wr_state[0],wr_state[0]}),
    .b({sd_state[0],sd_state[0]}),
    .c({wr_state[1],wr_state[1]}),
    .f({_al_u380_o,_al_u375_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*((0*~C)*~(D)*~(A)+(0*~C)*D*~(A)+~((0*~C))*D*A+(0*~C)*D*A))"),
    //.LUTF1("0"),
    //.LUTG0("(B*((1*~C)*~(D)*~(A)+(1*~C)*D*~(A)+~((1*~C))*D*A+(1*~C)*D*A))"),
    //.LUTG1("~A*~B*~C*~D+~A*~B*C*~D+~A*~B*~C*D+~A*~B*C*D"),
    .INIT_LUTF0(16'b1000100000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000110000000100),
    .INIT_LUTG1(16'b0001000100010001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u384|_al_u385  (
    .a({wr_state[0],sd_state[0]}),
    .b({wr_state[1],_al_u381_o}),
    .c({open_n1523,reset_step[1]}),
    .d({open_n1526,_al_u384_o}),
    .e({wr_addr[4],sd_cmd_ack}),
    .f({_al_u384_o,_al_u385_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~0*~(~D*~A*~(~C*B)))"),
    //.LUT1("(~1*~(~D*~A*~(~B*C)))"),
    .INIT_LUT0(16'b1111111110101110),
    .INIT_LUT1(16'b0000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u386 (
    .a({_al_u375_o,_al_u375_o}),
    .b({sd_state[0],_al_u376_o}),
    .c({_al_u376_o,sd_state[0]}),
    .d({sd_state[1],sd_state[1]}),
    .mi({open_n1559,1'b0}),
    .fx({open_n1564,_al_u386_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~A))"),
    //.LUTF1("(C*~B)"),
    //.LUTG0("(~B*~(C*~A))"),
    //.LUTG1("(C*~B)"),
    .INIT_LUTF0(16'b0010001100100011),
    .INIT_LUTF1(16'b0011000000110000),
    .INIT_LUTG0(16'b0010001100100011),
    .INIT_LUTG1(16'b0011000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u392|_al_u374  (
    .a({open_n1567,reset_step[1]}),
    .b({reset_step[1],sd_state[0]}),
    .c({sd_cmd_ack,sd_cmd_ack}),
    .f({_al_u392_o,_al_u374_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(~D*C*B)*~(0*A))"),
    //.LUT1("(~(~D*C*A)*~(1*B))"),
    .INIT_LUT0(16'b1111111100111111),
    .INIT_LUT1(16'b0011001100010011),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u393 (
    .a({_al_u392_o,_al_u375_o}),
    .b({_al_u375_o,_al_u392_o}),
    .c({reset_step[0],reset_step[0]}),
    .d({sd_state[0],sd_state[0]}),
    .mi({open_n1606,wr_addr[11]}),
    .fx({open_n1611,_al_u393_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(~D*C*B)*~(0*A))"),
    //.LUT1("(~(~C*D*B)*~(1*A))"),
    .INIT_LUT0(16'b1111111100111111),
    .INIT_LUT1(16'b0101000101010101),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u396 (
    .a({_al_u375_o,_al_u375_o}),
    .b({_al_u392_o,_al_u392_o}),
    .c({sd_state[0],reset_step[0]}),
    .d({reset_step[0],sd_state[0]}),
    .mi({open_n1626,wr_addr[10]}),
    .fx({open_n1631,_al_u396_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(A*D))"),
    //.LUTF1("~A*D*~C*~B+~A*D*~C*B"),
    //.LUTG0("(~C*~(A*D))"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0000010100001111),
    .INIT_LUTF1(16'b0000010100000000),
    .INIT_LUTG0(16'b0000010100001111),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u399|_al_u569  (
    .a({sd_state[0],sd_state[1]}),
    .c({rd_state[1],1'b0}),
    .d(sd_state[1:0]),
    .e({rd_state[0],open_n1638}),
    .f({_al_u399_o,_al_u569_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D)"),
    //.LUT1("(~B*~(C*~(A*D)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100010010101010),
    .INIT_LUT1(16'b0010001100000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u400|reg0_b0  (
    .a(reset_step),
    .b({sd_state[0],reset_step[1]}),
    .c({sd_cmd_ack,open_n1659}),
    .ce(n80),
    .clk(clk_200m),
    .d({reset_step[0],sd_cmd_ack}),
    .sr(rst_n_pad),
    .f({_al_u400_o,open_n1672}),
    .q({open_n1676,reset_step[0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~0*~(~A*~(~D*~C*~B)))"),
    //.LUT1("(~1*~(~D*~(~A*~C*~B)))"),
    .INIT_LUT0(16'b1010101010101011),
    .INIT_LUT1(16'b0000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u401 (
    .a({sd_state[1],_al_u399_o}),
    .b({_al_u400_o,_al_u400_o}),
    .c({_al_u380_o,_al_u380_o}),
    .d({_al_u399_o,sd_state[1]}),
    .mi({open_n1689,1'b0}),
    .fx({open_n1694,_al_u401_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("0"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u404|_al_u381  (
    .a({_al_u381_o,open_n1697}),
    .c({open_n1700,1'b0}),
    .d({open_n1703,sd_state[1]}),
    .e({_al_u375_o,open_n1704}),
    .f({_al_u404_o,_al_u381_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("~B*A*~C*D+B*A*~C*D+~B*A*C*D+B*A*C*D"),
    //.LUTG0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101000001010),
    .INIT_LUTF1(16'b1010101000000000),
    .INIT_LUTG0(16'b0010101000001010),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u406|reg8_b7  (
    .a({_al_u399_o,rd_addr[7]}),
    .b({open_n1725,n53_lutinv}),
    .c({open_n1726,_al_u542_o}),
    .clk(clk_200m),
    .d({rd_addr[7],sd_state[1]}),
    .e({1'b0,_al_u594_o}),
    .sr(rst_n_pad),
    .f({_al_u406_o,open_n1742}),
    .q({open_n1746,rd_addr[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("B*~A*~C*D+B*~A*C*D"),
    //.LUTG0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    //.LUTG1("B*~A*~C*D+B*~A*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101000001010),
    .INIT_LUTF1(16'b0100010000000000),
    .INIT_LUTG0(16'b0010101000001010),
    .INIT_LUTG1(16'b0100010000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u408|reg8_b6  (
    .a({1'b0,rd_addr[6]}),
    .b({_al_u399_o,n53_lutinv}),
    .c({open_n1747,_al_u542_o}),
    .clk(clk_200m),
    .d({rd_addr[6],sd_state[1]}),
    .e({open_n1749,_al_u594_o}),
    .sr(rst_n_pad),
    .f({_al_u408_o,open_n1764}),
    .q({open_n1768,rd_addr[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("A*B*~C*~D"),
    //.LUTG0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    //.LUTG1("A*B*~C*~D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101000001010),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b0010101000001010),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u410|reg8_b5  (
    .a({sd_state[1],rd_addr[5]}),
    .b({_al_u378_o,n53_lutinv}),
    .c({1'b0,_al_u542_o}),
    .clk(clk_200m),
    .d({rd_addr[5],sd_state[1]}),
    .e({open_n1770,_al_u594_o}),
    .sr(rst_n_pad),
    .f({_al_u410_o,open_n1785}),
    .q({open_n1789,rd_addr[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("A*B*~C*~D"),
    //.LUTG0("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    //.LUTG1("A*B*~C*~D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101000001010),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b0010101000001010),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u412|reg8_b2  (
    .a({sd_state[1],rd_addr[2]}),
    .b({_al_u378_o,n53_lutinv}),
    .c({1'b0,_al_u542_o}),
    .clk(clk_200m),
    .d({rd_addr[2],sd_state[1]}),
    .e({open_n1791,_al_u594_o}),
    .sr(rst_n_pad),
    .f({_al_u412_o,open_n1806}),
    .q({open_n1810,rd_addr[2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUTF1("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A+~D*~B*C*~A+~D*B*C*~A+~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+~D*B*C*A"),
    //.LUTG0("(~B*(1*~((C*~A))*~(D)+1*(C*~A)*~(D)+~(1)*(C*~A)*D+1*(C*~A)*D))"),
    //.LUTG1("~D*~B*~C*~A+D*~B*~C*~A+D*B*~C*~A+~D*~B*C*~A+~D*~B*~C*A+D*~B*~C*A+D*B*~C*A+~D*~B*C*A"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0000111111111111),
    .INIT_LUTG0(16'b0001000000110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u414|reg7_b20  (
    .a({open_n1811,n35_lutinv}),
    .b({sd_state[1],_al_u522_o}),
    .c({wr_addr[20],n36[12]}),
    .clk(clk_200m),
    .d({_al_u375_o,_al_u523_o}),
    .e({rd_addr[20],wr_addr[20]}),
    .sr(rst_n_pad),
    .f({_al_u414_o,open_n1827}),
    .q({open_n1831,wr_addr[20]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUTF1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*B*~C*D+~A*~B*C*D+~A*B*C*D"),
    //.LUTG0("(~B*(1*~((C*~A))*~(D)+1*(C*~A)*~(D)+~(1)*(C*~A)*D+1*(C*~A)*D))"),
    //.LUTG1("~A*~B*~C*~D+A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*~B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0101010111111111),
    .INIT_LUTG0(16'b0001000000110011),
    .INIT_LUTG1(16'b0001000110111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u416|reg7_b19  (
    .a({_al_u375_o,n35_lutinv}),
    .b({rd_addr[19],_al_u522_o}),
    .c({open_n1832,n36[11]}),
    .clk(clk_200m),
    .d({wr_addr[19],_al_u523_o}),
    .e({sd_state[1],wr_addr[19]}),
    .sr(rst_n_pad),
    .f({_al_u416_o,open_n1848}),
    .q({open_n1852,wr_addr[19]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(D)*~(C)+~A*D*~(C)+~(~A)*D*C+~A*D*C)"),
    //.LUT1("~((B*D)*~(C)*~(A)+(B*D)*C*~(A)+~((B*D))*C*A+(B*D)*C*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000101011111010),
    .INIT_LUT1(16'b0001101101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u418|reg6_b18  (
    .a({_al_u375_o,sd_addr[18]}),
    .b({rd_addr[18],open_n1853}),
    .c({wr_addr[18],_al_u401_o}),
    .clk(clk_200m),
    .d({sd_state[1],_al_u418_o}),
    .sr(rst_n_pad),
    .f({_al_u418_o,open_n1867}),
    .q({open_n1871,sd_addr[18]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+~A*B*C*D"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    //.LUTG1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+A*~B*~C*D+A*B*~C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101010101010),
    .INIT_LUTF1(16'b0101111101011111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000101001011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u420|reg6_b17  (
    .a({_al_u375_o,sd_addr[17]}),
    .c({wr_addr[17],open_n1874}),
    .clk(clk_200m),
    .d({sd_state[1],_al_u420_o}),
    .e({rd_addr[17],_al_u401_o}),
    .sr(rst_n_pad),
    .f({_al_u420_o,open_n1890}),
    .q({open_n1894,sd_addr[17]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUTF1("~C*~A*~D*~B+C*~A*~D*~B+~C*A*~D*~B+~C*~A*D*~B+C*~A*D*~B+~C*A*D*~B+~C*~A*~D*B+C*~A*~D*B+~C*A*~D*B+~C*~A*D*B+C*~A*D*B+~C*A*D*B"),
    //.LUTG0("(~B*(1*~((C*~A))*~(D)+1*(C*~A)*~(D)+~(1)*(C*~A)*D+1*(C*~A)*D))"),
    //.LUTG1("~C*~A*~D*~B+C*~A*~D*~B+~C*A*~D*~B+C*A*~D*~B+~C*~A*~D*B+C*~A*~D*B+~C*A*~D*B+C*A*~D*B"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0101111101011111),
    .INIT_LUTG0(16'b0001000000110011),
    .INIT_LUTG1(16'b0000000011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u422|reg7_b16  (
    .a({sd_state[1],n35_lutinv}),
    .b({open_n1895,_al_u522_o}),
    .c({rd_addr[16],n36[8]}),
    .clk(clk_200m),
    .d({wr_addr[16],_al_u523_o}),
    .e({_al_u375_o,wr_addr[16]}),
    .sr(rst_n_pad),
    .f({_al_u422_o,open_n1911}),
    .q({open_n1915,wr_addr[16]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUTF1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*B*~C*D+~A*~B*C*D+~A*B*C*D"),
    //.LUTG0("(~B*(1*~((C*~A))*~(D)+1*(C*~A)*~(D)+~(1)*(C*~A)*D+1*(C*~A)*D))"),
    //.LUTG1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*B*~C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0101010111111111),
    .INIT_LUTG0(16'b0001000000110011),
    .INIT_LUTG1(16'b0000010110101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u424|reg7_b15  (
    .a({_al_u375_o,n35_lutinv}),
    .b({open_n1916,_al_u522_o}),
    .c({rd_addr[15],n36[7]}),
    .clk(clk_200m),
    .d({wr_addr[15],_al_u523_o}),
    .e({sd_state[1],wr_addr[15]}),
    .sr(rst_n_pad),
    .f({_al_u424_o,open_n1932}),
    .q({open_n1936,wr_addr[15]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUTF1("~C*~A*~B*~D+C*~A*~B*~D+~C*A*~B*~D+C*A*~B*~D+~C*~A*B*~D+C*~A*B*~D+~C*A*B*~D+C*A*B*~D+~C*~A*~B*D+~C*A*~B*D+~C*~A*B*D+~C*A*B*D"),
    //.LUTG0("(~B*(1*~((D*~A))*~(C)+1*(D*~A)*~(C)+~(1)*(D*~A)*C+1*(D*~A)*C))"),
    //.LUTG1("~C*~A*~B*~D+C*~A*~B*~D+C*A*~B*~D+~C*~A*B*~D+C*~A*B*~D+C*A*B*~D+~C*~A*~B*D+~C*~A*B*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0000111111111111),
    .INIT_LUTG0(16'b0001001100000011),
    .INIT_LUTG1(16'b0000010111110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u430|reg7_b12  (
    .a({sd_state[1],n35_lutinv}),
    .b({open_n1937,_al_u522_o}),
    .c({_al_u375_o,_al_u523_o}),
    .clk(clk_200m),
    .d({wr_addr[12],n36[4]}),
    .e({rd_addr[12],wr_addr[12]}),
    .sr(rst_n_pad),
    .f({_al_u430_o,open_n1953}),
    .q({open_n1957,wr_addr[12]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(D*C*B))"),
    //.LUT1("(~D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010101010101010),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u439|reg1_b8  (
    .a({burst_cnt[5],n29[8]}),
    .b({burst_cnt[6],_al_u439_o}),
    .c({burst_cnt[7],_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .d({burst_cnt[8],_al_u441_o}),
    .sr(rst_n_pad),
    .f({_al_u439_o,open_n1970}),
    .q({open_n1974,burst_cnt[8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+~A*B*C*D"),
    //.LUTG1("~B*A*~C*D+B*A*~C*D+~B*A*C*D+B*A*C*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0101111111111111),
    .INIT_LUTG1(16'b1010101000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u440|reg1_b3  (
    .a({burst_cnt[2],_al_u439_o}),
    .c({open_n1977,_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .d({burst_cnt[3],_al_u441_o}),
    .e({burst_cnt[1],n29[3]}),
    .sr(rst_n_pad),
    .f({_al_u440_o,open_n1992}),
    .q({open_n1996,burst_cnt[3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(B*D)"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D"),
    //.LUTG1("(B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1100110000000000),
    .INIT_LUTG0(16'b0011111111111111),
    .INIT_LUTG1(16'b1100110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u441|reg1_b6  (
    .b({burst_cnt[4],_al_u439_o}),
    .c({open_n1999,_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .d({burst_cnt[0],_al_u441_o}),
    .e({open_n2000,n29[6]}),
    .sr(rst_n_pad),
    .f({_al_u441_o,open_n2015}),
    .q({open_n2019,burst_cnt[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(0*A*C*B*D)"),
    //.LUTF1("0"),
    //.LUTG0("(1*A*C*B*D)"),
    //.LUTG1("A*B*C*~D+A*B*C*D"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u453|_al_u454  (
    .a({\ux_seg/cnt_w [13],\ux_seg/cnt_w [4]}),
    .b({\ux_seg/cnt_w [12],\ux_seg/cnt_w [2]}),
    .c({\ux_seg/cnt_w [14],\ux_seg/cnt_w [3]}),
    .d({open_n2022,_al_u453_o}),
    .e({\ux_seg/cnt_w [15],\ux_seg/cnt_w [5]}),
    .f({_al_u453_o,_al_u454_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*C*B*A)"),
    //.LUTF1("0"),
    //.LUTG0("(1*D*C*B*A)"),
    //.LUTG1("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u457|_al_u455  (
    .a({open_n2043,_al_u454_o}),
    .b({open_n2044,\ux_seg/cnt_w [6]}),
    .c({\ux_seg/mux11_b3_sel_is_3_o_neg ,\ux_seg/cnt_w [7]}),
    .d({_al_u455_o,\ux_seg/cnt_w [8]}),
    .e({_al_u456_o,\ux_seg/cnt_w [9]}),
    .f({\ux_seg/n12_lutinv ,_al_u455_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("~A*~D*B*C+~A*D*B*C"),
    //.LUTG0("~A*B*~C*~D+~A*B*C*~D"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0100000001000000),
    .INIT_LUTG0(16'b0000000001000100),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u476|_al_u478  (
    .a({\ux_seg/cnt [14],\ux_seg/cnt [10]}),
    .b({\ux_seg/cnt [16],\ux_seg/cnt [11]}),
    .c({\ux_seg/cnt [17],open_n2067}),
    .d({open_n2070,\ux_seg/cnt [13]}),
    .e({\ux_seg/cnt [15],\ux_seg/cnt [12]}),
    .f({_al_u476_o,_al_u478_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(0*~D*~C*B*A)"),
    //.LUT1("(1*~D*~C*B*A)"),
    .INIT_LUT0(16'b0000000000000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u477 (
    .a({_al_u476_o,_al_u476_o}),
    .b({\ux_seg/cnt [18],\ux_seg/cnt [18]}),
    .c({\ux_seg/cnt [19],\ux_seg/cnt [19]}),
    .d({\ux_seg/cnt [2],\ux_seg/cnt [2]}),
    .mi({open_n2103,\ux_seg/cnt [20]}),
    .fx({open_n2108,_al_u477_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(0*D*~C*B*A)"),
    //.LUTF1("B*D*~C*~A+B*D*~C*A"),
    //.LUTG0("(1*D*~C*B*A)"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000100000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u479|_al_u482  (
    .a({open_n2111,_al_u479_o}),
    .b({_al_u477_o,_al_u481_o}),
    .c({\ux_seg/cnt [0],\ux_seg/cnt [7]}),
    .d({_al_u478_o,\ux_seg/cnt [8]}),
    .e({\ux_seg/cnt [1],\ux_seg/cnt [9]}),
    .f({_al_u479_o,\ux_seg/n1_lutinv }));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A+~D*~B*C*~A+D*~B*C*~A+~D*B*C*~A+D*B*C*~A"),
    //.LUTG1("~C*~B*A*~D+C*~B*A*~D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0101010101010101),
    .INIT_LUTG1(16'b0000000000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u480|ux_seg/reg6_b24  (
    .a({\ux_seg/cnt [23],\ux_seg/n1_lutinv }),
    .b({\ux_seg/cnt [22],open_n2134}),
    .clk(CLKIN_pad),
    .d({\ux_seg/cnt [24],open_n2138}),
    .e({\ux_seg/cnt [21],\ux_seg/n2 [24]}),
    .sr(rst_n_pad),
    .f({_al_u480_o,open_n2153}),
    .q({open_n2157,\ux_seg/cnt [24]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(~0*~D*~C*~B*A)"),
    //.LUT1("(~1*~D*~C*~B*A)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u481 (
    .a({_al_u480_o,_al_u480_o}),
    .b({\ux_seg/cnt [3],\ux_seg/cnt [3]}),
    .c({\ux_seg/cnt [4],\ux_seg/cnt [4]}),
    .d({\ux_seg/cnt [5],\ux_seg/cnt [5]}),
    .mi({open_n2170,\ux_seg/cnt [6]}),
    .fx({open_n2175,_al_u481_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("0"),
    //.LUTG0("0"),
    //.LUTG1("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    .INIT_LUTF0(16'b1100110011001100),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b1100110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u510|_al_u579  (
    .b({wr_state[0],wr_state[0]}),
    .e({sd_cmd_ack,sd_cmd_ack}),
    .f({_al_u510_o,_al_u579_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(~B*~A)))"),
    //.LUT1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .INIT_LUT0(16'b0000000000011111),
    .INIT_LUT1(16'b1100110011110000),
    .MODE("LOGIC"))
    \_al_u513|_al_u512  (
    .a({open_n2206,\u2_al_u0/n6 }),
    .b({\u2_al_u0/n5 ,sd_dataout[4]}),
    .c({\u2_al_u0/n8 [2],\u2_al_u0/n5 }),
    .d({_al_u512_o,\u2_al_u0/n4 }),
    .f({\u2_al_u0/n10 ,_al_u512_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B)"),
    //.LUT1("(~B*C)"),
    .INIT_LUT0(16'b0000110000001100),
    .INIT_LUT1(16'b0011000000110000),
    .MODE("LOGIC"))
    \_al_u514|_al_u609  (
    .b({_al_u512_o,\u2_al_u0/n14 [3]}),
    .c({\u2_al_u0/n8 [3],_al_u607_o}),
    .f({\u2_al_u0/n9 ,\u2_al_u0/n15 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A)*~(B)+D*A*~(B)+~(D)*A*B+D*A*B)"),
    //.LUT1("(C*~(A)*~(D)+C*A*~(D)+~(C)*A*D+C*A*D)"),
    .INIT_LUT0(16'b1011101110001000),
    .INIT_LUT1(16'b1010101011110000),
    .MODE("LOGIC"))
    \_al_u515|_al_u610  (
    .a({sd_dataout[4],\u2_al_u0/n12 }),
    .b({open_n2251,_al_u607_o}),
    .c({\u2_al_u0/n8 [0],open_n2252}),
    .d({_al_u512_o,\u2_al_u0/n14 [1]}),
    .f({\u2_al_u0/n12 ,\u2_al_u0/n17 [1]}));
  EG_PHY_MSLICE #(
    //.LUT0("~((D*B)*~(C)*~(A)+(D*B)*C*~(A)+~((D*B))*C*A+(D*B)*C*A)"),
    //.LUT1("(B*C*D*A)"),
    .INIT_LUT0(16'b0001101101011111),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u517|_al_u426  (
    .a({wr_addr[12],_al_u375_o}),
    .b({wr_addr[15],sd_state[1]}),
    .c({wr_addr[14],wr_addr[14]}),
    .d({wr_addr[13],rd_addr[14]}),
    .f({_al_u517_o,_al_u426_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0011001100110011),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u518|_al_u631  (
    .a({wr_addr[16],open_n2293}),
    .b({wr_addr[17],rst_n_pad}),
    .c({wr_addr[18],open_n2294}),
    .d({wr_addr[19],open_n2297}),
    .f({_al_u518_o,n5}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~D)"),
    //.LUT1("(D*C*A)"),
    .INIT_LUT0(16'b0000000011001100),
    .INIT_LUT1(16'b1010000000000000),
    .MODE("LOGIC"))
    \_al_u519|_al_u376  (
    .a({wr_addr[20],open_n2316}),
    .b({open_n2317,sd_cmd_ack}),
    .c({wr_addr[8],open_n2318}),
    .d({wr_addr[9],reset_step[0]}),
    .f({_al_u519_o,_al_u376_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUTF1("(0*D*C*B*A)"),
    //.LUTG0("(~B*(1*~((D*~A))*~(C)+1*(D*~A)*~(C)+~(1)*(D*~A)*C+1*(D*~A)*C))"),
    //.LUTG1("(1*D*C*B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0001001100000011),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u520|reg7_b11  (
    .a({_al_u517_o,n35_lutinv}),
    .b({_al_u518_o,_al_u522_o}),
    .c({_al_u519_o,_al_u523_o}),
    .clk(clk_200m),
    .d({wr_addr[10],n36[3]}),
    .e({wr_addr[11],wr_addr[11]}),
    .sr(rst_n_pad),
    .f({n35_lutinv,open_n2354}),
    .q({open_n2358,wr_addr[11]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*A)"),
    //.LUT1("(B*C)"),
    .INIT_LUT0(16'b1000000010000000),
    .INIT_LUT1(16'b1100000011000000),
    .MODE("LOGIC"))
    \_al_u521|_al_u522  (
    .a({open_n2359,n80}),
    .b({reset_step[1],_al_u521_o}),
    .c({reset_step[0],sd_cmd_ack}),
    .f({_al_u521_o,_al_u522_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(0*D*C*B*A)"),
    //.LUT1("(1*D*B*A*C)"),
    .INIT_LUT0(16'b0000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u523 (
    .a({sd_state[0],_al_u381_o}),
    .b({wr_state[0],sd_state[0]}),
    .c({_al_u381_o,wr_state[0]}),
    .d({wr_state[1],wr_state[1]}),
    .mi({open_n2394,sd_cmd_ack}),
    .fx({open_n2399,_al_u523_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUTF1("0"),
    //.LUTG0("((1*~C)*~((D*~B))*~(A)+(1*~C)*(D*~B)*~(A)+~((1*~C))*(D*~B)*A+(1*~C)*(D*~B)*A)"),
    //.LUTG1("A*B*D*~C+A*B*D*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0010011100000101),
    .INIT_LUTG1(16'b1000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u537|reg8_b15  (
    .a({rd_addr[13],_al_u546_o}),
    .b({rd_addr[12],n53_lutinv}),
    .c({open_n2402,_al_u522_o}),
    .clk(clk_200m),
    .d({rd_addr[14],n54[7]}),
    .e({rd_addr[15],rd_addr[15]}),
    .sr(rst_n_pad),
    .f({_al_u537_o,open_n2418}),
    .q({open_n2422,rd_addr[15]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUTF1("A*B*C*D"),
    //.LUTG0("((1*~C)*~((D*~B))*~(A)+(1*~C)*(D*~B)*~(A)+~((1*~C))*(D*~B)*A+(1*~C)*(D*~B)*A)"),
    //.LUTG1("A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000000000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0010011100000101),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u538|reg8_b16  (
    .a({rd_addr[18],_al_u546_o}),
    .b({rd_addr[19],n53_lutinv}),
    .c({rd_addr[17],_al_u522_o}),
    .clk(clk_200m),
    .d({rd_addr[16],n54[8]}),
    .e({open_n2424,rd_addr[16]}),
    .sr(rst_n_pad),
    .f({_al_u538_o,open_n2439}),
    .q({open_n2443,rd_addr[16]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUTF1("0"),
    //.LUTG0("((1*~C)*~((D*~B))*~(A)+(1*~C)*(D*~B)*~(A)+~((1*~C))*(D*~B)*A+(1*~C)*(D*~B)*A)"),
    //.LUTG1("~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0010011100000101),
    .INIT_LUTG1(16'b1100110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u539|reg8_b8  (
    .a({open_n2444,_al_u546_o}),
    .b({rd_addr[20],n53_lutinv}),
    .c({open_n2445,_al_u522_o}),
    .clk(clk_200m),
    .d({rd_addr[8],n54[0]}),
    .e(rd_addr[9:8]),
    .sr(rst_n_pad),
    .f({_al_u539_o,open_n2461}),
    .q({open_n2465,rd_addr[8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(0*~(~C*~(D*B))))"),
    //.LUTF1("(D*~B)"),
    //.LUTG0("~(~A*~(1*~(~C*~(D*B))))"),
    //.LUTG1("(D*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101010101010),
    .INIT_LUTF1(16'b0011001100000000),
    .INIT_LUTG0(16'b1111111011111010),
    .INIT_LUTG1(16'b0011001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u543|reg8_b9  (
    .a({open_n2466,_al_u543_o}),
    .b({_al_u542_o,_al_u541_o}),
    .c({open_n2467,_al_u544_o}),
    .clk(clk_200m),
    .d({rd_addr[9],n54[1]}),
    .e({open_n2469,sd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u543_o,open_n2484}),
    .q({open_n2488,rd_addr[9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    //.LUTG0("~A*~B*~D*~C"),
    //.LUTG1("~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1010100010101000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u544|_al_u541  (
    .a({rd_addr[9],n53_lutinv}),
    .b({n51,n51}),
    .c({sd_state[0],sd_state[0]}),
    .d({open_n2491,1'b0}),
    .e({_al_u372_o,_al_u372_o}),
    .f({_al_u544_o,_al_u541_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~0*D*~C*B*~A)"),
    //.LUT1("(~1*B*~C*D*~A)"),
    .INIT_LUT0(16'b0000010000000000),
    .INIT_LUT1(16'b0000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u546 (
    .a({n51,n51}),
    .b({sd_state[1],_al_u372_o}),
    .c({sd_state[0],sd_state[0]}),
    .d({_al_u372_o,sd_state[1]}),
    .mi({open_n2524,1'b0}),
    .fx({open_n2529,_al_u546_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~(0*~(~C*~(B*A))))"),
    //.LUTF1("~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG0("~(~D*~(1*~(~C*~(B*A))))"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111100000000),
    .INIT_LUTF1(16'b1111111100000000),
    .INIT_LUTG0(16'b1111111111111000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u549|reg8_b19  (
    .a({open_n2532,_al_u541_o}),
    .b({open_n2533,n54[11]}),
    .c({open_n2534,_al_u550_o}),
    .clk(clk_200m),
    .d({rd_addr[19],_al_u549_o}),
    .e({_al_u542_o,sd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u549_o,open_n2550}),
    .q({open_n2554,rd_addr[19]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~C*~B*~D+~A*C*~B*~D+~A*~C*~B*D+~A*C*~B*D"),
    //.LUTG1("~A*~D*~B*~C+A*~D*~B*~C+A*D*~B*~C+~A*~D*B*~C+A*~D*B*~C+~A*D*B*~C+A*D*B*~C+~A*~D*~B*C+A*~D*~B*C+A*D*~B*C+~A*~D*B*C+A*~D*B*C+~A*D*B*C+A*D*B*C"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0001000100010001),
    .INIT_LUTG1(16'b1110111011111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u550|_al_u594  (
    .a({n51,n51}),
    .b({sd_state[0],sd_state[0]}),
    .d({_al_u372_o,open_n2559}),
    .e({rd_addr[19],_al_u372_o}),
    .f({_al_u550_o,_al_u594_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B*~A))"),
    //.LUT1("(D*~B)"),
    .INIT_LUT0(16'b1111101100000000),
    .INIT_LUT1(16'b0011001100000000),
    .MODE("LOGIC"))
    \_al_u556|_al_u557  (
    .a({open_n2580,n51}),
    .b({_al_u542_o,_al_u372_o}),
    .c({open_n2581,sd_state[0]}),
    .d({rd_addr[14],rd_addr[14]}),
    .f({_al_u556_o,_al_u557_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~((D*B)*~(C)*~(A)+(D*B)*C*~(A)+~((D*B))*C*A+(D*B)*C*A)"),
    //.LUT1("(B*~(~C*D*~A))"),
    .INIT_LUT0(16'b0001101101011111),
    .INIT_LUT1(16'b1100100011001100),
    .MODE("LOGIC"))
    \_al_u561|_al_u428  (
    .a({n51,_al_u375_o}),
    .b({rd_addr[12],sd_state[1]}),
    .c({sd_state[0],wr_addr[13]}),
    .d({_al_u372_o,rd_addr[13]}),
    .f({_al_u561_o,_al_u428_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("0"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("C*A*~B*D+C*A*B*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b1010000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u565|reg2_b5  (
    .a({burst_cnt1[3],n51}),
    .b({open_n2622,n52[5]}),
    .c({burst_cnt1[2],burst_cnt1[5]}),
    .ce(n82),
    .clk(clk_200m),
    .d({burst_cnt1[5],rd_state[0]}),
    .e({burst_cnt1[4],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u565_o,open_n2637}),
    .q({open_n2641,burst_cnt1[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("0"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("~B*A*~D*~C+B*A*~D*~C+~B*A*~D*C+B*A*~D*C"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b0000000010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u566|reg2_b8  (
    .a({burst_cnt1[7],n51}),
    .b({open_n2642,n52[8]}),
    .c({open_n2643,burst_cnt1[8]}),
    .ce(n82),
    .clk(clk_200m),
    .d({burst_cnt1[8],rd_state[0]}),
    .e({burst_cnt1[6],rd_state[1]}),
    .sr(rst_n_pad),
    .f({_al_u566_o,open_n2658}),
    .q({open_n2662,burst_cnt1[8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*~D)"),
    //.LUT1("(A*(C@B))"),
    .INIT_LUT0(16'b0000000000001100),
    .INIT_LUT1(16'b0010100000101000),
    .MODE("LOGIC"))
    \_al_u568|_al_u343  (
    .a({n82,open_n2663}),
    .b({rd_state[0],sd_state[1]}),
    .c({rd_state[1],1'b0}),
    .d({open_n2666,sd_state[0]}),
    .f({_al_u568_o,n82}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~(A*~(~0*~(~C*~(~D*~B))))"),
    //.LUTF1("(~(A)*~(D)*~(C)*~(B)*~(0)+A*~(D)*~(C)*~(B)*~(0)+~(A)*D*~(C)*~(B)*~(0)+~(A)*~(D)*C*~(B)*~(0)+A*~(D)*C*~(B)*~(0)+~(A)*D*C*~(B)*~(0)+~(A)*~(D)*C*B*~(0)+A*~(D)*C*B*~(0)+~(A)*~(D)*~(C)*~(B)*0+A*~(D)*~(C)*~(B)*0+~(A)*D*~(C)*~(B)*0+~(A)*~(D)*C*~(B)*0+A*~(D)*C*~(B)*0+~(A)*D*C*~(B)*0+~(A)*~(D)*C*B*0+A*~(D)*C*B*0+~(A)*D*C*B*0)"),
    //.LUTG0("~(A*~(~1*~(~C*~(~D*~B))))"),
    //.LUTG1("(~(A)*~(D)*~(C)*~(B)*~(1)+A*~(D)*~(C)*~(B)*~(1)+~(A)*D*~(C)*~(B)*~(1)+~(A)*~(D)*C*~(B)*~(1)+A*~(D)*C*~(B)*~(1)+~(A)*D*C*~(B)*~(1)+~(A)*~(D)*C*B*~(1)+A*~(D)*C*B*~(1)+~(A)*~(D)*~(C)*~(B)*1+A*~(D)*~(C)*~(B)*1+~(A)*D*~(C)*~(B)*1+~(A)*~(D)*C*~(B)*1+A*~(D)*C*~(B)*1+~(A)*D*C*~(B)*1+~(A)*~(D)*C*B*1+A*~(D)*C*B*1+~(A)*D*C*B*1)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111010111110111),
    .INIT_LUTF1(16'b0001000111110011),
    .INIT_LUTG0(16'b0101010101010101),
    .INIT_LUTG1(16'b0101000111110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u570|reg13_b2  (
    .a({_al_u567_o,_al_u570_o}),
    .b({sd_cmd[2],_al_u573_o}),
    .c({_al_u569_o,_al_u574_o}),
    .clk(clk_200m),
    .d({_al_u568_o,1'b0}),
    .e({sd_cmd_ack,_al_u542_o}),
    .sr(rst_n_pad),
    .f({_al_u570_o,open_n2700}),
    .q({open_n2704,sd_cmd[2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A)"),
    //.LUTF1("C*~D*A*~B+C*~D*A*B"),
    //.LUTG0("(C*~A)"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0101000001010000),
    .INIT_LUTF1(16'b0000000010100000),
    .INIT_LUTG0(16'b0101000001010000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u572|_al_u344  (
    .a({burst_cnt[3],wr_state[0]}),
    .c({burst_cnt[2],wr_state[1]}),
    .d({burst_cnt[1],open_n2709}),
    .e({wr_state[0],open_n2710}),
    .f({_al_u572_o,_al_u344_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~D*C*A))"),
    //.LUT1("(B*A)"),
    .INIT_LUT0(16'b1100110001001100),
    .INIT_LUT1(16'b1000100010001000),
    .MODE("LOGIC"))
    \_al_u574|_al_u571  (
    .a({sd_cmd[2],sd_cmd[2]}),
    .b({wr_state[1],sd_state[0]}),
    .c({open_n2731,wr_state[0]}),
    .d({open_n2734,sd_cmd_ack}),
    .f({_al_u574_o,_al_u571_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*(C*~(B)*~(0)+~(C)*B*~(0)+C*~(B)*0)))"),
    //.LUTF1("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG0("(A*~(D*(C*~(B)*~(1)+~(C)*B*~(1)+C*~(B)*1)))"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b1000001010101010),
    .INIT_LUTF1(16'b1100110011001100),
    .INIT_LUTG0(16'b1000101010101010),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u576|_al_u577  (
    .a({open_n2753,_al_u569_o}),
    .b({sd_state[1],rd_state[1]}),
    .c({open_n2754,rd_state[0]}),
    .d({open_n2757,_al_u576_o}),
    .e({sd_cmd_ack,_al_u567_o}),
    .f({_al_u576_o,_al_u577_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~(B@(~0*~A)))"),
    //.LUT1("(~A*~D*~(B@(~1*~C)))"),
    .INIT_LUT0(16'b0000000000000110),
    .INIT_LUT1(16'b0000000000010001),
    .MODE("LOGIC"),
    .MSFXMUX("ON"))
    _al_u582 (
    .a({sd_state[1],reset_step[0]}),
    .b({reset_step[1],reset_step[1]}),
    .c({reset_step[0],sd_state[0]}),
    .d({sd_state[0],sd_state[1]}),
    .mi({open_n2790,sd_cmd_ack}),
    .fx({open_n2795,_al_u582_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~C*A)"),
    //.LUTF1("(~C*~(~A*~D))"),
    //.LUTG0("(B*~C*A)"),
    //.LUTG1("(~C*~(~A*~D))"),
    .INIT_LUTF0(16'b0000100000001000),
    .INIT_LUTF1(16'b0000111100001010),
    .INIT_LUTG0(16'b0000100000001000),
    .INIT_LUTG1(16'b0000111100001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u583|_al_u403  (
    .a({_al_u399_o,_al_u399_o}),
    .b({open_n2798,rd_addr[9]}),
    .c(2'b00),
    .d({_al_u582_o,open_n2801}),
    .f({_al_u583_o,_al_u403_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~C*~B*~D+A*C*~B*~D+A*~C*B*~D+A*C*B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    //.LUTF1("0"),
    //.LUTG0("A*~C*~B*~D+A*~C*B*~D+A*C*B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    //.LUTG1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111110101010),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1111111110001010),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u593|reg3_b1  (
    .a({n35_lutinv,sd_state[1]}),
    .b({open_n2824,1'b0}),
    .c({open_n2825,_al_u594_o}),
    .clk(clk_200m),
    .d({open_n2827,_al_u593_o}),
    .e({_al_u523_o,n53_lutinv}),
    .sr(rst_n_pad),
    .f({_al_u593_o,open_n2842}),
    .q({open_n2846,sd_state[1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("~A*~B*~C*~D+~A*B*~C*~D+~A*~B*~C*D"),
    //.LUTG0("0"),
    //.LUTG1("~A*~B*~C*~D+~A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+~A*~B*~C*D+~A*B*~C*D+~A*~B*C*D+~A*B*C*D"),
    .INIT_LUTF0(16'b1111010011110000),
    .INIT_LUTF1(16'b0000000100000101),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0101010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u596|_al_u542  (
    .a({sd_state[0],sd_state[0]}),
    .b({sd_cmd_ack,sd_cmd_ack}),
    .c({sd_state[1],sd_state[1]}),
    .d({_al_u521_o,_al_u521_o}),
    .e(2'b00),
    .f({_al_u596_o,_al_u542_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~0*A*~(C*B)))"),
    //.LUTF1("~A*~D*~B*~C+A*~D*~B*~C+~A*D*~B*~C+A*D*~B*~C+~A*~D*B*~C+A*~D*B*~C+~A*~D*~B*C+A*~D*~B*C+~A*D*~B*C+A*D*~B*C+~A*~D*B*C+A*~D*B*C"),
    //.LUTG0("(D*~(~1*A*~(C*B)))"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1101010100000000),
    .INIT_LUTF1(16'b0011001111111111),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u597|reg3_b0  (
    .a({open_n2869,sd_state[1]}),
    .b({_al_u523_o,_al_u594_o}),
    .c({open_n2870,n53_lutinv}),
    .clk(clk_200m),
    .d({n35_lutinv,_al_u597_o}),
    .e({_al_u596_o,sd_state[0]}),
    .sr(rst_n_pad),
    .f({_al_u597_o,open_n2886}),
    .q({open_n2890,sd_state[0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(D*~(~B*~A)))"),
    //.LUT1("(D*~(A)*~(B)+D*A*~(B)+~(D)*A*B+D*A*B)"),
    .INIT_LUT0(16'b0000000100001111),
    .INIT_LUT1(16'b1011101110001000),
    .MODE("LOGIC"))
    \_al_u608|_al_u607  (
    .a({\u2_al_u0/n11 ,\u2_al_u0/n12 }),
    .b({_al_u607_o,sd_dataout[3]}),
    .c({open_n2891,\u2_al_u0/n10 }),
    .d({\u2_al_u0/n14 [2],\u2_al_u0/n11 }),
    .f({\u2_al_u0/n16 ,_al_u607_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~C*~A*B*~D+C*~A*B*~D+~C*A*B*~D+C*A*B*~D+~C*~A*B*D+C*~A*B*D+~C*A*B*D+C*A*B*D"),
    //.LUTF1("~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTG0("~C*A*~B*~D+C*A*~B*~D+~C*A*B*~D+C*A*B*~D+~C*A*~B*D+C*A*~B*D+~C*A*B*D+C*A*B*D"),
    //.LUTG1("~A*B*~D*~C+A*B*~D*~C+~A*B*D*~C+A*B*D*~C+~A*B*~D*C+A*B*~D*C+~A*B*D*C+A*B*D*C"),
    .INIT_LUTF0(16'b1100110011001100),
    .INIT_LUTF1(16'b1111111100000000),
    .INIT_LUTG0(16'b1010101010101010),
    .INIT_LUTG1(16'b1100110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u611|_al_u619  (
    .a({open_n2912,\u2_al_u0/n17 [0]}),
    .b({sd_dataout[3],\u2_al_u0/n19 [1]}),
    .d({\u2_al_u0/n14 [0],open_n2917}),
    .e({_al_u607_o,_al_u616_o}),
    .f({\u2_al_u0/n17 [0],\u2_al_u0/n21 [1]}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(B*D*~(~C*~A))"),
    //.LUT1("(B*~(~D*~(~C*~A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100100000000000),
    .INIT_LUT1(16'b1100110000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u613|ux_seg/reg2_b1  (
    .a({\u2_al_u0/n15 ,\u2_al_u0/n15 }),
    .b({\u2_al_u0/n3 ,\u2_al_u0/n3 }),
    .c({\u2_al_u0/n9 ,\u2_al_u0/n9 }),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({\u2_al_u0/n24 [2],\u2_al_u0/n23 }),
    .f({\u2_al_u0/n25 [2],open_n2951}),
    .q({open_n2955,\ux_seg/sm_bit3_num [1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(~(D)*A*~(C)*~(B)+D*A*~(C)*~(B)+~(D)*A*C*~(B)+D*A*C*~(B)+D*A*~(C)*B+D*~(A)*C*B+D*A*C*B)"),
    //.LUT1("(~(D)*~(A)*C*~(B)+D*~(A)*C*~(B)+~(D)*A*C*~(B)+D*A*C*~(B)+D*A*~(C)*B+D*~(A)*C*B+D*A*C*B)"),
    .INIT_LUT0(16'b1110101000100010),
    .INIT_LUT1(16'b1111100000110000),
    .MODE("LOGIC"))
    \_al_u614|_al_u615  (
    .a({\u2_al_u0/n15 ,\u2_al_u0/n15 }),
    .b({\u2_al_u0/n3 ,\u2_al_u0/n3 }),
    .c({\u2_al_u0/n9 ,\u2_al_u0/n9 }),
    .d(\u2_al_u0/n24 [1:0]),
    .f(\u2_al_u0/n25 [1:0]));
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~D*B*~C+A*~D*B*~C+~A*D*B*~C+A*D*B*~C+~A*~D*B*C+A*~D*B*C+~A*D*B*C+A*D*B*C"),
    //.LUTF1("(~A*B)"),
    //.LUTG0("~A*D*~B*~C+A*D*~B*~C+~A*D*B*~C+A*D*B*~C+~A*D*~B*C+A*D*~B*C+~A*D*B*C+A*D*B*C"),
    //.LUTG1("(~A*B)"),
    .INIT_LUTF0(16'b1100110011001100),
    .INIT_LUTF1(16'b0100010001000100),
    .INIT_LUTG0(16'b1111111100000000),
    .INIT_LUTG1(16'b0100010001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u617|_al_u620  (
    .a({_al_u616_o,open_n2976}),
    .b({\u2_al_u0/n19 [3],\u2_al_u0/n19 [0]}),
    .d({open_n2981,sd_dataout[2]}),
    .e({open_n2982,_al_u616_o}),
    .f({\u2_al_u0/n20 ,\u2_al_u0/n21 [0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~D*~C+A*~B*~D*~C+~A*B*~D*~C+~A*~B*D*~C+~A*B*D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+~A*~B*D*C+~A*B*D*C"),
    //.LUTF1("~A*~C*B*~D+A*~C*B*~D+~A*C*B*~D+A*C*B*~D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    //.LUTG0("0"),
    //.LUTG1("A*~C*~B*~D+A*C*~B*~D+A*~C*B*~D+A*C*B*~D+A*~C*~B*D+A*C*~B*D+A*~C*B*D+A*C*B*D"),
    .INIT_LUTF0(16'b0101010101110111),
    .INIT_LUTF1(16'b1100110011001100),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b1010101010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u618|_al_u616  (
    .a({\u2_al_u0/n17 [1],\u2_al_u0/n17 [1]}),
    .b({\u2_al_u0/n19 [2],sd_dataout[2]}),
    .d({open_n3007,\u2_al_u0/n17 [0]}),
    .e({_al_u616_o,\u2_al_u0/n16 }),
    .f({\u2_al_u0/n21 [2],_al_u616_o}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D"),
    //.LUTF1("~D*~C*~A*~B+D*~C*~A*~B+~D*C*~A*~B+D*C*~A*~B+~D*~C*~A*B+D*~C*~A*B+~D*C*~A*B+D*C*~A*B"),
    //.LUTG0("~C*~B*A*~D+C*~B*A*~D+~C*B*A*~D+C*B*A*~D+~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D+~C*~B*A*D+C*~B*A*D+~C*B*A*D+C*B*A*D"),
    //.LUTG1("~D*~C*~A*~B+~D*~C*~A*B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101010100000000),
    .INIT_LUTF1(16'b0101010101010101),
    .INIT_LUTG0(16'b1111111110101010),
    .INIT_LUTG1(16'b0000000000000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u621|ux_seg/reg0_b3  (
    .a({\u2_al_u0/n21 [2],_al_u621_o}),
    .c({sd_dataout[1],open_n3030}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({\u2_al_u0/n21 [0],\u2_al_u0/n27 [2]}),
    .e({\u2_al_u0/n21 [1],\u2_al_u0/n21 [1]}),
    .f({_al_u621_o,open_n3046}),
    .q({open_n3050,\ux_seg/sm_bit1_num [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    //.LUT1("(~D*~(C*~(~A*~B)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100101011001010),
    .INIT_LUT1(16'b0000000000011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u626|ux_seg/reg1_b3  (
    .a({\u2_al_u0/n25 [0],\u2_al_u0/n29 [2]}),
    .b({\u2_al_u0/n20 ,\u2_al_u0/n25 [1]}),
    .c({\u2_al_u0/n25 [1],_al_u626_o}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({\u2_al_u0/n25 [2],open_n3051}),
    .f({_al_u626_o,open_n3065}),
    .q({open_n3069,\ux_seg/sm_bit2_num [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u645"),
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
    \add0/u11_al_u648  (
    .a({error_cnt[13],error_cnt[11]}),
    .b({error_cnt[14],error_cnt[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c11 ),
    .f({n1[13],n1[11]}),
    .fco(\add0/c15 ),
    .fx({n1[14],n1[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u645"),
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
    \add0/u15_al_u649  (
    .a({open_n3088,error_cnt[15]}),
    .c(2'b00),
    .d({open_n3093,1'b0}),
    .fci(\add0/c15 ),
    .f({open_n3110,n1[15]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u645"),
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
    \add0/u3_al_u646  (
    .a({error_cnt[5],error_cnt[3]}),
    .b({error_cnt[6],error_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n1[5],n1[3]}),
    .fco(\add0/c7 ),
    .fx({n1[6],n1[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u645"),
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
    \add0/u7_al_u647  (
    .a({error_cnt[9],error_cnt[7]}),
    .b({error_cnt[10],error_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n1[9],n1[7]}),
    .fco(\add0/c11 ),
    .fx({n1[10],n1[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u645"),
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
    \add0/ucin_al_u645  (
    .a({error_cnt[1],1'b0}),
    .b({error_cnt[2],error_cnt[0]}),
    .c(2'b00),
    .ce(test_error_tmp),
    .clk(clk_200m),
    .d(2'b01),
    .e(2'b01),
    .mi(n1[1:0]),
    .sr(rst_n_pad),
    .f({n1[1],open_n3164}),
    .fco(\add0/c3 ),
    .fx({n1[2],n1[0]}),
    .q(error_cnt[1:0]));
  EG_PHY_MSLICE #(
    //.MACRO("add10/u0|add10/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add10/u0|add10/ucin  (
    .a({datacnt[0],1'b0}),
    .b({1'b1,open_n3165}),
    .f({n65[0],open_n3185}),
    .fco(\add10/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add10/u0|add10/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add10/u2|add10/u1  (
    .a({datacnt[2],1'b0}),
    .b({1'b0,datacnt[1]}),
    .fci(\add10/c1 ),
    .f(n65[2:1]),
    .fco(\add10/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add10/u0|add10/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add10/u4|add10/u3  (
    .a(2'b00),
    .b(datacnt[4:3]),
    .fci(\add10/c3 ),
    .f(n65[4:3]),
    .fco(\add10/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("add10/u0|add10/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add10/u6|add10/u5  (
    .a(2'b00),
    .b(datacnt[6:5]),
    .fci(\add10/c5 ),
    .f(n65[6:5]),
    .fco(\add10/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("add10/u0|add10/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add10/u7_al_u661  (
    .a({open_n3256,datacnt[7]}),
    .b({open_n3257,1'b0}),
    .fci(\add10/c7 ),
    .f({open_n3276,n65[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add4/ucin_al_u658"),
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
    \add4/u3_al_u659  (
    .a({burst_cnt[5],burst_cnt[3]}),
    .b({burst_cnt[6],burst_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add4/c3 ),
    .f({n29[5],n29[3]}),
    .fco(\add4/c7 ),
    .fx({n29[6],n29[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add4/ucin_al_u658"),
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
    \add4/u7_al_u660  (
    .a({open_n3300,burst_cnt[7]}),
    .b({open_n3301,burst_cnt[8]}),
    .c(2'b00),
    .d({open_n3304,1'b0}),
    .e({open_n3305,1'b0}),
    .fci(\add4/c7 ),
    .f({open_n3320,n29[7]}),
    .fx({open_n3322,n29[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add4/ucin_al_u658"),
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
    \add4/ucin_al_u658  (
    .a({burst_cnt[1],1'b0}),
    .b({burst_cnt[2],burst_cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n29[1],open_n3342}),
    .fco(\add4/c3 ),
    .fx({n29[2],n29[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("add5/u0|add5/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \add5/u0|add5/ucin  (
    .a({fifo_q[0],1'b0}),
    .b({1'b1,open_n3345}),
    .clk(clk_200m),
    .mi({open_n3361,fifo_q[0]}),
    .sr(rst_n_pad),
    .f({n34[0],open_n3362}),
    .fco(\add5/c1 ),
    .q({open_n3365,\u_sdram/ux_data_path/DIN1 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("add5/u0|add5/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add5/u2|add5/u1  (
    .a(fifo_q[2:1]),
    .b(2'b00),
    .fci(\add5/c1 ),
    .f(n34[2:1]),
    .fco(\add5/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add5/u0|add5/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add5/u4|add5/u3  (
    .a({fifo_q[4],1'b0}),
    .b({1'b0,fifo_q[3]}),
    .fci(\add5/c3 ),
    .f(n34[4:3]),
    .fco(\add5/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("add5/u0|add5/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add5/u6|add5/u5  (
    .a({fifo_q[6],1'b0}),
    .b({1'b0,fifo_q[5]}),
    .fci(\add5/c5 ),
    .f(n34[6:5]),
    .fco(\add5/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("add5/u0|add5/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add5/u7_al_u662  (
    .a({open_n3432,1'b0}),
    .b({open_n3433,fifo_q[7]}),
    .fci(\add5/c7 ),
    .f({open_n3452,n34[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add6/ucin_al_u650"),
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
    \add6/u11_al_u653  (
    .a({open_n3458,wr_addr[19]}),
    .b({open_n3459,wr_addr[20]}),
    .c(2'b00),
    .d({open_n3462,1'b0}),
    .e({open_n3463,1'b0}),
    .fci(\add6/c11 ),
    .f({open_n3478,n36[11]}),
    .fx({open_n3480,n36[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add6/ucin_al_u650"),
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
    \add6/u3_al_u651  (
    .a({wr_addr[13],wr_addr[11]}),
    .b({wr_addr[14],wr_addr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add6/c3 ),
    .f({n36[5],n36[3]}),
    .fco(\add6/c7 ),
    .fx({n36[6],n36[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add6/ucin_al_u650"),
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
    \add6/u7_al_u652  (
    .a({wr_addr[17],wr_addr[15]}),
    .b({wr_addr[18],wr_addr[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add6/c7 ),
    .f({n36[9],n36[7]}),
    .fco(\add6/c11 ),
    .fx({n36[10],n36[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add6/ucin_al_u650"),
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
    \add6/ucin_al_u650  (
    .a({wr_addr[9],1'b0}),
    .b({wr_addr[10],wr_addr[8]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n36[1],open_n3536}),
    .fco(\add6/c3 ),
    .fx({n36[2],n36[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("add8/u0|add8/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add8/u0|add8/ucin  (
    .a({burst_cnt1[0],1'b0}),
    .b({1'b1,open_n3539}),
    .f({n52[0],open_n3559}),
    .fco(\add8/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add8/u0|add8/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add8/u2|add8/u1  (
    .a({1'b0,burst_cnt1[1]}),
    .b({burst_cnt1[2],1'b0}),
    .fci(\add8/c1 ),
    .f(n52[2:1]),
    .fco(\add8/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add8/u0|add8/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add8/u4|add8/u3  (
    .a({1'b0,burst_cnt1[3]}),
    .b({burst_cnt1[4],1'b0}),
    .fci(\add8/c3 ),
    .f(n52[4:3]),
    .fco(\add8/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("add8/u0|add8/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add8/u6|add8/u5  (
    .a(burst_cnt1[6:5]),
    .b(2'b00),
    .fci(\add8/c5 ),
    .f(n52[6:5]),
    .fco(\add8/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("add8/u0|add8/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add8/u8|add8/u7  (
    .a(burst_cnt1[8:7]),
    .b(2'b00),
    .fci(\add8/c7 ),
    .f(n52[8:7]));
  EG_PHY_LSLICE #(
    //.MACRO("add9/ucin_al_u654"),
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
    \add9/u11_al_u657  (
    .a({open_n3653,rd_addr[19]}),
    .b({open_n3654,rd_addr[20]}),
    .c(2'b00),
    .d({open_n3657,1'b0}),
    .e({open_n3658,1'b0}),
    .fci(\add9/c11 ),
    .f({open_n3673,n54[11]}),
    .fx({open_n3675,n54[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("add9/ucin_al_u654"),
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
    \add9/u3_al_u655  (
    .a({rd_addr[13],rd_addr[11]}),
    .b({rd_addr[14],rd_addr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add9/c3 ),
    .f({n54[5],n54[3]}),
    .fco(\add9/c7 ),
    .fx({n54[6],n54[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add9/ucin_al_u654"),
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
    \add9/u7_al_u656  (
    .a({rd_addr[17],rd_addr[15]}),
    .b({rd_addr[18],rd_addr[16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add9/c7 ),
    .f({n54[9],n54[7]}),
    .fco(\add9/c11 ),
    .fx({n54[10],n54[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add9/ucin_al_u654"),
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
    \add9/ucin_al_u654  (
    .a({rd_addr[9],1'b0}),
    .b({rd_addr[10],rd_addr[8]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n54[1],open_n3731}),
    .fco(\add9/c3 ),
    .fx({n54[2],n54[0]}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_0|lt0_cin  (
    .a({burst_cnt1[0],1'b0}),
    .b({1'b0,open_n3781}),
    .fco(lt0_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(burst_cnt1[2:1]),
    .b(2'b10),
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
    .a(burst_cnt1[4:3]),
    .b(2'b00),
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
    .a(burst_cnt1[6:5]),
    .b(2'b00),
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
    .a(burst_cnt1[8:7]),
    .b(2'b10),
    .fci(lt0_c7),
    .fco(lt0_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_cout_al_u663 (
    .a({open_n3903,1'b0}),
    .b({open_n3904,1'b1}),
    .fci(lt0_c9),
    .f({open_n3923,n51}));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_0|lt1_cin  (
    .a(2'b00),
    .b({burst_cnt1[0],open_n3929}),
    .fco(lt1_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_2|lt1_1  (
    .a(2'b11),
    .b(burst_cnt1[2:1]),
    .fci(lt1_c1),
    .fco(lt1_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_4|lt1_3  (
    .a(2'b00),
    .b(burst_cnt1[4:3]),
    .fci(lt1_c3),
    .fco(lt1_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_6|lt1_5  (
    .a(2'b00),
    .b(burst_cnt1[6:5]),
    .fci(lt1_c5),
    .fco(lt1_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_8|lt1_7  (
    .a(2'b00),
    .b(burst_cnt1[8:7]),
    .fci(lt1_c7),
    .fco(lt1_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_cout_al_u664 (
    .a({open_n4051,1'b0}),
    .b({open_n4052,1'b1}),
    .fci(lt1_c9),
    .f({open_n4071,n64}));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_0|lt2_cin  (
    .a({burst_cnt1[0],1'b0}),
    .b({1'b0,open_n4077}),
    .fco(lt2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_2|lt2_1  (
    .a(burst_cnt1[2:1]),
    .b(2'b01),
    .fci(lt2_c1),
    .fco(lt2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_4|lt2_3  (
    .a(burst_cnt1[4:3]),
    .b(2'b11),
    .fci(lt2_c3),
    .fco(lt2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_6|lt2_5  (
    .a(burst_cnt1[6:5]),
    .b(2'b11),
    .fci(lt2_c5),
    .fco(lt2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_8|lt2_7  (
    .a(burst_cnt1[8:7]),
    .b(2'b01),
    .fci(lt2_c7),
    .fco(lt2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt2_cout_al_u665 (
    .a({open_n4199,1'b0}),
    .b({open_n4200,1'b1}),
    .fci(lt2_c9),
    .f({open_n4219,n68}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(B*(C*D*~(0)+C*~(D)*0+~(C)*D*0)))"),
    //.LUTF1("D*~B*~C*~A+D*B*~C*~A+~D*~B*C*~A+D*~B*C*~A+~D*B*C*~A+D*B*C*~A+D*~B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    //.LUTG0("(~A*~(B*(C*D*~(1)+C*~(D)*1+~(C)*D*1)))"),
    //.LUTG1("D*~B*~C*~A+D*B*~C*~A+~D*~B*C*~A+~D*B*C*~A+D*~B*~C*A+D*B*~C*A+~D*~B*C*A+~D*B*C*A"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001010101010101),
    .INIT_LUTF1(16'b1111111111110000),
    .INIT_LUTG0(16'b0101000100010101),
    .INIT_LUTG1(16'b0000111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|_al_u578  (
    .a({open_n4225,_al_u404_o}),
    .b({open_n4226,n80}),
    .c(reset_step),
    .ce(n80),
    .clk(clk_200m),
    .d({sd_cmd_ack,reset_step[1]}),
    .e({reset_step[0],sd_cmd_ack}),
    .sr(rst_n_pad),
    .f({open_n4241,_al_u578_o}),
    .q({reset_step[1],open_n4245}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1111000011110000),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b0000000011011000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg10_b1|reg10_b0  (
    .a({n64,n64}),
    .b(n65[1:0]),
    .c(datacnt[1:0]),
    .ce(n82),
    .clk(clk_200m),
    .d({rd_state[0],rd_state[0]}),
    .e({rd_state[1],rd_state[1]}),
    .sr(rst_n_pad),
    .q(datacnt[1:0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("~A*~B*~D*~C+A*B*~D*~C+~A*~B*~D*C+A*B*~D*C"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D"),
    //.LUTG1("~A*~B*D*~C+A*B*D*~C+~A*~B*D*C+A*B*D*C"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111111110),
    .INIT_LUTF1(16'b0000000010011001),
    .INIT_LUTG0(16'b0111111111111111),
    .INIT_LUTG1(16'b1001100100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b2|reg11_b1  (
    .a(sd_dq_int[2:1]),
    .b({datacnt[2],sd_dq_int[25]}),
    .c({open_n4265,sd_dq_int[9]}),
    .ce(n5),
    .clk(clk_200m),
    .d({datacnt[6],datacnt[1]}),
    .e({sd_dq_int[22],sd_dq_int[17]}),
    .mi(SD_DQ[2:1]),
    .f({_al_u272_o,_al_u268_o}),
    .q(sd_dq_int[2:1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~(0*D)*B)*~(C@A))"),
    //.LUTF1("~A*~C*~D*~B+~A*C*~D*~B+A*~C*D*~B+A*C*D*~B"),
    //.LUTG0("(~(~(1*D)*B)*~(C@A))"),
    //.LUTG1("~A*~C*~D*B+~A*C*~D*B+A*~C*D*B+A*C*D*B"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010000100100001),
    .INIT_LUTF1(16'b0010001000010001),
    .INIT_LUTG0(16'b1010010100100001),
    .INIT_LUTG1(16'b1000100001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b3|_al_u276  (
    .a({sd_dq_int[3],sd_dq_int[10]}),
    .b({datacnt[2],sd_dq_int[28]}),
    .c({open_n4282,datacnt[2]}),
    .ce(n5),
    .clk(clk_200m),
    .d({datacnt[3],datacnt[4]}),
    .e({sd_dq_int[18],sd_dq_int[4]}),
    .mi({SD_DQ[3],open_n4284}),
    .f({_al_u266_o,_al_u276_o}),
    .q({sd_dq_int[3],open_n4300}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~A*(~(C)*~(D)*~(0)+C*D*0))"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    //.LUTG0("(~B*~A*(~(C)*~(D)*~(1)+C*D*1))"),
    //.LUTG1("A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000011111010),
    .INIT_LUTG0(16'b0001000000000000),
    .INIT_LUTG1(16'b0000000011111010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b4|reg11_b0  (
    .a({sd_dq_int[4],_al_u278_o}),
    .b({open_n4301,\neq0/diff [11]}),
    .c({datacnt[4],sd_dq_int[24]}),
    .ce(n5),
    .clk(clk_200m),
    .d({sd_dq_int[28],datacnt[0]}),
    .e({open_n4302,sd_dq_int[0]}),
    .mi({SD_DQ[4],SD_DQ[0]}),
    .f({_al_u278_o,_al_u280_o}),
    .q({sd_dq_int[4],sd_dq_int[0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~A))"),
    //.LUT1("(B*~(C)*~(A)+~(B)*C*~(A)+B*C*~(A)+~(B)*~(C)*A+B*~(C)*A+~(B)*C*A)"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111101000000000),
    .INIT_LUT1(16'b0111111001111110),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg11_b6|u_sdram/ux_command/bankclose_reg  (
    .a({sd_dq_int[6],\u_sdram/ux_command/oe1 }),
    .b({sd_dq_int[30],open_n4319}),
    .c({datacnt[6],\u_sdram/ux_command/rw_flag }),
    .ce(n5),
    .clk(clk_200m),
    .d({open_n4320,\u_sdram/ux_command/do_precharge }),
    .mi({SD_DQ[6],open_n4331}),
    .f({_al_u273_o,\u_sdram/ux_command/n61 }),
    .q({sd_dq_int[6],\u_sdram/ux_command/bankclose }));  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("A*D*C*~B+A*D*C*B"),
    //.LUTG1("~D*B*A*C+D*B*A*C"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1010000000000000),
    .INIT_LUTG1(16'b1000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg12_b10|reg12_b12  (
    .a({error_cnt[10],error_cnt[12]}),
    .b({error_cnt[1],open_n4336}),
    .c({error_cnt[11],error_cnt[14]}),
    .ce(test_error_tmp),
    .clk(clk_200m),
    .d({open_n4337,error_cnt[13]}),
    .e({error_cnt[0],error_cnt[15]}),
    .mi({n1[10],n1[12]}),
    .sr(rst_n_pad),
    .f({_al_u437_o,_al_u436_o}),
    .q({error_cnt[10],error_cnt[12]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  EG_PHY_MSLICE #(
    //.LUT0("(0*D*C*B*A)"),
    //.LUT1("(1*D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg12_b11|_al_u373  (
    .a({n64,n64}),
    .b({n68,n68}),
    .c({n82,n82}),
    .ce(test_error_tmp),
    .clk(clk_200m),
    .d({_al_u372_o,_al_u372_o}),
    .mi({n1[11],rst_n_pad}),
    .sr(rst_n_pad),
    .fx({open_n4366,u26_sel_is_2_o}),
    .q({error_cnt[11],open_n4367}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  EG_PHY_MSLICE #(
    //.LUT0("(0*D*C*B*A)"),
    //.LUT1("(1*D*C*B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg12_b13|_al_u540  (
    .a({_al_u537_o,_al_u537_o}),
    .b({_al_u538_o,_al_u538_o}),
    .c({_al_u539_o,_al_u539_o}),
    .ce(test_error_tmp),
    .clk(clk_200m),
    .d({rd_addr[10],rd_addr[10]}),
    .mi({n1[13],rd_addr[11]}),
    .sr(rst_n_pad),
    .fx({open_n4381,n53_lutinv}),
    .q({error_cnt[13],open_n4382}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
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
    \reg12_b14|reg12_b9  (
    .ce(test_error_tmp),
    .clk(clk_200m),
    .mi({n1[14],n1[9]}),
    .sr(rst_n_pad),
    .q({error_cnt[14],error_cnt[9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
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
    \reg12_b15|reg12_b8  (
    .ce(test_error_tmp),
    .clk(clk_200m),
    .mi({n1[15],n1[8]}),
    .sr(rst_n_pad),
    .q({error_cnt[15],error_cnt[8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  EG_PHY_LSLICE #(
    //.LUTF0("(0*A*C*B*D)"),
    //.LUTF1("0"),
    //.LUTG0("(1*A*C*B*D)"),
    //.LUTG1("A*~C*B*D+A*C*B*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg12_b2|reg12_b6  (
    .a({error_cnt[2],error_cnt[8]}),
    .b({error_cnt[4],error_cnt[6]}),
    .c({open_n4429,error_cnt[7]}),
    .ce(test_error_tmp),
    .clk(clk_200m),
    .d({error_cnt[5],_al_u434_o}),
    .e({error_cnt[3],error_cnt[9]}),
    .mi({n1[2],n1[6]}),
    .sr(rst_n_pad),
    .f({_al_u434_o,_al_u435_o}),
    .q({error_cnt[2],error_cnt[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
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
    \reg12_b3|reg12_b7  (
    .ce(test_error_tmp),
    .clk(clk_200m),
    .mi({n1[3],n1[7]}),
    .sr(rst_n_pad),
    .q({error_cnt[3],error_cnt[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
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
    \reg12_b4|reg12_b5  (
    .ce(test_error_tmp),
    .clk(clk_200m),
    .mi({n1[4],n1[5]}),
    .sr(rst_n_pad),
    .q({error_cnt[4],error_cnt[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*~(A*~(~0*D))))"),
    //.LUTF1("~A*~B*D*~C+~A*B*D*~C+~A*~B*D*C+A*~B*D*C+~A*B*D*C"),
    //.LUTG0("~(B*~(C*~(A*~(~1*D))))"),
    //.LUTG1("~A*~B*~D*~C+A*~B*~D*~C+~A*B*~D*~C+A*B*~D*~C+~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111001101110011),
    .INIT_LUTF1(16'b0111010100000000),
    .INIT_LUTG0(16'b0111001101110011),
    .INIT_LUTG1(16'b1111111111111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg13_b0|reg13_b1  (
    .a({_al_u577_o,_al_u577_o}),
    .b({_al_u580_o,_al_u578_o}),
    .c({sd_state[0],sd_cmd[1]}),
    .clk(clk_200m),
    .d({sd_cmd[0],sd_state[0]}),
    .e({_al_u583_o,_al_u580_o}),
    .sr(rst_n_pad),
    .q({sd_cmd[0],sd_cmd[1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B+~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+~A*~D*C*B+~A*D*C*B"),
    //.LUTG1("~A*~C*~D*~B+A*~C*~D*~B+~A*C*~D*~B+A*C*~D*~B+~A*~C*D*~B+A*~C*D*~B+~A*C*D*~B+A*C*D*~B+~A*~C*~D*B+A*~C*~D*B+~A*C*~D*B+~A*~C*D*B+A*~C*D*B+~A*C*D*B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0111111101111111),
    .INIT_LUTG1(16'b0111111101111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b2  (
    .a({_al_u439_o,_al_u439_o}),
    .b({_al_u441_o,_al_u441_o}),
    .c({_al_u440_o,_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .e({n29[0],n29[2]}),
    .sr(rst_n_pad),
    .q({burst_cnt[0],burst_cnt[2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(D*C*A))"),
    //.LUT1("(C*~(B*D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0100110011001100),
    .INIT_LUT1(16'b0111000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b4|reg1_b1  (
    .a({_al_u439_o,_al_u439_o}),
    .b({_al_u441_o,n29[1]}),
    .c({n29[4],_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .d({_al_u440_o,_al_u441_o}),
    .sr(rst_n_pad),
    .q({burst_cnt[4],burst_cnt[1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~B*~A*~C*~D+B*~A*~C*~D+~B*A*~C*~D+B*A*~C*~D+~B*~A*C*~D+B*~A*C*~D+~B*A*C*~D+B*A*C*~D+~B*~A*~C*D+B*~A*~C*D+~B*A*~C*D+B*A*~C*D+~B*~A*C*D+B*~A*C*D"),
    //.LUTG1("~C*~B*~A*~D+C*~B*~A*~D+~C*B*~A*~D+C*B*~A*~D+~C*~B*A*~D+C*~B*A*~D+~C*B*A*~D+C*B*A*~D+~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D+~C*~B*A*D+C*~B*A*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0101111111111111),
    .INIT_LUTG1(16'b0111011111111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b5|reg1_b7  (
    .a({_al_u439_o,_al_u439_o}),
    .b({_al_u440_o,open_n4557}),
    .c({open_n4558,_al_u440_o}),
    .ce(sel8_b0_sel_is_3_o),
    .clk(clk_200m),
    .d({_al_u441_o,_al_u441_o}),
    .e({n29[5],n29[7]}),
    .sr(rst_n_pad),
    .q({burst_cnt[5],burst_cnt[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("(D*~((~C*B*A))*~(0)+D*(~C*B*A)*~(0)+~(D)*(~C*B*A)*0+D*(~C*B*A)*0)"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("(D*~((~C*B*A))*~(1)+D*(~C*B*A)*~(1)+~(D)*(~C*B*A)*1+D*(~C*B*A)*1)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1111111100000000),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b0000100000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b0|reg2_b6  (
    .a({n51,n51}),
    .b({n52[0],n52[6]}),
    .c({rd_state[0],burst_cnt1[6]}),
    .ce(n82),
    .clk(clk_200m),
    .d({burst_cnt1[0],rd_state[0]}),
    .e({rd_state[1],rd_state[1]}),
    .sr(rst_n_pad),
    .q({burst_cnt1[0],burst_cnt1[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("(B*~((~D*C*A))*~(0)+B*(~D*C*A)*~(0)+~(B)*(~D*C*A)*0+B*(~D*C*A)*0)"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("(B*~((~D*C*A))*~(1)+B*(~D*C*A)*~(1)+~(B)*(~D*C*A)*1+B*(~D*C*A)*1)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1100110011001100),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b0000000010100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b4  (
    .a({n51,n51}),
    .b({burst_cnt1[1],n52[4]}),
    .c({n52[1],burst_cnt1[4]}),
    .ce(n82),
    .clk(clk_200m),
    .d({rd_state[0],rd_state[0]}),
    .e({rd_state[1],rd_state[1]}),
    .sr(rst_n_pad),
    .q({burst_cnt1[1],burst_cnt1[4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("(B*~((~D*C*A))*~(0)+B*(~D*C*A)*~(0)+~(B)*(~D*C*A)*0+B*(~D*C*A)*0)"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("(B*~((~D*C*A))*~(1)+B*(~D*C*A)*~(1)+~(B)*(~D*C*A)*1+B*(~D*C*A)*1)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1100110011001100),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b0000000010100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b2|reg2_b3  (
    .a({n51,n51}),
    .b({burst_cnt1[2],n52[3]}),
    .c({n52[2],burst_cnt1[3]}),
    .ce(n82),
    .clk(clk_200m),
    .d({rd_state[0],rd_state[0]}),
    .e({rd_state[1],rd_state[1]}),
    .sr(rst_n_pad),
    .q({burst_cnt1[2],burst_cnt1[3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~0*~(C*~(D*B*A)))"),
    //.LUT1("(~1*~(C*~(B*D*A)))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1000111100001111),
    .INIT_LUT1(16'b0000000000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg4_b0 (
    .a({_al_u439_o,_al_u439_o}),
    .b({_al_u441_o,_al_u440_o}),
    .c({_al_u344_o,_al_u344_o}),
    .ce(n81),
    .clk(clk_200m),
    .d({_al_u440_o,_al_u441_o}),
    .mi({open_n4645,_al_u510_o}),
    .sr(rst_n_pad),
    .q({open_n4651,wr_state[0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~((~D*B*A))*~(0)+C*(~D*B*A)*~(0)+~(C)*(~D*B*A)*0+C*(~D*B*A)*0)"),
    //.LUTF1("~B*~C*~A*~D+B*~C*~A*~D+~B*C*~A*~D+B*C*~A*~D+~B*~C*A*~D+B*~C*A*~D+~B*C*A*~D+B*C*A*~D+~B*~C*~A*D+B*~C*~A*D"),
    //.LUTG0("(C*~((~D*B*A))*~(1)+C*(~D*B*A)*~(1)+~(C)*(~D*B*A)*1+C*(~D*B*A)*1)"),
    //.LUTG1("~B*~C*~A*~D+B*~C*~A*~D+~B*C*~A*~D+B*C*~A*~D+~B*~C*~A*D+B*~C*~A*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0000010111111111),
    .INIT_LUTG0(16'b0000000010001000),
    .INIT_LUTG1(16'b0000010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg5_b0|reg2_b7  (
    .a({rd_state[1],n51}),
    .b({open_n4652,n52[7]}),
    .c({sd_cmd_ack,burst_cnt1[7]}),
    .ce(n82),
    .clk(clk_200m),
    .d({rd_state[0],rd_state[0]}),
    .e({n51,rd_state[1]}),
    .sr(rst_n_pad),
    .q({rd_state[0],burst_cnt1[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(A)*~(B)*C*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+~(A)*B*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*~(B)*C*D*~(0)+A*~(B)*C*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+A*B*~(C)*~(D)*0+~(A)*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("A*~C*~B*~D+A*C*~B*~D+A*~C*B*~D+A*C*B*~D+A*~C*~B*D+A*C*~B*D+A*~C*B*D+A*C*B*D"),
    //.LUTG0("(~(A)*~(B)*C*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+~(A)*B*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*~(B)*C*D*~(1)+A*~(B)*C*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+A*B*~(C)*~(D)*1+~(A)*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("~A*~C*B*~D+~A*C*B*~D+~A*~C*B*D+~A*C*B*D"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b0000000011011000),
    .INIT_LUTG1(16'b0100010001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg5_b1|reg10_b5  (
    .a({rd_state[1],n64}),
    .b({sd_cmd_ack,n65[5]}),
    .c({open_n4672,datacnt[5]}),
    .ce(n82),
    .clk(clk_200m),
    .d({open_n4673,rd_state[0]}),
    .e({rd_state[0],rd_state[1]}),
    .sr(rst_n_pad),
    .q({rd_state[1],datacnt[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~B*A*~C*D+~B*A*C*D"),
    //.LUTF1("~C*D*~B*~A+C*D*~B*~A+~C*~D*B*~A+C*~D*B*~A+~C*D*B*~A+C*D*B*~A+~C*~D*~B*A+~C*D*~B*A+C*D*~B*A+~C*~D*B*A+C*~D*B*A+~C*D*B*A+C*D*B*A"),
    //.LUTG0("~B*A*C*~D+~B*A*C*D"),
    //.LUTG1("~C*D*~B*~A+C*D*~B*~A+~C*D*B*~A+C*D*B*~A+~C*~D*~B*A+~C*D*~B*A+C*D*~B*A+~C*~D*B*A+~C*D*B*A+C*D*B*A"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000000000),
    .INIT_LUTF1(16'b1111111111001110),
    .INIT_LUTG0(16'b0010000000100000),
    .INIT_LUTG1(16'b1111111100001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b10|u_sdram/ux_control/reg0_b10  (
    .a({sd_addr[10],sd_state[1]}),
    .b({_al_u381_o,1'b0}),
    .c({_al_u386_o,rd_addr[10]}),
    .clk(clk_200m),
    .d({_al_u395_o,sd_addr[10]}),
    .e({_al_u396_o,_al_u378_o}),
    .mi({open_n4695,sd_addr[10]}),
    .sr(rst_n_pad),
    .f({open_n4707,_al_u395_o}),
    .q({sd_addr[10],\u_sdram/saddr [10]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*B*(D*~(0)*~(C)+D*0*~(C)+~(D)*0*C+D*0*C))"),
    //.LUTF1("~C*D*~B*~A+C*D*~B*~A+~C*~D*B*~A+C*~D*B*~A+~C*D*B*~A+C*D*B*~A+~C*~D*~B*A+~C*D*~B*A+C*D*~B*A+~C*~D*B*A+C*~D*B*A+~C*D*B*A+C*D*B*A"),
    //.LUTG0("(~A*B*(D*~(1)*~(C)+D*1*~(C)+~(D)*1*C+D*1*C))"),
    //.LUTG1("~C*D*~B*~A+C*D*~B*~A+~C*D*B*~A+C*D*B*~A+~C*~D*~B*A+~C*D*~B*A+C*D*~B*A+~C*~D*B*A+~C*D*B*A+C*D*B*A"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000010000000000),
    .INIT_LUTF1(16'b1111111111001110),
    .INIT_LUTG0(16'b0100010001000000),
    .INIT_LUTG1(16'b1111111100001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b11|u_sdram/ux_control/reg0_b11  (
    .a({sd_addr[11],1'b0}),
    .b({_al_u381_o,sd_state[1]}),
    .c({_al_u386_o,_al_u378_o}),
    .clk(clk_200m),
    .d({_al_u391_o,sd_addr[11]}),
    .e({_al_u393_o,rd_addr[11]}),
    .mi({open_n4713,sd_addr[11]}),
    .sr(rst_n_pad),
    .f({open_n4725,_al_u391_o}),
    .q({sd_addr[11],\u_sdram/saddr [11]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*~B*C*D+A*~B*C*D"),
    //.LUTG1("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101010101010),
    .INIT_LUTF1(16'b0111010001110100),
    .INIT_LUTG0(16'b0011001100110011),
    .INIT_LUTG1(16'b0111010001110100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b12|reg6_b20  (
    .a({_al_u430_o,sd_addr[20]}),
    .b({_al_u401_o,_al_u414_o}),
    .c({sd_addr[12],open_n4729}),
    .clk(clk_200m),
    .e({open_n4733,_al_u401_o}),
    .sr(rst_n_pad),
    .q({sd_addr[12],sd_addr[20]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(C)*~(D)+~A*C*~(D)+~(~A)*C*D+~A*C*D)"),
    //.LUT1("~(~A*~(C)*~(D)+~A*C*~(D)+~(~A)*C*D+~A*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111110101010),
    .INIT_LUT1(16'b0000111110101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b13|reg6_b19  (
    .a({sd_addr[13],sd_addr[19]}),
    .c({_al_u428_o,_al_u416_o}),
    .clk(clk_200m),
    .d({_al_u401_o,_al_u401_o}),
    .sr(rst_n_pad),
    .q({sd_addr[13],sd_addr[19]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~D*C*~B*A+D*C*~B*A+~D*C*B*A+D*C*B*A"),
    //.LUTF1("A*~B*~D*~C+A*B*~D*~C+A*~B*D*~C+A*B*D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTG0("~D*~C*~B*~A+D*~C*~B*~A+~D*C*~B*~A+D*C*~B*~A+~D*~C*B*~A+D*~C*B*~A+~D*C*B*~A+D*C*B*~A+~D*C*~B*A+D*C*~B*A+~D*C*B*A+D*C*B*A"),
    //.LUTG1("A*~B*~D*~C+A*B*~D*~C+A*~B*D*~C+A*B*D*~C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010000010100000),
    .INIT_LUTF1(16'b1111101011111010),
    .INIT_LUTG0(16'b1111010111110101),
    .INIT_LUTG1(16'b0000101000001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b14|u_sdram/ux_command/reg3_b6  (
    .a({sd_addr[14],\u_sdram/ux_command/n17 }),
    .c({_al_u401_o,\u_sdram/saddr [14]}),
    .clk(clk_200m),
    .e({_al_u426_o,\u_sdram/saddr [6]}),
    .sr(rst_n_pad),
    .q({sd_addr[14],\u_sdram/ISA [6]}));  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~D*~C+A*B*~D*~C+A*~B*D*~C+A*B*D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTF1("~(~A*~(C)*~(D)+~A*C*~(D)+~(~A)*C*D+~A*C*D)"),
    //.LUTG0("A*~B*~D*~C+A*B*~D*~C+A*~B*D*~C+A*B*D*~C"),
    //.LUTG1("~(~A*~(C)*~(D)+~A*C*~(D)+~(~A)*C*D+~A*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111101011111010),
    .INIT_LUTF1(16'b0000111110101010),
    .INIT_LUTG0(16'b0000101000001010),
    .INIT_LUTG1(16'b0000111110101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b15|reg6_b16  (
    .a({sd_addr[15],sd_addr[16]}),
    .c({_al_u424_o,_al_u401_o}),
    .clk(clk_200m),
    .d({_al_u401_o,open_n4800}),
    .e({open_n4801,_al_u422_o}),
    .sr(rst_n_pad),
    .q({sd_addr[15],sd_addr[16]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D"),
    //.LUTF1("~C*~B*~A*~D+C*~B*~A*~D+~C*B*~A*~D+C*B*~A*~D+C*~B*A*~D+C*B*A*~D+~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    //.LUTG1("~C*~B*~A*~D+C*~B*~A*~D+~C*B*~A*~D+C*B*~A*~D+C*~B*A*~D+C*B*A*~D+~C*~B*~A*D+C*~B*~A*D+~C*B*~A*D+C*B*~A*D+C*B*A*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111001101111111),
    .INIT_LUTF1(16'b0101010111110101),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b1101010111110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b3|u_sdram/ux_control/reg0_b3  (
    .a({_al_u389_o,rd_addr[3]}),
    .b({_al_u380_o,sd_state[1]}),
    .c({_al_u381_o,_al_u378_o}),
    .clk(clk_200m),
    .d({_al_u388_o,sd_addr[3]}),
    .e({sd_addr[3],1'b0}),
    .mi({open_n4823,sd_addr[3]}),
    .sr(rst_n_pad),
    .f({open_n4835,_al_u389_o}),
    .q({sd_addr[3],\u_sdram/saddr [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*B*C*~D+~A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("A*~C*~B*~D+A*C*~B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    //.LUTG0("0"),
    //.LUTG1("~A*~C*~B*~D+A*~C*~B*~D+~A*C*~B*~D+A*C*~B*~D+~A*~C*B*~D+A*~C*B*~D+~A*C*B*~D+A*C*B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1111111100100010),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b1111111111111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b4|u_sdram/ux_control/reg0_b4  (
    .a({sd_addr[4],_al_u378_o}),
    .b({_al_u386_o,sd_state[1]}),
    .c({open_n4839,rd_addr[4]}),
    .clk(clk_200m),
    .d({_al_u383_o,sd_addr[4]}),
    .e({_al_u385_o,1'b0}),
    .mi({open_n4842,sd_addr[4]}),
    .sr(rst_n_pad),
    .f({open_n4854,_al_u383_o}),
    .q({sd_addr[4],\u_sdram/saddr [4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~B*~A*~C*~D+B*~A*~C*~D+~B*A*~C*~D+B*A*~C*~D+~B*~A*C*~D+B*~A*C*~D+~B*A*C*~D+B*A*C*~D+~B*~A*~C*D+~B*~A*C*D"),
    //.LUTF1("~D*~B*~A*~C+D*~B*~A*~C+~D*B*~A*~C+D*B*~A*~C+~D*~B*~A*C+D*~B*~A*C+~D*B*~A*C+D*B*~A*C+~D*~B*A*C+D*~B*A*C+~D*B*A*C+D*B*A*C"),
    //.LUTG0("~B*~A*~C*~D+B*~A*~C*~D+~B*A*~C*~D+B*A*~C*~D+~B*~A*C*~D+B*~A*C*~D+B*A*C*~D+~B*~A*~C*D+~B*A*~C*D+~B*~A*C*D"),
    //.LUTG1("~D*~B*~A*~C+D*~B*~A*~C+~D*B*~A*~C+D*B*~A*~C+~D*~B*~A*C+D*~B*~A*C+~D*B*~A*C+D*B*~A*C+D*B*A*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001000111111111),
    .INIT_LUTF1(16'b1111010111110101),
    .INIT_LUTG0(16'b0001001111011111),
    .INIT_LUTG1(16'b1101010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg6_b8|u_sdram/ux_control/reg0_b8  (
    .a({_al_u379_o,sd_state[1]}),
    .b({_al_u380_o,1'b0}),
    .c({_al_u381_o,rd_addr[8]}),
    .clk(clk_200m),
    .d({sd_addr[8],sd_addr[8]}),
    .e({_al_u377_o,_al_u378_o}),
    .mi({open_n4860,sd_addr[8]}),
    .sr(rst_n_pad),
    .f({open_n4872,_al_u379_o}),
    .q({sd_addr[8],\u_sdram/saddr [8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~C*~B*~A*D+C*~B*~A*D+~C*~B*A*D+C*~B*A*D"),
    //.LUTF1("0"),
    //.LUTG0("~C*~B*~A*D+C*~B*~A*D"),
    //.LUTG1("~D*~A*~B*~C+D*~A*~B*~C+~D*A*~B*~C+~D*~A*~B*C+D*~A*~B*C+~D*A*~B*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011001100000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0001000100000000),
    .INIT_LUTG1(16'b0001000100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b0|reg7_b7  (
    .a({_al_u523_o,_al_u523_o}),
    .b({_al_u522_o,_al_u522_o}),
    .clk(clk_200m),
    .d({n35_lutinv,wr_addr[7]}),
    .e({wr_addr[0],n35_lutinv}),
    .sr(rst_n_pad),
    .q({wr_addr[0],wr_addr[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUT1("(~A*(1*~((D*~B))*~(C)+1*(D*~B)*~(C)+~(1)*(D*~B)*C+1*(D*~B)*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001010100000101),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b10 (
    .a({_al_u522_o,n35_lutinv}),
    .b({n35_lutinv,_al_u522_o}),
    .c({_al_u523_o,_al_u523_o}),
    .clk(clk_200m),
    .d({n36[2],n36[2]}),
    .mi({open_n4909,wr_addr[10]}),
    .sr(rst_n_pad),
    .q({open_n4915,wr_addr[10]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUT1("(~B*(1*~((D*~A))*~(C)+1*(D*~A)*~(C)+~(1)*(D*~A)*C+1*(D*~A)*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001001100000011),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b13 (
    .a({n35_lutinv,n35_lutinv}),
    .b({_al_u522_o,_al_u522_o}),
    .c({_al_u523_o,_al_u523_o}),
    .clk(clk_200m),
    .d({n36[5],n36[5]}),
    .mi({open_n4927,wr_addr[13]}),
    .sr(rst_n_pad),
    .q({open_n4933,wr_addr[13]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUT1("(~B*(1*~((D*~A))*~(C)+1*(D*~A)*~(C)+~(1)*(D*~A)*C+1*(D*~A)*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001001100000011),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b14 (
    .a({n35_lutinv,n35_lutinv}),
    .b({_al_u522_o,_al_u522_o}),
    .c({_al_u523_o,_al_u523_o}),
    .clk(clk_200m),
    .d({n36[6],n36[6]}),
    .mi({open_n4945,wr_addr[14]}),
    .sr(rst_n_pad),
    .q({open_n4951,wr_addr[14]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUT1("(~A*(1*~((C*~B))*~(D)+1*(C*~B)*~(D)+~(1)*(C*~B)*D+1*(C*~B)*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001000001010101),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b17 (
    .a({_al_u522_o,n35_lutinv}),
    .b({n35_lutinv,_al_u522_o}),
    .c({n36[9],n36[9]}),
    .clk(clk_200m),
    .d({_al_u523_o,_al_u523_o}),
    .mi({open_n4963,wr_addr[17]}),
    .sr(rst_n_pad),
    .q({open_n4969,wr_addr[17]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((C*~A))*~(D)+0*(C*~A)*~(D)+~(0)*(C*~A)*D+0*(C*~A)*D))"),
    //.LUT1("(~A*(1*~((C*~B))*~(D)+1*(C*~B)*~(D)+~(1)*(C*~B)*D+1*(C*~B)*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001000001010101),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b18 (
    .a({_al_u522_o,n35_lutinv}),
    .b({n35_lutinv,_al_u522_o}),
    .c({n36[10],n36[10]}),
    .clk(clk_200m),
    .d({_al_u523_o,_al_u523_o}),
    .mi({open_n4981,wr_addr[18]}),
    .sr(rst_n_pad),
    .q({open_n4987,wr_addr[18]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("A*~C*~B*~D+A*C*~B*~D+A*~C*~B*D+A*C*~B*D"),
    //.LUTG0("~A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("A*~C*~B*~D+A*C*~B*~D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1101000111011101),
    .INIT_LUTF1(16'b0010001000100010),
    .INIT_LUTG0(16'b1101110111011101),
    .INIT_LUTG1(16'b0000000000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b1|_al_u398  (
    .a({wr_addr[1],_al_u376_o}),
    .b({_al_u522_o,sd_state[0]}),
    .c({open_n4988,wr_state[0]}),
    .clk(clk_200m),
    .d({n35_lutinv,wr_addr[1]}),
    .e({_al_u523_o,wr_state[1]}),
    .sr(rst_n_pad),
    .f({open_n5004,_al_u398_o}),
    .q({wr_addr[1],open_n5008}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~C*~D*~B+A*~C*~D*~B+~A*~C*D*~B+~A*~C*~D*B+A*~C*~D*B+~A*~C*D*B"),
    //.LUTG1("~A*~B*~D*~C+A*~B*~D*~C+~A*B*~D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000010100001111),
    .INIT_LUTG1(16'b0000000001110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b2|reg7_b4  (
    .a({n35_lutinv,n35_lutinv}),
    .b({_al_u523_o,open_n5009}),
    .c({open_n5010,_al_u522_o}),
    .clk(clk_200m),
    .d({_al_u522_o,_al_u523_o}),
    .e({wr_addr[2],wr_addr[4]}),
    .sr(rst_n_pad),
    .q({wr_addr[2],wr_addr[4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*~B*C*D"),
    //.LUTF1("A*~B*~D*~C+A*B*~D*~C+A*~B*D*~C+A*B*D*~C"),
    //.LUTG0("~A*~B*~C*~D+~A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+~A*~B*~C*D+~A*~B*C*D"),
    //.LUTG1("A*~B*~D*~C+A*~B*D*~C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0001001101011111),
    .INIT_LUTF1(16'b0000101000001010),
    .INIT_LUTG0(16'b0001000101010101),
    .INIT_LUTG1(16'b0000001000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b3|_al_u388  (
    .a({wr_addr[3],_al_u374_o}),
    .b({n35_lutinv,_al_u375_o}),
    .c({_al_u522_o,_al_u376_o}),
    .clk(clk_200m),
    .d({open_n5032,wr_addr[3]}),
    .e({_al_u523_o,sd_addr[3]}),
    .sr(rst_n_pad),
    .f({open_n5047,_al_u388_o}),
    .q({wr_addr[3],open_n5051}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*~B*~C*D+A*B*~C*D"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*~B*C*D"),
    //.LUTG0("~A*~B*~C*~D+A*~B*~C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000101000000010),
    .INIT_LUTF1(16'b0010001010101010),
    .INIT_LUTG0(16'b0000111100000011),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b5|reg6_b5  (
    .a({wr_addr[5],_al_u401_o}),
    .b({_al_u523_o,_al_u404_o}),
    .c({open_n5052,_al_u410_o}),
    .clk(clk_200m),
    .d({n35_lutinv,wr_addr[5]}),
    .e({_al_u522_o,sd_addr[5]}),
    .sr(rst_n_pad),
    .q({wr_addr[5],sd_addr[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D"),
    //.LUTG0("~A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("A*~B*~C*~D+A*~B*~C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b0000101000001010),
    .INIT_LUTG0(16'b1111110111011101),
    .INIT_LUTG1(16'b0000001000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg7_b6|reg6_b6  (
    .a({wr_addr[6],_al_u401_o}),
    .b({_al_u523_o,_al_u408_o}),
    .c({_al_u522_o,_al_u404_o}),
    .clk(clk_200m),
    .d({open_n5074,wr_addr[6]}),
    .e({n35_lutinv,sd_addr[6]}),
    .sr(rst_n_pad),
    .q({wr_addr[6],sd_addr[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(0*~((D*~A))*~(C)+0*(D*~A)*~(C)+~(0)*(D*~A)*C+0*(D*~A)*C))"),
    //.LUT1("(~B*(1*~((D*~A))*~(C)+1*(D*~A)*~(C)+~(1)*(D*~A)*C+1*(D*~A)*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001000000000000),
    .INIT_LUT1(16'b0001001100000011),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b8 (
    .a({n35_lutinv,n35_lutinv}),
    .b({_al_u522_o,_al_u522_o}),
    .c({_al_u523_o,_al_u523_o}),
    .clk(clk_200m),
    .d({n36[0],n36[0]}),
    .mi({open_n5105,wr_addr[8]}),
    .sr(rst_n_pad),
    .q({open_n5111,wr_addr[8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(D*~((C*~A))*~(0)+D*(C*~A)*~(0)+~(D)*(C*~A)*0+D*(C*~A)*0))"),
    //.LUT1("(~B*(D*~((C*~A))*~(1)+D*(C*~A)*~(1)+~(D)*(C*~A)*1+D*(C*~A)*1))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001100000000),
    .INIT_LUT1(16'b0001000000010000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg7_b9 (
    .a({n35_lutinv,n35_lutinv}),
    .b({_al_u522_o,_al_u522_o}),
    .c({n36[1],n36[1]}),
    .clk(clk_200m),
    .d({wr_addr[9],wr_addr[9]}),
    .mi({open_n5123,_al_u523_o}),
    .sr(rst_n_pad),
    .q({open_n5129,wr_addr[9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(0*~(C*~(D*~(B*A))))"),
    //.LUTF1("A*~B*~C*~D+A*~B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG0("(1*~(C*~(D*~(B*A))))"),
    //.LUTG1("A*~B*~C*~D+A*~B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1010101000100010),
    .INIT_LUTG0(16'b0111111100001111),
    .INIT_LUTG1(16'b0010101000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg8_b0|reg8_b4  (
    .a({rd_addr[0],_al_u594_o}),
    .b({_al_u542_o,n53_lutinv}),
    .c({n53_lutinv,_al_u542_o}),
    .clk(clk_200m),
    .d({sd_state[1],sd_state[1]}),
    .e({_al_u594_o,rd_addr[4]}),
    .sr(rst_n_pad),
    .q({rd_addr[0],rd_addr[4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUTF1("((0*~D)*~((A*~B))*~(C)+(0*~D)*(A*~B)*~(C)+~((0*~D))*(A*~B)*C+(0*~D)*(A*~B)*C)"),
    //.LUTG0("((1*~C)*~((D*~B))*~(A)+(1*~C)*(D*~B)*~(A)+~((1*~C))*(D*~B)*A+(1*~C)*(D*~B)*A)"),
    //.LUTG1("((1*~D)*~((A*~B))*~(C)+(1*~D)*(A*~B)*~(C)+~((1*~D))*(A*~B)*C+(1*~D)*(A*~B)*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000000000),
    .INIT_LUTF1(16'b0010000000100000),
    .INIT_LUTG0(16'b0010011100000101),
    .INIT_LUTG1(16'b0010000000101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg8_b10|reg8_b20  (
    .a({n54[2],_al_u546_o}),
    .b({n53_lutinv,n53_lutinv}),
    .c({_al_u546_o,_al_u522_o}),
    .clk(clk_200m),
    .d({_al_u522_o,n54[12]}),
    .e({rd_addr[10],rd_addr[20]}),
    .sr(rst_n_pad),
    .q({rd_addr[10],rd_addr[20]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUT1("((1*~B)*~((D*~C))*~(A)+(1*~B)*(D*~C)*~(A)+~((1*~B))*(D*~C)*A+(1*~B)*(D*~C)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010001000000000),
    .INIT_LUT1(16'b0001101100010001),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b11 (
    .a({_al_u546_o,_al_u546_o}),
    .b({_al_u522_o,n53_lutinv}),
    .c({n53_lutinv,_al_u522_o}),
    .clk(clk_200m),
    .d({n54[3],n54[3]}),
    .mi({open_n5181,rd_addr[11]}),
    .sr(rst_n_pad),
    .q({open_n5187,rd_addr[11]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(0*~(~C*~(D*A))))"),
    //.LUT1("~(~B*~(1*~(~C*~(D*A))))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011001100),
    .INIT_LUT1(16'b1111111011111100),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b12 (
    .a({_al_u541_o,_al_u541_o}),
    .b({_al_u560_o,_al_u560_o}),
    .c({_al_u561_o,_al_u561_o}),
    .clk(clk_200m),
    .d({n54[4],n54[4]}),
    .mi({open_n5199,sd_state[1]}),
    .sr(rst_n_pad),
    .q({open_n5205,rd_addr[12]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUT1("((1*~A)*~((D*~C))*~(B)+(1*~A)*(D*~C)*~(B)+~((1*~A))*(D*~C)*B+(1*~A)*(D*~C)*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010001000000000),
    .INIT_LUT1(16'b0001110100010001),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b13 (
    .a({_al_u522_o,_al_u546_o}),
    .b({_al_u546_o,n53_lutinv}),
    .c({n53_lutinv,_al_u522_o}),
    .clk(clk_200m),
    .d({n54[5],n54[5]}),
    .mi({open_n5217,rd_addr[13]}),
    .sr(rst_n_pad),
    .q({open_n5223,rd_addr[13]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(0*~(~C*~(D*A))))"),
    //.LUT1("~(~B*~(1*~(~C*~(D*A))))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011001100),
    .INIT_LUT1(16'b1111111011111100),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b14 (
    .a({_al_u541_o,_al_u541_o}),
    .b({_al_u556_o,_al_u556_o}),
    .c({_al_u557_o,_al_u557_o}),
    .clk(clk_200m),
    .d({n54[6],n54[6]}),
    .mi({open_n5235,sd_state[1]}),
    .sr(rst_n_pad),
    .q({open_n5241,rd_addr[14]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUT1("((1*~B)*~((D*~C))*~(A)+(1*~B)*(D*~C)*~(A)+~((1*~B))*(D*~C)*A+(1*~B)*(D*~C)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010001000000000),
    .INIT_LUT1(16'b0001101100010001),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b17 (
    .a({_al_u546_o,_al_u546_o}),
    .b({_al_u522_o,n53_lutinv}),
    .c({n53_lutinv,_al_u522_o}),
    .clk(clk_200m),
    .d({n54[9],n54[9]}),
    .mi({open_n5253,rd_addr[17]}),
    .sr(rst_n_pad),
    .q({open_n5259,rd_addr[17]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("((0*~C)*~((D*~B))*~(A)+(0*~C)*(D*~B)*~(A)+~((0*~C))*(D*~B)*A+(0*~C)*(D*~B)*A)"),
    //.LUT1("((1*~A)*~((D*~C))*~(B)+(1*~A)*(D*~C)*~(B)+~((1*~A))*(D*~C)*B+(1*~A)*(D*~C)*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010001000000000),
    .INIT_LUT1(16'b0001110100010001),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    reg8_b18 (
    .a({_al_u522_o,_al_u546_o}),
    .b({_al_u546_o,n53_lutinv}),
    .c({n53_lutinv,_al_u522_o}),
    .clk(clk_200m),
    .d({n54[10],n54[10]}),
    .mi({open_n5271,rd_addr[18]}),
    .sr(rst_n_pad),
    .q({open_n5277,rd_addr[18]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("(0*~(C*~(D*~(B*A))))"),
    //.LUTF1("A*~B*~C*~D+A*~B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG0("(1*~(C*~(D*~(B*A))))"),
    //.LUTG1("A*~B*~C*~D+A*~B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b1010101000100010),
    .INIT_LUTG0(16'b0111111100001111),
    .INIT_LUTG1(16'b0010101000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg8_b1|reg8_b3  (
    .a({rd_addr[1],_al_u594_o}),
    .b({_al_u542_o,n53_lutinv}),
    .c({n53_lutinv,_al_u542_o}),
    .clk(clk_200m),
    .d({sd_state[1],sd_state[1]}),
    .e({_al_u594_o,rd_addr[3]}),
    .sr(rst_n_pad),
    .q({rd_addr[1],rd_addr[3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(D@(B*A))"),
    //.LUT1("(D*~((~B*A))*~(C)+D*(~B*A)*~(C)+~(D)*(~B*A)*C+D*(~B*A)*C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111011110001000),
    .INIT_LUT1(16'b0010111100100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg9_b0|reg4_b1  (
    .a({n34[0],wr_state[0]}),
    .b({wr_state[0],sd_cmd_ack}),
    .c({wr_state[1],open_n5298}),
    .ce(n81),
    .clk(clk_200m),
    .d({fifo_q[0],wr_state[1]}),
    .sr(rst_n_pad),
    .q({fifo_q[0],wr_state[1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~((~B*A))*~(C)+D*(~B*A)*~(C)+~(D)*(~B*A)*C+D*(~B*A)*C)"),
    //.LUT1("(D*~((~B*A))*~(C)+D*(~B*A)*~(C)+~(D)*(~B*A)*C+D*(~B*A)*C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010111100100000),
    .INIT_LUT1(16'b0010111100100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg9_b1|reg9_b7  (
    .a({n34[1],n34[7]}),
    .b({wr_state[0],wr_state[0]}),
    .c({wr_state[1],wr_state[1]}),
    .ce(n81),
    .clk(clk_200m),
    .d({fifo_q[1],fifo_q[7]}),
    .sr(rst_n_pad),
    .q({fifo_q[1],fifo_q[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~((~B*A))*~(C)+D*(~B*A)*~(C)+~(D)*(~B*A)*C+D*(~B*A)*C)"),
    //.LUT1("(D*~((~B*A))*~(C)+D*(~B*A)*~(C)+~(D)*(~B*A)*C+D*(~B*A)*C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0010111100100000),
    .INIT_LUT1(16'b0010111100100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg9_b2|reg9_b6  (
    .a({n34[2],n34[6]}),
    .b({wr_state[0],wr_state[0]}),
    .c({wr_state[1],wr_state[1]}),
    .ce(n81),
    .clk(clk_200m),
    .d({fifo_q[2],fifo_q[6]}),
    .sr(rst_n_pad),
    .q({fifo_q[2],fifo_q[6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_LSLICE #(
    //.LUTF0("A*~D*C*~B+A*D*C*~B+~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+A*~D*C*B+A*D*C*B"),
    //.LUTF1("A*~D*C*~B+A*D*C*~B+~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B+A*~D*C*B+A*D*C*B"),
    //.LUTG0("~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B"),
    //.LUTG1("~A*~D*~C*B+A*~D*~C*B+~A*D*~C*B+A*D*~C*B"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010110010101100),
    .INIT_LUTF1(16'b1010110010101100),
    .INIT_LUTG0(16'b0000110000001100),
    .INIT_LUTG1(16'b0000110000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg9_b3|reg9_b5  (
    .a({n34[3],n34[5]}),
    .b({fifo_q[3],fifo_q[5]}),
    .c({wr_state[1],wr_state[1]}),
    .ce(n81),
    .clk(clk_200m),
    .e({wr_state[0],wr_state[0]}),
    .sr(rst_n_pad),
    .q({fifo_q[3],fifo_q[5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.LUT0("~(0*A*C*B*D)"),
    //.LUT1("~(1*A*C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111111111),
    .INIT_LUT1(16'b0111111111111111),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    test_error_tmp_reg (
    .a({_al_u277_o,_al_u277_o}),
    .b({_al_u270_o,_al_u270_o}),
    .c({_al_u275_o,_al_u275_o}),
    .ce(u26_sel_is_2_o),
    .clk(clk_200m),
    .d({_al_u267_o,_al_u267_o}),
    .mi({open_n5381,_al_u280_o}),
    .q({open_n5388,test_error_tmp}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("M4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("INV"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    test_io_reg_DO (
    .ce(n5),
    .do({open_n5389,open_n5390,open_n5391,test_error_tmp}),
    .osclk(clk_200m),
    .opad(test_io));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add0/u0|u2_al_u0/add0/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_al_u0/add0/u0|u2_al_u0/add0/ucin  (
    .a({sd_dataout[5],1'b0}),
    .b({1'b1,open_n5404}),
    .clk(clk_200m),
    .mi({open_n5420,\u_sdram/DQIN [5]}),
    .f({\u2_al_u0/n2 [0],open_n5422}),
    .fco(\u2_al_u0/add0/c1 ),
    .q({open_n5425,sd_dataout[5]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add0/u0|u2_al_u0/add0/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add0/u2|u2_al_u0/add0/u1  (
    .a({1'b0,sd_dataout[6]}),
    .b({sd_dataout[7],1'b1}),
    .fci(\u2_al_u0/add0/c1 ),
    .f(\u2_al_u0/n2 [2:1]),
    .fco(\u2_al_u0/add0/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add0/u0|u2_al_u0/add0/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add0/ucout_al_u666  (
    .fci(\u2_al_u0/add0/c3 ),
    .f({open_n5470,\u2_al_u0/n1 }));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add1/u0|u2_al_u0/add1/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_al_u0/add1/u0|u2_al_u0/add1/ucin  (
    .a({sd_dataout[4],1'b0}),
    .b({1'b1,open_n5476}),
    .clk(clk_200m),
    .mi({open_n5492,\u_sdram/DQIN [4]}),
    .f({\u2_al_u0/n8 [0],open_n5494}),
    .fco(\u2_al_u0/add1/c1 ),
    .q({open_n5497,sd_dataout[4]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add1/u0|u2_al_u0/add1/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add1/u2|u2_al_u0/add1/u1  (
    .a(2'b01),
    .b({\u2_al_u0/n5 ,\u2_al_u0/n6 }),
    .fci(\u2_al_u0/add1/c1 ),
    .f(\u2_al_u0/n8 [2:1]),
    .fco(\u2_al_u0/add1/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add1/u0|u2_al_u0/add1/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add1/u3_al_u667  (
    .a({open_n5520,\u2_al_u0/n4 }),
    .b({open_n5521,1'b0}),
    .fci(\u2_al_u0/add1/c3 ),
    .f({open_n5540,\u2_al_u0/n8 [3]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add2/u0|u2_al_u0/add2/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_al_u0/add2/u0|u2_al_u0/add2/ucin  (
    .a({sd_dataout[3],1'b0}),
    .b({1'b1,open_n5546}),
    .clk(clk_200m),
    .mi({open_n5562,\u_sdram/DQIN [3]}),
    .f({\u2_al_u0/n14 [0],open_n5564}),
    .fco(\u2_al_u0/add2/c1 ),
    .q({open_n5567,sd_dataout[3]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add2/u0|u2_al_u0/add2/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add2/u2|u2_al_u0/add2/u1  (
    .a({1'b0,\u2_al_u0/n12 }),
    .b({\u2_al_u0/n11 ,1'b1}),
    .fci(\u2_al_u0/add2/c1 ),
    .f(\u2_al_u0/n14 [2:1]),
    .fco(\u2_al_u0/add2/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add2/u0|u2_al_u0/add2/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add2/u3_al_u668  (
    .a({open_n5590,\u2_al_u0/n10 }),
    .b({open_n5591,1'b0}),
    .fci(\u2_al_u0/add2/c3 ),
    .f({open_n5610,\u2_al_u0/n14 [3]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add3/u0|u2_al_u0/add3/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_al_u0/add3/u0|u2_al_u0/add3/ucin  (
    .a({sd_dataout[2],1'b0}),
    .b({1'b1,open_n5616}),
    .clk(clk_200m),
    .mi({open_n5632,\u_sdram/DQIN [2]}),
    .f({\u2_al_u0/n19 [0],open_n5634}),
    .fco(\u2_al_u0/add3/c1 ),
    .q({open_n5637,sd_dataout[2]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add3/u0|u2_al_u0/add3/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add3/u2|u2_al_u0/add3/u1  (
    .a(2'b01),
    .b(\u2_al_u0/n17 ),
    .fci(\u2_al_u0/add3/c1 ),
    .f(\u2_al_u0/n19 [2:1]),
    .fco(\u2_al_u0/add3/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add3/u0|u2_al_u0/add3/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add3/u3_al_u669  (
    .a({open_n5660,1'b0}),
    .b({open_n5661,\u2_al_u0/n16 }),
    .fci(\u2_al_u0/add3/c3 ),
    .f({open_n5680,\u2_al_u0/n19 [3]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add4/u0|u2_al_u0/add4/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add4/u0|u2_al_u0/add4/ucin  (
    .a({\u2_al_u0/n15 ,1'b0}),
    .b({1'b1,open_n5686}),
    .f({\u2_al_u0/n24 [0],open_n5706}),
    .fco(\u2_al_u0/add4/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add4/u0|u2_al_u0/add4/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add4/u2|u2_al_u0/add4/u1  (
    .a({\u2_al_u0/n3 ,1'b1}),
    .b({1'b0,\u2_al_u0/n9 }),
    .fci(\u2_al_u0/add4/c1 ),
    .f(\u2_al_u0/n24 [2:1]),
    .fco(\u2_al_u0/add4/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add4/u0|u2_al_u0/add4/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add4/ucout_al_u670  (
    .fci(\u2_al_u0/add4/c3 ),
    .f({open_n5755,\u2_al_u0/n23 }));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add5/u0|u2_al_u0/add5/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_al_u0/add5/u0|u2_al_u0/add5/ucin  (
    .a({sd_dataout[1],1'b0}),
    .b({1'b1,open_n5761}),
    .clk(clk_200m),
    .mi({open_n5777,\u_sdram/DQIN [1]}),
    .f({\u2_al_u0/n27 [0],open_n5779}),
    .fco(\u2_al_u0/add5/c1 ),
    .q({open_n5782,sd_dataout[1]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add5/u0|u2_al_u0/add5/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add5/u2|u2_al_u0/add5/u1  (
    .a(\u2_al_u0/n21 [1:0]),
    .b(2'b01),
    .fci(\u2_al_u0/add5/c1 ),
    .f(\u2_al_u0/n27 [2:1]),
    .fco(\u2_al_u0/add5/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add5/u0|u2_al_u0/add5/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add5/u3_al_u671  (
    .a({open_n5805,\u2_al_u0/n21 [2]}),
    .b({open_n5806,1'b0}),
    .fci(\u2_al_u0/add5/c3 ),
    .f({open_n5825,\u2_al_u0/n27 [3]}));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add6/u0|u2_al_u0/add6/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add6/u0|u2_al_u0/add6/ucin  (
    .a({\u2_al_u0/n20 ,1'b0}),
    .b({1'b1,open_n5831}),
    .f({\u2_al_u0/n29 [0],open_n5851}),
    .fco(\u2_al_u0/add6/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add6/u0|u2_al_u0/add6/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add6/u2|u2_al_u0/add6/u1  (
    .a({1'b0,\u2_al_u0/n25 [0]}),
    .b({\u2_al_u0/n25 [1],1'b1}),
    .fci(\u2_al_u0/add6/c1 ),
    .f(\u2_al_u0/n29 [2:1]),
    .fco(\u2_al_u0/add6/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u2_al_u0/add6/u0|u2_al_u0/add6/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u2_al_u0/add6/u3_al_u672  (
    .a({open_n5878,1'b0}),
    .b({open_n5879,\u2_al_u0/n25 [2]}),
    .fci(\u2_al_u0/add6/c3 ),
    .f({open_n5898,\u2_al_u0/n29 [3]}));
  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
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
    \u_sdram/reg1_b0|u_sdram/reg1_b5  (
    .clk(clk_200m),
    .mi({SD_DQ[0],SD_DQ[5]}),
    .q({\u_sdram/DQIN [0],\u_sdram/DQIN [5]}));  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
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
    \u_sdram/reg1_b1|u_sdram/reg1_b4  (
    .clk(clk_200m),
    .mi({SD_DQ[1],SD_DQ[4]}),
    .q({\u_sdram/DQIN [1],\u_sdram/DQIN [4]}));  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
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
    \u_sdram/reg1_b2|u_sdram/reg1_b3  (
    .clk(clk_200m),
    .mi({SD_DQ[2],SD_DQ[3]}),
    .q({\u_sdram/DQIN [2],\u_sdram/DQIN [3]}));  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
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
    \u_sdram/reg1_b6|u_sdram/reg1_b7  (
    .clk(clk_200m),
    .mi({SD_DQ[6],SD_DQ[7]}),
    .q({\u_sdram/DQIN [6],\u_sdram/DQIN [7]}));  // ../sdr_sdram.v(88)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_sdram/reg2_b0  (
    .clk(clk_200m),
    .mi({open_n6024,\u_sdram/DQIN [0]}),
    .q({open_n6042,sd_dataout[0]}));  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
  // ../sdr_sdram.v(88)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~D*~(~C*~A)))"),
    //.LUT1("(C*~(~D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110000000100),
    .INIT_LUT1(16'b1111000010100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_sdram/reg2_b7|u_sdram/reg2_b6  (
    .a({sd_dataout[5],sd_dataout[5]}),
    .b({open_n6043,sd_dataout[7]}),
    .c(sd_dataout[7:6]),
    .clk(clk_200m),
    .d({sd_dataout[6],\u2_al_u0/n2 [2]}),
    .mi(\u_sdram/DQIN [7:6]),
    .f({\u2_al_u0/n0_lutinv ,\u2_al_u0/n4 }),
    .q(sd_dataout[7:6]));  // ../sdr_sdram.v(88)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("SET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/CS_N_reg  (
    .clk(clk_200m),
    .mi({open_n6078,1'b0}),
    .sr(rst_n_pad),
    .q({open_n6084,\u_sdram/ICS_N }));  // ../Command.v(271)
  // ../Command.v(271)
  // ../Command.v(141)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~D*~C+~A*~B*~D*C"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*~C*D+A*B*~C*D"),
    //.LUTG0("0"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000010001),
    .INIT_LUTF1(16'b0000101000001010),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/do_load_mode_reg|u_sdram/ux_command/WE_N_reg  (
    .a({\u_sdram/load_mode ,_al_u368_o}),
    .b({open_n6085,\u_sdram/ux_command/bankclose }),
    .c({\u_sdram/ux_command/do_load_mode ,open_n6086}),
    .clk(clk_200m),
    .d({open_n6088,\u_sdram/ux_command/do_load_mode }),
    .e({\u_sdram/ux_command/command_done ,\u_sdram/ux_command/do_precharge }),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/do_load_mode ,\u_sdram/IWE_N }));  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D*~A)"),
    //.LUT1("(D*~A*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001010000),
    .INIT_LUT1(16'b0001000100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/do_precharge_reg|u_sdram/ux_control/PRECHARGE_reg  (
    .a({\u_sdram/ux_command/do_precharge ,sd_cmd[0]}),
    .b({\u_sdram/ux_command/command_done ,open_n6108}),
    .c({open_n6109,sd_cmd[2]}),
    .clk(clk_200m),
    .d({\u_sdram/precharge ,sd_cmd[1]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/do_precharge ,\u_sdram/precharge }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~B*A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000100010),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/do_reada_reg|u_sdram/ux_control/READA_reg  (
    .a({\u_sdram/ux_command/command_done ,sd_cmd[0]}),
    .b({\u_sdram/ux_command/do_reada ,sd_cmd[1]}),
    .c({\u_sdram/ux_command/rp_done ,open_n6128}),
    .clk(clk_200m),
    .d({\u_sdram/reada ,sd_cmd[2]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/do_reada ,\u_sdram/reada }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // ../Command.v(271)
  // ../Command.v(183)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~B*~(~C*~(0*~A)))"),
    //.LUTF1("~(~A*~((~B*~(~0*C)))*~(D)+~A*(~B*~(~0*C))*~(D)+~(~A)*(~B*~(~0*C))*D+~A*(~B*~(~0*C))*D)"),
    //.LUTG0("~(~D*~B*~(~C*~(1*~A)))"),
    //.LUTG1("~(~A*~((~B*~(~1*C)))*~(D)+~A*(~B*~(~1*C))*~(D)+~(~A)*(~B*~(~1*C))*D+~A*(~B*~(~1*C))*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111001111),
    .INIT_LUTF1(16'b1111110010101010),
    .INIT_LUTG0(16'b1111111111001110),
    .INIT_LUTG1(16'b1100110010101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/do_rw_reg|u_sdram/ux_command/CAS_N_reg  (
    .a({\u_sdram/ux_command/rw_shift [0],\u_sdram/ux_command/n17 }),
    .b({\u_sdram/ux_command/do_rw ,\u_sdram/ux_command/bankclose }),
    .c({\u_sdram/sc_rc [0],\u_sdram/ux_command/do_load_mode }),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/n17 ,\u_sdram/ux_command/do_precharge }),
    .e({\u_sdram/sc_rc [1],\u_sdram/ux_command/do_rw }),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/do_rw ,\u_sdram/ICAS_N }));  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // ../Command.v(141)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("~A*~C*~B*D+~A*~C*B*D"),
    //.LUTG0("~A*~C*~B*~D+~A*C*~B*~D+~A*~C*~B*D+~A*C*~B*D"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000010100000000),
    .INIT_LUTG0(16'b0001000100010001),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/do_writea_reg|u_sdram/ux_control/WRITEA_reg  (
    .a({\u_sdram/ux_command/rp_done ,sd_cmd[0]}),
    .b({open_n6167,sd_cmd[2]}),
    .c({\u_sdram/ux_command/do_writea ,open_n6168}),
    .clk(clk_200m),
    .d({\u_sdram/writea ,open_n6170}),
    .e({\u_sdram/ux_command/command_done ,sd_cmd[1]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/do_writea ,\u_sdram/writea }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/oe1_reg  (
    .b({open_n6192,\u_sdram/ux_command/do_precharge }),
    .ce(_al_n0_en),
    .clk(clk_200m),
    .d({open_n6195,\u_sdram/ux_command/n17 }),
    .mi({open_n6206,\u_sdram/ux_command/do_writea }),
    .sr(rst_n_pad),
    .f({open_n6207,_al_n0_en}),
    .q({open_n6211,\u_sdram/ux_command/oe1 }));  // ../Command.v(157)
  // ../Command.v(271)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(~C*~D))"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011001111),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg0_b0|u_sdram/ux_command/RAS_N_reg  (
    .b({open_n6214,\u_sdram/ux_command/n61 }),
    .c({\u_sdram/ux_command/command_delay [1],\u_sdram/ux_command/bankclose }),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/n19 ,\u_sdram/ux_command/n19 }),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/command_delay [0],\u_sdram/IRAS_N }));  // ../Command.v(271)
  // ../Command.v(141)
  // ../Command.v(141)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTF1("~(~D*~C)"),
    //.LUTG0("~A*~B*~D*~C+A*~B*~D*~C+~A*B*~D*~C+A*B*~D*~C+~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C+~A*~B*~D*C+A*~B*~D*C+~A*B*~D*C+A*B*~D*C+~A*~B*D*C+A*~B*D*C+~A*B*D*C+A*B*D*C"),
    //.LUTG1("~(~D*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1111111111110000),
    .INIT_LUTG0(16'b1111111111111111),
    .INIT_LUTG1(16'b1111111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg0_b2|u_sdram/ux_command/reg0_b3  (
    .c({\u_sdram/ux_command/n19 ,\u_sdram/ux_command/n19 }),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/command_delay [3],open_n6238}),
    .e({open_n6239,\u_sdram/ux_command/command_delay [4]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/command_delay [2],\u_sdram/ux_command/command_delay [3]}));  // ../Command.v(141)
  // ../Command.v(141)
  // ../Command.v(141)
  EG_PHY_LSLICE #(
    //.LUTF0("~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    //.LUTF1("~(~D*~A)"),
    //.LUTG0("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A+~D*~B*C*~A+D*~B*C*~A+~D*B*C*~A+D*B*C*~A+~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    //.LUTG1("~(~D*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101010101010),
    .INIT_LUTF1(16'b1111111110101010),
    .INIT_LUTG0(16'b1111111111111111),
    .INIT_LUTG1(16'b1111111110101010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg0_b4|u_sdram/ux_command/reg0_b5  (
    .a({\u_sdram/ux_command/n19 ,\u_sdram/ux_command/n19 }),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/command_delay [5],open_n6264}),
    .e({open_n6265,\u_sdram/ux_command/command_delay [6]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/command_delay [4],\u_sdram/ux_command/command_delay [5]}));  // ../Command.v(141)
  // ../Command.v(199)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("~(~D*~C*~B*~A)"),
    //.LUT1("~(~D*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111111110),
    .INIT_LUT1(16'b1111111110101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg0_b6|u_sdram/ux_command/CM_ACK_reg  (
    .a({\u_sdram/ux_command/n19 ,\u_sdram/ux_command/do_load_mode }),
    .b({open_n6285,\u_sdram/ux_command/do_precharge }),
    .c({open_n6286,\u_sdram/ux_command/do_reada }),
    .clk(clk_200m),
    .d({\u_sdram/cm_ack ,\u_sdram/ux_command/do_writea }),
    .sr(rst_n_pad),
    .f({open_n6300,\u_sdram/ux_command/n19 }),
    .q({\u_sdram/ux_command/command_delay [6],\u_sdram/cm_ack }));  // ../Command.v(199)
  // ../Command.v(141)
  // ../Command.v(141)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~A)"),
    //.LUTF1("~(~C*~A)"),
    //.LUTG0("(D*~A)"),
    //.LUTG1("~(~C*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101010100000000),
    .INIT_LUTF1(16'b1111101011111010),
    .INIT_LUTG0(16'b0101010100000000),
    .INIT_LUTG1(16'b1111101011111010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg1_b0|u_sdram/ux_command/rp_done_reg  (
    .a({\u_sdram/ux_command/n24 ,\u_sdram/ux_command/n24 }),
    .c({\u_sdram/ux_command/rp_shift [1],open_n6306}),
    .clk(clk_200m),
    .d({open_n6308,\u_sdram/ux_command/rp_shift [0]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/rp_shift [0],\u_sdram/ux_command/rp_done }));  // ../Command.v(141)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("~(~D*~(C*B*A))"),
    //.LUT1("~(~C*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111110000000),
    .INIT_LUT1(16'b1111110011111100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg1_b1|test_error_reg  (
    .a({open_n6330,_al_u435_o}),
    .b({\u_sdram/ux_command/n24 ,_al_u436_o}),
    .c({\u_sdram/ux_command/rp_shift [2],_al_u437_o}),
    .clk(clk_200m),
    .d({open_n6332,test_error_led_pad}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/rp_shift [1],test_error_led_pad}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(131)
  // ../Command.v(141)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~D)"),
    //.LUT1("~(~C*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111001100),
    .INIT_LUT1(16'b1111101011111010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg1_b2|u_sdram/ux_command/reg0_b1  (
    .a({\u_sdram/ux_command/n24 ,open_n6350}),
    .b({open_n6351,\u_sdram/ux_command/command_delay [2]}),
    .c({\u_sdram/ux_command/rp_shift [3],open_n6352}),
    .clk(clk_200m),
    .d({open_n6354,\u_sdram/ux_command/n19 }),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_command/rp_shift [2],\u_sdram/ux_command/command_delay [1]}));  // ../Command.v(141)
  // ../Command.v(141)
  // ../Command.v(141)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~A)"),
    //.LUT1("(~D*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111011101110),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg1_b3|u_sdram/ux_command/command_done_reg  (
    .a({open_n6372,\u_sdram/ux_command/n19 }),
    .b({open_n6373,\u_sdram/ux_command/command_delay [0]}),
    .c({\u_sdram/ux_command/command_done ,open_n6374}),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/command_delay [0],open_n6376}),
    .sr(rst_n_pad),
    .f({\u_sdram/ux_command/n24 ,open_n6389}),
    .q({\u_sdram/ux_command/rp_shift [3],\u_sdram/ux_command/command_done }));  // ../Command.v(141)
  // ../Command.v(183)
  // ../Command.v(183)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~((~B*~(C)*~(0)+~B*C*~(0)+~(~B)*C*0+~B*C*0))*~(A)+~D*(~B*~(C)*~(0)+~B*C*~(0)+~(~B)*C*0+~B*C*0)*~(A)+~(~D)*(~B*~(C)*~(0)+~B*C*~(0)+~(~B)*C*0+~B*C*0)*A+~D*(~B*~(C)*~(0)+~B*C*~(0)+~(~B)*C*0+~B*C*0)*A)"),
    //.LUTF1("D*A*~B*~C+D*A*B*~C+D*A*~B*C+D*A*B*C"),
    //.LUTG0("~(~D*~((~B*~(C)*~(1)+~B*C*~(1)+~(~B)*C*1+~B*C*1))*~(A)+~D*(~B*~(C)*~(1)+~B*C*~(1)+~(~B)*C*1+~B*C*1)*~(A)+~(~D)*(~B*~(C)*~(1)+~B*C*~(1)+~(~B)*C*1+~B*C*1)*A+~D*(~B*~(C)*~(1)+~B*C*~(1)+~(~B)*C*1+~B*C*1)*A)"),
    //.LUTG1("D*~A*B*~C+D*A*B*~C+D*~A*B*C+D*A*B*C"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1101110110001000),
    .INIT_LUTF1(16'b1010101000000000),
    .INIT_LUTG0(16'b0101111100001010),
    .INIT_LUTG1(16'b1100110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg2_b1|u_sdram/ux_command/reg2_b0  (
    .a({\u_sdram/ux_command/rw_shift [1],\u_sdram/ux_command/n17 }),
    .b({\u_sdram/sc_rc [0],\u_sdram/ux_command/rw_shift [0]}),
    .c({open_n6393,\u_sdram/sc_rc [0]}),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/n17 ,\u_sdram/ux_command/rw_shift [1]}),
    .e({\u_sdram/sc_rc [1],\u_sdram/sc_rc [1]}),
    .sr(rst_n_pad),
    .q(\u_sdram/ux_command/rw_shift [1:0]));  // ../Command.v(183)
  // ../Command.v(271)
  // ../Command.v(271)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D"),
    //.LUTF1("~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG1("~A*~B*~C*~D+A*~B*~C*~D+~A*B*~C*~D+A*B*~C*~D+~A*~B*~C*D+A*~B*~C*D+~A*B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b1111111100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg3_b0|u_sdram/ux_command/reg3_b3  (
    .c({\u_sdram/ux_command/n17 ,\u_sdram/saddr [3]}),
    .clk(clk_200m),
    .d({\u_sdram/saddr [8],\u_sdram/ux_command/n17 }),
    .e({\u_sdram/saddr [0],\u_sdram/saddr [11]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ISA [0],\u_sdram/ISA [3]}));  // ../Command.v(271)
  // ../Command.v(271)
  // ../Command.v(271)
  EG_PHY_LSLICE #(
    //.LUTF0("((C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*~(0)*~(B)+(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*0*~(B)+~((C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))*0*B+(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*0*B)"),
    //.LUTF1("~A*C*~B*~D+A*C*~B*~D+~A*C*B*~D+A*C*B*~D"),
    //.LUTG0("((C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*~(1)*~(B)+(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*1*~(B)+~((C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))*1*B+(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)*1*B)"),
    //.LUTG1("~A*C*~B*~D+A*C*~B*~D+~A*C*B*~D+A*C*B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D+~A*~C*B*D+A*~C*B*D+~A*C*B*D+A*C*B*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111111011011100),
    .INIT_LUTG1(16'b1111111111110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg3_b1|u_sdram/ux_command/reg3_b9  (
    .a({open_n6438,\u_sdram/ux_command/n17 }),
    .b({open_n6439,\u_sdram/ux_command/do_load_mode }),
    .c({\u_sdram/saddr [1],\u_sdram/ISA [9]}),
    .clk(clk_200m),
    .d({\u_sdram/ux_command/n17 ,\u_sdram/saddr [17]}),
    .e({\u_sdram/saddr [9],\u_sdram/saddr [9]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ISA [1],\u_sdram/ISA [9]}));  // ../Command.v(271)
  // ../Command.v(271)
  // ../Command.v(271)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    //.LUT1("(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1101100011011000),
    .INIT_LUT1(16'b1111101001010000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg3_b4|u_sdram/ux_command/reg3_b2  (
    .a({\u_sdram/ux_command/n17 ,\u_sdram/ux_command/n17 }),
    .b({open_n6460,\u_sdram/saddr [10]}),
    .c({\u_sdram/saddr [4],\u_sdram/saddr [2]}),
    .clk(clk_200m),
    .d({\u_sdram/saddr [12],open_n6462}),
    .sr(rst_n_pad),
    .q({\u_sdram/ISA [4],\u_sdram/ISA [2]}));  // ../Command.v(271)
  // ../Command.v(271)
  // ../Command.v(271)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D)"),
    //.LUT1("(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110010101010),
    .INIT_LUT1(16'b1111101001010000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg3_b5|u_sdram/ux_command/reg3_b7  (
    .a({\u_sdram/ux_command/n17 ,\u_sdram/saddr [7]}),
    .b({open_n6480,\u_sdram/saddr [15]}),
    .c({\u_sdram/saddr [5],open_n6481}),
    .clk(clk_200m),
    .d({\u_sdram/saddr [13],\u_sdram/ux_command/n17 }),
    .sr(rst_n_pad),
    .q({\u_sdram/ISA [5],\u_sdram/ISA [7]}));  // ../Command.v(271)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1110111011101110),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg3_b8  (
    .a({open_n6500,\u_sdram/ux_command/do_reada }),
    .b({open_n6501,\u_sdram/ux_command/do_writea }),
    .ce(\u_sdram/ux_command/n17 ),
    .clk(clk_200m),
    .mi({open_n6516,\u_sdram/saddr [16]}),
    .sr(rst_n_pad),
    .f({open_n6517,\u_sdram/ux_command/n17 }),
    .q({open_n6521,\u_sdram/ISA [8]}));  // ../Command.v(271)
  // ../Command.v(271)
  // ../Command.v(271)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~C)"),
    //.LUT1("(C*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000001100),
    .INIT_LUT1(16'b0011000000110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/reg4_b0|u_sdram/ux_command/reg4_b1  (
    .b({\u_sdram/ux_command/do_load_mode ,\u_sdram/saddr [20]}),
    .c({\u_sdram/saddr [19],\u_sdram/ux_command/do_load_mode }),
    .clk(clk_200m),
    .sr(rst_n_pad),
    .q({\u_sdram/IBA [0],\u_sdram/IBA [1]}));  // ../Command.v(271)
  EG_PHY_LSLICE #(
    //.LUTF0("~C*B*~A*~D+~C*B*A*~D"),
    //.LUTG0("0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000001100),
    .INIT_LUTG0(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_command/rw_flag_reg  (
    .b({open_n6546,\u_sdram/ux_command/do_rw }),
    .c({open_n6547,\u_sdram/ux_command/do_reada }),
    .ce(\u_sdram/ux_command/n19 ),
    .clk(clk_200m),
    .d({open_n6548,\u_sdram/ux_command/rw_flag }),
    .e({open_n6549,\u_sdram/ux_command/do_writea }),
    .mi({open_n6551,\u_sdram/ux_command/do_reada }),
    .sr(rst_n_pad),
    .f({open_n6563,_al_u368_o}),
    .q({open_n6567,\u_sdram/ux_command/rw_flag }));  // ../Command.v(141)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0010000000100000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/LOAD_MODE_reg|u_sdram/ux_control/LOAD_REG1_reg  (
    .a({sd_cmd[0],sd_cmd[0]}),
    .b({sd_cmd[1],sd_cmd[1]}),
    .c({sd_cmd[2],sd_cmd[2]}),
    .clk(clk_200m),
    .d({open_n6569,\u_sdram/ux_control/LOAD_REG1 }),
    .sr(rst_n_pad),
    .q({\u_sdram/load_mode ,\u_sdram/ux_control/LOAD_REG1 }));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(133)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~D*~C*~A))"),
    //.LUT1("(~A*C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001100110010),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/LOAD_REG2_reg|u_sdram/ux_control/CMD_ACK_int_reg  (
    .a({\u_sdram/ux_control/LOAD_REG2 ,\u_sdram/cm_ack }),
    .b({sd_cmd[1],sd_cmd_ack}),
    .c({sd_cmd[2],\u_sdram/ux_control/LOAD_REG1 }),
    .clk(clk_200m),
    .d({sd_cmd[0],\u_sdram/ux_control/LOAD_REG2 }),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_control/LOAD_REG2 ,sd_cmd_ack}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(133)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~0*B)*~(~A*~D))"),
    //.LUT1("(~C*~(~1*B)*~(~D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000010),
    .INIT_LUT1(16'b0000111100001010),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b0|reg6_b0  (
    .a({_al_u401_o,sd_addr[0]}),
    .b({_al_u404_o,_al_u404_o}),
    .c({_al_u432_o,_al_u432_o}),
    .clk(clk_200m),
    .d({sd_addr[0],_al_u401_o}),
    .mi({sd_addr[0],wr_addr[0]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [0],sd_addr[0]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
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
    \u_sdram/ux_control/reg0_b12|u_sdram/ux_control/reg0_b6  (
    .clk(clk_200m),
    .mi({sd_addr[12],sd_addr[6]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [12],\u_sdram/saddr [6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
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
    \u_sdram/ux_control/reg0_b13|u_sdram/ux_control/reg0_b5  (
    .clk(clk_200m),
    .mi({sd_addr[13],sd_addr[5]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [13],\u_sdram/saddr [5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
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
    \u_sdram/ux_control/reg0_b14|u_sdram/ux_control/reg0_b20  (
    .clk(clk_200m),
    .mi({sd_addr[14],sd_addr[20]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [14],\u_sdram/saddr [20]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
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
    \u_sdram/ux_control/reg0_b15|u_sdram/ux_control/reg0_b19  (
    .clk(clk_200m),
    .mi({sd_addr[15],sd_addr[19]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [15],\u_sdram/saddr [19]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
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
    \u_sdram/ux_control/reg0_b16|u_sdram/ux_control/reg0_b17  (
    .clk(clk_200m),
    .mi({sd_addr[16],sd_addr[17]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [16],\u_sdram/saddr [17]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~(~B*(D*~(0)*~(A)+D*0*~(A)+~(D)*0*A+D*0*A)))"),
    //.LUT1("~(~B*~(~C*(D*~(1)*~(A)+D*1*~(A)+~(D)*1*A+D*1*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000111110000),
    .INIT_LUT1(16'b1100111111001110),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b18|u_sdram/ux_command/reg3_b10  (
    .a({\u_sdram/ux_command/n17 ,\u_sdram/ux_command/n17 }),
    .b({\u_sdram/ux_command/do_load_mode ,\u_sdram/ux_command/bankclose }),
    .c({\u_sdram/ux_command/bankclose ,\u_sdram/ux_command/do_load_mode }),
    .clk(clk_200m),
    .d({\u_sdram/ISA [10],\u_sdram/ISA [10]}),
    .mi({sd_addr[18],\u_sdram/saddr [18]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [18],\u_sdram/ISA [10]}));  // ../Command.v(271)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("(~(C)*B*~(A)*~(D)*~(0)+~(C)*~(B)*A*~(D)*~(0)+C*~(B)*A*~(D)*~(0)+~(C)*B*A*~(D)*~(0)+C*B*A*~(D)*~(0)+~(C)*B*~(A)*D*~(0)+~(C)*B*A*D*~(0)+~(C)*B*~(A)*~(D)*0+~(C)*~(B)*A*~(D)*0+C*~(B)*A*~(D)*0+~(C)*B*A*~(D)*0+C*B*A*~(D)*0+~(C)*~(B)*~(A)*D*0+C*~(B)*~(A)*D*0+~(C)*B*~(A)*D*0+~(C)*~(B)*A*D*0+C*~(B)*A*D*0+~(C)*B*A*D*0)"),
    //.LUT1("(~(A)*C*~(D)*~(B)*~(1)+~(A)*~(C)*D*~(B)*~(1)+A*~(C)*D*~(B)*~(1)+~(A)*C*D*~(B)*~(1)+A*C*D*~(B)*~(1)+~(A)*C*~(D)*B*~(1)+~(A)*C*D*B*~(1)+~(A)*C*~(D)*~(B)*1+~(A)*~(C)*D*~(B)*1+A*~(C)*D*~(B)*1+~(A)*C*D*~(B)*1+A*C*D*~(B)*1+~(A)*~(C)*~(D)*B*1+A*~(C)*~(D)*B*1+~(A)*C*~(D)*B*1+~(A)*~(C)*D*B*1+A*~(C)*D*B*1+~(A)*C*D*B*1)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110010101110),
    .INIT_LUT1(16'b0111111101011100),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b1|reg6_b1  (
    .a({_al_u398_o,sd_addr[1]}),
    .b({_al_u401_o,_al_u381_o}),
    .c({_al_u381_o,_al_u398_o}),
    .clk(clk_200m),
    .d({sd_addr[1],_al_u401_o}),
    .mi({sd_addr[1],rd_addr[1]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [1],sd_addr[1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~0*B)*~(~A*~D))"),
    //.LUT1("(~C*~(~1*B)*~(~D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000001100000010),
    .INIT_LUT1(16'b0000111100001010),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b2|reg6_b2  (
    .a({_al_u401_o,sd_addr[2]}),
    .b({_al_u404_o,_al_u404_o}),
    .c({_al_u412_o,_al_u412_o}),
    .clk(clk_200m),
    .d({sd_addr[2],_al_u401_o}),
    .mi({sd_addr[2],wr_addr[2]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [2],sd_addr[2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(0*C)*~(A*~D))"),
    //.LUT1("~(~B*~(1*C)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011101110),
    .INIT_LUT1(16'b1111110111111100),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b7|reg6_b7  (
    .a({_al_u401_o,sd_addr[7]}),
    .b({_al_u406_o,_al_u406_o}),
    .c({_al_u404_o,_al_u404_o}),
    .clk(clk_200m),
    .d({sd_addr[7],_al_u401_o}),
    .mi({sd_addr[7],wr_addr[7]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [7],sd_addr[7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(94)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(0*C)*~(A*~D))"),
    //.LUT1("~(~B*~(1*C)*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011101110),
    .INIT_LUT1(16'b1111110111111100),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG0_REGSET("RESET"),
    .REG0_SD("FX"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_control/reg0_b9|reg6_b9  (
    .a({_al_u401_o,sd_addr[9]}),
    .b({_al_u403_o,_al_u403_o}),
    .c({_al_u404_o,_al_u404_o}),
    .clk(clk_200m),
    .d({sd_addr[9],_al_u401_o}),
    .mi({sd_addr[9],wr_addr[9]}),
    .sr(rst_n_pad),
    .q({\u_sdram/saddr [9],sd_addr[9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_control.v(299)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
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
    \u_sdram/ux_control/reg2_b0|u_sdram/ux_control/reg2_b1  (
    .ce(\u_sdram/ux_control/LOAD_REG1 ),
    .clk(clk_200m),
    .mi({\u_sdram/saddr [2],\u_sdram/saddr [3]}),
    .sr(rst_n_pad),
    .q({\u_sdram/sc_rc [0],\u_sdram/sc_rc [1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/control_interface.v(117)
  // ../Command.v(157)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg0_b0|u_sdram/ux_command/OE_reg  (
    .clk(clk_200m),
    .mi({\u_sdram/ux_data_path/DIN1 [0],\u_sdram/ux_command/oe1 }),
    .sr(rst_n_pad),
    .q({\u_sdram/DQOUT [0],\u_sdram/oe }));  // ../Command.v(157)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(0*D*C*B))"),
    //.LUT1("(A*~(1*B*C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1010101010101010),
    .INIT_LUT1(16'b0010101010101010),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_data_path/reg0_b10|_al_u573  (
    .a({_al_u571_o,_al_u571_o}),
    .b({_al_u441_o,_al_u439_o}),
    .c({_al_u572_o,_al_u572_o}),
    .clk(clk_200m),
    .d({_al_u439_o,_al_u441_o}),
    .mi({\u_sdram/ux_data_path/DIN1 [10],wr_state[1]}),
    .sr(rst_n_pad),
    .fx({open_n6902,_al_u573_o}),
    .q({\u_sdram/DQOUT [10],open_n6903}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(0*~(D*B*A)))"),
    //.LUT1("(~C*~(1*~(A*D*B)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000111100001111),
    .INIT_LUT1(16'b0000100000000000),
    .MODE("LOGIC"),
    .MSFXMUX("ON"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \u_sdram/ux_data_path/reg1_b10|_al_u580  (
    .a({_al_u441_o,_al_u439_o}),
    .b({_al_u439_o,_al_u572_o}),
    .c({_al_u579_o,_al_u579_o}),
    .clk(clk_200m),
    .d({_al_u572_o,_al_u441_o}),
    .mi({fifo_q[2],wr_state[1]}),
    .sr(rst_n_pad),
    .fx({open_n6918,_al_u580_o}),
    .q({\u_sdram/ux_data_path/DIN1 [10],open_n6919}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b11|u_sdram/ux_data_path/reg0_b11  (
    .clk(clk_200m),
    .mi({fifo_q[3],\u_sdram/ux_data_path/DIN1 [11]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [11],\u_sdram/DQOUT [11]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b12|u_sdram/ux_data_path/reg0_b12  (
    .clk(clk_200m),
    .mi({fifo_q[4],\u_sdram/ux_data_path/DIN1 [12]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [12],\u_sdram/DQOUT [12]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b13|u_sdram/ux_data_path/reg0_b13  (
    .clk(clk_200m),
    .mi({fifo_q[5],\u_sdram/ux_data_path/DIN1 [13]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [13],\u_sdram/DQOUT [13]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b14|u_sdram/ux_data_path/reg0_b14  (
    .clk(clk_200m),
    .mi({fifo_q[6],\u_sdram/ux_data_path/DIN1 [14]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [14],\u_sdram/DQOUT [14]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b15|u_sdram/ux_data_path/reg0_b15  (
    .clk(clk_200m),
    .mi({fifo_q[7],\u_sdram/ux_data_path/DIN1 [15]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [15],\u_sdram/DQOUT [15]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
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
    \u_sdram/ux_data_path/reg1_b1|u_sdram/ux_data_path/reg0_b1  (
    .clk(clk_200m),
    .mi({fifo_q[1],\u_sdram/ux_data_path/DIN1 [1]}),
    .sr(rst_n_pad),
    .q({\u_sdram/ux_data_path/DIN1 [1],\u_sdram/DQOUT [1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdr_data_path.v(30)
  EG_PHY_GCLK \u_sys_pll/bufg_feedback  (
    .clki(\u_sys_pll/clk0_buf ),
    .clko(clk_200m));  // al_ip/pll1.v(33)
  EG_PHY_PLL #(
    //.RID("0X0100"),
    //.WID("0X0100"),
    .CLKC0_CPHASE(4),
    .CLKC0_DIV(5),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(5),
    .CLKC1_DIV(5),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(2),
    .CLKC2_CPHASE(1),
    .CLKC2_DIV(1),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("DISABLE"),
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
    .FBCLK_DIV(8),
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
    .PLLRST_ENA("DISABLE"),
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
    \u_sys_pll/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk_200m),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(CLKIN_pad),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n7076,open_n7077,open_n7078,sd_clk_int,\u_sys_pll/clk0_buf }));  // al_ip/pll1.v(60)
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u11_al_u636  (
    .a({\ux_seg/cnt [13],\ux_seg/cnt [11]}),
    .b({\ux_seg/cnt [14],\ux_seg/cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add0/c11 ),
    .f({\ux_seg/n2 [13],\ux_seg/n2 [11]}),
    .fco(\ux_seg/add0/c15 ),
    .fx({\ux_seg/n2 [14],\ux_seg/n2 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u15_al_u637  (
    .a({\ux_seg/cnt [17],\ux_seg/cnt [15]}),
    .b({\ux_seg/cnt [18],\ux_seg/cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add0/c15 ),
    .f({\ux_seg/n2 [17],\ux_seg/n2 [15]}),
    .fco(\ux_seg/add0/c19 ),
    .fx({\ux_seg/n2 [18],\ux_seg/n2 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u19_al_u638  (
    .a({\ux_seg/cnt [21],\ux_seg/cnt [19]}),
    .b({\ux_seg/cnt [22],\ux_seg/cnt [20]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add0/c19 ),
    .f({\ux_seg/n2 [21],\ux_seg/n2 [19]}),
    .fco(\ux_seg/add0/c23 ),
    .fx({\ux_seg/n2 [22],\ux_seg/n2 [20]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u23_al_u639  (
    .a({open_n7143,\ux_seg/cnt [23]}),
    .b({open_n7144,\ux_seg/cnt [24]}),
    .c(2'b00),
    .d({open_n7147,1'b0}),
    .e({open_n7148,1'b0}),
    .fci(\ux_seg/add0/c23 ),
    .f({open_n7163,\ux_seg/n2 [23]}),
    .fx({open_n7165,\ux_seg/n2 [24]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u3_al_u634  (
    .a({\ux_seg/cnt [5],\ux_seg/cnt [3]}),
    .b({\ux_seg/cnt [6],\ux_seg/cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add0/c3 ),
    .f({\ux_seg/n2 [5],\ux_seg/n2 [3]}),
    .fco(\ux_seg/add0/c7 ),
    .fx({\ux_seg/n2 [6],\ux_seg/n2 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/u7_al_u635  (
    .a({\ux_seg/cnt [9],\ux_seg/cnt [7]}),
    .b({\ux_seg/cnt [10],\ux_seg/cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add0/c7 ),
    .f({\ux_seg/n2 [9],\ux_seg/n2 [7]}),
    .fco(\ux_seg/add0/c11 ),
    .fx({\ux_seg/n2 [10],\ux_seg/n2 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add0/ucin_al_u633"),
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
    \ux_seg/add0/ucin_al_u633  (
    .a({\ux_seg/cnt [1],1'b0}),
    .b({\ux_seg/cnt [2],\ux_seg/cnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\ux_seg/n2 [1],open_n7221}),
    .fco(\ux_seg/add0/c3 ),
    .fx({\ux_seg/n2 [2],\ux_seg/n2 [0]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add1/ucin_al_u640"),
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
    \ux_seg/add1/u11_al_u643  (
    .a({\ux_seg/cnt_w [13],\ux_seg/cnt_w [11]}),
    .b({\ux_seg/cnt_w [14],\ux_seg/cnt_w [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add1/c11 ),
    .f({\ux_seg/n13 [13],\ux_seg/n13 [11]}),
    .fco(\ux_seg/add1/c15 ),
    .fx({\ux_seg/n13 [14],\ux_seg/n13 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add1/ucin_al_u640"),
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
    \ux_seg/add1/u15_al_u644  (
    .a({\ux_seg/cnt_w [17],\ux_seg/cnt_w [15]}),
    .b({open_n7242,\ux_seg/cnt_w [16]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n7245,1'b0}),
    .fci(\ux_seg/add1/c15 ),
    .f({\ux_seg/n13 [17],\ux_seg/n13 [15]}),
    .fx({open_n7261,\ux_seg/n13 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add1/ucin_al_u640"),
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
    \ux_seg/add1/u3_al_u641  (
    .a({\ux_seg/cnt_w [5],\ux_seg/cnt_w [3]}),
    .b({\ux_seg/cnt_w [6],\ux_seg/cnt_w [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add1/c3 ),
    .f({\ux_seg/n13 [5],\ux_seg/n13 [3]}),
    .fco(\ux_seg/add1/c7 ),
    .fx({\ux_seg/n13 [6],\ux_seg/n13 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add1/ucin_al_u640"),
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
    \ux_seg/add1/u7_al_u642  (
    .a({\ux_seg/cnt_w [9],\ux_seg/cnt_w [7]}),
    .b({\ux_seg/cnt_w [10],\ux_seg/cnt_w [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\ux_seg/add1/c7 ),
    .f({\ux_seg/n13 [9],\ux_seg/n13 [7]}),
    .fco(\ux_seg/add1/c11 ),
    .fx({\ux_seg/n13 [10],\ux_seg/n13 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("ux_seg/add1/ucin_al_u640"),
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
    \ux_seg/add1/ucin_al_u640  (
    .a({\ux_seg/cnt_w [1],1'b0}),
    .b({\ux_seg/cnt_w [2],\ux_seg/cnt_w [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\ux_seg/n13 [1],open_n7317}),
    .fco(\ux_seg/add1/c3 ),
    .fx({\ux_seg/n13 [2],\ux_seg/n13 [0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("C*~A*~B*~D+~C*A*~B*~D+C*A*~B*~D+C*~A*B*~D+~C*A*B*~D+C*A*B*~D"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+~A*B*C*~D"),
    //.LUTG0("C*A*~B*~D+C*A*B*~D"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b0000000011111010),
    .INIT_LUTF1(16'b0000000001011010),
    .INIT_LUTG0(16'b0000000010100000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \ux_seg/mux12_b0_rom0|ux_seg/mux12_b5_rom0  (
    .a({\ux_seg/sm_seg_num [0],\ux_seg/sm_seg_num [1]}),
    .c({\ux_seg/sm_seg_num [2],\ux_seg/sm_seg_num [0]}),
    .d({\ux_seg/sm_seg_num [1],\ux_seg/sm_seg_num [3]}),
    .e(\ux_seg/sm_seg_num [3:2]),
    .f({sm_seg_pad[0],sm_seg_pad[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("A*~B*~C*~D+A*B*~C*~D+~A*~B*C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+~A*~B*C*D+A*~B*C*D+A*B*C*D"),
    //.LUTF1("A*~C*B*~D+A*C*B*~D+~A*~C*B*D+~A*C*B*D"),
    //.LUTG0("A*~B*~C*~D+A*~B*~C*D"),
    //.LUTG1("0"),
    .INIT_LUTF0(16'b1011101010111010),
    .INIT_LUTF1(16'b0100010010001000),
    .INIT_LUTG0(16'b0000001000000010),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \ux_seg/mux12_b1_rom0|ux_seg/mux12_b4_rom0  (
    .a({\ux_seg/sm_seg_num [0],\ux_seg/sm_seg_num [0]}),
    .b(\ux_seg/sm_seg_num [2:1]),
    .c({open_n7344,\ux_seg/sm_seg_num [2]}),
    .d({\ux_seg/sm_seg_num [1],open_n7347}),
    .e({\ux_seg/sm_seg_num [3],\ux_seg/sm_seg_num [3]}),
    .f({sm_seg_pad[1],sm_seg_pad[4]}));
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(D)*~(A)+B*D*~(A)+~(B)*D*A+B*D*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1110111001000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ux_seg/reg0_b1|ux_seg/reg0_b0  (
    .a({_al_u621_o,open_n7368}),
    .b({\u2_al_u0/n27 [0],open_n7369}),
    .c({open_n7370,rst_n_pad}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({sd_dataout[1],\ux_seg/n1_lutinv }),
    .mi({open_n7381,sd_dataout[0]}),
    .f({open_n7383,\ux_seg/mux5_b0_sel_is_2_o }),
    .q(\ux_seg/sm_bit1_num [1:0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A)"),
    //.LUT1("(~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1101110110001000),
    .INIT_LUT1(16'b0011001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ux_seg/reg1_b0|ux_seg/reg0_b2  (
    .a({open_n7387,_al_u621_o}),
    .b({_al_u621_o,\u2_al_u0/n21 [0]}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({\u2_al_u0/n27 [3],\u2_al_u0/n27 [1]}),
    .q({\ux_seg/sm_bit2_num [0],\ux_seg/sm_bit1_num [2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(A)*~(D)+C*A*~(D)+~(C)*A*D+C*A*D)"),
    //.LUTF1("~D*~B*~C*A+D*~B*~C*A+~D*B*~C*A+D*B*~C*A+~D*~B*C*A+D*~B*C*A+~D*B*C*A+D*B*C*A"),
    //.LUTG0("(C*~(A)*~(D)+C*A*~(D)+~(C)*A*D+C*A*D)"),
    //.LUTG1("~D*B*~C*~A+D*B*~C*~A+~D*B*C*~A+D*B*C*~A+~D*B*~C*A+D*B*~C*A+~D*B*C*A+D*B*C*A"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010101011110000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b1010101011110000),
    .INIT_LUTG1(16'b1100110011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ux_seg/reg1_b1|ux_seg/reg1_b2  (
    .a({\u2_al_u0/n29 [0],\u2_al_u0/n25 [0]}),
    .b({\u2_al_u0/n20 ,open_n7408}),
    .c({open_n7409,\u2_al_u0/n29 [1]}),
    .ce(\ux_seg/mux5_b0_sel_is_2_o ),
    .clk(CLKIN_pad),
    .d({open_n7410,_al_u626_o}),
    .e({_al_u626_o,open_n7411}),
    .q({\ux_seg/sm_bit2_num [1],\ux_seg/sm_bit2_num [2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~C)"),
    //.LUT1("(A*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000001100),
    .INIT_LUT1(16'b0000101000001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b0|ux_seg/reg4_b9  (
    .a({\ux_seg/n13 [0],open_n7432}),
    .b({open_n7433,\ux_seg/n13 [9]}),
    .c({\ux_seg/n12_lutinv ,\ux_seg/n12_lutinv }),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [0],\ux_seg/cnt_w [9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b10|ux_seg/reg4_b8  (
    .c({\ux_seg/n13 [10],\ux_seg/n13 [8]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n12_lutinv ,\ux_seg/n12_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [10],\ux_seg/cnt_w [8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~A)"),
    //.LUTF1("(A*~B)"),
    //.LUTG0("(B*~A)"),
    //.LUTG1("(A*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0100010001000100),
    .INIT_LUTF1(16'b0010001000100010),
    .INIT_LUTG0(16'b0100010001000100),
    .INIT_LUTG1(16'b0010001000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b11|ux_seg/reg4_b7  (
    .a({\ux_seg/n13 [11],\ux_seg/n12_lutinv }),
    .b({\ux_seg/n12_lutinv ,\ux_seg/n13 [7]}),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [11],\ux_seg/cnt_w [7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B"),
    //.LUTG1("~A*~C*~B*~D+A*~C*~B*~D+~A*C*~B*~D+A*C*~B*~D+~A*~C*~B*D+A*~C*~B*D+~A*C*~B*D+A*C*~B*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0011001100110011),
    .INIT_LUTG1(16'b0011001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b12|ux_seg/reg4_b6  (
    .b({\ux_seg/n12_lutinv ,\ux_seg/n12_lutinv }),
    .clk(CLKIN_pad),
    .e({\ux_seg/n13 [12],\ux_seg/n13 [6]}),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [12],\ux_seg/cnt_w [6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~D)"),
    //.LUT1("(B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001100),
    .INIT_LUT1(16'b0000000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b13|ux_seg/reg4_b5  (
    .b({\ux_seg/n13 [13],\ux_seg/n13 [5]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n12_lutinv ,\ux_seg/n12_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [13],\ux_seg/cnt_w [5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A)"),
    //.LUT1("(D*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0101000001010000),
    .INIT_LUT1(16'b0101010100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b14|ux_seg/reg4_b4  (
    .a({\ux_seg/n12_lutinv ,\ux_seg/n12_lutinv }),
    .c({open_n7552,\ux_seg/n13 [4]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n13 [14],open_n7554}),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [14],\ux_seg/cnt_w [4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~D)"),
    //.LUTF1("(D*~C)"),
    //.LUTG0("(A*~D)"),
    //.LUTG1("(D*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010101010),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000010101010),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b15|ux_seg/reg4_b3  (
    .a({open_n7572,\ux_seg/n13 [3]}),
    .c({\ux_seg/n12_lutinv ,open_n7575}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n13 [15],\ux_seg/n12_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [15],\ux_seg/cnt_w [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("(B*~A)"),
    //.LUTG0("0"),
    //.LUTG1("(B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b0100010001000100),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0100010001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg4_b1|ux_seg/reg4_b2  (
    .a({\ux_seg/n12_lutinv ,open_n7598}),
    .b({\ux_seg/n13 [1],open_n7599}),
    .c({open_n7600,\ux_seg/n13 [2]}),
    .clk(CLKIN_pad),
    .e({open_n7604,\ux_seg/n12_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt_w [1],\ux_seg/cnt_w [2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(76)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(B)*~(C)*~(D)*~(0)+A*B*~(C)*~(D)*~(0)+A*~(B)*C*~(D)*~(0)+A*B*C*~(D)*~(0)+~(A)*B*~(C)*D*~(0)+A*B*~(C)*D*~(0)+~(A)*B*C*D*~(0)+A*B*C*D*~(0)+~(A)*~(B)*C*~(D)*0+A*~(B)*C*~(D)*0+~(A)*B*C*~(D)*0+A*B*C*~(D)*0)"),
    //.LUTF1("A*~B*C*~D+~A*B*~C*D+A*~B*C*D+~A*B*C*D"),
    //.LUTG0("(A*~(B)*~(C)*~(D)*~(1)+A*B*~(C)*~(D)*~(1)+A*~(B)*C*~(D)*~(1)+A*B*C*~(D)*~(1)+~(A)*B*~(C)*D*~(1)+A*B*~(C)*D*~(1)+~(A)*B*C*D*~(1)+A*B*C*D*~(1)+~(A)*~(B)*C*~(D)*1+A*~(B)*C*~(D)*1+~(A)*B*C*~(D)*1+A*B*C*~(D)*1)"),
    //.LUTG1("~A*~B*~C*~D+~A*~B*C*~D+A*~B*C*~D+~A*~B*~C*D+~A*B*~C*D+~A*~B*C*D+A*~B*C*D+~A*B*C*D"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100110010101010),
    .INIT_LUTF1(16'b0110010000100000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0111010100110001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg5_b0|ux_seg/reg5_b1  (
    .a({\ux_seg/cnt_w [17],\ux_seg/sm_bit1_num [1]}),
    .b({\ux_seg/cnt_w [16],\ux_seg/sm_bit2_num [1]}),
    .c({\ux_seg/sm_bit3_num [0],\ux_seg/sm_bit3_num [1]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/sm_bit2_num [0],\ux_seg/cnt_w [16]}),
    .e({\ux_seg/sm_bit1_num [0],\ux_seg/cnt_w [17]}),
    .sr(rst_n_pad),
    .q({\ux_seg/sm_seg_num [0],\ux_seg/sm_seg_num [1]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg5_b2|ux_seg/reg5_b3  (
    .a({\ux_seg/sm_bit1_num [2],\ux_seg/sm_bit1_num [3]}),
    .b({\ux_seg/sm_bit2_num [2],\ux_seg/sm_bit2_num [3]}),
    .c({\ux_seg/cnt_w [16],\ux_seg/cnt_w [16]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/cnt_w [17],\ux_seg/cnt_w [17]}),
    .sr(rst_n_pad),
    .q({\ux_seg/sm_seg_num [2],\ux_seg/sm_seg_num [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(91)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*B*~C*~D+A*B*~C*~D+~A*B*C*~D+A*B*C*~D+~A*B*~C*D+A*B*~C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTG0("0"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100110011001100),
    .INIT_LUTF1(16'b1111000011110000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b0|ux_seg/reg6_b9  (
    .b({open_n7664,\ux_seg/n2 [9]}),
    .c({\ux_seg/n2 [0],open_n7665}),
    .clk(CLKIN_pad),
    .e({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [0],\ux_seg/cnt [9]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(A*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b10|ux_seg/reg6_b8  (
    .a({\ux_seg/n2 [10],open_n7688}),
    .c({open_n7691,\ux_seg/n2 [8]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [10],\ux_seg/cnt [8]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~D)"),
    //.LUT1("(A*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011001100),
    .INIT_LUT1(16'b0000000010101010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b11|ux_seg/reg6_b7  (
    .a({\ux_seg/n2 [11],open_n7710}),
    .b({open_n7711,\ux_seg/n2 [7]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [11],\ux_seg/cnt [7]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("0"),
    //.LUTG0("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A+~D*~B*C*~A+D*~B*C*~A+~D*B*C*~A+D*B*C*~A"),
    //.LUTG1("~D*~B*~C*~A+D*~B*~C*~A+~D*B*~C*~A+D*B*~C*~A+~D*~B*C*~A+D*~B*C*~A+~D*B*C*~A+D*B*C*~A"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0101010101010101),
    .INIT_LUTG1(16'b0101010101010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b12|ux_seg/reg6_b6  (
    .a({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .e({\ux_seg/n2 [12],\ux_seg/n2 [6]}),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [12],\ux_seg/cnt [6]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A)"),
    //.LUTF1("(A*~B)"),
    //.LUTG0("(C*~A)"),
    //.LUTG1("(A*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0101000001010000),
    .INIT_LUTF1(16'b0010001000100010),
    .INIT_LUTG0(16'b0101000001010000),
    .INIT_LUTG1(16'b0010001000100010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b13|ux_seg/reg6_b5  (
    .a({\ux_seg/n2 [13],\ux_seg/n1_lutinv }),
    .b({\ux_seg/n1_lutinv ,open_n7758}),
    .c({open_n7759,\ux_seg/n2 [5]}),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [13],\ux_seg/cnt [5]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b14|ux_seg/reg6_b4  (
    .b({\ux_seg/n2 [14],open_n7786}),
    .c({open_n7787,\ux_seg/n2 [4]}),
    .clk(CLKIN_pad),
    .d({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [14],\ux_seg/cnt [4]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~C)"),
    //.LUT1("(B*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000001100),
    .INIT_LUT1(16'b0000110000001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b15|ux_seg/reg6_b3  (
    .b({\ux_seg/n2 [15],\ux_seg/n2 [3]}),
    .c({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [15],\ux_seg/cnt [3]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("0"),
    //.LUTF1("(C*~B)"),
    //.LUTG0("~A*~B*~D*~C+A*~B*~D*~C+~A*B*~D*~C+A*B*~D*~C+~A*~B*D*~C+A*~B*D*~C+~A*B*D*~C+A*B*D*~C"),
    //.LUTG1("(C*~B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0011000000110000),
    .INIT_LUTG0(16'b0000111100001111),
    .INIT_LUTG1(16'b0011000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b16|ux_seg/reg6_b23  (
    .b({\ux_seg/n1_lutinv ,open_n7830}),
    .c({\ux_seg/n2 [16],\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .e({open_n7834,\ux_seg/n2 [23]}),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [16],\ux_seg/cnt [23]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(A*~C)"),
    //.LUT1("(A*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000101000001010),
    .INIT_LUT1(16'b0000101000001010),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b17|ux_seg/reg6_b22  (
    .a({\ux_seg/n2 [17],\ux_seg/n2 [22]}),
    .c({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [17],\ux_seg/cnt [22]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~C)"),
    //.LUT1("(B*~C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110000001100),
    .INIT_LUT1(16'b0000110000001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b18|ux_seg/reg6_b21  (
    .b({\ux_seg/n2 [18],\ux_seg/n2 [21]}),
    .c({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [18],\ux_seg/cnt [21]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("~A*~B*C*~D+A*~B*C*~D+~A*B*C*~D+A*B*C*~D+~A*~B*C*D+A*~B*C*D+~A*B*C*D+A*B*C*D"),
    //.LUTF1("A*~B*~C*~D+A*B*~C*~D+A*~B*C*~D+A*B*C*~D+A*~B*~C*D+A*B*~C*D+A*~B*C*D+A*B*C*D"),
    //.LUTG0("0"),
    //.LUTG1("0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011110000),
    .INIT_LUTF1(16'b1010101010101010),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b19|ux_seg/reg6_b20  (
    .a({\ux_seg/n2 [19],open_n7898}),
    .c({open_n7901,\ux_seg/n2 [20]}),
    .clk(CLKIN_pad),
    .e({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [19],\ux_seg/cnt [20]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~B)"),
    //.LUTF1("0"),
    //.LUTG0("(A*~B)"),
    //.LUTG1("~A*~D*~C*~B+A*~D*~C*~B+~A*D*~C*~B+A*D*~C*~B+~A*~D*C*~B+A*~D*C*~B+~A*D*C*~B+A*D*C*~B"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0010001000100010),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0010001000100010),
    .INIT_LUTG1(16'b0011001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \ux_seg/reg6_b1|ux_seg/reg6_b2  (
    .a({open_n7924,\ux_seg/n2 [2]}),
    .b({\ux_seg/n1_lutinv ,\ux_seg/n1_lutinv }),
    .clk(CLKIN_pad),
    .e({\ux_seg/n2 [1],open_n7930}),
    .sr(rst_n_pad),
    .q({\ux_seg/cnt [1],\ux_seg/cnt [2]}));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(63)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("B1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \ux_seg/reg7_b0_DO  (
    .ce(1'b1),
    .do({open_n7950,open_n7951,open_n7952,\ux_seg/mux11_b0_sel_is_0_o_neg }),
    .osclk(CLKIN_pad),
    .rst(rst_n_pad),
    .opad(sm_bit[0]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \ux_seg/reg7_b1_DO  (
    .ce(1'b1),
    .do({open_n7964,open_n7965,open_n7966,\ux_seg/mux11_b1_sel_is_1_o_neg }),
    .osclk(CLKIN_pad),
    .rst(rst_n_pad),
    .opad(sm_bit[1]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("C2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \ux_seg/reg7_b2_DO  (
    .ce(1'b1),
    .do({open_n7978,open_n7979,open_n7980,\ux_seg/mux11_b2_sel_is_2_o_neg }),
    .osclk(CLKIN_pad),
    .rst(rst_n_pad),
    .opad(sm_bit[2]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)
  EG_PHY_PAD #(
    //.CLKSRC("CLK"),
    //.LOCATION("F3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS33"),
    .MODE("OUT"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \ux_seg/reg7_b3_DO  (
    .ce(1'b1),
    .do({open_n7992,open_n7993,open_n7994,\ux_seg/mux11_b3_sel_is_3_o_neg }),
    .osclk(CLKIN_pad),
    .rst(rst_n_pad),
    .opad(sm_bit[3]));  // C:/Users/dell/Desktop/Tang_FPGA_Examples-master/3.SDRAM/SDRAM_TEST/sdram_test/seg_4.v(106)

endmodule 

