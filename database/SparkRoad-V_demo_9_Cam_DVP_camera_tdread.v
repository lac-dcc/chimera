// Verilog netlist created by TD v4.6.12906
// Mon Jul 29 11:23:07 2019

`timescale 1ns / 1ps
module camera  // sources/rtl/test_camera.v(2)
  (
  CLK_IN,
  CSI_D,
  CSI_HREF,
  CSI_PCLK,
  CSI_VSYNC,
  RST_N,
  B,
  CSI_PWDN,
  CSI_RST,
  CSI_SOIC,
  CSI_XCLK,
  G,
  LCD_CLK,
  LCD_DEN,
  LCD_HSYNC,
  LCD_PWM,
  LCD_VSYNC,
  OD,
  R,
  TESTA,
  TESTB,
  TESTC,
  TESTD,
  TESTE,
  TESTF,
  CSI_SOID
  );

  input CLK_IN;  // sources/rtl/test_camera.v(4)
  input [7:0] CSI_D;  // sources/rtl/test_camera.v(15)
  input CSI_HREF;  // sources/rtl/test_camera.v(9)
  input CSI_PCLK;  // sources/rtl/test_camera.v(7)
  input CSI_VSYNC;  // sources/rtl/test_camera.v(10)
  input RST_N;  // sources/rtl/test_camera.v(5)
  output [7:0] B;  // sources/rtl/test_camera.v(19)
  output CSI_PWDN;  // sources/rtl/test_camera.v(11)
  output CSI_RST;  // sources/rtl/test_camera.v(12)
  output CSI_SOIC;  // sources/rtl/test_camera.v(13)
  output CSI_XCLK;  // sources/rtl/test_camera.v(8)
  output [7:0] G;  // sources/rtl/test_camera.v(18)
  output LCD_CLK;  // sources/rtl/test_camera.v(20)
  output LCD_DEN;  // sources/rtl/test_camera.v(23)
  output LCD_HSYNC;  // sources/rtl/test_camera.v(21)
  output LCD_PWM;  // sources/rtl/test_camera.v(24)
  output LCD_VSYNC;  // sources/rtl/test_camera.v(22)
  output [0:7] OD;  // sources/rtl/test_camera.v(32)
  output [7:0] R;  // sources/rtl/test_camera.v(17)
  output TESTA;  // sources/rtl/test_camera.v(26)
  output TESTB;  // sources/rtl/test_camera.v(27)
  output TESTC;  // sources/rtl/test_camera.v(28)
  output TESTD;  // sources/rtl/test_camera.v(29)
  output TESTE;  // sources/rtl/test_camera.v(30)
  output TESTF;  // sources/rtl/test_camera.v(31)
  inout CSI_SOID;  // sources/rtl/test_camera.v(14)

  wire [19:0] camera_addr;  // sources/rtl/test_camera.v(103)
  wire [15:0] camera_wrdat;  // sources/rtl/test_camera.v(102)
  wire [15:0] lcd_rdaddr;  // sources/rtl/test_camera.v(77)
  wire [15:0] lcd_rddat;  // sources/rtl/test_camera.v(76)
  wire camera_wclk;  // sources/rtl/test_camera.v(101)
  wire camera_wrreq;  // sources/rtl/test_camera.v(101)
  wire clk_cam;  // sources/rtl/test_camera.v(36)
  wire clk_lcd;  // sources/rtl/test_camera.v(35)
  wire clk_sccb;  // sources/rtl/test_camera.v(37)
  wire lcd_rden;  // sources/rtl/test_camera.v(75)
  wire n0;
  wire n1;
  wire scl;  // sources/rtl/test_camera.v(51)
  wire sda;  // sources/rtl/test_camera.v(49)
  wire sda_in;  // sources/rtl/test_camera.v(50)
  wire sda_oe;  // sources/rtl/test_camera.v(48)

  binary_mux_s1_w5 mux0 (
    .i0(5'b00000),
    .i1(lcd_rddat[15:11]),
    .sel(lcd_rden),
    .o(R[7:3]));  // sources/rtl/test_camera.v(138)
  binary_mux_s1_w6 mux1 (
    .i0(6'b000000),
    .i1(lcd_rddat[10:5]),
    .sel(lcd_rden),
    .o(G[7:2]));  // sources/rtl/test_camera.v(139)
  binary_mux_s1_w5 mux2 (
    .i0(5'b00000),
    .i1(lcd_rddat[4:0]),
    .sel(lcd_rden),
    .o(B[7:3]));  // sources/rtl/test_camera.v(140)
  ip_pll pll (
    .refclk(CLK_IN),
    .clk0_out(clk_lcd),
    .clk1_out(clk_cam),
    .clk2_out(clk_sccb));  // sources/rtl/test_camera.v(39)
  buf u1 (OD[5], CSI_D[2]);  // sources/rtl/test_camera.v(136)
  buf u10 (sda_in, CSI_SOID);  // sources/rtl/test_camera.v(65)
  buf u11 (CSI_SOIC, scl);  // sources/rtl/test_camera.v(66)
  buf u12 (TESTB, CSI_SOIC);  // sources/rtl/test_camera.v(67)
  buf u13 (CSI_PWDN, 1'b0);  // sources/rtl/test_camera.v(68)
  buf u14 (CSI_RST, RST_N);  // sources/rtl/test_camera.v(69)
  not u15 (n0, CSI_VSYNC);  // sources/rtl/test_camera.v(112)
  not u16 (n1, RST_N);  // sources/rtl/test_camera.v(127)
  buf u17 (B[0], 1'b0);  // sources/rtl/test_camera.v(144)
  buf u18 (OD[7], CSI_D[0]);  // sources/rtl/test_camera.v(136)
  buf u19 (R[0], 1'b0);  // sources/rtl/test_camera.v(142)
  buf u2 (OD[6], CSI_D[1]);  // sources/rtl/test_camera.v(136)
  buf u20 (G[0], 1'b0);  // sources/rtl/test_camera.v(143)
  buf u21 (OD[4], CSI_D[3]);  // sources/rtl/test_camera.v(136)
  buf u22 (OD[3], CSI_D[4]);  // sources/rtl/test_camera.v(136)
  buf u23 (OD[2], CSI_D[5]);  // sources/rtl/test_camera.v(136)
  buf u24 (OD[1], CSI_D[6]);  // sources/rtl/test_camera.v(136)
  buf u25 (OD[0], CSI_D[7]);  // sources/rtl/test_camera.v(136)
  buf u3 (R[2], 1'b0);  // sources/rtl/test_camera.v(142)
  buf u4 (R[1], 1'b0);  // sources/rtl/test_camera.v(142)
  buf u5 (G[1], 1'b0);  // sources/rtl/test_camera.v(143)
  buf u6 (B[2], 1'b0);  // sources/rtl/test_camera.v(144)
  buf u7 (B[1], 1'b0);  // sources/rtl/test_camera.v(144)
  bufif1 u8 (CSI_SOID, sda, sda_oe);  // sources/rtl/test_camera.v(63)
  buf u9 (TESTA, CSI_SOID);  // sources/rtl/test_camera.v(64)
  cameraReader u_cameraReader (
    .clk(clk_cam),
    .csi_data(CSI_D),
    .csi_hsync(CSI_HREF),
    .csi_pclk(CSI_PCLK),
    .csi_vsync(n0),
    .reset_n(RST_N),
    .csi_xclk(CSI_XCLK),
    .data_out(camera_wrdat),
    .wraddr({open_n0,open_n1,open_n2,open_n3,camera_addr[15:0]}),
    .wrclk(camera_wclk),
    .wrreq(camera_wrreq));  // sources/rtl/test_camera.v(105)
  camera_init u_camera_init (
    .clk(clk_sccb),
    .reset_n(RST_N),
    .sda_in(sda_in),
    .scl(scl),
    .sda(sda),
    .sda_oe(sda_oe));  // sources/rtl/test_camera.v(53)
  lcd_sync u_lcd_sync (
    .clk(clk_lcd),
    .rest_n(RST_N),
    .addr(lcd_rdaddr),
    .img_ack(lcd_rden),
    .lcd_clk(LCD_CLK),
    .lcd_de(LCD_DEN),
    .lcd_hsync(LCD_HSYNC),
    .lcd_pwm(LCD_PWM),
    .lcd_vsync(LCD_VSYNC));  // sources/rtl/test_camera.v(86)
  img_cache uimg (
    .addra(camera_addr[15:0]),
    .addrb(lcd_rdaddr),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(camera_wclk),
    .clkb(clk_lcd),
    .dia(camera_wrdat),
    .rsta(n1),
    .rstb(n1),
    .dob(lcd_rddat));  // sources/rtl/test_camera.v(120)

endmodule 

module binary_mux_s1_w5
  (
  i0,
  i1,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input sel;
  output [4:0] o;



endmodule 

module binary_mux_s1_w6
  (
  i0,
  i1,
  sel,
  o
  );

  input [5:0] i0;
  input [5:0] i1;
  input sel;
  output [5:0] o;



endmodule 

module ip_pll  // al_ip/ip_pll.v(24)
  (
  refclk,
  clk0_out,
  clk1_out,
  clk2_out
  );

  input refclk;  // al_ip/ip_pll.v(29)
  output clk0_out;  // al_ip/ip_pll.v(30)
  output clk1_out;  // al_ip/ip_pll.v(31)
  output clk2_out;  // al_ip/ip_pll.v(32)

  wire clk0_buf;  // al_ip/ip_pll.v(34)

  EG_LOGIC_BUFG bufg_feedback (
    .i(clk0_buf),
    .o(clk0_out));  // al_ip/ip_pll.v(36)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(19),
    .CLKC0_DIV(20),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(41),
    .CLKC1_DIV(42),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(125),
    .CLKC2_DIV(126),
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
    .FBCLK_DIV(17),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("24.000"),
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
    .REFCLK_DIV(16),
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
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n0,open_n1,clk2_out,clk1_out,clk0_buf}));  // al_ip/ip_pll.v(67)

endmodule 

module cameraReader  // sources/rtl/cameraReader.v(1)
  (
  clk,
  csi_data,
  csi_hsync,
  csi_pclk,
  csi_vsync,
  reset_n,
  csi_xclk,
  data_out,
  wraddr,
  wrclk,
  wrreq
  );

  input clk;  // sources/rtl/cameraReader.v(3)
  input [7:0] csi_data;  // sources/rtl/cameraReader.v(9)
  input csi_hsync;  // sources/rtl/cameraReader.v(11)
  input csi_pclk;  // sources/rtl/cameraReader.v(8)
  input csi_vsync;  // sources/rtl/cameraReader.v(10)
  input reset_n;  // sources/rtl/cameraReader.v(4)
  output csi_xclk;  // sources/rtl/cameraReader.v(6)
  output [15:0] data_out;  // sources/rtl/cameraReader.v(13)
  output [19:0] wraddr;  // sources/rtl/cameraReader.v(16)
  output wrclk;  // sources/rtl/cameraReader.v(15)
  output wrreq;  // sources/rtl/cameraReader.v(14)

  wire [15:0] current_pixel;  // sources/rtl/cameraReader.v(40)
  wire [7:0] n10;
  wire [15:0] n11;
  wire [19:0] n12;
  wire [19:0] n14;
  wire [19:0] n15;
  wire [7:0] n16;
  wire [15:0] n17;
  wire [19:0] n18;
  wire [19:0] n19;
  wire [19:0] n21;
  wire [7:0] n22;
  wire [15:0] n23;
  wire [19:0] n24;
  wire [19:0] n26;
  wire [7:0] n27;
  wire [15:0] n28;
  wire [19:0] n8;
  wire [19:0] n9;
  wire [19:0] pixel_counter;  // sources/rtl/cameraReader.v(19)
  wire [7:0] subpixel;  // sources/rtl/cameraReader.v(39)
  wire n0;
  wire n1;
  wire n13;
  wire n2;
  wire n20;
  wire n25;
  wire n29;
  wire n3;
  wire n30;
  wire n4;
  wire n5;
  wire n6;
  wire n7;
  wire vsync_passed;  // sources/rtl/cameraReader.v(23)
  wire wrclk1;  // sources/rtl/cameraReader.v(26)
  wire write_pixel;  // sources/rtl/cameraReader.v(24)

  add_pu20_pu20_o20 add0 (
    .i0(pixel_counter),
    .i1(20'b00000000000000000001),
    .o(n8));  // sources/rtl/cameraReader.v(77)
  add_pu20_pu20_o20 add1 (
    .i0(wraddr),
    .i1(20'b00000000000000000001),
    .o(n9));  // sources/rtl/cameraReader.v(84)
  eq_w1 eq0 (
    .i0(reset_n),
    .i1(1'b1),
    .o(n0));  // sources/rtl/cameraReader.v(21)
  eq_w1 eq1 (
    .i0(csi_hsync),
    .i1(1'b1),
    .o(n2));  // sources/rtl/cameraReader.v(33)
  eq_w1 eq2 (
    .i0(reset_n),
    .i1(1'b0),
    .o(n3));  // sources/rtl/cameraReader.v(59)
  eq_w1 eq3 (
    .i0(csi_vsync),
    .i1(1'b1),
    .o(n4));  // sources/rtl/cameraReader.v(66)
  eq_w1 eq4 (
    .i0(vsync_passed),
    .i1(1'b1),
    .o(n5));  // sources/rtl/cameraReader.v(73)
  eq_w1 eq5 (
    .i0(pixel_counter[0]),
    .i1(1'b0),
    .o(n7));  // sources/rtl/cameraReader.v(75)
  eq_w1 eq6 (
    .i0(write_pixel),
    .i1(1'b1),
    .o(n13));  // sources/rtl/cameraReader.v(89)
  lt_u20_u20 lt0 (
    .ci(1'b0),
    .i0(20'b00000000000000000010),
    .i1(pixel_counter),
    .o(n29));  // sources/rtl/cameraReader.v(97)
  binary_mux_s1_w8 mux0 (
    .i0(subpixel),
    .i1(csi_data),
    .sel(n7),
    .o(n10));  // sources/rtl/cameraReader.v(85)
  binary_mux_s1_w16 mux1 (
    .i0({subpixel,csi_data}),
    .i1(current_pixel),
    .sel(n7),
    .o(n11));  // sources/rtl/cameraReader.v(85)
  binary_mux_s1_w8 mux10 (
    .i0(n16),
    .i1(subpixel),
    .sel(n4),
    .o(n22));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w16 mux11 (
    .i0(n17),
    .i1(current_pixel),
    .sel(n4),
    .o(n23));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w20 mux12 (
    .i0(n19),
    .i1(20'b00000000000000000000),
    .sel(n3),
    .o(n24));  // sources/rtl/cameraReader.v(94)
  binary_mux_s1_w20 mux13 (
    .i0(n21),
    .i1(wraddr),
    .sel(n3),
    .o(n26));  // sources/rtl/cameraReader.v(94)
  binary_mux_s1_w8 mux14 (
    .i0(n22),
    .i1(subpixel),
    .sel(n3),
    .o(n27));  // sources/rtl/cameraReader.v(94)
  binary_mux_s1_w16 mux15 (
    .i0(n23),
    .i1(current_pixel),
    .sel(n3),
    .o(n28));  // sources/rtl/cameraReader.v(94)
  binary_mux_s1_w20 mux2 (
    .i0(n9),
    .i1(wraddr),
    .sel(n7),
    .o(n12));  // sources/rtl/cameraReader.v(85)
  binary_mux_s1_w20 mux3 (
    .i0(20'b00000000000000000000),
    .i1(n8),
    .sel(n13),
    .o(n14));  // sources/rtl/cameraReader.v(92)
  binary_mux_s1_w20 mux4 (
    .i0(n14),
    .i1(n8),
    .sel(n6),
    .o(n15));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w8 mux5 (
    .i0(subpixel),
    .i1(n10),
    .sel(n6),
    .o(n16));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w16 mux6 (
    .i0(current_pixel),
    .i1(n11),
    .sel(n6),
    .o(n17));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w20 mux7 (
    .i0(wraddr),
    .i1(n12),
    .sel(n6),
    .o(n18));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w20 mux8 (
    .i0(n15),
    .i1(20'b00000000000000000000),
    .sel(n4),
    .o(n19));  // sources/rtl/cameraReader.v(93)
  binary_mux_s1_w20 mux9 (
    .i0(n18),
    .i1(20'b00000000000000000000),
    .sel(n4),
    .o(n21));  // sources/rtl/cameraReader.v(93)
  reg_ar_as_w16 reg0 (
    .clk(wrreq),
    .d(current_pixel),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(data_out));  // sources/rtl/cameraReader.v(55)
  reg_ar_as_w20 reg1 (
    .clk(csi_pclk),
    .d(n24),
    .reset(20'b00000000000000000000),
    .set(20'b00000000000000000000),
    .q(pixel_counter));  // sources/rtl/cameraReader.v(95)
  reg_ar_as_w20 reg2 (
    .clk(csi_pclk),
    .d(n26),
    .reset(20'b00000000000000000000),
    .set(20'b00000000000000000000),
    .q(wraddr));  // sources/rtl/cameraReader.v(95)
  reg_ar_as_w8 reg3 (
    .clk(csi_pclk),
    .d(n27),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(subpixel));  // sources/rtl/cameraReader.v(95)
  reg_ar_as_w16 reg4 (
    .clk(csi_pclk),
    .d(n28),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(current_pixel));  // sources/rtl/cameraReader.v(95)
  AL_MUX u2 (
    .i0(1'b0),
    .i1(clk),
    .sel(n0),
    .o(csi_xclk));  // sources/rtl/cameraReader.v(21)
  not u3 (n1, wrclk1);  // sources/rtl/cameraReader.v(29)
  and u4 (n6, n2, n5);  // sources/rtl/cameraReader.v(73)
  AL_MUX u5 (
    .i0(vsync_passed),
    .i1(1'b1),
    .sel(n4),
    .o(n20));  // sources/rtl/cameraReader.v(93)
  AL_MUX u6 (
    .i0(n20),
    .i1(1'b0),
    .sel(n3),
    .o(n25));  // sources/rtl/cameraReader.v(94)
  and u7 (n30, n13, n29);  // sources/rtl/cameraReader.v(97)
  AL_MUX u8 (
    .i0(1'b0),
    .i1(wrclk1),
    .sel(n30),
    .o(wrreq));  // sources/rtl/cameraReader.v(97)
  buf u9 (wrclk, csi_pclk);  // sources/rtl/cameraReader.v(98)
  AL_DFF vsync_passed_reg (
    .clk(csi_pclk),
    .d(n25),
    .reset(1'b0),
    .set(1'b0),
    .q(vsync_passed));  // sources/rtl/cameraReader.v(95)
  AL_DFF wrclk1_reg (
    .clk(csi_pclk),
    .d(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(wrclk1));  // sources/rtl/cameraReader.v(29)
  AL_DFF write_pixel_reg (
    .clk(n1),
    .d(n2),
    .reset(1'b0),
    .set(1'b0),
    .q(write_pixel));  // sources/rtl/cameraReader.v(37)

endmodule 

module camera_init  // sources/rtl/camera_init.v(1)
  (
  clk,
  reset_n,
  sda_in,
  ready,
  scl,
  sda,
  sda_oe
  );

  input clk;  // sources/rtl/camera_init.v(3)
  input reset_n;  // sources/rtl/camera_init.v(4)
  input sda_in;  // sources/rtl/camera_init.v(10)
  output ready;  // sources/rtl/camera_init.v(6)
  output scl;  // sources/rtl/camera_init.v(11)
  output sda;  // sources/rtl/camera_init.v(9)
  output sda_oe;  // sources/rtl/camera_init.v(8)

  parameter REGS_TO_INIT = 178;
  // localparam CAMERA_IDLE = 18;
  // localparam CAMERA_INIT_1 = 11;
  // localparam CAMERA_INIT_2 = 12;
  // localparam CAMERA_INIT_3 = 13;
  // localparam CAMERA_INIT_4 = 14;
  // localparam CAMERA_INIT_5 = 15;
  // localparam CAMERA_INIT_6 = 16;
  // localparam CAMERA_INIT_7 = 17;
  // localparam CONTROL_REG = 3'b000;
  // localparam SLAVE_ADDRESS = 3'b001;
  // localparam SLAVE_DATA_1 = 3'b011;
  // localparam SLAVE_DATA_2 = 3'b100;
  // localparam SLAVE_REG_ADDRESS = 3'b010;
  wire [7:0] cnt;  // sources/rtl/camera_init.v(47)
  wire [7:0] counter;  // sources/rtl/camera_init.v(46)
  wire [7:0] data_in_bus;  // sources/rtl/camera_init.v(32)
  wire [8:0] divider2;  // sources/rtl/camera_init.v(52)
  wire [8:0] n0;
  wire [10:0] n178;
  wire [15:0] n183;
  wire [15:0] n184;
  wire [15:0] n185;
  wire [15:0] n186;
  wire [15:0] n187;
  wire [15:0] n188;
  wire [15:0] n189;
  wire [15:0] n190;
  wire [15:0] n191;
  wire [15:0] n192;
  wire [15:0] n193;
  wire [15:0] n194;
  wire [15:0] n195;
  wire [15:0] n196;
  wire [15:0] n197;
  wire [15:0] n198;
  wire [15:0] n199;
  wire [15:0] n200;
  wire [15:0] n201;
  wire [15:0] n202;
  wire [15:0] n203;
  wire [15:0] n204;
  wire [15:0] n205;
  wire [15:0] n206;
  wire [15:0] n207;
  wire [15:0] n208;
  wire [15:0] n209;
  wire [15:0] n210;
  wire [15:0] n211;
  wire [15:0] n212;
  wire [15:0] n213;
  wire [15:0] n214;
  wire [15:0] n215;
  wire [15:0] n216;
  wire [15:0] n217;
  wire [15:0] n218;
  wire [15:0] n219;
  wire [15:0] n220;
  wire [15:0] n221;
  wire [15:0] n222;
  wire [15:0] n223;
  wire [15:0] n224;
  wire [15:0] n225;
  wire [15:0] n226;
  wire [15:0] n227;
  wire [15:0] n228;
  wire [15:0] n229;
  wire [15:0] n230;
  wire [15:0] n231;
  wire [15:0] n232;
  wire [15:0] n233;
  wire [15:0] n234;
  wire [15:0] n235;
  wire [15:0] n236;
  wire [15:0] n237;
  wire [15:0] n238;
  wire [15:0] n239;
  wire [15:0] n240;
  wire [15:0] n241;
  wire [15:0] n242;
  wire [15:0] n243;
  wire [15:0] n244;
  wire [15:0] n245;
  wire [15:0] n246;
  wire [15:0] n247;
  wire [15:0] n248;
  wire [15:0] n249;
  wire [15:0] n250;
  wire [15:0] n251;
  wire [15:0] n252;
  wire [15:0] n253;
  wire [15:0] n254;
  wire [15:0] n255;
  wire [15:0] n256;
  wire [15:0] n257;
  wire [15:0] n258;
  wire [15:0] n259;
  wire [15:0] n260;
  wire [15:0] n261;
  wire [15:0] n262;
  wire [15:0] n263;
  wire [15:0] n264;
  wire [15:0] n265;
  wire [15:0] n266;
  wire [15:0] n267;
  wire [15:0] n268;
  wire [15:0] n269;
  wire [15:0] n270;
  wire [15:0] n271;
  wire [15:0] n272;
  wire [15:0] n273;
  wire [15:0] n274;
  wire [15:0] n275;
  wire [15:0] n276;
  wire [15:0] n277;
  wire [15:0] n278;
  wire [15:0] n279;
  wire [15:0] n280;
  wire [15:0] n281;
  wire [15:0] n282;
  wire [15:0] n283;
  wire [15:0] n284;
  wire [15:0] n285;
  wire [15:0] n286;
  wire [15:0] n287;
  wire [15:0] n288;
  wire [15:0] n289;
  wire [15:0] n290;
  wire [15:0] n291;
  wire [15:0] n292;
  wire [15:0] n293;
  wire [15:0] n294;
  wire [15:0] n295;
  wire [15:0] n296;
  wire [15:0] n297;
  wire [15:0] n298;
  wire [15:0] n299;
  wire [15:0] n300;
  wire [15:0] n301;
  wire [15:0] n302;
  wire [15:0] n303;
  wire [15:0] n304;
  wire [15:0] n305;
  wire [15:0] n306;
  wire [15:0] n307;
  wire [15:0] n308;
  wire [15:0] n309;
  wire [15:0] n310;
  wire [15:0] n311;
  wire [15:0] n312;
  wire [15:0] n313;
  wire [15:0] n314;
  wire [15:0] n315;
  wire [15:0] n316;
  wire [15:0] n317;
  wire [15:0] n318;
  wire [15:0] n319;
  wire [15:0] n320;
  wire [15:0] n321;
  wire [15:0] n322;
  wire [15:0] n323;
  wire [15:0] n324;
  wire [15:0] n325;
  wire [15:0] n326;
  wire [15:0] n327;
  wire [15:0] n328;
  wire [15:0] n329;
  wire [15:0] n330;
  wire [15:0] n331;
  wire [15:0] n332;
  wire [15:0] n333;
  wire [15:0] n334;
  wire [15:0] n335;
  wire [15:0] n336;
  wire [15:0] n337;
  wire [15:0] n338;
  wire [15:0] n339;
  wire [15:0] n340;
  wire [15:0] n341;
  wire [15:0] n342;
  wire [15:0] n343;
  wire [15:0] n344;
  wire [15:0] n345;
  wire [15:0] n346;
  wire [15:0] n347;
  wire [15:0] n348;
  wire [15:0] n349;
  wire [15:0] n350;
  wire [15:0] n351;
  wire [15:0] n352;
  wire [15:0] n353;
  wire [15:0] n354;
  wire [15:0] n355;
  wire [15:0] n356;
  wire [15:0] n357;
  wire [7:0] n359;
  wire [4:0] n361;
  wire [4:0] n363;
  wire [4:0] n364;
  wire [7:0] n365;
  wire [7:0] n369;
  wire [7:0] n370;
  wire [7:0] n372;
  wire [7:0] n373;
  wire [7:0] n374;
  wire [7:0] n375;
  wire [2:0] n385;
  wire [7:0] n386;
  wire [7:0] n388;
  wire [7:0] n389;
  wire [2:0] n390;
  wire [7:0] n391;
  wire [7:0] n393;
  wire [7:0] n394;
  wire [2:0] reg_address;  // sources/rtl/camera_init.v(33)
  wire [15:0] regs_data;  // sources/rtl/camera_init.v(62)
  wire [7:0] state_next;  // sources/rtl/camera_init.v(50)
  wire bus_write;  // sources/rtl/camera_init.v(34)
  wire clk_div;  // sources/rtl/camera_init.v(59)
  wire n1;
  wire n10;
  wire n100;
  wire n101;
  wire n102;
  wire n103;
  wire n104;
  wire n105;
  wire n106;
  wire n107;
  wire n108;
  wire n109;
  wire n11;
  wire n110;
  wire n111;
  wire n112;
  wire n113;
  wire n114;
  wire n115;
  wire n116;
  wire n117;
  wire n118;
  wire n119;
  wire n12;
  wire n120;
  wire n121;
  wire n122;
  wire n123;
  wire n124;
  wire n125;
  wire n126;
  wire n127;
  wire n128;
  wire n129;
  wire n13;
  wire n130;
  wire n131;
  wire n132;
  wire n133;
  wire n134;
  wire n135;
  wire n136;
  wire n137;
  wire n138;
  wire n139;
  wire n14;
  wire n140;
  wire n141;
  wire n142;
  wire n143;
  wire n144;
  wire n145;
  wire n146;
  wire n147;
  wire n148;
  wire n149;
  wire n15;
  wire n150;
  wire n151;
  wire n152;
  wire n153;
  wire n154;
  wire n155;
  wire n156;
  wire n157;
  wire n158;
  wire n159;
  wire n16;
  wire n160;
  wire n161;
  wire n162;
  wire n163;
  wire n164;
  wire n165;
  wire n166;
  wire n167;
  wire n168;
  wire n169;
  wire n17;
  wire n170;
  wire n171;
  wire n172;
  wire n173;
  wire n174;
  wire n175;
  wire n176;
  wire n177;
  wire n179;
  wire n18;
  wire n180;
  wire n181;
  wire n182;
  wire n19;
  wire n2;
  wire n20;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n27;
  wire n28;
  wire n29;
  wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n35;
  wire n358;
  wire n36;
  wire n360;
  wire n362;
  wire n366;
  wire n367;
  wire n368;
  wire n37;
  wire n371;
  wire n376;
  wire n377;
  wire n378;
  wire n379;
  wire n38;
  wire n380;
  wire n381;
  wire n382;
  wire n383;
  wire n384;
  wire n387;
  wire n39;
  wire n392;
  wire n4;
  wire n40;
  wire n41;
  wire n42;
  wire n43;
  wire n44;
  wire n45;
  wire n46;
  wire n47;
  wire n48;
  wire n49;
  wire n5;
  wire n50;
  wire n51;
  wire n52;
  wire n53;
  wire n54;
  wire n55;
  wire n56;
  wire n57;
  wire n58;
  wire n59;
  wire n6;
  wire n60;
  wire n61;
  wire n62;
  wire n63;
  wire n64;
  wire n65;
  wire n66;
  wire n67;
  wire n68;
  wire n69;
  wire n7;
  wire n70;
  wire n71;
  wire n72;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire n79;
  wire n8;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n9;
  wire n90;
  wire n91;
  wire n92;
  wire n93;
  wire n94;
  wire n95;
  wire n96;
  wire n97;
  wire n98;
  wire n99;
  wire ready_out;  // sources/rtl/camera_init.v(35)
  wire success_out;  // sources/rtl/camera_init.v(36)

  add_pu9_pu9_o9 add0 (
    .i0(divider2),
    .i1(9'b000000001),
    .o(n0));  // sources/rtl/camera_init.v(56)
  add_pu8_pu8_o8 add1 (
    .i0(cnt),
    .i1(8'b00000001),
    .o(n372));  // sources/rtl/camera_init.v(405)
  add_pu8_pu8_o8 add2 (
    .i0(counter),
    .i1(8'b00000001),
    .o(n373));  // sources/rtl/camera_init.v(409)
  AL_DFF bus_write_reg (
    .clk(clk_div),
    .d(n392),
    .reset(1'b0),
    .set(1'b0),
    .q(bus_write));  // sources/rtl/camera_init.v(434)
  eq_w8 eq0 (
    .i0(counter),
    .i1(8'b00000000),
    .o(n1));  // sources/rtl/camera_init.v(63)
  eq_w8 eq1 (
    .i0(counter),
    .i1(8'b00000001),
    .o(n2));  // sources/rtl/camera_init.v(64)
  eq_w8 eq10 (
    .i0(counter),
    .i1(8'b00001010),
    .o(n11));  // sources/rtl/camera_init.v(77)
  eq_w8 eq100 (
    .i0(counter),
    .i1(8'b01100100),
    .o(n101));  // sources/rtl/camera_init.v(179)
  eq_w8 eq101 (
    .i0(counter),
    .i1(8'b01100101),
    .o(n102));  // sources/rtl/camera_init.v(180)
  eq_w8 eq102 (
    .i0(counter),
    .i1(8'b01100110),
    .o(n103));  // sources/rtl/camera_init.v(181)
  eq_w8 eq103 (
    .i0(counter),
    .i1(8'b01100111),
    .o(n104));  // sources/rtl/camera_init.v(182)
  eq_w8 eq104 (
    .i0(counter),
    .i1(8'b01101000),
    .o(n105));  // sources/rtl/camera_init.v(183)
  eq_w8 eq105 (
    .i0(counter),
    .i1(8'b01101001),
    .o(n106));  // sources/rtl/camera_init.v(184)
  eq_w8 eq106 (
    .i0(counter),
    .i1(8'b01101010),
    .o(n107));  // sources/rtl/camera_init.v(185)
  eq_w8 eq107 (
    .i0(counter),
    .i1(8'b01101011),
    .o(n108));  // sources/rtl/camera_init.v(186)
  eq_w8 eq108 (
    .i0(counter),
    .i1(8'b01101100),
    .o(n109));  // sources/rtl/camera_init.v(187)
  eq_w8 eq109 (
    .i0(counter),
    .i1(8'b01101101),
    .o(n110));  // sources/rtl/camera_init.v(189)
  eq_w8 eq11 (
    .i0(counter),
    .i1(8'b00001011),
    .o(n12));  // sources/rtl/camera_init.v(78)
  eq_w8 eq110 (
    .i0(counter),
    .i1(8'b01101110),
    .o(n111));  // sources/rtl/camera_init.v(190)
  eq_w8 eq111 (
    .i0(counter),
    .i1(8'b01101111),
    .o(n112));  // sources/rtl/camera_init.v(191)
  eq_w8 eq112 (
    .i0(counter),
    .i1(8'b01110000),
    .o(n113));  // sources/rtl/camera_init.v(192)
  eq_w8 eq113 (
    .i0(counter),
    .i1(8'b01110001),
    .o(n114));  // sources/rtl/camera_init.v(193)
  eq_w8 eq114 (
    .i0(counter),
    .i1(8'b01110010),
    .o(n115));  // sources/rtl/camera_init.v(194)
  eq_w8 eq115 (
    .i0(counter),
    .i1(8'b01110011),
    .o(n116));  // sources/rtl/camera_init.v(195)
  eq_w8 eq116 (
    .i0(counter),
    .i1(8'b01110100),
    .o(n117));  // sources/rtl/camera_init.v(196)
  eq_w8 eq117 (
    .i0(counter),
    .i1(8'b01110101),
    .o(n118));  // sources/rtl/camera_init.v(197)
  eq_w8 eq118 (
    .i0(counter),
    .i1(8'b01110110),
    .o(n119));  // sources/rtl/camera_init.v(198)
  eq_w8 eq119 (
    .i0(counter),
    .i1(8'b01110111),
    .o(n120));  // sources/rtl/camera_init.v(199)
  eq_w8 eq12 (
    .i0(counter),
    .i1(8'b00001100),
    .o(n13));  // sources/rtl/camera_init.v(79)
  eq_w8 eq120 (
    .i0(counter),
    .i1(8'b01111000),
    .o(n121));  // sources/rtl/camera_init.v(200)
  eq_w8 eq121 (
    .i0(counter),
    .i1(8'b01111001),
    .o(n122));  // sources/rtl/camera_init.v(201)
  eq_w8 eq122 (
    .i0(counter),
    .i1(8'b01111010),
    .o(n123));  // sources/rtl/camera_init.v(202)
  eq_w8 eq123 (
    .i0(counter),
    .i1(8'b01111011),
    .o(n124));  // sources/rtl/camera_init.v(204)
  eq_w8 eq124 (
    .i0(counter),
    .i1(8'b01111100),
    .o(n125));  // sources/rtl/camera_init.v(205)
  eq_w8 eq125 (
    .i0(counter),
    .i1(8'b01111101),
    .o(n126));  // sources/rtl/camera_init.v(206)
  eq_w8 eq126 (
    .i0(counter),
    .i1(8'b01111110),
    .o(n127));  // sources/rtl/camera_init.v(207)
  eq_w8 eq127 (
    .i0(counter),
    .i1(8'b01111111),
    .o(n128));  // sources/rtl/camera_init.v(208)
  eq_w8 eq128 (
    .i0(counter),
    .i1(8'b10000000),
    .o(n129));  // sources/rtl/camera_init.v(209)
  eq_w8 eq129 (
    .i0(counter),
    .i1(8'b10000001),
    .o(n130));  // sources/rtl/camera_init.v(210)
  eq_w8 eq13 (
    .i0(counter),
    .i1(8'b00001101),
    .o(n14));  // sources/rtl/camera_init.v(80)
  eq_w8 eq130 (
    .i0(counter),
    .i1(8'b10000010),
    .o(n131));  // sources/rtl/camera_init.v(211)
  eq_w8 eq131 (
    .i0(counter),
    .i1(8'b10000011),
    .o(n132));  // sources/rtl/camera_init.v(212)
  eq_w8 eq132 (
    .i0(counter),
    .i1(8'b10000100),
    .o(n133));  // sources/rtl/camera_init.v(213)
  eq_w8 eq133 (
    .i0(counter),
    .i1(8'b10000101),
    .o(n134));  // sources/rtl/camera_init.v(214)
  eq_w8 eq134 (
    .i0(counter),
    .i1(8'b10000110),
    .o(n135));  // sources/rtl/camera_init.v(215)
  eq_w8 eq135 (
    .i0(counter),
    .i1(8'b10000111),
    .o(n136));  // sources/rtl/camera_init.v(216)
  eq_w8 eq136 (
    .i0(counter),
    .i1(8'b10001000),
    .o(n137));  // sources/rtl/camera_init.v(217)
  eq_w8 eq137 (
    .i0(counter),
    .i1(8'b10001001),
    .o(n138));  // sources/rtl/camera_init.v(219)
  eq_w8 eq138 (
    .i0(counter),
    .i1(8'b10001010),
    .o(n139));  // sources/rtl/camera_init.v(220)
  eq_w8 eq139 (
    .i0(counter),
    .i1(8'b10001011),
    .o(n140));  // sources/rtl/camera_init.v(221)
  eq_w8 eq14 (
    .i0(counter),
    .i1(8'b00001110),
    .o(n15));  // sources/rtl/camera_init.v(81)
  eq_w8 eq140 (
    .i0(counter),
    .i1(8'b10001100),
    .o(n141));  // sources/rtl/camera_init.v(222)
  eq_w8 eq141 (
    .i0(counter),
    .i1(8'b10001101),
    .o(n142));  // sources/rtl/camera_init.v(223)
  eq_w8 eq142 (
    .i0(counter),
    .i1(8'b10001110),
    .o(n143));  // sources/rtl/camera_init.v(224)
  eq_w8 eq143 (
    .i0(counter),
    .i1(8'b10001111),
    .o(n144));  // sources/rtl/camera_init.v(225)
  eq_w8 eq144 (
    .i0(counter),
    .i1(8'b10010000),
    .o(n145));  // sources/rtl/camera_init.v(226)
  eq_w8 eq145 (
    .i0(counter),
    .i1(8'b10010001),
    .o(n146));  // sources/rtl/camera_init.v(227)
  eq_w8 eq146 (
    .i0(counter),
    .i1(8'b10010010),
    .o(n147));  // sources/rtl/camera_init.v(228)
  eq_w8 eq147 (
    .i0(counter),
    .i1(8'b10010011),
    .o(n148));  // sources/rtl/camera_init.v(229)
  eq_w8 eq148 (
    .i0(counter),
    .i1(8'b10010100),
    .o(n149));  // sources/rtl/camera_init.v(230)
  eq_w8 eq149 (
    .i0(counter),
    .i1(8'b10010101),
    .o(n150));  // sources/rtl/camera_init.v(231)
  eq_w8 eq15 (
    .i0(counter),
    .i1(8'b00001111),
    .o(n16));  // sources/rtl/camera_init.v(82)
  eq_w8 eq150 (
    .i0(counter),
    .i1(8'b10010110),
    .o(n151));  // sources/rtl/camera_init.v(232)
  eq_w8 eq151 (
    .i0(counter),
    .i1(8'b10010111),
    .o(n152));  // sources/rtl/camera_init.v(233)
  eq_w8 eq152 (
    .i0(counter),
    .i1(8'b10011000),
    .o(n153));  // sources/rtl/camera_init.v(234)
  eq_w8 eq153 (
    .i0(counter),
    .i1(8'b10011001),
    .o(n154));  // sources/rtl/camera_init.v(235)
  eq_w8 eq154 (
    .i0(counter),
    .i1(8'b10011010),
    .o(n155));  // sources/rtl/camera_init.v(236)
  eq_w8 eq155 (
    .i0(counter),
    .i1(8'b10011011),
    .o(n156));  // sources/rtl/camera_init.v(238)
  eq_w8 eq156 (
    .i0(counter),
    .i1(8'b10011100),
    .o(n157));  // sources/rtl/camera_init.v(239)
  eq_w8 eq157 (
    .i0(counter),
    .i1(8'b10011101),
    .o(n158));  // sources/rtl/camera_init.v(240)
  eq_w8 eq158 (
    .i0(counter),
    .i1(8'b10011110),
    .o(n159));  // sources/rtl/camera_init.v(241)
  eq_w8 eq159 (
    .i0(counter),
    .i1(8'b10011111),
    .o(n160));  // sources/rtl/camera_init.v(242)
  eq_w8 eq16 (
    .i0(counter),
    .i1(8'b00010000),
    .o(n17));  // sources/rtl/camera_init.v(84)
  eq_w8 eq160 (
    .i0(counter),
    .i1(8'b10100000),
    .o(n161));  // sources/rtl/camera_init.v(243)
  eq_w8 eq161 (
    .i0(counter),
    .i1(8'b10100001),
    .o(n162));  // sources/rtl/camera_init.v(244)
  eq_w8 eq162 (
    .i0(counter),
    .i1(8'b10100010),
    .o(n163));  // sources/rtl/camera_init.v(245)
  eq_w8 eq163 (
    .i0(counter),
    .i1(8'b10100011),
    .o(n164));  // sources/rtl/camera_init.v(246)
  eq_w8 eq164 (
    .i0(counter),
    .i1(8'b10100100),
    .o(n165));  // sources/rtl/camera_init.v(247)
  eq_w8 eq165 (
    .i0(counter),
    .i1(8'b10100101),
    .o(n166));  // sources/rtl/camera_init.v(248)
  eq_w8 eq166 (
    .i0(counter),
    .i1(8'b10100110),
    .o(n167));  // sources/rtl/camera_init.v(249)
  eq_w8 eq167 (
    .i0(counter),
    .i1(8'b10100111),
    .o(n168));  // sources/rtl/camera_init.v(252)
  eq_w8 eq168 (
    .i0(counter),
    .i1(8'b10101000),
    .o(n169));  // sources/rtl/camera_init.v(253)
  eq_w8 eq169 (
    .i0(counter),
    .i1(8'b10101001),
    .o(n170));  // sources/rtl/camera_init.v(254)
  eq_w8 eq17 (
    .i0(counter),
    .i1(8'b00010001),
    .o(n18));  // sources/rtl/camera_init.v(85)
  eq_w8 eq170 (
    .i0(counter),
    .i1(8'b10101010),
    .o(n171));  // sources/rtl/camera_init.v(255)
  eq_w8 eq171 (
    .i0(counter),
    .i1(8'b10101011),
    .o(n172));  // sources/rtl/camera_init.v(256)
  eq_w8 eq172 (
    .i0(counter),
    .i1(8'b10101101),
    .o(n173));  // sources/rtl/camera_init.v(257)
  eq_w8 eq173 (
    .i0(counter),
    .i1(8'b10101110),
    .o(n174));  // sources/rtl/camera_init.v(258)
  eq_w8 eq174 (
    .i0(counter),
    .i1(8'b10101111),
    .o(n175));  // sources/rtl/camera_init.v(259)
  eq_w8 eq175 (
    .i0(counter),
    .i1(8'b10110000),
    .o(n176));  // sources/rtl/camera_init.v(260)
  eq_w8 eq176 (
    .i0(counter),
    .i1(8'b10110001),
    .o(n177));  // sources/rtl/camera_init.v(261)
  eq_w8 eq177 (
    .i0(state_next),
    .i1(8'b00010010),
    .o(n383));  // sources/rtl/camera_init.v(267)
  eq_w8 eq178 (
    .i0(cnt),
    .i1(8'b00000100),
    .o(n360));  // sources/rtl/camera_init.v(320)
  eq_w8 eq179 (
    .i0(state_next),
    .i1(8'b00001011),
    .o(n376));  // sources/rtl/camera_init.v(284)
  eq_w8 eq18 (
    .i0(counter),
    .i1(8'b00010010),
    .o(n19));  // sources/rtl/camera_init.v(86)
  eq_w8 eq180 (
    .i0(state_next),
    .i1(8'b00001100),
    .o(n377));  // sources/rtl/camera_init.v(289)
  eq_w8 eq181 (
    .i0(state_next),
    .i1(8'b00001101),
    .o(n378));  // sources/rtl/camera_init.v(294)
  eq_w8 eq182 (
    .i0(state_next),
    .i1(8'b00001110),
    .o(n379));  // sources/rtl/camera_init.v(300)
  eq_w8 eq183 (
    .i0(state_next),
    .i1(8'b00010001),
    .o(n382));  // sources/rtl/camera_init.v(306)
  eq_w8 eq184 (
    .i0(state_next),
    .i1(8'b00001111),
    .o(n380));  // sources/rtl/camera_init.v(312)
  eq_w8 eq185 (
    .i0(state_next),
    .i1(8'b00010000),
    .o(n381));  // sources/rtl/camera_init.v(335)
  eq_w8 eq19 (
    .i0(counter),
    .i1(8'b00010011),
    .o(n20));  // sources/rtl/camera_init.v(88)
  eq_w8 eq2 (
    .i0(counter),
    .i1(8'b00000010),
    .o(n3));  // sources/rtl/camera_init.v(68)
  eq_w8 eq20 (
    .i0(counter),
    .i1(8'b00010100),
    .o(n21));  // sources/rtl/camera_init.v(90)
  eq_w8 eq21 (
    .i0(counter),
    .i1(8'b00010101),
    .o(n22));  // sources/rtl/camera_init.v(91)
  eq_w8 eq22 (
    .i0(counter),
    .i1(8'b00010110),
    .o(n23));  // sources/rtl/camera_init.v(92)
  eq_w8 eq23 (
    .i0(counter),
    .i1(8'b00010111),
    .o(n24));  // sources/rtl/camera_init.v(93)
  eq_w8 eq24 (
    .i0(counter),
    .i1(8'b00011000),
    .o(n25));  // sources/rtl/camera_init.v(94)
  eq_w8 eq25 (
    .i0(counter),
    .i1(8'b00011001),
    .o(n26));  // sources/rtl/camera_init.v(95)
  eq_w8 eq26 (
    .i0(counter),
    .i1(8'b00011010),
    .o(n27));  // sources/rtl/camera_init.v(96)
  eq_w8 eq27 (
    .i0(counter),
    .i1(8'b00011011),
    .o(n28));  // sources/rtl/camera_init.v(97)
  eq_w8 eq28 (
    .i0(counter),
    .i1(8'b00011100),
    .o(n29));  // sources/rtl/camera_init.v(98)
  eq_w8 eq29 (
    .i0(counter),
    .i1(8'b00011101),
    .o(n30));  // sources/rtl/camera_init.v(99)
  eq_w8 eq3 (
    .i0(counter),
    .i1(8'b00000011),
    .o(n4));  // sources/rtl/camera_init.v(69)
  eq_w8 eq30 (
    .i0(counter),
    .i1(8'b00011110),
    .o(n31));  // sources/rtl/camera_init.v(100)
  eq_w8 eq31 (
    .i0(counter),
    .i1(8'b00011111),
    .o(n32));  // sources/rtl/camera_init.v(101)
  eq_w8 eq32 (
    .i0(counter),
    .i1(8'b00100000),
    .o(n33));  // sources/rtl/camera_init.v(102)
  eq_w8 eq33 (
    .i0(counter),
    .i1(8'b00100001),
    .o(n34));  // sources/rtl/camera_init.v(103)
  eq_w8 eq34 (
    .i0(counter),
    .i1(8'b00100010),
    .o(n35));  // sources/rtl/camera_init.v(105)
  eq_w8 eq35 (
    .i0(counter),
    .i1(8'b00100011),
    .o(n36));  // sources/rtl/camera_init.v(106)
  eq_w8 eq36 (
    .i0(counter),
    .i1(8'b00100100),
    .o(n37));  // sources/rtl/camera_init.v(108)
  eq_w8 eq37 (
    .i0(counter),
    .i1(8'b00100101),
    .o(n38));  // sources/rtl/camera_init.v(109)
  eq_w8 eq38 (
    .i0(counter),
    .i1(8'b00100110),
    .o(n39));  // sources/rtl/camera_init.v(110)
  eq_w8 eq39 (
    .i0(counter),
    .i1(8'b00100111),
    .o(n40));  // sources/rtl/camera_init.v(111)
  eq_w8 eq4 (
    .i0(counter),
    .i1(8'b00000100),
    .o(n5));  // sources/rtl/camera_init.v(70)
  eq_w8 eq40 (
    .i0(counter),
    .i1(8'b00101000),
    .o(n41));  // sources/rtl/camera_init.v(112)
  eq_w8 eq41 (
    .i0(counter),
    .i1(8'b00101001),
    .o(n42));  // sources/rtl/camera_init.v(113)
  eq_w8 eq42 (
    .i0(counter),
    .i1(8'b00101010),
    .o(n43));  // sources/rtl/camera_init.v(114)
  eq_w8 eq43 (
    .i0(counter),
    .i1(8'b00101011),
    .o(n44));  // sources/rtl/camera_init.v(116)
  eq_w8 eq44 (
    .i0(counter),
    .i1(8'b00101100),
    .o(n45));  // sources/rtl/camera_init.v(117)
  eq_w8 eq45 (
    .i0(counter),
    .i1(8'b00101101),
    .o(n46));  // sources/rtl/camera_init.v(118)
  eq_w8 eq46 (
    .i0(counter),
    .i1(8'b00101110),
    .o(n47));  // sources/rtl/camera_init.v(120)
  eq_w8 eq47 (
    .i0(counter),
    .i1(8'b00101111),
    .o(n48));  // sources/rtl/camera_init.v(121)
  eq_w8 eq48 (
    .i0(counter),
    .i1(8'b00110000),
    .o(n49));  // sources/rtl/camera_init.v(122)
  eq_w8 eq49 (
    .i0(counter),
    .i1(8'b00110001),
    .o(n50));  // sources/rtl/camera_init.v(123)
  eq_w8 eq5 (
    .i0(counter),
    .i1(8'b00000101),
    .o(n6));  // sources/rtl/camera_init.v(71)
  eq_w8 eq50 (
    .i0(counter),
    .i1(8'b00110010),
    .o(n51));  // sources/rtl/camera_init.v(124)
  eq_w8 eq51 (
    .i0(counter),
    .i1(8'b00110011),
    .o(n52));  // sources/rtl/camera_init.v(125)
  eq_w8 eq52 (
    .i0(counter),
    .i1(8'b00110100),
    .o(n53));  // sources/rtl/camera_init.v(126)
  eq_w8 eq53 (
    .i0(counter),
    .i1(8'b00110101),
    .o(n54));  // sources/rtl/camera_init.v(127)
  eq_w8 eq54 (
    .i0(counter),
    .i1(8'b00110110),
    .o(n55));  // sources/rtl/camera_init.v(129)
  eq_w8 eq55 (
    .i0(counter),
    .i1(8'b00110111),
    .o(n56));  // sources/rtl/camera_init.v(130)
  eq_w8 eq56 (
    .i0(counter),
    .i1(8'b00111000),
    .o(n57));  // sources/rtl/camera_init.v(131)
  eq_w8 eq57 (
    .i0(counter),
    .i1(8'b00111001),
    .o(n58));  // sources/rtl/camera_init.v(132)
  eq_w8 eq58 (
    .i0(counter),
    .i1(8'b00111010),
    .o(n59));  // sources/rtl/camera_init.v(133)
  eq_w8 eq59 (
    .i0(counter),
    .i1(8'b00111011),
    .o(n60));  // sources/rtl/camera_init.v(134)
  eq_w8 eq6 (
    .i0(counter),
    .i1(8'b00000110),
    .o(n7));  // sources/rtl/camera_init.v(72)
  eq_w8 eq60 (
    .i0(counter),
    .i1(8'b00111100),
    .o(n61));  // sources/rtl/camera_init.v(135)
  eq_w8 eq61 (
    .i0(counter),
    .i1(8'b00111101),
    .o(n62));  // sources/rtl/camera_init.v(136)
  eq_w8 eq62 (
    .i0(counter),
    .i1(8'b00111110),
    .o(n63));  // sources/rtl/camera_init.v(137)
  eq_w8 eq63 (
    .i0(counter),
    .i1(8'b00111111),
    .o(n64));  // sources/rtl/camera_init.v(138)
  eq_w8 eq64 (
    .i0(counter),
    .i1(8'b01000000),
    .o(n65));  // sources/rtl/camera_init.v(139)
  eq_w8 eq65 (
    .i0(counter),
    .i1(8'b01000001),
    .o(n66));  // sources/rtl/camera_init.v(140)
  eq_w8 eq66 (
    .i0(counter),
    .i1(8'b01000010),
    .o(n67));  // sources/rtl/camera_init.v(142)
  eq_w8 eq67 (
    .i0(counter),
    .i1(8'b01000011),
    .o(n68));  // sources/rtl/camera_init.v(143)
  eq_w8 eq68 (
    .i0(counter),
    .i1(8'b01000100),
    .o(n69));  // sources/rtl/camera_init.v(144)
  eq_w8 eq69 (
    .i0(counter),
    .i1(8'b01000101),
    .o(n70));  // sources/rtl/camera_init.v(145)
  eq_w8 eq7 (
    .i0(counter),
    .i1(8'b00000111),
    .o(n8));  // sources/rtl/camera_init.v(74)
  eq_w8 eq70 (
    .i0(counter),
    .i1(8'b01000110),
    .o(n71));  // sources/rtl/camera_init.v(146)
  eq_w8 eq71 (
    .i0(counter),
    .i1(8'b01000111),
    .o(n72));  // sources/rtl/camera_init.v(147)
  eq_w8 eq72 (
    .i0(counter),
    .i1(8'b01001000),
    .o(n73));  // sources/rtl/camera_init.v(148)
  eq_w8 eq73 (
    .i0(counter),
    .i1(8'b01001001),
    .o(n74));  // sources/rtl/camera_init.v(149)
  eq_w8 eq74 (
    .i0(counter),
    .i1(8'b01001010),
    .o(n75));  // sources/rtl/camera_init.v(150)
  eq_w8 eq75 (
    .i0(counter),
    .i1(8'b01001011),
    .o(n76));  // sources/rtl/camera_init.v(151)
  eq_w8 eq76 (
    .i0(counter),
    .i1(8'b01001100),
    .o(n77));  // sources/rtl/camera_init.v(152)
  eq_w8 eq77 (
    .i0(counter),
    .i1(8'b01001101),
    .o(n78));  // sources/rtl/camera_init.v(153)
  eq_w8 eq78 (
    .i0(counter),
    .i1(8'b01001110),
    .o(n79));  // sources/rtl/camera_init.v(154)
  eq_w8 eq79 (
    .i0(counter),
    .i1(8'b01001111),
    .o(n80));  // sources/rtl/camera_init.v(155)
  eq_w8 eq8 (
    .i0(counter),
    .i1(8'b00001000),
    .o(n9));  // sources/rtl/camera_init.v(75)
  eq_w8 eq80 (
    .i0(counter),
    .i1(8'b01010000),
    .o(n81));  // sources/rtl/camera_init.v(156)
  eq_w8 eq81 (
    .i0(counter),
    .i1(8'b01010001),
    .o(n82));  // sources/rtl/camera_init.v(158)
  eq_w8 eq82 (
    .i0(counter),
    .i1(8'b01010010),
    .o(n83));  // sources/rtl/camera_init.v(159)
  eq_w8 eq83 (
    .i0(counter),
    .i1(8'b01010011),
    .o(n84));  // sources/rtl/camera_init.v(161)
  eq_w8 eq84 (
    .i0(counter),
    .i1(8'b01010100),
    .o(n85));  // sources/rtl/camera_init.v(162)
  eq_w8 eq85 (
    .i0(counter),
    .i1(8'b01010101),
    .o(n86));  // sources/rtl/camera_init.v(163)
  eq_w8 eq86 (
    .i0(counter),
    .i1(8'b01010110),
    .o(n87));  // sources/rtl/camera_init.v(164)
  eq_w8 eq87 (
    .i0(counter),
    .i1(8'b01010111),
    .o(n88));  // sources/rtl/camera_init.v(165)
  eq_w8 eq88 (
    .i0(counter),
    .i1(8'b01011000),
    .o(n89));  // sources/rtl/camera_init.v(166)
  eq_w8 eq89 (
    .i0(counter),
    .i1(8'b01011001),
    .o(n90));  // sources/rtl/camera_init.v(167)
  eq_w8 eq9 (
    .i0(counter),
    .i1(8'b00001001),
    .o(n10));  // sources/rtl/camera_init.v(76)
  eq_w8 eq90 (
    .i0(counter),
    .i1(8'b01011010),
    .o(n91));  // sources/rtl/camera_init.v(168)
  eq_w8 eq91 (
    .i0(counter),
    .i1(8'b01011011),
    .o(n92));  // sources/rtl/camera_init.v(169)
  eq_w8 eq92 (
    .i0(counter),
    .i1(8'b01011100),
    .o(n93));  // sources/rtl/camera_init.v(171)
  eq_w8 eq93 (
    .i0(counter),
    .i1(8'b01011101),
    .o(n94));  // sources/rtl/camera_init.v(172)
  eq_w8 eq94 (
    .i0(counter),
    .i1(8'b01011110),
    .o(n95));  // sources/rtl/camera_init.v(173)
  eq_w8 eq95 (
    .i0(counter),
    .i1(8'b01011111),
    .o(n96));  // sources/rtl/camera_init.v(174)
  eq_w8 eq96 (
    .i0(counter),
    .i1(8'b01100000),
    .o(n97));  // sources/rtl/camera_init.v(175)
  eq_w8 eq97 (
    .i0(counter),
    .i1(8'b01100001),
    .o(n98));  // sources/rtl/camera_init.v(176)
  eq_w8 eq98 (
    .i0(counter),
    .i1(8'b01100010),
    .o(n99));  // sources/rtl/camera_init.v(177)
  eq_w8 eq99 (
    .i0(counter),
    .i1(8'b01100011),
    .o(n100));  // sources/rtl/camera_init.v(178)
  i2c_module i2c_write_module (
    .address(reg_address),
    .clk(clk),
    .reset_n(reset_n),
    .sda_in(sda_in),
    .write(bus_write),
    .writedata(data_in_bus),
    .ready(ready_out),
    .scl_out(scl),
    .sda(sda),
    .sda_oe(sda_oe),
    .success_out(success_out));  // sources/rtl/camera_init.v(38)
  binary_mux_s1_w16 mux0 (
    .i0({5'b00000,n177,1'b0,n177,n178[4],n178[4],n178[4],n178[4],n178[4],n178[4],n178[4],n178[4]}),
    .i1(16'b1101110101111111),
    .sel(n176),
    .o(n183));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux1 (
    .i0(n183),
    .i1(16'b1110000000000000),
    .sel(n175),
    .o(n184));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux10 (
    .i0(n192),
    .i1(16'b0101101000110010),
    .sel(n166),
    .o(n193));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux100 (
    .i0(n282),
    .i1(16'b0100110000000000),
    .sel(n76),
    .o(n283));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux101 (
    .i0(n283),
    .i1(16'b0100001100011000),
    .sel(n75),
    .o(n284));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux102 (
    .i0(n284),
    .i1(16'b0100001000100000),
    .sel(n74),
    .o(n285));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux103 (
    .i0(n285),
    .i1(16'b0011001110100000),
    .sel(n73),
    .o(n286));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux104 (
    .i0(n286),
    .i1(16'b0111011011111111),
    .sel(n72),
    .o(n287));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux105 (
    .i0(n287),
    .i1(16'b1110000000010100),
    .sel(n71),
    .o(n288));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux106 (
    .i0(n288),
    .i1(16'b0100000100100100),
    .sel(n70),
    .o(n289));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux107 (
    .i0(n289),
    .i1(16'b1111100111000000),
    .sel(n69),
    .o(n290));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux108 (
    .i0(n290),
    .i1(16'b1110010101111111),
    .sel(n68),
    .o(n291));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux109 (
    .i0(n291),
    .i1(16'b1111111100000000),
    .sel(n67),
    .o(n292));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux11 (
    .i0(n193),
    .i1(16'b0101010100000000),
    .sel(n165),
    .o(n194));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux110 (
    .i0(n292),
    .i1(16'b0011110100111000),
    .sel(n66),
    .o(n293));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux111 (
    .i0(n293),
    .i1(16'b0110110100000000),
    .sel(n65),
    .o(n294));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux112 (
    .i0(n294),
    .i1(16'b0101101000100011),
    .sel(n64),
    .o(n295));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux113 (
    .i0(n295),
    .i1(16'b0101000010101000),
    .sel(n63),
    .o(n296));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux114 (
    .i0(n296),
    .i1(16'b0100111111001010),
    .sel(n62),
    .o(n297));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux115 (
    .i0(n297),
    .i1(16'b0011011111000000),
    .sel(n61),
    .o(n298));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux116 (
    .i0(n298),
    .i1(16'b0011001000001001),
    .sel(n60),
    .o(n299));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux117 (
    .i0(n299),
    .i1(16'b0001101001001011),
    .sel(n59),
    .o(n300));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux118 (
    .i0(n300),
    .i1(16'b0001100100000000),
    .sel(n58),
    .o(n301));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux119 (
    .i0(n301),
    .i1(16'b0001100001000011),
    .sel(n57),
    .o(n302));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux12 (
    .i0(n194),
    .i1(16'b0101010000000000),
    .sel(n164),
    .o(n195));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux120 (
    .i0(n302),
    .i1(16'b0001011100010001),
    .sel(n56),
    .o(n303));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux121 (
    .i0(n303),
    .i1(16'b0001001001000000),
    .sel(n55),
    .o(n304));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux122 (
    .i0(n304),
    .i1(16'b0111001111000001),
    .sel(n54),
    .o(n305));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux123 (
    .i0(n305),
    .i1(16'b0111000110010100),
    .sel(n53),
    .o(n306));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux124 (
    .i0(n306),
    .i1(16'b0111000000000010),
    .sel(n52),
    .o(n307));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux125 (
    .i0(n307),
    .i1(16'b0110111000000000),
    .sel(n51),
    .o(n308));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux126 (
    .i0(n308),
    .i1(16'b0110110110000000),
    .sel(n50),
    .o(n309));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux127 (
    .i0(n309),
    .i1(16'b0110110000000000),
    .sel(n49),
    .o(n310));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux128 (
    .i0(n310),
    .i1(16'b0010100000110000),
    .sel(n48),
    .o(n311));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux129 (
    .i0(n311),
    .i1(16'b0010000010000000),
    .sel(n47),
    .o(n312));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux13 (
    .i0(n195),
    .i1(16'b0101001100000000),
    .sel(n163),
    .o(n196));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux130 (
    .i0(n312),
    .i1(16'b0111110000000101),
    .sel(n46),
    .o(n313));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux131 (
    .i0(n313),
    .i1(16'b0110001010000000),
    .sel(n45),
    .o(n314));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux132 (
    .i0(n314),
    .i1(16'b0110000101110000),
    .sel(n44),
    .o(n315));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux133 (
    .i0(n315),
    .i1(16'b0000110000111100),
    .sel(n43),
    .o(n316));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux134 (
    .i0(n316),
    .i1(16'b0100011000100010),
    .sel(n42),
    .o(n317));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux135 (
    .i0(n317),
    .i1(16'b0110001100000000),
    .sel(n41),
    .o(n318));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux136 (
    .i0(n318),
    .i1(16'b0101110000000000),
    .sel(n40),
    .o(n319));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux137 (
    .i0(n319),
    .i1(16'b0010011010000010),
    .sel(n39),
    .o(n320));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux138 (
    .i0(n320),
    .i1(16'b0010010100111000),
    .sel(n38),
    .o(n321));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux139 (
    .i0(n321),
    .i1(16'b0010010001000000),
    .sel(n37),
    .o(n322));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux14 (
    .i0(n196),
    .i1(16'b0101001010010110),
    .sel(n162),
    .o(n197));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux140 (
    .i0(n322),
    .i1(16'b0010000110011001),
    .sel(n36),
    .o(n323));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux141 (
    .i0(n323),
    .i1(16'b0100101010000001),
    .sel(n35),
    .o(n324));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux142 (
    .i0(n324),
    .i1(16'b0100001000000011),
    .sel(n34),
    .o(n325));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux143 (
    .i0(n325),
    .i1(16'b0101101100000000),
    .sel(n33),
    .o(n326));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux144 (
    .i0(n326),
    .i1(16'b0100100000000000),
    .sel(n32),
    .o(n327));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux145 (
    .i0(n327),
    .i1(16'b0100110000000000),
    .sel(n31),
    .o(n328));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux146 (
    .i0(n328),
    .i1(16'b0000111001000001),
    .sel(n30),
    .o(n329));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux147 (
    .i0(n329),
    .i1(16'b0000110110000111),
    .sel(n29),
    .o(n330));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux148 (
    .i0(n330),
    .i1(16'b0000011111000000),
    .sel(n28),
    .o(n331));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux149 (
    .i0(n331),
    .i1(16'b0000011010001000),
    .sel(n27),
    .o(n332));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux15 (
    .i0(n197),
    .i1(16'b0101000111001000),
    .sel(n161),
    .o(n198));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux150 (
    .i0(n332),
    .i1(16'b0011011000011010),
    .sel(n26),
    .o(n333));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux151 (
    .i0(n333),
    .i1(16'b0011010011000000),
    .sel(n25),
    .o(n334));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux152 (
    .i0(n334),
    .i1(16'b0010001100000000),
    .sel(n24),
    .o(n335));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux153 (
    .i0(n335),
    .i1(16'b0011011111000011),
    .sel(n23),
    .o(n336));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux154 (
    .i0(n336),
    .i1(16'b0010001000011010),
    .sel(n22),
    .o(n337));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux155 (
    .i0(n337),
    .i1(16'b0011010111011010),
    .sel(n21),
    .o(n338));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux156 (
    .i0(n338),
    .i1(16'b0011100110010010),
    .sel(n20),
    .o(n339));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux157 (
    .i0(n339),
    .i1(16'b0001011000010000),
    .sel(n19),
    .o(n340));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux158 (
    .i0(n340),
    .i1(16'b0100001100010001),
    .sel(n18),
    .o(n341));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux159 (
    .i0(n341),
    .i1(16'b0011111000000000),
    .sel(n17),
    .o(n342));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux16 (
    .i0(n198),
    .i1(16'b0101000000000000),
    .sel(n160),
    .o(n199));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux160 (
    .i0(n342),
    .i1(16'b0011101111111011),
    .sel(n16),
    .o(n343));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux161 (
    .i0(n343),
    .i1(16'b0011101000110011),
    .sel(n15),
    .o(n344));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux162 (
    .i0(n344),
    .i1(16'b0011001101111000),
    .sel(n14),
    .o(n345));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux163 (
    .i0(n345),
    .i1(16'b0010110000001100),
    .sel(n13),
    .o(n346));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux164 (
    .i0(n346),
    .i1(16'b0001010001001000),
    .sel(n12),
    .o(n347));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux165 (
    .i0(n347),
    .i1(16'b0001001111100101),
    .sel(n11),
    .o(n348));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux166 (
    .i0(n348),
    .i1(16'b0000010000101000),
    .sel(n10),
    .o(n349));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux167 (
    .i0(n349),
    .i1(16'b0000100100000010),
    .sel(n9),
    .o(n350));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux168 (
    .i0(n350),
    .i1(16'b0001000100000000),
    .sel(n8),
    .o(n351));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux169 (
    .i0(n351),
    .i1(16'b0011110000110010),
    .sel(n7),
    .o(n352));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux17 (
    .i0(n199),
    .i1(16'b1000011000111101),
    .sel(n159),
    .o(n200));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux170 (
    .i0(n352),
    .i1(16'b1111111100000001),
    .sel(n6),
    .o(n353));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux171 (
    .i0(n353),
    .i1(16'b0010111011011111),
    .sel(n5),
    .o(n354));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux172 (
    .i0(n354),
    .i1(16'b0010110011111111),
    .sel(n4),
    .o(n355));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux173 (
    .i0(n355),
    .i1(16'b1111111100000000),
    .sel(n3),
    .o(n356));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux174 (
    .i0(n356),
    .i1(16'b0001001010000000),
    .sel(n2),
    .o(n357));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux175 (
    .i0(n357),
    .i1(16'b1111111100000001),
    .sel(n1),
    .o(regs_data));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w5 mux176 (
    .i0(5'b10000),
    .i1({n360,n361[3],2'b01,n361[3]}),
    .sel(n177),
    .o(n363));  // sources/rtl/camera_init.v(328)
  binary_mux_s1_w5 mux177 (
    .i0(5'b01100),
    .i1(n363),
    .sel(success_out),
    .o(n364));  // sources/rtl/camera_init.v(331)
  binary_mux_s1_w16 mux178 (
    .i0({8'b00001111,state_next}),
    .i1({state_next,3'b000,n364}),
    .sel(ready_out),
    .o({n359,n365}));  // sources/rtl/camera_init.v(309)
  binary_mux_s1_w8 mux179 (
    .i0(8'b00001011),
    .i1(n369),
    .sel(reset_n),
    .o(n370));  // sources/rtl/camera_init.v(346)
  binary_mux_s1_w16 mux18 (
    .i0(n200),
    .i1(16'b1000110000000000),
    .sel(n158),
    .o(n201));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w8 mux180 (
    .i0(cnt),
    .i1(n372),
    .sel(n177),
    .o(n374));  // sources/rtl/camera_init.v(409)
  binary_mux_s1_w8 mux181 (
    .i0(n373),
    .i1(8'b00000011),
    .sel(n177),
    .o(n375));  // sources/rtl/camera_init.v(409)
  binary_mux_s1_w3 mux182 (
    .i0(n385),
    .i1(3'b000),
    .sel(n371),
    .o(n390));  // sources/rtl/camera_init.v(433)
  binary_mux_s1_w8 mux183 (
    .i0(n386),
    .i1(8'b00000000),
    .sel(n371),
    .o(n391));  // sources/rtl/camera_init.v(433)
  binary_mux_s1_w8 mux184 (
    .i0(n389),
    .i1(8'b00000000),
    .sel(n371),
    .o(n393));  // sources/rtl/camera_init.v(433)
  binary_mux_s1_w8 mux185 (
    .i0(n388),
    .i1(cnt),
    .sel(n371),
    .o(n394));  // sources/rtl/camera_init.v(433)
  binary_mux_s1_w16 mux19 (
    .i0(n201),
    .i1(16'b1100000101001011),
    .sel(n157),
    .o(n202));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux2 (
    .i0(n184),
    .i1(16'b1110000101100111),
    .sel(n174),
    .o(n185));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux20 (
    .i0(n202),
    .i1(16'b1100000001100100),
    .sel(n156),
    .o(n203));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux21 (
    .i0(n203),
    .i1(16'b1100010001011100),
    .sel(n155),
    .o(n204));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux22 (
    .i0(n204),
    .i1(16'b1011001000001111),
    .sel(n154),
    .o(n205));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux23 (
    .i0(n205),
    .i1(16'b1011000110010100),
    .sel(n153),
    .o(n206));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux24 (
    .i0(n206),
    .i1(16'b1011000011000101),
    .sel(n152),
    .o(n207));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux25 (
    .i0(n207),
    .i1(16'b1011010111111111),
    .sel(n151),
    .o(n208));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux26 (
    .i0(n208),
    .i1(16'b1011010010010111),
    .sel(n150),
    .o(n209));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux27 (
    .i0(n209),
    .i1(16'b1011001110101111),
    .sel(n149),
    .o(n210));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux28 (
    .i0(n210),
    .i1(16'b1011100101111100),
    .sel(n148),
    .o(n211));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux29 (
    .i0(n211),
    .i1(16'b1011011101100100),
    .sel(n147),
    .o(n212));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux3 (
    .i0(n185),
    .i1(16'b1110010100011111),
    .sel(n173),
    .o(n186));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux30 (
    .i0(n212),
    .i1(16'b1011100010100101),
    .sel(n146),
    .o(n213));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux31 (
    .i0(n213),
    .i1(16'b1011011001100110),
    .sel(n145),
    .o(n214));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux32 (
    .i0(n214),
    .i1(16'b1100011100010000),
    .sel(n144),
    .o(n215));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux33 (
    .i0(n215),
    .i1(16'b1011111110000000),
    .sel(n143),
    .o(n216));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux34 (
    .i0(n216),
    .i1(16'b1100011001010001),
    .sel(n142),
    .o(n217));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux35 (
    .i0(n217),
    .i1(16'b1100010100010001),
    .sel(n141),
    .o(n218));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux36 (
    .i0(n218),
    .i1(16'b1010100000000000),
    .sel(n140),
    .o(n219));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux37 (
    .i0(n219),
    .i1(16'b1010010000000000),
    .sel(n139),
    .o(n220));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux38 (
    .i0(n220),
    .i1(16'b1100001111101101),
    .sel(n138),
    .o(n221));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux39 (
    .i0(n221),
    .i1(16'b1001011100000000),
    .sel(n137),
    .o(n222));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux4 (
    .i0(n186),
    .i1(16'b1101101000001000),
    .sel(n172),
    .o(n187));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux40 (
    .i0(n222),
    .i1(16'b1001011100000000),
    .sel(n136),
    .o(n223));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux41 (
    .i0(n223),
    .i1(16'b1001011110000000),
    .sel(n135),
    .o(n224));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux42 (
    .i0(n224),
    .i1(16'b1001011110011000),
    .sel(n134),
    .o(n225));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux43 (
    .i0(n225),
    .i1(16'b1001011100000010),
    .sel(n133),
    .o(n226));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux44 (
    .i0(n226),
    .i1(16'b1001011100100110),
    .sel(n132),
    .o(n227));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux45 (
    .i0(n227),
    .i1(16'b1001011100101000),
    .sel(n131),
    .o(n228));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux46 (
    .i0(n228),
    .i1(16'b1001011100110000),
    .sel(n130),
    .o(n229));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux47 (
    .i0(n229),
    .i1(16'b1001011100100100),
    .sel(n129),
    .o(n230));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux48 (
    .i0(n230),
    .i1(16'b1001011100001100),
    .sel(n128),
    .o(n231));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux49 (
    .i0(n231),
    .i1(16'b1001011100000010),
    .sel(n127),
    .o(n232));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux5 (
    .i0(n187),
    .i1(16'b0111111100000000),
    .sel(n171),
    .o(n188));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux50 (
    .i0(n232),
    .i1(16'b1001011100011001),
    .sel(n126),
    .o(n233));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux51 (
    .i0(n233),
    .i1(16'b1001011100001000),
    .sel(n125),
    .o(n234));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux52 (
    .i0(n234),
    .i1(16'b1001011000000000),
    .sel(n124),
    .o(n235));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux53 (
    .i0(n235),
    .i1(16'b1001001100000000),
    .sel(n123),
    .o(n236));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux54 (
    .i0(n236),
    .i1(16'b1001001100000000),
    .sel(n122),
    .o(n237));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux55 (
    .i0(n237),
    .i1(16'b1001001100000000),
    .sel(n121),
    .o(n238));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux56 (
    .i0(n238),
    .i1(16'b1001001100000000),
    .sel(n120),
    .o(n239));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux57 (
    .i0(n239),
    .i1(16'b1001001100000000),
    .sel(n119),
    .o(n240));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux58 (
    .i0(n240),
    .i1(16'b1001001100000000),
    .sel(n118),
    .o(n241));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux59 (
    .i0(n241),
    .i1(16'b1001001100000000),
    .sel(n117),
    .o(n242));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux6 (
    .i0(n188),
    .i1(16'b1100001111101101),
    .sel(n170),
    .o(n189));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux60 (
    .i0(n242),
    .i1(16'b1001001100000100),
    .sel(n116),
    .o(n243));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux61 (
    .i0(n243),
    .i1(16'b1001001100000000),
    .sel(n115),
    .o(n244));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux62 (
    .i0(n244),
    .i1(16'b1001001100000101),
    .sel(n114),
    .o(n245));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux63 (
    .i0(n245),
    .i1(16'b1001001100000101),
    .sel(n113),
    .o(n246));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux64 (
    .i0(n246),
    .i1(16'b1001001111100011),
    .sel(n112),
    .o(n247));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux65 (
    .i0(n247),
    .i1(16'b1001001100000110),
    .sel(n111),
    .o(n248));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux66 (
    .i0(n248),
    .i1(16'b1001001000000000),
    .sel(n110),
    .o(n249));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux67 (
    .i0(n249),
    .i1(16'b1001000100100000),
    .sel(n109),
    .o(n250));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux68 (
    .i0(n250),
    .i1(16'b1001000111101000),
    .sel(n108),
    .o(n251));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux69 (
    .i0(n251),
    .i1(16'b1001000111010111),
    .sel(n107),
    .o(n252));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux7 (
    .i0(n189),
    .i1(16'b1101001110000010),
    .sel(n169),
    .o(n190));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux70 (
    .i0(n252),
    .i1(16'b1001000111000100),
    .sel(n106),
    .o(n253));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux71 (
    .i0(n253),
    .i1(16'b1001000110101111),
    .sel(n105),
    .o(n254));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux72 (
    .i0(n254),
    .i1(16'b1001000110100011),
    .sel(n104),
    .o(n255));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux73 (
    .i0(n255),
    .i1(16'b1001000110010110),
    .sel(n103),
    .o(n256));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux74 (
    .i0(n256),
    .i1(16'b1001000110001111),
    .sel(n102),
    .o(n257));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux75 (
    .i0(n257),
    .i1(16'b1001000110001000),
    .sel(n101),
    .o(n258));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux76 (
    .i0(n258),
    .i1(16'b1001000101111110),
    .sel(n100),
    .o(n259));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux77 (
    .i0(n259),
    .i1(16'b1001000101110101),
    .sel(n99),
    .o(n260));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux78 (
    .i0(n260),
    .i1(16'b1001000101101001),
    .sel(n98),
    .o(n261));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux79 (
    .i0(n261),
    .i1(16'b1001000101011010),
    .sel(n97),
    .o(n262));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux8 (
    .i0(n190),
    .i1(16'b0101110000000000),
    .sel(n168),
    .o(n191));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux80 (
    .i0(n262),
    .i1(16'b1001000100110001),
    .sel(n96),
    .o(n263));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux81 (
    .i0(n263),
    .i1(16'b1001000100011010),
    .sel(n95),
    .o(n264));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux82 (
    .i0(n264),
    .i1(16'b1001000100001110),
    .sel(n94),
    .o(n265));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux83 (
    .i0(n265),
    .i1(16'b1001000000000000),
    .sel(n93),
    .o(n266));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux84 (
    .i0(n266),
    .i1(16'b0111110100001110),
    .sel(n92),
    .o(n267));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux85 (
    .i0(n267),
    .i1(16'b0111110100010000),
    .sel(n91),
    .o(n268));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux86 (
    .i0(n268),
    .i1(16'b0111110100100000),
    .sel(n90),
    .o(n269));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux87 (
    .i0(n269),
    .i1(16'b0111110000001000),
    .sel(n89),
    .o(n270));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux88 (
    .i0(n270),
    .i1(16'b0111110101001000),
    .sel(n88),
    .o(n271));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux89 (
    .i0(n271),
    .i1(16'b0111110101001000),
    .sel(n87),
    .o(n272));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux9 (
    .i0(n191),
    .i1(16'b0101101100101001),
    .sel(n167),
    .o(n192));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux90 (
    .i0(n272),
    .i1(16'b0111110000000011),
    .sel(n86),
    .o(n273));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux91 (
    .i0(n273),
    .i1(16'b0111110100000000),
    .sel(n85),
    .o(n274));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux92 (
    .i0(n274),
    .i1(16'b0111110000000000),
    .sel(n84),
    .o(n275));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux93 (
    .i0(n275),
    .i1(16'b1100100110000000),
    .sel(n83),
    .o(n276));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux94 (
    .i0(n276),
    .i1(16'b1100100000001000),
    .sel(n82),
    .o(n277));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux95 (
    .i0(n277),
    .i1(16'b1101001110000010),
    .sel(n81),
    .o(n278));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux96 (
    .i0(n278),
    .i1(16'b1101100100010000),
    .sel(n80),
    .o(n279));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux97 (
    .i0(n279),
    .i1(16'b1101011100000011),
    .sel(n79),
    .o(n280));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux98 (
    .i0(n280),
    .i1(16'b1000100000111111),
    .sel(n78),
    .o(n281));  // sources/rtl/camera_init.v(262)
  binary_mux_s1_w16 mux99 (
    .i0(n281),
    .i1(16'b1000011111010101),
    .sel(n77),
    .o(n282));  // sources/rtl/camera_init.v(262)
  AL_DFF ready_reg (
    .clk(clk),
    .d(n383),
    .reset(1'b0),
    .set(1'b0),
    .q(ready));  // sources/rtl/camera_init.v(271)
  reg_ar_as_w8 reg0 (
    .clk(clk_div),
    .d(n370),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(state_next));  // sources/rtl/camera_init.v(347)
  reg_ar_as_w3 reg1 (
    .clk(clk_div),
    .d(n390),
    .reset(3'b000),
    .set(3'b000),
    .q(reg_address));  // sources/rtl/camera_init.v(434)
  reg_ar_as_w8 reg2 (
    .clk(clk_div),
    .d(n391),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(data_in_bus));  // sources/rtl/camera_init.v(434)
  reg_ar_as_w8 reg3 (
    .clk(clk_div),
    .d(n393),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(counter));  // sources/rtl/camera_init.v(434)
  reg_ar_as_w8 reg4 (
    .clk(clk_div),
    .d(n394),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(cnt));  // sources/rtl/camera_init.v(434)
  reg_ar_as_w9 reg5 (
    .clk(clk),
    .d(n0),
    .reset(9'b000000000),
    .set(9'b000000000),
    .q(divider2));  // sources/rtl/camera_init.v(57)
  onehot_mux_s9_w8 sel0 (
    .i0(state_next),
    .i1(8'b00010010),
    .i2(8'b00001100),
    .i3(n365),
    .i4(n359),
    .i5(8'b00010001),
    .i6(8'b00001110),
    .i7(8'b00001101),
    .i8(8'b00001100),
    .sel({n376,n377,n378,n379,n382,n380,n381,n383,n384}),
    .o(n369));  // sources/rtl/camera_init.v(345)
  onehot_mux_s9_w3 sel1 (
    .i0(3'b000),
    .i1(3'b000),
    .i2(3'b000),
    .i3(3'b000),
    .i4(3'b000),
    .i5(3'b000),
    .i6(3'b011),
    .i7(3'b010),
    .i8(3'b001),
    .sel({n376,n377,n378,n379,n380,n381,n382,n383,n384}),
    .o(n385));  // sources/rtl/camera_init.v(432)
  onehot_mux_s9_w8 sel2 (
    .i0(8'b00000000),
    .i1(8'b00000000),
    .i2(8'b00000000),
    .i3(8'b00000000),
    .i4(8'b00000000),
    .i5(8'b00000001),
    .i6(regs_data[7:0]),
    .i7(regs_data[15:8]),
    .i8(8'b01100000),
    .sel({n376,n377,n378,n379,n380,n381,n382,n383,n384}),
    .o(n386));  // sources/rtl/camera_init.v(432)
  onehot_mux_s9_w8 sel3 (
    .i0(cnt),
    .i1(cnt),
    .i2(cnt),
    .i3(n374),
    .i4(cnt),
    .i5(cnt),
    .i6(cnt),
    .i7(cnt),
    .i8(cnt),
    .sel({n376,n377,n378,n379,n380,n381,n382,n383,n384}),
    .o(n388));  // sources/rtl/camera_init.v(432)
  onehot_mux_s9_w8 sel4 (
    .i0(counter),
    .i1(counter),
    .i2(counter),
    .i3(n375),
    .i4(counter),
    .i5(counter),
    .i6(counter),
    .i7(counter),
    .i8(counter),
    .sel({n376,n377,n378,n379,n380,n381,n382,n383,n384}),
    .o(n389));  // sources/rtl/camera_init.v(432)
  or u10 (n366, n179, n358);  // sources/rtl/camera_init.v(432)
  or u11 (n182, n383, n382);  // sources/rtl/camera_init.v(432)
  AL_MUX u12 (
    .i0(n387),
    .i1(1'b0),
    .sel(n371),
    .o(n392));  // sources/rtl/camera_init.v(433)
  or u13 (n358, n377, n376);  // sources/rtl/camera_init.v(432)
  or u14 (n179, n379, n378);  // sources/rtl/camera_init.v(432)
  or u15 (n180, n182, n181);  // sources/rtl/camera_init.v(432)
  or u16 (n181, n381, n380);  // sources/rtl/camera_init.v(432)
  or u17 (n387, n368, n362);  // sources/rtl/camera_init.v(432)
  not u2 (n178[4], n177);  // sources/rtl/camera_init.v(262)
  buf u3 (clk_div, divider2[8]);  // sources/rtl/camera_init.v(59)
  not u4 (n361[3], n360);  // sources/rtl/camera_init.v(325)
  or u5 (n368, n379, n378);  // sources/rtl/camera_init.v(432)
  or u6 (n362, n377, n376);  // sources/rtl/camera_init.v(432)
  not u7 (n371, reset_n);  // sources/rtl/camera_init.v(351)
  not u8 (n384, n367);  // sources/rtl/camera_init.v(432)
  or u9 (n367, n180, n366);  // sources/rtl/camera_init.v(432)

endmodule 

module lcd_sync  // sources/rtl/lcd_sync.v(2)
  (
  clk,
  rest_n,
  addr,
  hsync_cnt,
  img_ack,
  lcd_clk,
  lcd_de,
  lcd_hsync,
  lcd_pwm,
  lcd_vsync,
  vsync_cnt
  );

  input clk;  // sources/rtl/lcd_sync.v(11)
  input rest_n;  // sources/rtl/lcd_sync.v(12)
  output [15:0] addr;  // sources/rtl/lcd_sync.v(21)
  output [10:0] hsync_cnt;  // sources/rtl/lcd_sync.v(18)
  output img_ack;  // sources/rtl/lcd_sync.v(20)
  output lcd_clk;  // sources/rtl/lcd_sync.v(13)
  output lcd_de;  // sources/rtl/lcd_sync.v(17)
  output lcd_hsync;  // sources/rtl/lcd_sync.v(15)
  output lcd_pwm;  // sources/rtl/lcd_sync.v(14)
  output lcd_vsync;  // sources/rtl/lcd_sync.v(16)
  output [10:0] vsync_cnt;  // sources/rtl/lcd_sync.v(19)

  parameter IMG_H = 164;
  parameter IMG_W = 200;
  parameter IMG_X = 0;
  parameter IMG_Y = 0;
  // localparam TH = 800;
  // localparam THB = 160;
  // localparam TV = 525;
  // localparam TVB = 45;
  // localparam VGA_H = 640;
  // localparam VGA_V = 480;
  wire [10:0] counter_hs;  // sources/rtl/lcd_sync.v(33)
  wire [10:0] counter_vs;  // sources/rtl/lcd_sync.v(34)
  wire [11:0] n19;
  wire [10:0] n2;
  wire [11:0] n22;
  wire [11:0] n25;
  wire [31:0] n26;
  wire [11:0] n27;
  wire [31:0] n28;
  wire [39:0] n29;
  wire [10:0] n3;
  wire [31:0] n30;
  wire [15:0] n31;
  wire [10:0] n4;
  wire [10:0] n5;
  wire [10:0] n6;
  wire [10:0] n7;
  wire [10:0] n8;
  wire [15:0] read_addr;  // sources/rtl/lcd_sync.v(70)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n17;
  wire n18;
  wire n20;
  wire n21;
  wire n23;
  wire n24;
  wire n9;

  add_pu11_pu11_o11 add0 (
    .i0(counter_vs),
    .i1(11'b00000000001),
    .o(n2));  // sources/rtl/lcd_sync.v(50)
  add_pu11_pu11_o11 add1 (
    .i0(counter_hs),
    .i1(11'b00000000001),
    .o(n4));  // sources/rtl/lcd_sync.v(54)
  add_pu32_pu32_o32 add2 (
    .i0(n26),
    .i1(n29[31:0]),
    .o({open_n0,open_n1,open_n2,open_n3,open_n4,open_n5,open_n6,open_n7,open_n8,open_n9,open_n10,open_n11,open_n12,open_n13,open_n14,open_n15,n30[15:0]}));  // sources/rtl/lcd_sync.v(79)
  eq_w11 eq0 (
    .i0(counter_hs),
    .i1(11'b01100100000),
    .o(n0));  // sources/rtl/lcd_sync.v(45)
  eq_w11 eq1 (
    .i0(counter_vs),
    .i1(11'b01000001101),
    .o(n1));  // sources/rtl/lcd_sync.v(47)
  eq_w1 eq2 (
    .i0(rest_n),
    .i1(1'b1),
    .o(lcd_pwm));  // sources/rtl/lcd_sync.v(58)
  lt_u11_u11 lt0 (
    .ci(1'b1),
    .i0(11'b00000010000),
    .i1(counter_hs),
    .o(n9));  // sources/rtl/lcd_sync.v(60)
  lt_u11_u11 lt1 (
    .ci(1'b0),
    .i0(counter_hs),
    .i1(11'b00001110000),
    .o(n10));  // sources/rtl/lcd_sync.v(60)
  lt_u11_u11 lt2 (
    .ci(1'b1),
    .i0(11'b00000001010),
    .i1(counter_vs),
    .o(n11));  // sources/rtl/lcd_sync.v(61)
  lt_u11_u11 lt3 (
    .ci(1'b0),
    .i0(counter_vs),
    .i1(11'b00000001100),
    .o(n12));  // sources/rtl/lcd_sync.v(61)
  lt_u11_u11 lt4 (
    .ci(1'b1),
    .i0(11'b00010100000),
    .i1(counter_hs),
    .o(n13));  // sources/rtl/lcd_sync.v(62)
  lt_u11_u11 lt5 (
    .ci(1'b1),
    .i0(counter_hs),
    .i1(11'b01100100000),
    .o(n14));  // sources/rtl/lcd_sync.v(62)
  lt_u11_u11 lt6 (
    .ci(1'b1),
    .i0(11'b00000101101),
    .i1(counter_vs),
    .o(n16));  // sources/rtl/lcd_sync.v(62)
  lt_u11_u11 lt7 (
    .ci(1'b0),
    .i0(counter_vs),
    .i1(11'b01000001101),
    .o(n18));  // sources/rtl/lcd_sync.v(62)
  lt_u32_u32 lt8 (
    .ci(1'b0),
    .i0({n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19[11],n19}),
    .i1(32'b00000000000000000000000011001000),
    .o(n20));  // sources/rtl/lcd_sync.v(67)
  lt_u32_u32 lt9 (
    .ci(1'b0),
    .i0({n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22[11],n22}),
    .i1(32'b00000000000000000000000010100100),
    .o(n23));  // sources/rtl/lcd_sync.v(68)
  mult_u32_u8_o40 mult0 (
    .i0(n28),
    .i1(8'b11001000),
    .o({open_n16,open_n17,open_n18,open_n19,open_n20,open_n21,open_n22,open_n23,n29[31:0]}));  // sources/rtl/lcd_sync.v(79)
  binary_mux_s1_w11 mux0 (
    .i0(n2),
    .i1(11'b00000000000),
    .sel(n1),
    .o(n3));  // sources/rtl/lcd_sync.v(50)
  binary_mux_s1_w11 mux1 (
    .i0(counter_vs),
    .i1(n3),
    .sel(n0),
    .o(n5));  // sources/rtl/lcd_sync.v(54)
  binary_mux_s1_w11 mux2 (
    .i0(n4),
    .i1(11'b00000000000),
    .sel(n0),
    .o(n6));  // sources/rtl/lcd_sync.v(54)
  binary_mux_s1_w11 mux3 (
    .i0(n6),
    .i1(11'b00000000000),
    .sel(n24),
    .o(n7));  // sources/rtl/lcd_sync.v(55)
  binary_mux_s1_w11 mux4 (
    .i0(n5),
    .i1(11'b00000000000),
    .sel(n24),
    .o(n8));  // sources/rtl/lcd_sync.v(55)
  binary_mux_s1_w16 mux5 (
    .i0(16'b0000000000000000),
    .i1(n30[15:0]),
    .sel(img_ack),
    .o(n31));  // sources/rtl/lcd_sync.v(81)
  reg_ar_as_w11 reg0 (
    .clk(clk),
    .d(n8),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(counter_vs));  // sources/rtl/lcd_sync.v(56)
  reg_ar_as_w16 reg1 (
    .clk(clk),
    .d(n31),
    .reset({n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24,n24}),
    .set(16'b0000000000000000),
    .q(read_addr));  // sources/rtl/lcd_sync.v(81)
  reg_ar_as_w11 reg2 (
    .clk(clk),
    .d(n7),
    .reset(11'b00000000000),
    .set(11'b00000000000),
    .q(counter_hs));  // sources/rtl/lcd_sync.v(56)
  add_pu12_mu12_o12 sub0 (
    .i0({1'b0,counter_hs}),
    .i1(12'b000010100000),
    .o(n19));  // sources/rtl/lcd_sync.v(67)
  add_pu12_mu12_o12 sub1 (
    .i0({1'b0,counter_vs}),
    .i1(12'b000000101101),
    .o(n22));  // sources/rtl/lcd_sync.v(68)
  add_pu12_mu12_o12 sub2 (
    .i0({1'b0,counter_hs}),
    .i1(12'b000000000000),
    .o(n25));  // sources/rtl/lcd_sync.v(79)
  add_pu32_mu32_o32 sub3 (
    .i0({n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25[11],n25}),
    .i1(32'b00000000000000000000000010100000),
    .o(n26));  // sources/rtl/lcd_sync.v(79)
  add_pu12_mu12_o12 sub4 (
    .i0({1'b0,counter_vs}),
    .i1(12'b000000000000),
    .o(n27));  // sources/rtl/lcd_sync.v(79)
  add_pu32_mu32_o32 sub5 (
    .i0({n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27[11],n27}),
    .i1(32'b00000000000000000000000000101101),
    .o(n28));  // sources/rtl/lcd_sync.v(79)
  and u10 (n17, n15, n16);  // sources/rtl/lcd_sync.v(62)
  and u11 (lcd_de, n17, n18);  // sources/rtl/lcd_sync.v(62)
  buf u12 (hsync_cnt[0], counter_hs[0]);  // sources/rtl/lcd_sync.v(63)
  buf u13 (addr[4], read_addr[4]);  // sources/rtl/lcd_sync.v(72)
  and u14 (n21, lcd_de, n20);  // sources/rtl/lcd_sync.v(67)
  buf u15 (addr[3], read_addr[3]);  // sources/rtl/lcd_sync.v(72)
  and u16 (img_ack, n21, n23);  // sources/rtl/lcd_sync.v(68)
  buf u17 (vsync_cnt[0], counter_vs[0]);  // sources/rtl/lcd_sync.v(64)
  buf u18 (addr[2], read_addr[2]);  // sources/rtl/lcd_sync.v(72)
  buf u19 (addr[0], read_addr[0]);  // sources/rtl/lcd_sync.v(72)
  buf u2 (addr[6], read_addr[6]);  // sources/rtl/lcd_sync.v(72)
  buf u20 (addr[7], read_addr[7]);  // sources/rtl/lcd_sync.v(72)
  buf u21 (addr[8], read_addr[8]);  // sources/rtl/lcd_sync.v(72)
  buf u22 (addr[9], read_addr[9]);  // sources/rtl/lcd_sync.v(72)
  buf u23 (addr[10], read_addr[10]);  // sources/rtl/lcd_sync.v(72)
  buf u24 (addr[11], read_addr[11]);  // sources/rtl/lcd_sync.v(72)
  buf u25 (addr[12], read_addr[12]);  // sources/rtl/lcd_sync.v(72)
  buf u26 (addr[13], read_addr[13]);  // sources/rtl/lcd_sync.v(72)
  buf u27 (addr[14], read_addr[14]);  // sources/rtl/lcd_sync.v(72)
  buf u28 (addr[15], read_addr[15]);  // sources/rtl/lcd_sync.v(72)
  buf u29 (vsync_cnt[1], counter_vs[1]);  // sources/rtl/lcd_sync.v(64)
  buf u3 (addr[5], read_addr[5]);  // sources/rtl/lcd_sync.v(72)
  buf u30 (vsync_cnt[2], counter_vs[2]);  // sources/rtl/lcd_sync.v(64)
  buf u31 (vsync_cnt[3], counter_vs[3]);  // sources/rtl/lcd_sync.v(64)
  buf u32 (vsync_cnt[4], counter_vs[4]);  // sources/rtl/lcd_sync.v(64)
  buf u33 (vsync_cnt[5], counter_vs[5]);  // sources/rtl/lcd_sync.v(64)
  buf u34 (vsync_cnt[6], counter_vs[6]);  // sources/rtl/lcd_sync.v(64)
  buf u35 (vsync_cnt[7], counter_vs[7]);  // sources/rtl/lcd_sync.v(64)
  buf u36 (vsync_cnt[8], counter_vs[8]);  // sources/rtl/lcd_sync.v(64)
  buf u37 (vsync_cnt[9], counter_vs[9]);  // sources/rtl/lcd_sync.v(64)
  buf u38 (vsync_cnt[10], counter_vs[10]);  // sources/rtl/lcd_sync.v(64)
  buf u39 (hsync_cnt[1], counter_hs[1]);  // sources/rtl/lcd_sync.v(63)
  not u4 (n24, rest_n);  // sources/rtl/lcd_sync.v(38)
  buf u40 (hsync_cnt[2], counter_hs[2]);  // sources/rtl/lcd_sync.v(63)
  buf u41 (hsync_cnt[3], counter_hs[3]);  // sources/rtl/lcd_sync.v(63)
  buf u42 (hsync_cnt[4], counter_hs[4]);  // sources/rtl/lcd_sync.v(63)
  buf u43 (hsync_cnt[5], counter_hs[5]);  // sources/rtl/lcd_sync.v(63)
  buf u44 (hsync_cnt[6], counter_hs[6]);  // sources/rtl/lcd_sync.v(63)
  buf u45 (hsync_cnt[7], counter_hs[7]);  // sources/rtl/lcd_sync.v(63)
  buf u46 (hsync_cnt[8], counter_hs[8]);  // sources/rtl/lcd_sync.v(63)
  buf u47 (hsync_cnt[9], counter_hs[9]);  // sources/rtl/lcd_sync.v(63)
  buf u48 (hsync_cnt[10], counter_hs[10]);  // sources/rtl/lcd_sync.v(63)
  AL_MUX u5 (
    .i0(1'b0),
    .i1(clk),
    .sel(lcd_pwm),
    .o(lcd_clk));  // sources/rtl/lcd_sync.v(58)
  buf u6 (addr[1], read_addr[1]);  // sources/rtl/lcd_sync.v(72)
  and u7 (lcd_hsync, n9, n10);  // sources/rtl/lcd_sync.v(60)
  and u8 (lcd_vsync, n11, n12);  // sources/rtl/lcd_sync.v(61)
  and u9 (n15, n13, n14);  // sources/rtl/lcd_sync.v(62)

endmodule 

module img_cache  // al_ip/ip_ram.v(14)
  (
  addra,
  addrb,
  cea,
  ceb,
  clka,
  clkb,
  dia,
  rsta,
  rstb,
  dob
  );

  input [15:0] addra;  // al_ip/ip_ram.v(23)
  input [15:0] addrb;  // al_ip/ip_ram.v(24)
  input cea;  // al_ip/ip_ram.v(25)
  input ceb;  // al_ip/ip_ram.v(26)
  input clka;  // al_ip/ip_ram.v(27)
  input clkb;  // al_ip/ip_ram.v(28)
  input [15:0] dia;  // al_ip/ip_ram.v(22)
  input rsta;  // al_ip/ip_ram.v(29)
  input rstb;  // al_ip/ip_ram.v(30)
  output [15:0] dob;  // al_ip/ip_ram.v(19)


  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("NONE"),
    .ADDR_WIDTH_A(16),
    .ADDR_WIDTH_B(16),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(32800),
    .DATA_DEPTH_B(32800),
    .DATA_WIDTH_A(16),
    .DATA_WIDTH_B(16),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("PDPW"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst (
    .addra(addra),
    .addrb(addrb),
    .bea(1'b0),
    .beb(1'b0),
    .cea(cea),
    .ceb(ceb),
    .clka(clka),
    .clkb(clkb),
    .dia(dia),
    .dib(16'b0000000000000000),
    .ocea(1'b0),
    .oceb(1'b1),
    .rsta(rsta),
    .rstb(rstb),
    .wea(1'b1),
    .web(1'b0),
    .dob(dob));  // al_ip/ip_ram.v(50)

endmodule 

module add_pu20_pu20_o20
  (
  i0,
  i1,
  o
  );

  input [19:0] i0;
  input [19:0] i1;
  output [19:0] o;



endmodule 

module eq_w1
  (
  i0,
  i1,
  o
  );

  input i0;
  input i1;
  output o;



endmodule 

module lt_u20_u20
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [19:0] i0;
  input [19:0] i1;
  output o;



endmodule 

module binary_mux_s1_w8
  (
  i0,
  i1,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input sel;
  output [7:0] o;



endmodule 

module binary_mux_s1_w16
  (
  i0,
  i1,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input sel;
  output [15:0] o;



endmodule 

module binary_mux_s1_w20
  (
  i0,
  i1,
  sel,
  o
  );

  input [19:0] i0;
  input [19:0] i1;
  input sel;
  output [19:0] o;



endmodule 

module reg_ar_as_w16
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [15:0] d;
  input en;
  input [15:0] reset;
  input [15:0] set;
  output [15:0] q;



endmodule 

module reg_ar_as_w20
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [19:0] d;
  input en;
  input [19:0] reset;
  input [19:0] set;
  output [19:0] q;



endmodule 

module reg_ar_as_w8
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [7:0] d;
  input en;
  input [7:0] reset;
  input [7:0] set;
  output [7:0] q;



endmodule 

module add_pu9_pu9_o9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output [8:0] o;



endmodule 

module add_pu8_pu8_o8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [7:0] o;



endmodule 

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;



endmodule 

module i2c_module  // sources/rtl/i2c_module.v(2)
  (
  address,
  clk,
  reset_n,
  sda_in,
  write,
  writedata,
  ready,
  scl_out,
  sda,
  sda_oe,
  success_out
  );

  input [2:0] address;  // sources/rtl/i2c_module.v(14)
  input clk;  // sources/rtl/i2c_module.v(3)
  input reset_n;  // sources/rtl/i2c_module.v(4)
  input sda_in;  // sources/rtl/i2c_module.v(7)
  input write;  // sources/rtl/i2c_module.v(13)
  input [7:0] writedata;  // sources/rtl/i2c_module.v(12)
  output ready;  // sources/rtl/i2c_module.v(16)
  output scl_out;  // sources/rtl/i2c_module.v(10)
  output sda;  // sources/rtl/i2c_module.v(8)
  output sda_oe;  // sources/rtl/i2c_module.v(6)
  output success_out;  // sources/rtl/i2c_module.v(17)

  // localparam STATE_ADDRESS_ACK = 10;
  // localparam STATE_ADDRESS_BIT_1 = 2;
  // localparam STATE_ADDRESS_BIT_2 = 3;
  // localparam STATE_ADDRESS_BIT_3 = 4;
  // localparam STATE_ADDRESS_BIT_4 = 5;
  // localparam STATE_ADDRESS_BIT_5 = 6;
  // localparam STATE_ADDRESS_BIT_6 = 7;
  // localparam STATE_ADDRESS_BIT_7 = 8;
  // localparam STATE_ADDRESS_BIT_8 = 9;
  // localparam STATE_ADDRESS_START = 1;
  // localparam STATE_ADDRESS_START_2 = 111;
  // localparam STATE_ADDRESS_START_3 = 112;
  // localparam STATE_DATA_ACK = 28;
  // localparam STATE_DATA_BIT_1 = 20;
  // localparam STATE_DATA_BIT_2 = 21;
  // localparam STATE_DATA_BIT_3 = 22;
  // localparam STATE_DATA_BIT_4 = 23;
  // localparam STATE_DATA_BIT_5 = 24;
  // localparam STATE_DATA_BIT_6 = 25;
  // localparam STATE_DATA_BIT_7 = 26;
  // localparam STATE_DATA_BIT_8 = 27;
  // localparam STATE_IDLE = 0;
  // localparam STATE_REG_ACK = 19;
  // localparam STATE_REG_BIT_1 = 11;
  // localparam STATE_REG_BIT_2 = 12;
  // localparam STATE_REG_BIT_3 = 13;
  // localparam STATE_REG_BIT_4 = 14;
  // localparam STATE_REG_BIT_5 = 15;
  // localparam STATE_REG_BIT_6 = 16;
  // localparam STATE_REG_BIT_7 = 17;
  // localparam STATE_REG_BIT_8 = 18;
  // localparam STATE_STOP = 29;
  // localparam STATE_STOP_1 = 30;
  // localparam STATE_STOP_2 = 31;
  // localparam STATE_TRANSIT_1 = 102;
  // localparam STATE_TRANSIT_2 = 192;
  wire [7:0] control_reg;  // sources/rtl/i2c_module.v(85)
  wire [7:0] divider2;  // sources/rtl/i2c_module.v(71)
  wire [7:0] n1;
  wire [7:0] n10;
  wire [7:0] n100;
  wire [7:0] n12;
  wire [7:0] n13;
  wire [7:0] n14;
  wire [7:0] n15;
  wire [7:0] n16;
  wire [7:0] n3;
  wire [7:0] n35;
  wire [7:0] n37;
  wire [7:0] n38;
  wire [7:0] n39;
  wire [7:0] n4;
  wire [7:0] n40;
  wire [7:0] n41;
  wire [7:0] n42;
  wire [7:0] n43;
  wire [7:0] n44;
  wire [7:0] n45;
  wire [7:0] n46;
  wire [7:0] n47;
  wire [7:0] n48;
  wire [7:0] n49;
  wire [7:0] n5;
  wire [7:0] n50;
  wire [7:0] n51;
  wire [7:0] n52;
  wire [7:0] n53;
  wire [7:0] n54;
  wire [7:0] n55;
  wire [7:0] n56;
  wire [7:0] n57;
  wire [7:0] n58;
  wire [7:0] n59;
  wire [7:0] n6;
  wire [7:0] n60;
  wire [7:0] n61;
  wire [7:0] n62;
  wire [7:0] n63;
  wire [7:0] n64;
  wire [7:0] n65;
  wire [7:0] n66;
  wire [7:0] n67;
  wire [7:0] n68;
  wire [7:0] n69;
  wire [7:0] n7;
  wire [7:0] n70;
  wire [7:0] n71;
  wire [7:0] n72;
  wire [7:0] n8;
  wire [7:0] n9;
  wire [7:0] n99;
  wire [7:0] slave_address;  // sources/rtl/i2c_module.v(86)
  wire [7:0] slave_data_1;  // sources/rtl/i2c_module.v(88)
  wire [7:0] slave_reg_address;  // sources/rtl/i2c_module.v(87)
  wire [7:0] state_next;  // sources/rtl/i2c_module.v(21)
  wire ack_ok;  // sources/rtl/i2c_module.v(143)
  wire clk_div;  // sources/rtl/i2c_module.v(69)
  wire clk_div_2;  // sources/rtl/i2c_module.v(70)
  wire n0;
  wire n101;
  wire n102;
  wire n103;
  wire n104;
  wire n105;
  wire n106;
  wire n107;
  wire n108;
  wire n109;
  wire n11;
  wire n110;
  wire n111;
  wire n112;
  wire n113;
  wire n114;
  wire n115;
  wire n116;
  wire n117;
  wire n118;
  wire n119;
  wire n120;
  wire n121;
  wire n122;
  wire n123;
  wire n124;
  wire n125;
  wire n126;
  wire n127;
  wire n128;
  wire n129;
  wire n130;
  wire n131;
  wire n132;
  wire n133;
  wire n134;
  wire n135;
  wire n136;
  wire n137;
  wire n138;
  wire n139;
  wire n140;
  wire n141;
  wire n142;
  wire n143;
  wire n144;
  wire n145;
  wire n146;
  wire n147;
  wire n148;
  wire n149;
  wire n150;
  wire n151;
  wire n152;
  wire n153;
  wire n154;
  wire n155;
  wire n156;
  wire n157;
  wire n158;
  wire n159;
  wire n160;
  wire n161;
  wire n162;
  wire n163;
  wire n164;
  wire n165;
  wire n166;
  wire n167;
  wire n168;
  wire n169;
  wire n17;
  wire n170;
  wire n171;
  wire n172;
  wire n173;
  wire n174;
  wire n175;
  wire n176;
  wire n177;
  wire n178;
  wire n179;
  wire n18;
  wire n180;
  wire n181;
  wire n182;
  wire n183;
  wire n184;
  wire n185;
  wire n186;
  wire n187;
  wire n188;
  wire n189;
  wire n19;
  wire n190;
  wire n191;
  wire n192;
  wire n193;
  wire n194;
  wire n195;
  wire n196;
  wire n197;
  wire n198;
  wire n199;
  wire n2;
  wire n20;
  wire n200;
  wire n21;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n26;
  wire n27;
  wire n28;
  wire n29;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n34;
  wire n36;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire n79;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n90;
  wire n91;
  wire n92;
  wire n93;
  wire n94;
  wire n95;
  wire n96;
  wire n97;
  wire n98;
  wire scl_output_enable;  // sources/rtl/i2c_module.v(120)
  wire scl_output_zero;  // sources/rtl/i2c_module.v(121)
  wire success;  // sources/rtl/i2c_module.v(141)

  AL_DFF ack_ok_reg (
    .clk(clk_div_2),
    .d(n29),
    .reset(1'b0),
    .set(1'b0),
    .q(ack_ok));  // sources/rtl/i2c_module.v(153)
  add_pu8_pu8_o8 add0 (
    .i0(divider2),
    .i1(8'b00000001),
    .o(n1));  // sources/rtl/i2c_module.v(80)
  AL_DFF clk_div_reg (
    .clk(clk_div_2),
    .d(n0),
    .reset(1'b0),
    .set(1'b0),
    .q(clk_div));  // sources/rtl/i2c_module.v(76)
  eq_w1 eq0 (
    .i0(reset_n),
    .i1(1'b0),
    .o(n2));  // sources/rtl/i2c_module.v(93)
  eq_w1 eq1 (
    .i0(scl_output_enable),
    .i1(1'b1),
    .o(n17));  // sources/rtl/i2c_module.v(125)
  eq_w8 eq10 (
    .i0(state_next),
    .i1(8'b00000000),
    .o(n146));  // sources/rtl/i2c_module.v(179)
  eq_w8 eq11 (
    .i0(state_next),
    .i1(8'b01101111),
    .o(n148));  // sources/rtl/i2c_module.v(195)
  eq_w8 eq12 (
    .i0(state_next),
    .i1(8'b01110000),
    .o(n149));  // sources/rtl/i2c_module.v(203)
  eq_w8 eq13 (
    .i0(state_next),
    .i1(8'b00000010),
    .o(n150));  // sources/rtl/i2c_module.v(211)
  eq_w8 eq14 (
    .i0(state_next),
    .i1(8'b00000011),
    .o(n151));  // sources/rtl/i2c_module.v(219)
  eq_w8 eq15 (
    .i0(state_next),
    .i1(8'b00000100),
    .o(n152));  // sources/rtl/i2c_module.v(227)
  eq_w8 eq16 (
    .i0(state_next),
    .i1(8'b00000101),
    .o(n153));  // sources/rtl/i2c_module.v(235)
  eq_w8 eq17 (
    .i0(state_next),
    .i1(8'b00000110),
    .o(n154));  // sources/rtl/i2c_module.v(243)
  eq_w8 eq18 (
    .i0(state_next),
    .i1(8'b00000111),
    .o(n155));  // sources/rtl/i2c_module.v(251)
  eq_w8 eq19 (
    .i0(state_next),
    .i1(8'b00001000),
    .o(n156));  // sources/rtl/i2c_module.v(259)
  eq_w1 eq2 (
    .i0(scl_output_zero),
    .i1(1'b0),
    .o(n19));  // sources/rtl/i2c_module.v(131)
  eq_w8 eq20 (
    .i0(state_next),
    .i1(8'b00001001),
    .o(n157));  // sources/rtl/i2c_module.v(267)
  eq_w8 eq21 (
    .i0(state_next),
    .i1(8'b01100110),
    .o(n159));  // sources/rtl/i2c_module.v(290)
  eq_w8 eq22 (
    .i0(state_next),
    .i1(8'b00001011),
    .o(n160));  // sources/rtl/i2c_module.v(306)
  eq_w8 eq23 (
    .i0(state_next),
    .i1(8'b00001100),
    .o(n161));  // sources/rtl/i2c_module.v(314)
  eq_w8 eq24 (
    .i0(state_next),
    .i1(8'b00001101),
    .o(n162));  // sources/rtl/i2c_module.v(322)
  eq_w8 eq25 (
    .i0(state_next),
    .i1(8'b00001110),
    .o(n163));  // sources/rtl/i2c_module.v(330)
  eq_w8 eq26 (
    .i0(state_next),
    .i1(8'b00001111),
    .o(n164));  // sources/rtl/i2c_module.v(338)
  eq_w8 eq27 (
    .i0(state_next),
    .i1(8'b00010000),
    .o(n165));  // sources/rtl/i2c_module.v(346)
  eq_w8 eq28 (
    .i0(state_next),
    .i1(8'b00010001),
    .o(n166));  // sources/rtl/i2c_module.v(354)
  eq_w8 eq29 (
    .i0(state_next),
    .i1(8'b00010010),
    .o(n167));  // sources/rtl/i2c_module.v(362)
  eq_w8 eq3 (
    .i0(state_next),
    .i1(8'b00001010),
    .o(n158));  // sources/rtl/i2c_module.v(147)
  eq_w8 eq30 (
    .i0(state_next),
    .i1(8'b11000000),
    .o(n169));  // sources/rtl/i2c_module.v(393)
  eq_w8 eq31 (
    .i0(state_next),
    .i1(8'b00010100),
    .o(n170));  // sources/rtl/i2c_module.v(402)
  eq_w8 eq32 (
    .i0(state_next),
    .i1(8'b00010101),
    .o(n171));  // sources/rtl/i2c_module.v(410)
  eq_w8 eq33 (
    .i0(state_next),
    .i1(8'b00010110),
    .o(n172));  // sources/rtl/i2c_module.v(418)
  eq_w8 eq34 (
    .i0(state_next),
    .i1(8'b00010111),
    .o(n173));  // sources/rtl/i2c_module.v(426)
  eq_w8 eq35 (
    .i0(state_next),
    .i1(8'b00011000),
    .o(n174));  // sources/rtl/i2c_module.v(434)
  eq_w8 eq36 (
    .i0(state_next),
    .i1(8'b00011001),
    .o(n175));  // sources/rtl/i2c_module.v(442)
  eq_w8 eq37 (
    .i0(state_next),
    .i1(8'b00011010),
    .o(n176));  // sources/rtl/i2c_module.v(450)
  eq_w8 eq38 (
    .i0(state_next),
    .i1(8'b00011011),
    .o(n177));  // sources/rtl/i2c_module.v(458)
  eq_w8 eq39 (
    .i0(state_next),
    .i1(8'b00011110),
    .o(n180));  // sources/rtl/i2c_module.v(492)
  eq_w8 eq4 (
    .i0(state_next),
    .i1(8'b00010011),
    .o(n168));  // sources/rtl/i2c_module.v(147)
  eq_w8 eq40 (
    .i0(state_next),
    .i1(8'b00011111),
    .o(n181));  // sources/rtl/i2c_module.v(500)
  eq_w8 eq5 (
    .i0(state_next),
    .i1(8'b00011100),
    .o(n178));  // sources/rtl/i2c_module.v(147)
  eq_w1 eq6 (
    .i0(clk_div),
    .i1(1'b1),
    .o(n28));  // sources/rtl/i2c_module.v(147)
  eq_w8 eq7 (
    .i0(state_next),
    .i1(8'b00011101),
    .o(n179));  // sources/rtl/i2c_module.v(160)
  eq_w8 eq8 (
    .i0(state_next),
    .i1(8'b00000001),
    .o(n147));  // sources/rtl/i2c_module.v(163)
  eq_w1 eq9 (
    .i0(clk_div),
    .i1(1'b0),
    .o(n36));  // sources/rtl/i2c_module.v(189)
  binary_mux_s3_w8 mux0 (
    .i0(slave_data_1),
    .i1(slave_data_1),
    .i2(slave_data_1),
    .i3(writedata),
    .i4(slave_data_1),
    .i5(slave_data_1),
    .i6(slave_data_1),
    .i7(slave_data_1),
    .sel(address),
    .o(n3));  // sources/rtl/i2c_module.v(111)
  binary_mux_s3_w8 mux1 (
    .i0(slave_reg_address),
    .i1(slave_reg_address),
    .i2(writedata),
    .i3(slave_reg_address),
    .i4(slave_reg_address),
    .i5(slave_reg_address),
    .i6(slave_reg_address),
    .i7(slave_reg_address),
    .sel(address),
    .o(n4));  // sources/rtl/i2c_module.v(111)
  binary_mux_s1_w8 mux10 (
    .i0(n9),
    .i1(8'b00000000),
    .sel(n2),
    .o(n14));  // sources/rtl/i2c_module.v(116)
  binary_mux_s1_w8 mux11 (
    .i0(n8),
    .i1(8'b00000000),
    .sel(n2),
    .o(n15));  // sources/rtl/i2c_module.v(116)
  binary_mux_s1_w8 mux12 (
    .i0(n7),
    .i1(8'b00000000),
    .sel(n2),
    .o(n16));  // sources/rtl/i2c_module.v(116)
  binary_mux_s1_w8 mux13 (
    .i0(state_next),
    .i1(8'b00000001),
    .sel(control_reg[0]),
    .o(n35));  // sources/rtl/i2c_module.v(184)
  binary_mux_s1_w24 mux14 (
    .i0({state_next,state_next,state_next}),
    .i1(24'b011100000001111000000000),
    .sel(n28),
    .o({n38,n70,n72}));  // sources/rtl/i2c_module.v(200)
  binary_mux_s1_w256 mux15 (
    .i0({state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next,state_next}),
    .i1({81'b011011110000001000000011000001000000010100000110000001110000100000001001000010100,ack_ok,ack_ok,n58[0],n58[0],1'b1,ack_ok,n58[0],72'b000010110000110000001101000011100000111100010000000100010001001000010011,ack_ok,ack_ok,1'b0,n58[0],n58[0],n58[0],1'b0,n58[0],88'b0001010000010101000101100001011100011000000110010001101000011011000111000001110100000000}),
    .sel(n36),
    .o({n37,n39,n40,n41,n42,n43,n44,n45,n46,n47,n48,n49,n50,n51,n52,n53,n54,n55,n56,n57,n59,n60,n61,n62,n63,n64,n65,n66,n67,n68,n69,n71}));  // sources/rtl/i2c_module.v(192)
  binary_mux_s1_w8 mux16 (
    .i0(n99),
    .i1(8'b00000000),
    .sel(n2),
    .o(n100));  // sources/rtl/i2c_module.v(509)
  binary_mux_s3_w8 mux2 (
    .i0(slave_address),
    .i1(writedata),
    .i2(slave_address),
    .i3(slave_address),
    .i4(slave_address),
    .i5(slave_address),
    .i6(slave_address),
    .i7(slave_address),
    .sel(address),
    .o(n5));  // sources/rtl/i2c_module.v(111)
  binary_mux_s3_w8 mux3 (
    .i0(writedata),
    .i1(control_reg),
    .i2(control_reg),
    .i3(control_reg),
    .i4(control_reg),
    .i5(control_reg),
    .i6(control_reg),
    .i7(control_reg),
    .sel(address),
    .o(n6));  // sources/rtl/i2c_module.v(111)
  binary_mux_s1_w8 mux4 (
    .i0(slave_data_1),
    .i1(n3),
    .sel(write),
    .o(n7));  // sources/rtl/i2c_module.v(112)
  binary_mux_s1_w8 mux5 (
    .i0(slave_reg_address),
    .i1(n4),
    .sel(write),
    .o(n8));  // sources/rtl/i2c_module.v(112)
  binary_mux_s1_w8 mux6 (
    .i0(slave_address),
    .i1(n5),
    .sel(write),
    .o(n9));  // sources/rtl/i2c_module.v(112)
  binary_mux_s1_w8 mux7 (
    .i0(control_reg),
    .i1(n6),
    .sel(write),
    .o(n10));  // sources/rtl/i2c_module.v(112)
  binary_mux_s1_w8 mux8 (
    .i0(n10),
    .i1(8'b00000000),
    .sel(n11),
    .o(n12));  // sources/rtl/i2c_module.v(115)
  binary_mux_s1_w8 mux9 (
    .i0(n12),
    .i1(8'b00000000),
    .sel(n2),
    .o(n13));  // sources/rtl/i2c_module.v(116)
  ne_w32 neq0 (
    .i0({24'b000000000000000000000000,state_next}),
    .i1(32'b00000000000000000000000000000000),
    .o(n11));  // sources/rtl/i2c_module.v(114)
  AL_DFF ready_reg (
    .clk(n101),
    .d(n198),
    .reset(1'b0),
    .set(1'b0),
    .q(ready));  // sources/rtl/i2c_module.v(1066)
  reg_ar_as_w8 reg0 (
    .clk(clk),
    .d(n1),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(divider2));  // sources/rtl/i2c_module.v(81)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n13),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(control_reg));  // sources/rtl/i2c_module.v(117)
  reg_ar_as_w8 reg2 (
    .clk(clk),
    .d(n14),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(slave_address));  // sources/rtl/i2c_module.v(117)
  reg_ar_as_w8 reg3 (
    .clk(clk),
    .d(n15),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(slave_reg_address));  // sources/rtl/i2c_module.v(117)
  reg_ar_as_w8 reg4 (
    .clk(clk),
    .d(n16),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(slave_data_1));  // sources/rtl/i2c_module.v(117)
  reg_ar_as_w8 reg5 (
    .clk(n101),
    .d(n100),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(state_next));  // sources/rtl/i2c_module.v(510)
  AL_DFF scl_out_reg (
    .clk(clk_div_2),
    .d(n20),
    .reset(1'b0),
    .set(1'b0),
    .q(scl_out));  // sources/rtl/i2c_module.v(137)
  AL_DFF scl_output_enable_reg (
    .clk(n101),
    .d(n197),
    .reset(1'b0),
    .set(1'b0),
    .q(scl_output_enable));  // sources/rtl/i2c_module.v(1066)
  AL_DFF scl_output_zero_reg (
    .clk(n101),
    .d(n200),
    .reset(1'b0),
    .set(1'b0),
    .q(scl_output_zero));  // sources/rtl/i2c_module.v(1066)
  AL_DFF sda_oe_reg (
    .clk(n101),
    .d(n196),
    .reset(1'b0),
    .set(1'b0),
    .q(sda_oe));  // sources/rtl/i2c_module.v(1066)
  AL_DFF sda_reg (
    .clk(n101),
    .d(n195),
    .reset(1'b0),
    .set(1'b0),
    .q(sda));  // sources/rtl/i2c_module.v(1066)
  onehot_mux_s37_w8 sel0 (
    .i0(state_next),
    .i1(n72),
    .i10(n63),
    .i11(n62),
    .i12(n61),
    .i13(n60),
    .i14(n59),
    .i15(n57),
    .i16(n56),
    .i17(n55),
    .i18(n54),
    .i19(n53),
    .i2(n71),
    .i20(n52),
    .i21(n51),
    .i22(n50),
    .i23(n49),
    .i24(n48),
    .i25(n47),
    .i26(n46),
    .i27(n45),
    .i28(n44),
    .i29(n43),
    .i3(n70),
    .i30(n42),
    .i31(n41),
    .i32(n40),
    .i33(n39),
    .i34(n38),
    .i35(n37),
    .i36(n35),
    .i4(n69),
    .i5(n68),
    .i6(n67),
    .i7(n66),
    .i8(n65),
    .i9(n64),
    .sel({n146,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181,n182}),
    .o(n99));  // sources/rtl/i2c_module.v(508)
  onehot_mux_s36_w1 sel1 (
    .i0(sda),
    .i1(n145),
    .i10(n136),
    .i11(n135),
    .i12(n134),
    .i13(n106),
    .i14(n106),
    .i15(n133),
    .i16(n132),
    .i17(n131),
    .i18(n130),
    .i19(n129),
    .i2(n112),
    .i20(n128),
    .i21(n127),
    .i22(n126),
    .i23(n106),
    .i24(n106),
    .i25(n123),
    .i26(n122),
    .i27(n121),
    .i28(n120),
    .i29(n119),
    .i3(n106),
    .i30(n118),
    .i31(n117),
    .i32(n116),
    .i33(n112),
    .i34(n106),
    .i35(1'b1),
    .i4(n106),
    .i5(n141),
    .i6(n140),
    .i7(n139),
    .i8(n138),
    .i9(n137),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n184));  // sources/rtl/i2c_module.v(1064)
  onehot_mux_s36_w1 sel2 (
    .i0(sda_oe),
    .i1(n105),
    .i10(n105),
    .i11(n105),
    .i12(n105),
    .i13(n105),
    .i14(n124),
    .i15(n105),
    .i16(n105),
    .i17(n105),
    .i18(n105),
    .i19(n105),
    .i2(n111),
    .i20(n105),
    .i21(n105),
    .i22(n105),
    .i23(n105),
    .i24(n124),
    .i25(n105),
    .i26(n105),
    .i27(n105),
    .i28(n105),
    .i29(n105),
    .i3(n105),
    .i30(n105),
    .i31(n105),
    .i32(n105),
    .i33(n111),
    .i34(n105),
    .i35(1'b1),
    .i4(n124),
    .i5(n105),
    .i6(n105),
    .i7(n105),
    .i8(n105),
    .i9(n105),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n186));  // sources/rtl/i2c_module.v(1064)
  onehot_mux_s36_w1 sel3 (
    .i0(scl_output_enable),
    .i1(n104),
    .i10(n115),
    .i11(n115),
    .i12(n115),
    .i13(n104),
    .i14(n115),
    .i15(n115),
    .i16(n115),
    .i17(n115),
    .i18(n115),
    .i19(n115),
    .i2(n110),
    .i20(n115),
    .i21(n115),
    .i22(n115),
    .i23(n104),
    .i24(n115),
    .i25(n115),
    .i26(n115),
    .i27(n115),
    .i28(n115),
    .i29(n115),
    .i3(n142),
    .i30(n115),
    .i31(n115),
    .i32(n115),
    .i33(n110),
    .i34(n104),
    .i35(1'b0),
    .i4(n115),
    .i5(n115),
    .i6(n115),
    .i7(n115),
    .i8(n115),
    .i9(n115),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n188));  // sources/rtl/i2c_module.v(1064)
  onehot_mux_s36_w1 sel4 (
    .i0(ready),
    .i1(n107),
    .i10(n107),
    .i11(n107),
    .i12(n107),
    .i13(n107),
    .i14(n107),
    .i15(n107),
    .i16(n107),
    .i17(n107),
    .i18(n107),
    .i19(n107),
    .i2(n113),
    .i20(n107),
    .i21(n107),
    .i22(n107),
    .i23(n107),
    .i24(n107),
    .i25(n107),
    .i26(n107),
    .i27(n107),
    .i28(n107),
    .i29(n107),
    .i3(n107),
    .i30(n107),
    .i31(n107),
    .i32(n107),
    .i33(n113),
    .i34(n107),
    .i35(1'b1),
    .i4(n107),
    .i5(n107),
    .i6(n107),
    .i7(n107),
    .i8(n107),
    .i9(n107),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n190));  // sources/rtl/i2c_module.v(1064)
  onehot_mux_s36_w1 sel5 (
    .i0(success),
    .i1(n108),
    .i10(n108),
    .i11(n108),
    .i12(n108),
    .i13(n108),
    .i14(n108),
    .i15(n108),
    .i16(n108),
    .i17(n108),
    .i18(n108),
    .i19(n108),
    .i2(n114),
    .i20(n108),
    .i21(n108),
    .i22(n108),
    .i23(n108),
    .i24(n108),
    .i25(n108),
    .i26(n108),
    .i27(n108),
    .i28(n108),
    .i29(n108),
    .i3(n143),
    .i30(n108),
    .i31(n108),
    .i32(n108),
    .i33(n114),
    .i34(n108),
    .i35(1'b0),
    .i4(n108),
    .i5(n108),
    .i6(n108),
    .i7(n108),
    .i8(n108),
    .i9(n108),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n192));  // sources/rtl/i2c_module.v(1064)
  onehot_mux_s36_w1 sel6 (
    .i0(scl_output_zero),
    .i1(n103),
    .i10(n103),
    .i11(n103),
    .i12(n103),
    .i13(n125),
    .i14(n103),
    .i15(n103),
    .i16(n103),
    .i17(n103),
    .i18(n103),
    .i19(n103),
    .i2(n144),
    .i20(n103),
    .i21(n103),
    .i22(n103),
    .i23(n125),
    .i24(n103),
    .i25(n103),
    .i26(n103),
    .i27(n103),
    .i28(n103),
    .i29(n103),
    .i3(n125),
    .i30(n103),
    .i31(n103),
    .i32(n103),
    .i33(n109),
    .i34(n103),
    .i35(1'b0),
    .i4(n103),
    .i5(n103),
    .i6(n103),
    .i7(n103),
    .i8(n103),
    .i9(n103),
    .sel({n183,n147,n148,n149,n150,n151,n152,n153,n154,n155,n156,n157,n158,n159,n160,n161,n162,n163,n164,n165,n166,n167,n168,n169,n170,n171,n172,n173,n174,n175,n176,n177,n178,n179,n180,n181}),
    .o(n194));  // sources/rtl/i2c_module.v(1064)
  AL_DFF success_out_reg (
    .clk(n101),
    .d(n34),
    .reset(1'b0),
    .set(1'b0),
    .q(success_out));  // sources/rtl/i2c_module.v(167)
  AL_DFF success_reg (
    .clk(n101),
    .d(n199),
    .reset(1'b0),
    .set(1'b0),
    .q(success));  // sources/rtl/i2c_module.v(1066)
  and u10 (n29, n27, n28);  // sources/rtl/i2c_module.v(147)
  AL_MUX u100 (
    .i0(n188),
    .i1(1'b0),
    .sel(n102),
    .o(n197));  // sources/rtl/i2c_module.v(1065)
  AL_MUX u101 (
    .i0(n190),
    .i1(1'b1),
    .sel(n102),
    .o(n198));  // sources/rtl/i2c_module.v(1065)
  AL_MUX u102 (
    .i0(n192),
    .i1(1'b0),
    .sel(n102),
    .o(n199));  // sources/rtl/i2c_module.v(1065)
  AL_MUX u103 (
    .i0(n194),
    .i1(scl_output_zero),
    .sel(n102),
    .o(n200));  // sources/rtl/i2c_module.v(1065)
  not u11 (n101, clk_div_2);  // sources/rtl/i2c_module.v(156)
  and u12 (n31, n179, success);  // sources/rtl/i2c_module.v(160)
  AL_MUX u13 (
    .i0(success_out),
    .i1(1'b0),
    .sel(n147),
    .o(n32));  // sources/rtl/i2c_module.v(164)
  AL_MUX u14 (
    .i0(n32),
    .i1(1'b1),
    .sel(n31),
    .o(n33));  // sources/rtl/i2c_module.v(164)
  AL_MUX u15 (
    .i0(success_out),
    .i1(n33),
    .sel(n28),
    .o(n34));  // sources/rtl/i2c_module.v(165)
  or u16 (n98, n181, n180);  // sources/rtl/i2c_module.v(1064)
  or u17 (n189, n177, n176);  // sources/rtl/i2c_module.v(1064)
  or u18 (n187, n174, n173);  // sources/rtl/i2c_module.v(1064)
  or u19 (n185, n175, n187);  // sources/rtl/i2c_module.v(1064)
  not u2 (n0, clk_div);  // sources/rtl/i2c_module.v(75)
  or u20 (n97, n189, n185);  // sources/rtl/i2c_module.v(1064)
  or u21 (n96, n191, n97);  // sources/rtl/i2c_module.v(1064)
  or u22 (n30, n172, n171);  // sources/rtl/i2c_module.v(1064)
  or u23 (n24, n170, n169);  // sources/rtl/i2c_module.v(1064)
  or u24 (n95, n30, n24);  // sources/rtl/i2c_module.v(1064)
  or u25 (n94, n168, n167);  // sources/rtl/i2c_module.v(1064)
  not u26 (n58[0], ack_ok);  // sources/rtl/i2c_module.v(381)
  or u27 (n93, n165, n164);  // sources/rtl/i2c_module.v(1064)
  or u28 (n92, n166, n93);  // sources/rtl/i2c_module.v(1064)
  or u29 (n91, n94, n92);  // sources/rtl/i2c_module.v(1064)
  buf u3 (clk_div_2, divider2[7]);  // sources/rtl/i2c_module.v(83)
  or u30 (n90, n95, n91);  // sources/rtl/i2c_module.v(1064)
  or u31 (n89, n96, n90);  // sources/rtl/i2c_module.v(1064)
  or u32 (n88, n163, n162);  // sources/rtl/i2c_module.v(1064)
  or u33 (n87, n161, n160);  // sources/rtl/i2c_module.v(1064)
  or u34 (n22, n88, n87);  // sources/rtl/i2c_module.v(1064)
  or u35 (n86, n159, n158);  // sources/rtl/i2c_module.v(1064)
  or u36 (n85, n156, n155);  // sources/rtl/i2c_module.v(1064)
  or u37 (n84, n157, n85);  // sources/rtl/i2c_module.v(1064)
  or u38 (n83, n86, n84);  // sources/rtl/i2c_module.v(1064)
  or u39 (n82, n22, n83);  // sources/rtl/i2c_module.v(1064)
  not u4 (n18, scl_out);  // sources/rtl/i2c_module.v(127)
  or u40 (n81, n154, n153);  // sources/rtl/i2c_module.v(1064)
  or u41 (n80, n152, n151);  // sources/rtl/i2c_module.v(1064)
  or u42 (n79, n81, n80);  // sources/rtl/i2c_module.v(1064)
  or u43 (n78, n150, n149);  // sources/rtl/i2c_module.v(1064)
  or u44 (n21, n147, n146);  // sources/rtl/i2c_module.v(1064)
  or u45 (n77, n148, n21);  // sources/rtl/i2c_module.v(1064)
  or u46 (n76, n78, n77);  // sources/rtl/i2c_module.v(1064)
  or u47 (n75, n79, n76);  // sources/rtl/i2c_module.v(1064)
  or u48 (n193, n179, n178);  // sources/rtl/i2c_module.v(1064)
  or u49 (n74, n82, n75);  // sources/rtl/i2c_module.v(1064)
  AL_MUX u5 (
    .i0(n19),
    .i1(n18),
    .sel(n17),
    .o(n20));  // sources/rtl/i2c_module.v(135)
  or u50 (n191, n98, n193);  // sources/rtl/i2c_module.v(1064)
  not u51 (n102, reset_n);  // sources/rtl/i2c_module.v(514)
  AL_MUX u52 (
    .i0(scl_output_zero),
    .i1(1'b0),
    .sel(n36),
    .o(n103));  // sources/rtl/i2c_module.v(545)
  AL_MUX u53 (
    .i0(scl_output_enable),
    .i1(1'b0),
    .sel(n36),
    .o(n104));  // sources/rtl/i2c_module.v(545)
  AL_MUX u54 (
    .i0(sda_oe),
    .i1(1'b1),
    .sel(n36),
    .o(n105));  // sources/rtl/i2c_module.v(545)
  AL_MUX u55 (
    .i0(sda),
    .i1(1'b0),
    .sel(n36),
    .o(n106));  // sources/rtl/i2c_module.v(545)
  AL_MUX u56 (
    .i0(ready),
    .i1(1'b0),
    .sel(n36),
    .o(n107));  // sources/rtl/i2c_module.v(545)
  AL_MUX u57 (
    .i0(success),
    .i1(1'b0),
    .sel(n36),
    .o(n108));  // sources/rtl/i2c_module.v(545)
  AL_MUX u58 (
    .i0(scl_output_zero),
    .i1(1'b1),
    .sel(n28),
    .o(n109));  // sources/rtl/i2c_module.v(558)
  AL_MUX u59 (
    .i0(scl_output_enable),
    .i1(1'b0),
    .sel(n28),
    .o(n110));  // sources/rtl/i2c_module.v(558)
  or u6 (n23, n158, n168);  // sources/rtl/i2c_module.v(147)
  AL_MUX u60 (
    .i0(sda_oe),
    .i1(1'b1),
    .sel(n28),
    .o(n111));  // sources/rtl/i2c_module.v(558)
  AL_MUX u61 (
    .i0(sda),
    .i1(1'b0),
    .sel(n28),
    .o(n112));  // sources/rtl/i2c_module.v(558)
  AL_MUX u62 (
    .i0(ready),
    .i1(1'b0),
    .sel(n28),
    .o(n113));  // sources/rtl/i2c_module.v(558)
  AL_MUX u63 (
    .i0(success),
    .i1(1'b0),
    .sel(n28),
    .o(n114));  // sources/rtl/i2c_module.v(558)
  AL_MUX u64 (
    .i0(scl_output_enable),
    .i1(1'b1),
    .sel(n36),
    .o(n115));  // sources/rtl/i2c_module.v(571)
  AL_MUX u65 (
    .i0(sda),
    .i1(slave_address[7]),
    .sel(n36),
    .o(n116));  // sources/rtl/i2c_module.v(571)
  AL_MUX u66 (
    .i0(sda),
    .i1(slave_address[6]),
    .sel(n36),
    .o(n117));  // sources/rtl/i2c_module.v(584)
  AL_MUX u67 (
    .i0(sda),
    .i1(slave_address[5]),
    .sel(n36),
    .o(n118));  // sources/rtl/i2c_module.v(597)
  AL_MUX u68 (
    .i0(sda),
    .i1(slave_address[4]),
    .sel(n36),
    .o(n119));  // sources/rtl/i2c_module.v(610)
  AL_MUX u69 (
    .i0(sda),
    .i1(slave_address[3]),
    .sel(n36),
    .o(n120));  // sources/rtl/i2c_module.v(623)
  or u7 (n25, n23, n178);  // sources/rtl/i2c_module.v(147)
  AL_MUX u70 (
    .i0(sda),
    .i1(slave_address[2]),
    .sel(n36),
    .o(n121));  // sources/rtl/i2c_module.v(636)
  AL_MUX u71 (
    .i0(sda),
    .i1(slave_address[1]),
    .sel(n36),
    .o(n122));  // sources/rtl/i2c_module.v(649)
  AL_MUX u72 (
    .i0(sda),
    .i1(slave_address[0]),
    .sel(n36),
    .o(n123));  // sources/rtl/i2c_module.v(662)
  AL_MUX u73 (
    .i0(sda_oe),
    .i1(1'b0),
    .sel(n36),
    .o(n124));  // sources/rtl/i2c_module.v(675)
  AL_MUX u74 (
    .i0(scl_output_zero),
    .i1(1'b1),
    .sel(n36),
    .o(n125));  // sources/rtl/i2c_module.v(700)
  AL_MUX u75 (
    .i0(sda),
    .i1(slave_reg_address[7]),
    .sel(n36),
    .o(n126));  // sources/rtl/i2c_module.v(727)
  AL_MUX u76 (
    .i0(sda),
    .i1(slave_reg_address[6]),
    .sel(n36),
    .o(n127));  // sources/rtl/i2c_module.v(740)
  AL_MUX u77 (
    .i0(sda),
    .i1(slave_reg_address[5]),
    .sel(n36),
    .o(n128));  // sources/rtl/i2c_module.v(753)
  AL_MUX u78 (
    .i0(sda),
    .i1(slave_reg_address[4]),
    .sel(n36),
    .o(n129));  // sources/rtl/i2c_module.v(766)
  AL_MUX u79 (
    .i0(sda),
    .i1(slave_reg_address[3]),
    .sel(n36),
    .o(n130));  // sources/rtl/i2c_module.v(779)
  not u8 (n26, sda_in);  // sources/rtl/i2c_module.v(147)
  AL_MUX u80 (
    .i0(sda),
    .i1(slave_reg_address[2]),
    .sel(n36),
    .o(n131));  // sources/rtl/i2c_module.v(792)
  AL_MUX u81 (
    .i0(sda),
    .i1(slave_reg_address[1]),
    .sel(n36),
    .o(n132));  // sources/rtl/i2c_module.v(805)
  AL_MUX u82 (
    .i0(sda),
    .i1(slave_reg_address[0]),
    .sel(n36),
    .o(n133));  // sources/rtl/i2c_module.v(818)
  AL_MUX u83 (
    .i0(sda),
    .i1(slave_data_1[7]),
    .sel(n36),
    .o(n134));  // sources/rtl/i2c_module.v(878)
  AL_MUX u84 (
    .i0(sda),
    .i1(slave_data_1[6]),
    .sel(n36),
    .o(n135));  // sources/rtl/i2c_module.v(891)
  AL_MUX u85 (
    .i0(sda),
    .i1(slave_data_1[5]),
    .sel(n36),
    .o(n136));  // sources/rtl/i2c_module.v(904)
  AL_MUX u86 (
    .i0(sda),
    .i1(slave_data_1[4]),
    .sel(n36),
    .o(n137));  // sources/rtl/i2c_module.v(917)
  AL_MUX u87 (
    .i0(sda),
    .i1(slave_data_1[3]),
    .sel(n36),
    .o(n138));  // sources/rtl/i2c_module.v(930)
  AL_MUX u88 (
    .i0(sda),
    .i1(slave_data_1[2]),
    .sel(n36),
    .o(n139));  // sources/rtl/i2c_module.v(943)
  AL_MUX u89 (
    .i0(sda),
    .i1(slave_data_1[1]),
    .sel(n36),
    .o(n140));  // sources/rtl/i2c_module.v(956)
  and u9 (n27, n25, n26);  // sources/rtl/i2c_module.v(147)
  AL_MUX u90 (
    .i0(sda),
    .i1(slave_data_1[0]),
    .sel(n36),
    .o(n141));  // sources/rtl/i2c_module.v(969)
  AL_MUX u91 (
    .i0(scl_output_enable),
    .i1(ack_ok),
    .sel(n36),
    .o(n142));  // sources/rtl/i2c_module.v(1008)
  AL_MUX u92 (
    .i0(success),
    .i1(ack_ok),
    .sel(n36),
    .o(n143));  // sources/rtl/i2c_module.v(1008)
  AL_MUX u93 (
    .i0(scl_output_zero),
    .i1(1'b0),
    .sel(n28),
    .o(n144));  // sources/rtl/i2c_module.v(1030)
  AL_MUX u94 (
    .i0(sda),
    .i1(1'b1),
    .sel(n36),
    .o(n145));  // sources/rtl/i2c_module.v(1043)
  or u95 (n183, n146, n182);  // sources/rtl/i2c_module.v(1064)
  not u96 (n182, n73);  // sources/rtl/i2c_module.v(1064)
  or u97 (n73, n89, n74);  // sources/rtl/i2c_module.v(1064)
  AL_MUX u98 (
    .i0(n184),
    .i1(1'b1),
    .sel(n102),
    .o(n195));  // sources/rtl/i2c_module.v(1065)
  AL_MUX u99 (
    .i0(n186),
    .i1(1'b1),
    .sel(n102),
    .o(n196));  // sources/rtl/i2c_module.v(1065)

endmodule 

module binary_mux_s1_w3
  (
  i0,
  i1,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input sel;
  output [2:0] o;



endmodule 

module reg_ar_as_w3
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [2:0] d;
  input en;
  input [2:0] reset;
  input [2:0] set;
  output [2:0] q;



endmodule 

module reg_ar_as_w9
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [8:0] d;
  input en;
  input [8:0] reset;
  input [8:0] set;
  output [8:0] q;



endmodule 

module onehot_mux_s9_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] i8;
  input [8:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s9_w3
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  input [2:0] i3;
  input [2:0] i4;
  input [2:0] i5;
  input [2:0] i6;
  input [2:0] i7;
  input [2:0] i8;
  input [8:0] sel;
  output [2:0] o;



endmodule 

module add_pu11_pu11_o11
  (
  i0,
  i1,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  output [10:0] o;



endmodule 

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



endmodule 

module eq_w11
  (
  i0,
  i1,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  output o;



endmodule 

module lt_u11_u11
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [10:0] i0;
  input [10:0] i1;
  output o;



endmodule 

module lt_u32_u32
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module mult_u32_u8_o40
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [7:0] i1;
  output [39:0] o;



endmodule 

module binary_mux_s1_w11
  (
  i0,
  i1,
  sel,
  o
  );

  input [10:0] i0;
  input [10:0] i1;
  input sel;
  output [10:0] o;



endmodule 

module reg_ar_as_w11
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [10:0] d;
  input en;
  input [10:0] reset;
  input [10:0] set;
  output [10:0] q;



endmodule 

module add_pu12_mu12_o12
  (
  i0,
  i1,
  o
  );

  input [11:0] i0;
  input [11:0] i1;
  output [11:0] o;



endmodule 

module add_pu32_mu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



endmodule 

module binary_mux_s3_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [2:0] sel;
  output [7:0] o;



endmodule 

module binary_mux_s1_w24
  (
  i0,
  i1,
  sel,
  o
  );

  input [23:0] i0;
  input [23:0] i1;
  input sel;
  output [23:0] o;



endmodule 

module binary_mux_s1_w256
  (
  i0,
  i1,
  sel,
  o
  );

  input [255:0] i0;
  input [255:0] i1;
  input sel;
  output [255:0] o;



endmodule 

module ne_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module onehot_mux_s37_w8
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i16,
  i17,
  i18,
  i19,
  i2,
  i20,
  i21,
  i22,
  i23,
  i24,
  i25,
  i26,
  i27,
  i28,
  i29,
  i3,
  i30,
  i31,
  i32,
  i33,
  i34,
  i35,
  i36,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i10;
  input [7:0] i11;
  input [7:0] i12;
  input [7:0] i13;
  input [7:0] i14;
  input [7:0] i15;
  input [7:0] i16;
  input [7:0] i17;
  input [7:0] i18;
  input [7:0] i19;
  input [7:0] i2;
  input [7:0] i20;
  input [7:0] i21;
  input [7:0] i22;
  input [7:0] i23;
  input [7:0] i24;
  input [7:0] i25;
  input [7:0] i26;
  input [7:0] i27;
  input [7:0] i28;
  input [7:0] i29;
  input [7:0] i3;
  input [7:0] i30;
  input [7:0] i31;
  input [7:0] i32;
  input [7:0] i33;
  input [7:0] i34;
  input [7:0] i35;
  input [7:0] i36;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] i8;
  input [7:0] i9;
  input [36:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s36_w1
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i16,
  i17,
  i18,
  i19,
  i2,
  i20,
  i21,
  i22,
  i23,
  i24,
  i25,
  i26,
  i27,
  i28,
  i29,
  i3,
  i30,
  i31,
  i32,
  i33,
  i34,
  i35,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input i0;
  input i1;
  input i10;
  input i11;
  input i12;
  input i13;
  input i14;
  input i15;
  input i16;
  input i17;
  input i18;
  input i19;
  input i2;
  input i20;
  input i21;
  input i22;
  input i23;
  input i24;
  input i25;
  input i26;
  input i27;
  input i28;
  input i29;
  input i3;
  input i30;
  input i31;
  input i32;
  input i33;
  input i34;
  input i35;
  input i4;
  input i5;
  input i6;
  input i7;
  input i8;
  input i9;
  input [35:0] sel;
  output o;



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

