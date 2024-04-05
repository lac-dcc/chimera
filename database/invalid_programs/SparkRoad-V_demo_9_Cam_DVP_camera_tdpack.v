// Verilog netlist created by TD v4.6.12906
// Mon Jul 29 11:23:12 2019

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

  wire [7:0] B_pad;  // sources/rtl/test_camera.v(19)
  wire [7:0] G_pad;  // sources/rtl/test_camera.v(18)
  wire [0:7] OD_pad;  // sources/rtl/test_camera.v(32)
  wire [7:0] R_pad;  // sources/rtl/test_camera.v(17)
  wire [19:0] camera_addr;  // sources/rtl/test_camera.v(103)
  wire [15:0] camera_wrdat;  // sources/rtl/test_camera.v(102)
  wire [15:0] lcd_rdaddr;  // sources/rtl/test_camera.v(77)
  wire [0:6] lcd_rdaddr_piped;
  wire [0:6] lcd_rdaddr_piped_piped;
  wire [15:0] \u_cameraReader/current_pixel ;  // sources/rtl/cameraReader.v(40)
  wire [19:0] \u_cameraReader/n8 ;
  wire [19:0] \u_cameraReader/n9 ;
  wire [19:0] \u_cameraReader/pixel_counter ;  // sources/rtl/cameraReader.v(19)
  wire [7:0] \u_cameraReader/subpixel ;  // sources/rtl/cameraReader.v(39)
  wire CLK_IN_pad;  // sources/rtl/test_camera.v(4)
  wire CSI_PCLK_pad;  // sources/rtl/test_camera.v(7)
  wire CSI_RST_pad;  // sources/rtl/test_camera.v(12)
  wire CSI_RST_pad_neg;
  wire CSI_VSYNC_pad;  // sources/rtl/test_camera.v(10)
  wire CSI_XCLK_pad;  // sources/rtl/test_camera.v(8)
  wire LCD_CLK_pad;  // sources/rtl/test_camera.v(20)
  wire LCD_DEN_pad;  // sources/rtl/test_camera.v(23)
  wire LCD_HSYNC_pad;  // sources/rtl/test_camera.v(21)
  wire LCD_PWM_pad;  // sources/rtl/test_camera.v(24)
  wire LCD_VSYNC_pad;  // sources/rtl/test_camera.v(22)
  wire TESTA_pad;  // sources/rtl/test_camera.v(26)
  wire TESTB_pad;  // sources/rtl/test_camera.v(27)
  wire _al_u461_o;
  wire _al_u471_o;
  wire _al_u477_o;
  wire _al_u498_o;
  wire _al_u499_o;
  wire _al_u500_o;
  wire _al_u501_o;
  wire _al_u502_o;
  wire _al_u503_o;
  wire _al_u504_o;
  wire _al_u505_o;
  wire _al_u506_o;
  wire _al_u507_o;
  wire _al_u508_o;
  wire _al_u509_o;
  wire _al_u510_o;
  wire _al_u511_o;
  wire _al_u512_o;
  wire _al_u513_o;
  wire _al_u514_o;
  wire _al_u515_o;
  wire _al_u516_o;
  wire _al_u517_o;
  wire _al_u518_o;
  wire _al_u519_o;
  wire _al_u520_o;
  wire _al_u521_o;
  wire _al_u522_o;
  wire _al_u523_o;
  wire _al_u524_o;
  wire _al_u526_o;
  wire _al_u527_o;
  wire _al_u528_o;
  wire _al_u529_o;
  wire _al_u530_o;
  wire _al_u531_o;
  wire _al_u532_o;
  wire _al_u533_o;
  wire _al_u534_o;
  wire _al_u535_o;
  wire _al_u536_o;
  wire _al_u537_o;
  wire _al_u538_o;
  wire _al_u539_o;
  wire _al_u540_o;
  wire _al_u541_o;
  wire _al_u542_o;
  wire _al_u543_o;
  wire _al_u544_o;
  wire _al_u545_o;
  wire _al_u546_o;
  wire _al_u547_o;
  wire _al_u548_o;
  wire _al_u549_o;
  wire _al_u550_o;
  wire _al_u551_o;
  wire _al_u552_o;
  wire _al_u554_o;
  wire _al_u555_o;
  wire _al_u556_o;
  wire _al_u557_o;
  wire _al_u558_o;
  wire _al_u559_o;
  wire _al_u560_o;
  wire _al_u561_o;
  wire _al_u562_o;
  wire _al_u563_o;
  wire _al_u564_o;
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
  wire _al_u575_o;
  wire _al_u576_o;
  wire _al_u577_o;
  wire _al_u578_o;
  wire _al_u579_o;
  wire _al_u580_o;
  wire _al_u582_o;
  wire _al_u583_o;
  wire _al_u584_o;
  wire _al_u585_o;
  wire _al_u586_o;
  wire _al_u587_o;
  wire _al_u588_o;
  wire _al_u589_o;
  wire _al_u590_o;
  wire _al_u591_o;
  wire _al_u592_o;
  wire _al_u593_o;
  wire _al_u594_o;
  wire _al_u595_o;
  wire _al_u596_o;
  wire _al_u597_o;
  wire _al_u598_o;
  wire _al_u599_o;
  wire _al_u600_o;
  wire _al_u601_o;
  wire _al_u602_o;
  wire _al_u603_o;
  wire _al_u604_o;
  wire _al_u605_o;
  wire _al_u606_o;
  wire _al_u607_o;
  wire _al_u608_o;
  wire _al_u610_o;
  wire _al_u611_o;
  wire _al_u612_o;
  wire _al_u613_o;
  wire _al_u614_o;
  wire _al_u615_o;
  wire _al_u616_o;
  wire _al_u617_o;
  wire _al_u618_o;
  wire _al_u619_o;
  wire _al_u620_o;
  wire _al_u621_o;
  wire _al_u622_o;
  wire _al_u623_o;
  wire _al_u624_o;
  wire _al_u625_o;
  wire _al_u626_o;
  wire _al_u627_o;
  wire _al_u628_o;
  wire _al_u629_o;
  wire _al_u630_o;
  wire _al_u631_o;
  wire _al_u632_o;
  wire _al_u633_o;
  wire _al_u634_o;
  wire _al_u635_o;
  wire _al_u636_o;
  wire _al_u638_o;
  wire _al_u639_o;
  wire _al_u640_o;
  wire _al_u641_o;
  wire _al_u642_o;
  wire _al_u643_o;
  wire _al_u644_o;
  wire _al_u645_o;
  wire _al_u646_o;
  wire _al_u647_o;
  wire _al_u648_o;
  wire _al_u649_o;
  wire _al_u650_o;
  wire _al_u651_o;
  wire _al_u652_o;
  wire _al_u653_o;
  wire _al_u654_o;
  wire _al_u655_o;
  wire _al_u656_o;
  wire _al_u657_o;
  wire _al_u658_o;
  wire _al_u659_o;
  wire _al_u660_o;
  wire _al_u661_o;
  wire _al_u662_o;
  wire _al_u663_o;
  wire _al_u664_o;
  wire _al_u666_o;
  wire _al_u667_o;
  wire _al_u668_o;
  wire _al_u669_o;
  wire _al_u670_o;
  wire _al_u671_o;
  wire _al_u672_o;
  wire _al_u673_o;
  wire _al_u674_o;
  wire _al_u675_o;
  wire _al_u676_o;
  wire _al_u677_o;
  wire _al_u678_o;
  wire _al_u679_o;
  wire _al_u680_o;
  wire _al_u681_o;
  wire _al_u682_o;
  wire _al_u683_o;
  wire _al_u684_o;
  wire _al_u685_o;
  wire _al_u686_o;
  wire _al_u687_o;
  wire _al_u688_o;
  wire _al_u689_o;
  wire _al_u690_o;
  wire _al_u691_o;
  wire _al_u692_o;
  wire _al_u694_o;
  wire _al_u695_o;
  wire _al_u696_o;
  wire _al_u697_o;
  wire _al_u698_o;
  wire _al_u699_o;
  wire _al_u700_o;
  wire _al_u701_o;
  wire _al_u702_o;
  wire _al_u703_o;
  wire _al_u704_o;
  wire _al_u705_o;
  wire _al_u706_o;
  wire _al_u707_o;
  wire _al_u708_o;
  wire _al_u709_o;
  wire _al_u710_o;
  wire _al_u711_o;
  wire _al_u712_o;
  wire _al_u713_o;
  wire _al_u714_o;
  wire _al_u715_o;
  wire _al_u716_o;
  wire _al_u717_o;
  wire _al_u718_o;
  wire _al_u719_o;
  wire _al_u720_o;
  wire _al_u722_o;
  wire _al_u723_o;
  wire _al_u724_o;
  wire _al_u725_o;
  wire _al_u726_o;
  wire _al_u727_o;
  wire _al_u728_o;
  wire _al_u729_o;
  wire _al_u730_o;
  wire _al_u731_o;
  wire _al_u732_o;
  wire _al_u733_o;
  wire _al_u734_o;
  wire _al_u735_o;
  wire _al_u736_o;
  wire _al_u737_o;
  wire _al_u738_o;
  wire _al_u739_o;
  wire _al_u740_o;
  wire _al_u741_o;
  wire _al_u742_o;
  wire _al_u743_o;
  wire _al_u744_o;
  wire _al_u745_o;
  wire _al_u746_o;
  wire _al_u747_o;
  wire _al_u748_o;
  wire _al_u750_o;
  wire _al_u751_o;
  wire _al_u752_o;
  wire _al_u754_o;
  wire _al_u755_o;
  wire _al_u756_o;
  wire _al_u758_o;
  wire _al_u759_o;
  wire _al_u760_o;
  wire _al_u762_o;
  wire _al_u763_o;
  wire _al_u764_o;
  wire _al_u766_o;
  wire _al_u767_o;
  wire _al_u768_o;
  wire _al_u770_o;
  wire _al_u771_o;
  wire _al_u772_o;
  wire _al_u774_o;
  wire _al_u775_o;
  wire _al_u776_o;
  wire \and_Ncamera_addr[11]_o_and_camera_wrreq ;
  wire \and_Ncamera_addr[12]_o ;
  wire \and_Ncamera_addr[12]_o_al_n197 ;
  wire \and_Ncamera_addr[12]_o_al_n228 ;
  wire \and_Ncamera_addr[12]_o_al_n260 ;
  wire \and_Nlcd_rdaddr[11]__o_and_lcd_rden ;
  wire \and_Nlcd_rdaddr[12]__o ;
  wire \and_Nlcd_rdaddr[12]__o_al_n200 ;
  wire \and_Nlcd_rdaddr[12]__o_al_n231 ;
  wire \and_Nlcd_rdaddr[12]__o_al_n263 ;
  wire \and_camera_addr[12]__o ;
  wire \and_camera_addr[12]__o_al_n213 ;
  wire \and_camera_addr[12]__o_al_n244 ;
  wire \and_camera_addr[12]__o_al_n276 ;
  wire \and_lcd_rdaddr[12]_N_o ;
  wire \and_lcd_rdaddr[12]_N_o_al_n247 ;
  wire \and_lcd_rdaddr[12]_l_o ;
  wire \and_lcd_rdaddr[12]_l_o_al_n279 ;
  wire camera_wrreq;  // sources/rtl/test_camera.v(101)
  wire clk_cam;  // sources/rtl/test_camera.v(36)
  wire clk_lcd;  // sources/rtl/test_camera.v(35)
  wire clk_sccb;  // sources/rtl/test_camera.v(37)
  wire lcd_rden;  // sources/rtl/test_camera.v(75)
  wire \pll/clk0_buf ;  // al_ip/ip_pll.v(34)
  wire sda;  // sources/rtl/test_camera.v(49)
  wire sda_oe;  // sources/rtl/test_camera.v(48)
  wire \u_cameraReader/add0/c11 ;
  wire \u_cameraReader/add0/c15 ;
  wire \u_cameraReader/add0/c19 ;
  wire \u_cameraReader/add0/c3 ;
  wire \u_cameraReader/add0/c7 ;
  wire \u_cameraReader/add1/c11 ;
  wire \u_cameraReader/add1/c15 ;
  wire \u_cameraReader/add1/c3 ;
  wire \u_cameraReader/add1/c7 ;
  wire \u_cameraReader/lt0_c1 ;
  wire \u_cameraReader/lt0_c11 ;
  wire \u_cameraReader/lt0_c13 ;
  wire \u_cameraReader/lt0_c15 ;
  wire \u_cameraReader/lt0_c17 ;
  wire \u_cameraReader/lt0_c19 ;
  wire \u_cameraReader/lt0_c3 ;
  wire \u_cameraReader/lt0_c5 ;
  wire \u_cameraReader/lt0_c7 ;
  wire \u_cameraReader/lt0_c9 ;
  wire \u_cameraReader/mux12_b0_sel_is_2_o ;
  wire \u_cameraReader/mux14_b0_sel_is_2_o ;
  wire \u_cameraReader/mux15_b0_sel_is_2_o ;
  wire \u_cameraReader/mux6_b0_sel_is_1_o ;
  wire \u_cameraReader/n2 ;
  wire \u_cameraReader/n29 ;
  wire \u_cameraReader/vsync_passed ;  // sources/rtl/cameraReader.v(23)
  wire \u_cameraReader/wrclk1 ;  // sources/rtl/cameraReader.v(26)
  wire \u_cameraReader/write_pixel ;  // sources/rtl/cameraReader.v(24)
  wire \uimg/inst_dob_i0_000 ;
  wire \uimg/inst_dob_i0_001 ;
  wire \uimg/inst_dob_i0_002 ;
  wire \uimg/inst_dob_i0_003 ;
  wire \uimg/inst_dob_i0_004 ;
  wire \uimg/inst_dob_i0_005 ;
  wire \uimg/inst_dob_i0_006 ;
  wire \uimg/inst_dob_i0_007 ;
  wire \uimg/inst_dob_i0_008 ;
  wire \uimg/inst_dob_i0_009 ;
  wire \uimg/inst_dob_i0_010 ;
  wire \uimg/inst_dob_i0_011 ;
  wire \uimg/inst_dob_i0_012 ;
  wire \uimg/inst_dob_i0_013 ;
  wire \uimg/inst_dob_i0_014 ;
  wire \uimg/inst_dob_i0_015 ;
  wire \uimg/inst_dob_i10_000 ;
  wire \uimg/inst_dob_i10_001 ;
  wire \uimg/inst_dob_i10_002 ;
  wire \uimg/inst_dob_i10_003 ;
  wire \uimg/inst_dob_i10_004 ;
  wire \uimg/inst_dob_i10_005 ;
  wire \uimg/inst_dob_i10_006 ;
  wire \uimg/inst_dob_i10_007 ;
  wire \uimg/inst_dob_i10_008 ;
  wire \uimg/inst_dob_i12_000 ;
  wire \uimg/inst_dob_i12_001 ;
  wire \uimg/inst_dob_i12_002 ;
  wire \uimg/inst_dob_i12_003 ;
  wire \uimg/inst_dob_i12_004 ;
  wire \uimg/inst_dob_i12_005 ;
  wire \uimg/inst_dob_i12_006 ;
  wire \uimg/inst_dob_i12_007 ;
  wire \uimg/inst_dob_i12_008 ;
  wire \uimg/inst_dob_i14_000 ;
  wire \uimg/inst_dob_i14_001 ;
  wire \uimg/inst_dob_i14_002 ;
  wire \uimg/inst_dob_i14_003 ;
  wire \uimg/inst_dob_i14_004 ;
  wire \uimg/inst_dob_i14_005 ;
  wire \uimg/inst_dob_i14_006 ;
  wire \uimg/inst_dob_i14_007 ;
  wire \uimg/inst_dob_i14_008 ;
  wire \uimg/inst_dob_i16_000 ;
  wire \uimg/inst_dob_i16_001 ;
  wire \uimg/inst_dob_i16_002 ;
  wire \uimg/inst_dob_i16_003 ;
  wire \uimg/inst_dob_i16_004 ;
  wire \uimg/inst_dob_i16_005 ;
  wire \uimg/inst_dob_i16_006 ;
  wire \uimg/inst_dob_i16_007 ;
  wire \uimg/inst_dob_i16_008 ;
  wire \uimg/inst_dob_i16_009 ;
  wire \uimg/inst_dob_i16_010 ;
  wire \uimg/inst_dob_i16_011 ;
  wire \uimg/inst_dob_i16_012 ;
  wire \uimg/inst_dob_i16_013 ;
  wire \uimg/inst_dob_i16_014 ;
  wire \uimg/inst_dob_i16_015 ;
  wire \uimg/inst_dob_i18_000 ;
  wire \uimg/inst_dob_i18_001 ;
  wire \uimg/inst_dob_i18_002 ;
  wire \uimg/inst_dob_i18_003 ;
  wire \uimg/inst_dob_i18_004 ;
  wire \uimg/inst_dob_i18_005 ;
  wire \uimg/inst_dob_i18_006 ;
  wire \uimg/inst_dob_i18_007 ;
  wire \uimg/inst_dob_i18_008 ;
  wire \uimg/inst_dob_i20_000 ;
  wire \uimg/inst_dob_i20_001 ;
  wire \uimg/inst_dob_i20_002 ;
  wire \uimg/inst_dob_i20_003 ;
  wire \uimg/inst_dob_i20_004 ;
  wire \uimg/inst_dob_i20_005 ;
  wire \uimg/inst_dob_i20_006 ;
  wire \uimg/inst_dob_i20_007 ;
  wire \uimg/inst_dob_i20_008 ;
  wire \uimg/inst_dob_i22_000 ;
  wire \uimg/inst_dob_i22_001 ;
  wire \uimg/inst_dob_i22_002 ;
  wire \uimg/inst_dob_i22_003 ;
  wire \uimg/inst_dob_i22_004 ;
  wire \uimg/inst_dob_i22_005 ;
  wire \uimg/inst_dob_i22_006 ;
  wire \uimg/inst_dob_i22_007 ;
  wire \uimg/inst_dob_i22_008 ;
  wire \uimg/inst_dob_i24_000 ;
  wire \uimg/inst_dob_i24_001 ;
  wire \uimg/inst_dob_i24_002 ;
  wire \uimg/inst_dob_i24_003 ;
  wire \uimg/inst_dob_i24_004 ;
  wire \uimg/inst_dob_i24_005 ;
  wire \uimg/inst_dob_i24_006 ;
  wire \uimg/inst_dob_i24_007 ;
  wire \uimg/inst_dob_i24_008 ;
  wire \uimg/inst_dob_i26_000 ;
  wire \uimg/inst_dob_i26_001 ;
  wire \uimg/inst_dob_i26_002 ;
  wire \uimg/inst_dob_i26_003 ;
  wire \uimg/inst_dob_i26_004 ;
  wire \uimg/inst_dob_i26_005 ;
  wire \uimg/inst_dob_i26_006 ;
  wire \uimg/inst_dob_i26_007 ;
  wire \uimg/inst_dob_i26_008 ;
  wire \uimg/inst_dob_i28_000 ;
  wire \uimg/inst_dob_i28_001 ;
  wire \uimg/inst_dob_i28_002 ;
  wire \uimg/inst_dob_i28_003 ;
  wire \uimg/inst_dob_i28_004 ;
  wire \uimg/inst_dob_i28_005 ;
  wire \uimg/inst_dob_i28_006 ;
  wire \uimg/inst_dob_i28_007 ;
  wire \uimg/inst_dob_i28_008 ;
  wire \uimg/inst_dob_i2_000 ;
  wire \uimg/inst_dob_i2_001 ;
  wire \uimg/inst_dob_i2_002 ;
  wire \uimg/inst_dob_i2_003 ;
  wire \uimg/inst_dob_i2_004 ;
  wire \uimg/inst_dob_i2_005 ;
  wire \uimg/inst_dob_i2_006 ;
  wire \uimg/inst_dob_i2_007 ;
  wire \uimg/inst_dob_i2_008 ;
  wire \uimg/inst_dob_i30_000 ;
  wire \uimg/inst_dob_i30_001 ;
  wire \uimg/inst_dob_i30_002 ;
  wire \uimg/inst_dob_i30_003 ;
  wire \uimg/inst_dob_i30_004 ;
  wire \uimg/inst_dob_i30_005 ;
  wire \uimg/inst_dob_i30_006 ;
  wire \uimg/inst_dob_i30_007 ;
  wire \uimg/inst_dob_i30_008 ;
  wire \uimg/inst_dob_i32_000 ;
  wire \uimg/inst_dob_i32_001 ;
  wire \uimg/inst_dob_i32_002 ;
  wire \uimg/inst_dob_i32_003 ;
  wire \uimg/inst_dob_i32_004 ;
  wire \uimg/inst_dob_i32_005 ;
  wire \uimg/inst_dob_i32_006 ;
  wire \uimg/inst_dob_i32_007 ;
  wire \uimg/inst_dob_i32_008 ;
  wire \uimg/inst_dob_i32_009 ;
  wire \uimg/inst_dob_i32_010 ;
  wire \uimg/inst_dob_i32_011 ;
  wire \uimg/inst_dob_i32_012 ;
  wire \uimg/inst_dob_i32_013 ;
  wire \uimg/inst_dob_i32_014 ;
  wire \uimg/inst_dob_i32_015 ;
  wire \uimg/inst_dob_i34_000 ;
  wire \uimg/inst_dob_i34_001 ;
  wire \uimg/inst_dob_i34_002 ;
  wire \uimg/inst_dob_i34_003 ;
  wire \uimg/inst_dob_i34_004 ;
  wire \uimg/inst_dob_i34_005 ;
  wire \uimg/inst_dob_i34_006 ;
  wire \uimg/inst_dob_i34_007 ;
  wire \uimg/inst_dob_i34_008 ;
  wire \uimg/inst_dob_i36_000 ;
  wire \uimg/inst_dob_i36_001 ;
  wire \uimg/inst_dob_i36_002 ;
  wire \uimg/inst_dob_i36_003 ;
  wire \uimg/inst_dob_i36_004 ;
  wire \uimg/inst_dob_i36_005 ;
  wire \uimg/inst_dob_i36_006 ;
  wire \uimg/inst_dob_i36_007 ;
  wire \uimg/inst_dob_i36_008 ;
  wire \uimg/inst_dob_i38_000 ;
  wire \uimg/inst_dob_i38_001 ;
  wire \uimg/inst_dob_i38_002 ;
  wire \uimg/inst_dob_i38_003 ;
  wire \uimg/inst_dob_i38_004 ;
  wire \uimg/inst_dob_i38_005 ;
  wire \uimg/inst_dob_i38_006 ;
  wire \uimg/inst_dob_i38_007 ;
  wire \uimg/inst_dob_i38_008 ;
  wire \uimg/inst_dob_i40_000 ;
  wire \uimg/inst_dob_i40_001 ;
  wire \uimg/inst_dob_i40_002 ;
  wire \uimg/inst_dob_i40_003 ;
  wire \uimg/inst_dob_i40_004 ;
  wire \uimg/inst_dob_i40_005 ;
  wire \uimg/inst_dob_i40_006 ;
  wire \uimg/inst_dob_i40_007 ;
  wire \uimg/inst_dob_i40_008 ;
  wire \uimg/inst_dob_i42_000 ;
  wire \uimg/inst_dob_i42_001 ;
  wire \uimg/inst_dob_i42_002 ;
  wire \uimg/inst_dob_i42_003 ;
  wire \uimg/inst_dob_i42_004 ;
  wire \uimg/inst_dob_i42_005 ;
  wire \uimg/inst_dob_i42_006 ;
  wire \uimg/inst_dob_i42_007 ;
  wire \uimg/inst_dob_i42_008 ;
  wire \uimg/inst_dob_i44_000 ;
  wire \uimg/inst_dob_i44_001 ;
  wire \uimg/inst_dob_i44_002 ;
  wire \uimg/inst_dob_i44_003 ;
  wire \uimg/inst_dob_i44_004 ;
  wire \uimg/inst_dob_i44_005 ;
  wire \uimg/inst_dob_i44_006 ;
  wire \uimg/inst_dob_i44_007 ;
  wire \uimg/inst_dob_i44_008 ;
  wire \uimg/inst_dob_i46_000 ;
  wire \uimg/inst_dob_i46_001 ;
  wire \uimg/inst_dob_i46_002 ;
  wire \uimg/inst_dob_i46_003 ;
  wire \uimg/inst_dob_i46_004 ;
  wire \uimg/inst_dob_i46_005 ;
  wire \uimg/inst_dob_i46_006 ;
  wire \uimg/inst_dob_i46_007 ;
  wire \uimg/inst_dob_i46_008 ;
  wire \uimg/inst_dob_i48_000 ;
  wire \uimg/inst_dob_i48_001 ;
  wire \uimg/inst_dob_i48_002 ;
  wire \uimg/inst_dob_i48_003 ;
  wire \uimg/inst_dob_i48_004 ;
  wire \uimg/inst_dob_i48_005 ;
  wire \uimg/inst_dob_i48_006 ;
  wire \uimg/inst_dob_i48_007 ;
  wire \uimg/inst_dob_i48_008 ;
  wire \uimg/inst_dob_i48_009 ;
  wire \uimg/inst_dob_i48_010 ;
  wire \uimg/inst_dob_i48_011 ;
  wire \uimg/inst_dob_i48_012 ;
  wire \uimg/inst_dob_i48_013 ;
  wire \uimg/inst_dob_i48_014 ;
  wire \uimg/inst_dob_i48_015 ;
  wire \uimg/inst_dob_i4_000 ;
  wire \uimg/inst_dob_i4_001 ;
  wire \uimg/inst_dob_i4_002 ;
  wire \uimg/inst_dob_i4_003 ;
  wire \uimg/inst_dob_i4_004 ;
  wire \uimg/inst_dob_i4_005 ;
  wire \uimg/inst_dob_i4_006 ;
  wire \uimg/inst_dob_i4_007 ;
  wire \uimg/inst_dob_i4_008 ;
  wire \uimg/inst_dob_i50_000 ;
  wire \uimg/inst_dob_i50_001 ;
  wire \uimg/inst_dob_i50_002 ;
  wire \uimg/inst_dob_i50_003 ;
  wire \uimg/inst_dob_i50_004 ;
  wire \uimg/inst_dob_i50_005 ;
  wire \uimg/inst_dob_i50_006 ;
  wire \uimg/inst_dob_i50_007 ;
  wire \uimg/inst_dob_i50_008 ;
  wire \uimg/inst_dob_i52_000 ;
  wire \uimg/inst_dob_i52_001 ;
  wire \uimg/inst_dob_i52_002 ;
  wire \uimg/inst_dob_i52_003 ;
  wire \uimg/inst_dob_i52_004 ;
  wire \uimg/inst_dob_i52_005 ;
  wire \uimg/inst_dob_i52_006 ;
  wire \uimg/inst_dob_i52_007 ;
  wire \uimg/inst_dob_i52_008 ;
  wire \uimg/inst_dob_i54_000 ;
  wire \uimg/inst_dob_i54_001 ;
  wire \uimg/inst_dob_i54_002 ;
  wire \uimg/inst_dob_i54_003 ;
  wire \uimg/inst_dob_i54_004 ;
  wire \uimg/inst_dob_i54_005 ;
  wire \uimg/inst_dob_i54_006 ;
  wire \uimg/inst_dob_i54_007 ;
  wire \uimg/inst_dob_i54_008 ;
  wire \uimg/inst_dob_i56_000 ;
  wire \uimg/inst_dob_i56_001 ;
  wire \uimg/inst_dob_i56_002 ;
  wire \uimg/inst_dob_i56_003 ;
  wire \uimg/inst_dob_i56_004 ;
  wire \uimg/inst_dob_i56_005 ;
  wire \uimg/inst_dob_i56_006 ;
  wire \uimg/inst_dob_i56_007 ;
  wire \uimg/inst_dob_i56_008 ;
  wire \uimg/inst_dob_i58_000 ;
  wire \uimg/inst_dob_i58_001 ;
  wire \uimg/inst_dob_i58_002 ;
  wire \uimg/inst_dob_i58_003 ;
  wire \uimg/inst_dob_i58_004 ;
  wire \uimg/inst_dob_i58_005 ;
  wire \uimg/inst_dob_i58_006 ;
  wire \uimg/inst_dob_i58_007 ;
  wire \uimg/inst_dob_i58_008 ;
  wire \uimg/inst_dob_i60_000 ;
  wire \uimg/inst_dob_i60_001 ;
  wire \uimg/inst_dob_i60_002 ;
  wire \uimg/inst_dob_i60_003 ;
  wire \uimg/inst_dob_i60_004 ;
  wire \uimg/inst_dob_i60_005 ;
  wire \uimg/inst_dob_i60_006 ;
  wire \uimg/inst_dob_i60_007 ;
  wire \uimg/inst_dob_i60_008 ;
  wire \uimg/inst_dob_i62_000 ;
  wire \uimg/inst_dob_i62_001 ;
  wire \uimg/inst_dob_i62_002 ;
  wire \uimg/inst_dob_i62_003 ;
  wire \uimg/inst_dob_i62_004 ;
  wire \uimg/inst_dob_i62_005 ;
  wire \uimg/inst_dob_i62_006 ;
  wire \uimg/inst_dob_i62_007 ;
  wire \uimg/inst_dob_i62_008 ;
  wire \uimg/inst_dob_i64_000 ;
  wire \uimg/inst_dob_i64_001 ;
  wire \uimg/inst_dob_i64_002 ;
  wire \uimg/inst_dob_i64_003 ;
  wire \uimg/inst_dob_i64_004 ;
  wire \uimg/inst_dob_i64_005 ;
  wire \uimg/inst_dob_i64_006 ;
  wire \uimg/inst_dob_i64_007 ;
  wire \uimg/inst_dob_i64_008 ;
  wire \uimg/inst_dob_i64_009 ;
  wire \uimg/inst_dob_i64_010 ;
  wire \uimg/inst_dob_i64_011 ;
  wire \uimg/inst_dob_i64_012 ;
  wire \uimg/inst_dob_i64_013 ;
  wire \uimg/inst_dob_i64_014 ;
  wire \uimg/inst_dob_i64_015 ;
  wire \uimg/inst_dob_i6_000 ;
  wire \uimg/inst_dob_i6_001 ;
  wire \uimg/inst_dob_i6_002 ;
  wire \uimg/inst_dob_i6_003 ;
  wire \uimg/inst_dob_i6_004 ;
  wire \uimg/inst_dob_i6_005 ;
  wire \uimg/inst_dob_i6_006 ;
  wire \uimg/inst_dob_i6_007 ;
  wire \uimg/inst_dob_i6_008 ;
  wire \uimg/inst_dob_i8_000 ;
  wire \uimg/inst_dob_i8_001 ;
  wire \uimg/inst_dob_i8_002 ;
  wire \uimg/inst_dob_i8_003 ;
  wire \uimg/inst_dob_i8_004 ;
  wire \uimg/inst_dob_i8_005 ;
  wire \uimg/inst_dob_i8_006 ;
  wire \uimg/inst_dob_i8_007 ;
  wire \uimg/inst_dob_i8_008 ;

  assign TESTD = TESTC;
  assign TESTE = TESTC;
  assign TESTF = TESTC;
  EG_PHY_LSLICE #(
    //.LUTF0("a"),
    //.LUTF1("a"),
    //.LUTG0("a"),
    //.LUTG1("a"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTF1(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000000000),
    .INIT_LUTG1(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \LCD_DEN_vio|LCD_PWM_vio  (
    .d({LCD_DEN_pad,LCD_PWM_pad}),
    .f({LCD_DEN,LCD_PWM}));
  EG_PHY_LSLICE #(
    //.LUTF0("a"),
    //.LUTG0("a"),
    .INIT_LUTF0(16'b0000000000000000),
    .INIT_LUTG0(16'b0000000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    TESTC_vio (
    .d({open_n38,1'b0}),
    .f({open_n56,TESTC}));
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u171 (
    .do({open_n63,open_n64,open_n65,B_pad[7]}),
    .opad(B[7]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u172 (
    .do({open_n80,open_n81,open_n82,B_pad[6]}),
    .opad(B[6]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u173 (
    .do({open_n97,open_n98,open_n99,B_pad[5]}),
    .opad(B[5]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u174 (
    .do({open_n114,open_n115,open_n116,B_pad[4]}),
    .opad(B[4]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u175 (
    .do({open_n131,open_n132,open_n133,B_pad[3]}),
    .opad(B[3]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u176 (
    .do({open_n148,open_n149,open_n150,1'b0}),
    .opad(B[2]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u177 (
    .do({open_n165,open_n166,open_n167,1'b0}),
    .opad(B[1]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u178 (
    .do({open_n182,open_n183,open_n184,1'b0}),
    .opad(B[0]));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u179 (
    .ipad(CLK_IN),
    .di(CLK_IN_pad));  // sources/rtl/test_camera.v(4)
  EG_PHY_PAD #(
    //.LOCATION("H13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u180 (
    .ipad(CSI_D[7]),
    .di(OD_pad[0]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("G16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u181 (
    .ipad(CSI_D[6]),
    .di(OD_pad[1]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u182 (
    .ipad(CSI_D[5]),
    .di(OD_pad[2]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("G14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u183 (
    .ipad(CSI_D[4]),
    .di(OD_pad[3]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u184 (
    .ipad(CSI_D[3]),
    .di(OD_pad[4]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("K16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u185 (
    .ipad(CSI_D[2]),
    .di(OD_pad[5]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("J16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u186 (
    .ipad(CSI_D[1]),
    .di(OD_pad[6]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("H15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u187 (
    .ipad(CSI_D[0]),
    .di(OD_pad[7]));  // sources/rtl/test_camera.v(15)
  EG_PHY_PAD #(
    //.LOCATION("F15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u188 (
    .ipad(CSI_HREF),
    .di(\u_cameraReader/n2 ));  // sources/rtl/test_camera.v(9)
  EG_PHY_PAD #(
    //.LOCATION("K12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u189 (
    .ipad(CSI_PCLK),
    .di(CSI_PCLK_pad));  // sources/rtl/test_camera.v(7)
  EG_PHY_PAD #(
    //.LOCATION("F14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u190 (
    .do({open_n386,open_n387,open_n388,1'b0}),
    .opad(CSI_PWDN));  // sources/rtl/test_camera.v(11)
  EG_PHY_PAD #(
    //.LOCATION("F13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u191 (
    .do({open_n403,open_n404,open_n405,CSI_RST_pad}),
    .opad(CSI_RST));  // sources/rtl/test_camera.v(12)
  EG_PHY_PAD #(
    //.LOCATION("D16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u192 (
    .do({open_n420,open_n421,open_n422,TESTB_pad}),
    .opad(CSI_SOIC));  // sources/rtl/test_camera.v(13)
  EG_PHY_PAD #(
    //.LOCATION("D14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    _al_u193 (
    .do({open_n437,open_n438,open_n439,sda}),
    .ts(sda_oe),
    .di(TESTA_pad),
    .bpad(CSI_SOID));  // sources/rtl/test_camera.v(63)
  EG_PHY_PAD #(
    //.LOCATION("E15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u194 (
    .ipad(CSI_VSYNC),
    .di(CSI_VSYNC_pad));  // sources/rtl/test_camera.v(10)
  EG_PHY_PAD #(
    //.LOCATION("J12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u195 (
    .do({open_n469,open_n470,open_n471,CSI_XCLK_pad}),
    .opad(CSI_XCLK));  // sources/rtl/test_camera.v(8)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u196 (
    .do({open_n486,open_n487,open_n488,G_pad[7]}),
    .opad(G[7]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u197 (
    .do({open_n503,open_n504,open_n505,G_pad[6]}),
    .opad(G[6]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u198 (
    .do({open_n520,open_n521,open_n522,G_pad[5]}),
    .opad(G[5]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u199 (
    .do({open_n537,open_n538,open_n539,G_pad[4]}),
    .opad(G[4]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("J1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u200 (
    .do({open_n554,open_n555,open_n556,G_pad[3]}),
    .opad(G[3]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u201 (
    .do({open_n571,open_n572,open_n573,G_pad[2]}),
    .opad(G[2]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u202 (
    .do({open_n588,open_n589,open_n590,1'b0}),
    .opad(G[1]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("L1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u203 (
    .do({open_n605,open_n606,open_n607,1'b0}),
    .opad(G[0]));  // sources/rtl/test_camera.v(18)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u204 (
    .do({open_n622,open_n623,open_n624,LCD_CLK_pad}),
    .opad(LCD_CLK));  // sources/rtl/test_camera.v(20)
  EG_PHY_PAD #(
    //.LOCATION("J3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u205 (
    .do({open_n639,open_n640,open_n641,LCD_HSYNC_pad}),
    .opad(LCD_HSYNC));  // sources/rtl/test_camera.v(21)
  EG_PHY_PAD #(
    //.LOCATION("J4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u206 (
    .do({open_n656,open_n657,open_n658,LCD_VSYNC_pad}),
    .opad(LCD_VSYNC));  // sources/rtl/test_camera.v(22)
  EG_PHY_PAD #(
    //.LOCATION("A7"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u207 (
    .do({open_n673,open_n674,open_n675,OD_pad[0]}),
    .opad(OD[0]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u208 (
    .do({open_n690,open_n691,open_n692,OD_pad[1]}),
    .opad(OD[1]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A10"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u209 (
    .do({open_n707,open_n708,open_n709,OD_pad[2]}),
    .opad(OD[2]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u210 (
    .do({open_n724,open_n725,open_n726,OD_pad[3]}),
    .opad(OD[3]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u211 (
    .do({open_n741,open_n742,open_n743,OD_pad[4]}),
    .opad(OD[4]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u212 (
    .do({open_n758,open_n759,open_n760,OD_pad[5]}),
    .opad(OD[5]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("E8"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u213 (
    .do({open_n775,open_n776,open_n777,OD_pad[6]}),
    .opad(OD[6]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("A14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u214 (
    .do({open_n792,open_n793,open_n794,OD_pad[7]}),
    .opad(OD[7]));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u215 (
    .do({open_n809,open_n810,open_n811,R_pad[7]}),
    .opad(R[7]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u216 (
    .do({open_n826,open_n827,open_n828,R_pad[6]}),
    .opad(R[6]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u217 (
    .do({open_n843,open_n844,open_n845,R_pad[5]}),
    .opad(R[5]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u218 (
    .do({open_n860,open_n861,open_n862,R_pad[4]}),
    .opad(R[4]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u219 (
    .do({open_n877,open_n878,open_n879,R_pad[3]}),
    .opad(R[3]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u220 (
    .do({open_n894,open_n895,open_n896,1'b0}),
    .opad(R[2]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("K3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u221 (
    .do({open_n911,open_n912,open_n913,1'b0}),
    .opad(R[1]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("K6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u222 (
    .do({open_n928,open_n929,open_n930,1'b0}),
    .opad(R[0]));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u223 (
    .ipad(RST_N),
    .di(CSI_RST_pad));  // sources/rtl/test_camera.v(5)
  EG_PHY_PAD #(
    //.LOCATION("A5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u224 (
    .do({open_n962,open_n963,open_n964,TESTA_pad}),
    .opad(TESTA));  // sources/rtl/test_camera.v(26)
  EG_PHY_PAD #(
    //.LOCATION("A9"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u225 (
    .do({open_n979,open_n980,open_n981,TESTB_pad}),
    .opad(TESTB));  // sources/rtl/test_camera.v(27)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*~A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(~D*~C*B*~A)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000100),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000000000000100),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u454|_al_u460  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n276 ,\and_Ncamera_addr[12]_o_al_n197 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u455|_al_u459  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n244 ,\and_Ncamera_addr[12]_o_al_n228 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u456|_al_u458  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n213 ,\and_Ncamera_addr[12]_o_al_n260 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u461|_al_u457  (
    .a({open_n1063,camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[12],camera_addr[15]}),
    .f({_al_u461_o,\and_camera_addr[12]__o }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u462|_al_u476  (
    .a({open_n1084,_al_u461_o}),
    .b({open_n1085,camera_wrreq}),
    .c({camera_addr[15],camera_addr[11]}),
    .d({_al_u461_o,camera_addr[15]}),
    .f({\and_Ncamera_addr[12]_o ,\and_Ncamera_addr[11]_o_and_camera_wrreq }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*C*B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*C*B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u463|_al_u470  (
    .a({lcd_rdaddr[15],lcd_rdaddr[15]}),
    .b({lcd_rdaddr[14],lcd_rdaddr[14]}),
    .c({lcd_rdaddr[13],lcd_rdaddr[13]}),
    .d({lcd_rdaddr[12],lcd_rdaddr[12]}),
    .f({\and_lcd_rdaddr[12]_l_o_al_n279 ,\and_Nlcd_rdaddr[12]__o }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(D*C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0001000000000000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0001000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u464|_al_u469  (
    .a({lcd_rdaddr[15],lcd_rdaddr[15]}),
    .b({lcd_rdaddr[14],lcd_rdaddr[14]}),
    .c({lcd_rdaddr[13],lcd_rdaddr[13]}),
    .d({lcd_rdaddr[12],lcd_rdaddr[12]}),
    .f({\and_lcd_rdaddr[12]_l_o ,\and_Nlcd_rdaddr[12]__o_al_n200 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(D*~C*B*~A)"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b0000010000000000),
    .MODE("LOGIC"))
    \_al_u465|_al_u468  (
    .a({lcd_rdaddr[15],lcd_rdaddr[15]}),
    .b({lcd_rdaddr[14],lcd_rdaddr[14]}),
    .c({lcd_rdaddr[13],lcd_rdaddr[13]}),
    .d({lcd_rdaddr[12],lcd_rdaddr[12]}),
    .f({\and_lcd_rdaddr[12]_N_o_al_n247 ,\and_Nlcd_rdaddr[12]__o_al_n231 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u466|_al_u467  (
    .a({lcd_rdaddr[15],lcd_rdaddr[15]}),
    .b({lcd_rdaddr[14],lcd_rdaddr[14]}),
    .c({lcd_rdaddr[13],lcd_rdaddr[13]}),
    .d({lcd_rdaddr[12],lcd_rdaddr[12]}),
    .f({\and_lcd_rdaddr[12]_N_o ,\and_Nlcd_rdaddr[12]__o_al_n263 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*A)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(D*~C*~B*A)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000001000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u472|_al_u471  (
    .a({open_n1194,lcd_rdaddr[15]}),
    .b({lcd_rdaddr[13],lcd_rdaddr[14]}),
    .c(lcd_rdaddr[12:11]),
    .d({_al_u471_o,lcd_rden}),
    .f({\and_Nlcd_rdaddr[11]__o_and_lcd_rden ,_al_u471_o}));
  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u473|u_cameraReader/reg3_b0  (
    .a({open_n1219,_al_u477_o}),
    .b({open_n1220,CSI_VSYNC_pad}),
    .c({clk_cam,CSI_RST_pad}),
    .ce(\u_cameraReader/mux14_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .d({CSI_RST_pad,\u_cameraReader/pixel_counter [0]}),
    .mi({open_n1224,OD_pad[7]}),
    .f({CSI_XCLK_pad,\u_cameraReader/mux14_b0_sel_is_2_o }),
    .q({open_n1240,\u_cameraReader/subpixel [0]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*~(~D*~A))"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000010000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u477|u_cameraReader/reg1_b10  (
    .a({open_n1241,_al_u477_o}),
    .b({open_n1242,CSI_VSYNC_pad}),
    .c({\u_cameraReader/vsync_passed ,CSI_RST_pad}),
    .clk(CSI_PCLK_pad),
    .d({\u_cameraReader/n2 ,\u_cameraReader/write_pixel }),
    .mi({open_n1254,\u_cameraReader/n8 [10]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .f({_al_u477_o,\u_cameraReader/mux12_b0_sel_is_2_o }),
    .q({open_n1258,\u_cameraReader/pixel_counter [10]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u478|u_cameraReader/reg4_b0  (
    .b({open_n1261,CSI_VSYNC_pad}),
    .c({\u_cameraReader/pixel_counter [0],CSI_RST_pad}),
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .d({_al_u477_o,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .mi({open_n1272,OD_pad[7]}),
    .f({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux15_b0_sel_is_2_o }),
    .q({open_n1277,\u_cameraReader/current_pixel [0]}));  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u498|_al_u500  (
    .a({open_n1278,_al_u498_o}),
    .b({\uimg/inst_dob_i4_008 ,_al_u499_o}),
    .c({\uimg/inst_dob_i6_008 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u498_o,_al_u500_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u499|_al_u742  (
    .b({\uimg/inst_dob_i0_008 ,\uimg/inst_dob_i24_000 }),
    .c({\uimg/inst_dob_i2_008 ,\uimg/inst_dob_i26_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u499_o,_al_u742_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u501|_al_u744  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i12_008 ,\uimg/inst_dob_i20_000 }),
    .d({\uimg/inst_dob_i14_008 ,\uimg/inst_dob_i22_000 }),
    .f({_al_u501_o,_al_u744_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u502|_al_u738  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i8_008 ,\uimg/inst_dob_i12_000 }),
    .d({\uimg/inst_dob_i10_008 ,\uimg/inst_dob_i14_000 }),
    .f({_al_u502_o,_al_u738_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B*~A))"),
    //.LUT1("(~D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1111111000000000),
    .INIT_LUT1(16'b0000000011101111),
    .MODE("LOGIC"))
    \_al_u503|_al_u593  (
    .a({_al_u501_o,_al_u591_o}),
    .b({_al_u502_o,_al_u592_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u503_o,_al_u593_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u504|_al_u741  (
    .b({\uimg/inst_dob_i28_008 ,\uimg/inst_dob_i28_000 }),
    .c({\uimg/inst_dob_i30_008 ,\uimg/inst_dob_i30_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u504_o,_al_u741_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u505|_al_u736  (
    .b({\uimg/inst_dob_i24_008 ,\uimg/inst_dob_i0_000 }),
    .c({\uimg/inst_dob_i26_008 ,\uimg/inst_dob_i2_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u505_o,_al_u736_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u507|_al_u731  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i20_008 ,\uimg/inst_dob_i56_000 }),
    .d({\uimg/inst_dob_i22_008 ,\uimg/inst_dob_i58_000 }),
    .f({_al_u507_o,_al_u731_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u508|_al_u725  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i16_008 ,\uimg/inst_dob_i44_000 }),
    .d({\uimg/inst_dob_i18_008 ,\uimg/inst_dob_i46_000 }),
    .f({_al_u508_o,_al_u725_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B*~A))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0000000011101111),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u509|_al_u587  (
    .a({_al_u507_o,_al_u585_o}),
    .b({_al_u508_o,_al_u586_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u509_o,_al_u587_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b1010110000000000),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b1010110000000000),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u510|_al_u506  (
    .a({_al_u500_o,_al_u504_o}),
    .b({_al_u503_o,_al_u505_o}),
    .c({_al_u506_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u509_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u510_o,_al_u506_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u511|_al_u513  (
    .a({open_n1529,_al_u511_o}),
    .b({\uimg/inst_dob_i36_008 ,_al_u512_o}),
    .c({\uimg/inst_dob_i38_008 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u511_o,_al_u513_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u512|_al_u729  (
    .b({\uimg/inst_dob_i32_008 ,\uimg/inst_dob_i48_000 }),
    .c({\uimg/inst_dob_i34_008 ,\uimg/inst_dob_i50_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u512_o,_al_u729_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u514|_al_u715  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i44_008 ,\uimg/inst_dob_i0_001 }),
    .d({\uimg/inst_dob_i46_008 ,\uimg/inst_dob_i2_001 }),
    .f({_al_u514_o,_al_u715_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u515|_al_u713  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i40_008 ,\uimg/inst_dob_i8_001 }),
    .d({\uimg/inst_dob_i42_008 ,\uimg/inst_dob_i10_001 }),
    .f({_al_u515_o,_al_u713_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B*~A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(D*~(~C*~B*~A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b1111111000000000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b1111111000000000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u516|_al_u578  (
    .a({_al_u514_o,_al_u576_o}),
    .b({_al_u515_o,_al_u577_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u516_o,_al_u578_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u517|_al_u728  (
    .b({\uimg/inst_dob_i52_008 ,\uimg/inst_dob_i52_000 }),
    .c({\uimg/inst_dob_i54_008 ,\uimg/inst_dob_i54_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u517_o,_al_u728_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u518|_al_u723  (
    .b({\uimg/inst_dob_i48_008 ,\uimg/inst_dob_i32_000 }),
    .c({\uimg/inst_dob_i50_008 ,\uimg/inst_dob_i34_000 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u518_o,_al_u723_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b0011001000010000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b0011001000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u520|_al_u709  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i56_008 ,\uimg/inst_dob_i16_001 }),
    .d({\uimg/inst_dob_i58_008 ,\uimg/inst_dob_i18_001 }),
    .f({_al_u520_o,_al_u709_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b1100100001000000),
    .MODE("LOGIC"))
    \_al_u521|_al_u707  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i60_008 ,\uimg/inst_dob_i24_001 }),
    .d({\uimg/inst_dob_i62_008 ,\uimg/inst_dob_i26_001 }),
    .f({_al_u521_o,_al_u707_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B*~A))"),
    //.LUTF1("(D*~(C*~B*~A))"),
    //.LUTG0("(~D*~(C*~B*~A))"),
    //.LUTG1("(D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011101111),
    .INIT_LUTF1(16'b1110111100000000),
    .INIT_LUTG0(16'b0000000011101111),
    .INIT_LUTG1(16'b1110111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u522|_al_u572  (
    .a({_al_u520_o,_al_u570_o}),
    .b({_al_u521_o,_al_u571_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u522_o,_al_u572_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u523|_al_u519  (
    .a({_al_u513_o,_al_u517_o}),
    .b({_al_u516_o,_al_u518_o}),
    .c({_al_u519_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u522_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u523_o,_al_u519_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"))
    \_al_u524|_al_u759  (
    .a({_al_u510_o,lcd_rdaddr_piped_piped[4]}),
    .b({_al_u523_o,lcd_rdaddr_piped_piped[5]}),
    .c({lcd_rdaddr_piped_piped[5],\uimg/inst_dob_i32_013 }),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i48_013 }),
    .f({_al_u524_o,_al_u759_o}));
  // sources/rtl/cameraReader.v(29)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*~A*~(~D*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0101000000010000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u525|u_cameraReader/wrclk1_reg  (
    .a({_al_u524_o,open_n1800}),
    .b({lcd_rdaddr_piped_piped[6],open_n1801}),
    .c({lcd_rden,open_n1802}),
    .clk(CSI_PCLK_pad),
    .d({\uimg/inst_dob_i64_008 ,\u_cameraReader/wrclk1 }),
    .f({G_pad[5],open_n1817}),
    .q({open_n1821,\u_cameraReader/wrclk1 }));  // sources/rtl/cameraReader.v(29)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u526|_al_u528  (
    .a({open_n1822,_al_u526_o}),
    .b({\uimg/inst_dob_i8_007 ,_al_u527_o}),
    .c({\uimg/inst_dob_i10_007 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u526_o,_al_u528_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u527|_al_u686  (
    .b({\uimg/inst_dob_i12_007 ,\uimg/inst_dob_i16_002 }),
    .c({\uimg/inst_dob_i14_007 ,\uimg/inst_dob_i18_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u527_o,_al_u686_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u529|_al_u702  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i4_007 ,\uimg/inst_dob_i32_001 }),
    .d({\uimg/inst_dob_i6_007 ,\uimg/inst_dob_i34_001 }),
    .f({_al_u529_o,_al_u702_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u530|_al_u700  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i0_007 ,\uimg/inst_dob_i40_001 }),
    .d({\uimg/inst_dob_i2_007 ,\uimg/inst_dob_i42_001 }),
    .f({_al_u530_o,_al_u700_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*~B*~A))"),
    //.LUT1("(~D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b1110111100000000),
    .INIT_LUT1(16'b0000000011111110),
    .MODE("LOGIC"))
    \_al_u531|_al_u565  (
    .a({_al_u529_o,_al_u563_o}),
    .b({_al_u530_o,_al_u564_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u531_o,_al_u565_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u532|_al_u685  (
    .b({\uimg/inst_dob_i20_007 ,\uimg/inst_dob_i20_002 }),
    .c({\uimg/inst_dob_i22_007 ,\uimg/inst_dob_i22_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u532_o,_al_u685_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u533|_al_u680  (
    .b({\uimg/inst_dob_i16_007 ,\uimg/inst_dob_i12_002 }),
    .c({\uimg/inst_dob_i18_007 ,\uimg/inst_dob_i14_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u533_o,_al_u680_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b0011001000010000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b0011001000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u535|_al_u696  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i24_007 ,\uimg/inst_dob_i48_001 }),
    .d({\uimg/inst_dob_i26_007 ,\uimg/inst_dob_i50_001 }),
    .f({_al_u535_o,_al_u696_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b1100100001000000),
    .MODE("LOGIC"))
    \_al_u536|_al_u694  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i28_007 ,\uimg/inst_dob_i56_001 }),
    .d({\uimg/inst_dob_i30_007 ,\uimg/inst_dob_i58_001 }),
    .f({_al_u536_o,_al_u694_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~B*~A))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b0000000011101111),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u537|_al_u559  (
    .a({_al_u535_o,_al_u557_o}),
    .b({_al_u536_o,_al_u558_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u537_o,_al_u559_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u538|_al_u534  (
    .a({_al_u528_o,_al_u532_o}),
    .b({_al_u531_o,_al_u533_o}),
    .c({_al_u534_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u537_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u538_o,_al_u534_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u539|_al_u541  (
    .a({open_n2069,_al_u539_o}),
    .b({\uimg/inst_dob_i40_007 ,_al_u540_o}),
    .c({\uimg/inst_dob_i42_007 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u539_o,_al_u541_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u540|_al_u673  (
    .b({\uimg/inst_dob_i44_007 ,\uimg/inst_dob_i48_002 }),
    .c({\uimg/inst_dob_i46_007 ,\uimg/inst_dob_i50_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u540_o,_al_u673_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u542|_al_u688  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i36_007 ,\uimg/inst_dob_i24_002 }),
    .d({\uimg/inst_dob_i38_007 ,\uimg/inst_dob_i26_002 }),
    .f({_al_u542_o,_al_u688_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u543|_al_u682  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i32_007 ,\uimg/inst_dob_i4_002 }),
    .d({\uimg/inst_dob_i34_007 ,\uimg/inst_dob_i6_002 }),
    .f({_al_u543_o,_al_u682_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B*~A))"),
    //.LUTF1("(~D*~(~C*~B*~A))"),
    //.LUTG0("(D*~(C*~B*~A))"),
    //.LUTG1("(~D*~(~C*~B*~A))"),
    .INIT_LUTF0(16'b1110111100000000),
    .INIT_LUTF1(16'b0000000011111110),
    .INIT_LUTG0(16'b1110111100000000),
    .INIT_LUTG1(16'b0000000011111110),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u544|_al_u550  (
    .a({_al_u542_o,_al_u548_o}),
    .b({_al_u543_o,_al_u549_o}),
    .c({lcd_rdaddr_piped_piped[3],lcd_rdaddr_piped_piped[3]}),
    .d({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .f({_al_u544_o,_al_u550_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u545|_al_u672  (
    .b({\uimg/inst_dob_i52_007 ,\uimg/inst_dob_i52_002 }),
    .c({\uimg/inst_dob_i54_007 ,\uimg/inst_dob_i54_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u545_o,_al_u672_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u546|_al_u667  (
    .b({\uimg/inst_dob_i48_007 ,\uimg/inst_dob_i32_002 }),
    .c({\uimg/inst_dob_i50_007 ,\uimg/inst_dob_i34_002 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u546_o,_al_u667_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0011001000010000),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0011001000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u548|_al_u675  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i56_007 ,\uimg/inst_dob_i56_002 }),
    .d({\uimg/inst_dob_i58_007 ,\uimg/inst_dob_i58_002 }),
    .f({_al_u548_o,_al_u675_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b1100100001000000),
    .MODE("LOGIC"))
    \_al_u549|_al_u669  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i60_007 ,\uimg/inst_dob_i44_002 }),
    .d({\uimg/inst_dob_i62_007 ,\uimg/inst_dob_i46_002 }),
    .f({_al_u549_o,_al_u669_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u551|_al_u547  (
    .a({_al_u541_o,_al_u545_o}),
    .b({_al_u544_o,_al_u546_o}),
    .c({_al_u547_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u550_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u551_o,_al_u547_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(~D*B))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~A*~(~D*B))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0101000000010000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0101000000010000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u552|_al_u553  (
    .a({_al_u538_o,_al_u552_o}),
    .b({_al_u551_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_007 }),
    .f({_al_u552_o,G_pad[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u554|_al_u556  (
    .a({open_n2316,_al_u554_o}),
    .b({\uimg/inst_dob_i36_006 ,_al_u555_o}),
    .c({\uimg/inst_dob_i38_006 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u554_o,_al_u556_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u555|_al_u630  (
    .b({\uimg/inst_dob_i32_006 ,\uimg/inst_dob_i56_004 }),
    .c({\uimg/inst_dob_i34_006 ,\uimg/inst_dob_i58_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u555_o,_al_u630_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u557|_al_u659  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i44_006 ,\uimg/inst_dob_i0_003 }),
    .d({\uimg/inst_dob_i46_006 ,\uimg/inst_dob_i2_003 }),
    .f({_al_u557_o,_al_u659_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u558|_al_u657  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i40_006 ,\uimg/inst_dob_i8_003 }),
    .d({\uimg/inst_dob_i42_006 ,\uimg/inst_dob_i10_003 }),
    .f({_al_u558_o,_al_u657_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u560|_al_u629  (
    .b({\uimg/inst_dob_i52_006 ,\uimg/inst_dob_i60_004 }),
    .c({\uimg/inst_dob_i54_006 ,\uimg/inst_dob_i62_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u560_o,_al_u629_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u561|_al_u624  (
    .b({\uimg/inst_dob_i48_006 ,\uimg/inst_dob_i44_004 }),
    .c({\uimg/inst_dob_i50_006 ,\uimg/inst_dob_i46_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u561_o,_al_u624_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u563|_al_u653  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i60_006 ,\uimg/inst_dob_i16_003 }),
    .d({\uimg/inst_dob_i62_006 ,\uimg/inst_dob_i18_003 }),
    .f({_al_u563_o,_al_u653_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u564|_al_u651  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i56_006 ,\uimg/inst_dob_i24_003 }),
    .d({\uimg/inst_dob_i58_006 ,\uimg/inst_dob_i26_003 }),
    .f({_al_u564_o,_al_u651_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u566|_al_u562  (
    .a({_al_u556_o,_al_u560_o}),
    .b({_al_u559_o,_al_u561_o}),
    .c({_al_u562_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u565_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u566_o,_al_u562_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u567|_al_u569  (
    .a({open_n2527,_al_u567_o}),
    .b({\uimg/inst_dob_i4_006 ,_al_u568_o}),
    .c({\uimg/inst_dob_i6_006 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u567_o,_al_u569_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u568|_al_u617  (
    .b({\uimg/inst_dob_i0_006 ,\uimg/inst_dob_i24_004 }),
    .c({\uimg/inst_dob_i2_006 ,\uimg/inst_dob_i26_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u568_o,_al_u617_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u570|_al_u646  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i12_006 ,\uimg/inst_dob_i32_003 }),
    .d({\uimg/inst_dob_i14_006 ,\uimg/inst_dob_i34_003 }),
    .f({_al_u570_o,_al_u646_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u571|_al_u644  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i8_006 ,\uimg/inst_dob_i40_003 }),
    .d({\uimg/inst_dob_i10_006 ,\uimg/inst_dob_i42_003 }),
    .f({_al_u571_o,_al_u644_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u573|_al_u616  (
    .b({\uimg/inst_dob_i28_006 ,\uimg/inst_dob_i28_004 }),
    .c({\uimg/inst_dob_i30_006 ,\uimg/inst_dob_i30_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u573_o,_al_u616_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u574|_al_u611  (
    .b({\uimg/inst_dob_i24_006 ,\uimg/inst_dob_i0_004 }),
    .c({\uimg/inst_dob_i26_006 ,\uimg/inst_dob_i2_004 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u574_o,_al_u611_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0000000100100011),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b0000000100100011),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u576|_al_u640  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i20_006 ,\uimg/inst_dob_i48_003 }),
    .d({\uimg/inst_dob_i22_006 ,\uimg/inst_dob_i50_003 }),
    .f({_al_u576_o,_al_u640_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0000000100100011),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u577|_al_u638  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i16_006 ,\uimg/inst_dob_i56_003 }),
    .d({\uimg/inst_dob_i18_006 ,\uimg/inst_dob_i58_003 }),
    .f({_al_u577_o,_al_u638_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b1010110000000000),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u579|_al_u575  (
    .a({_al_u569_o,_al_u573_o}),
    .b({_al_u572_o,_al_u574_o}),
    .c({_al_u575_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u578_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u579_o,_al_u575_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A*~(~D*B))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0101000000010000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u580|_al_u581  (
    .a({_al_u566_o,_al_u580_o}),
    .b({_al_u579_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_006 }),
    .f({_al_u580_o,G_pad[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u582|_al_u584  (
    .a({open_n2750,_al_u582_o}),
    .b({\uimg/inst_dob_i4_005 ,_al_u583_o}),
    .c({\uimg/inst_dob_i6_005 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u582_o,_al_u584_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u583|_al_u602  (
    .b({\uimg/inst_dob_i0_005 ,\uimg/inst_dob_i56_005 }),
    .c({\uimg/inst_dob_i2_005 ,\uimg/inst_dob_i58_005 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u583_o,_al_u602_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u585|_al_u632  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i12_005 ,\uimg/inst_dob_i52_004 }),
    .d({\uimg/inst_dob_i14_005 ,\uimg/inst_dob_i54_004 }),
    .f({_al_u585_o,_al_u632_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u586|_al_u626  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i8_005 ,\uimg/inst_dob_i36_004 }),
    .d({\uimg/inst_dob_i10_005 ,\uimg/inst_dob_i38_004 }),
    .f({_al_u586_o,_al_u626_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000111100110011),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u588|_al_u601  (
    .b({\uimg/inst_dob_i28_005 ,\uimg/inst_dob_i60_005 }),
    .c({\uimg/inst_dob_i30_005 ,\uimg/inst_dob_i62_005 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u588_o,_al_u601_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u589|_al_u596  (
    .b({\uimg/inst_dob_i24_005 ,\uimg/inst_dob_i32_005 }),
    .c({\uimg/inst_dob_i26_005 ,\uimg/inst_dob_i34_005 }),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .f({_al_u589_o,_al_u596_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u591|_al_u619  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i20_005 ,\uimg/inst_dob_i20_004 }),
    .d({\uimg/inst_dob_i22_005 ,\uimg/inst_dob_i22_004 }),
    .f({_al_u591_o,_al_u619_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u592|_al_u613  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i16_005 ,\uimg/inst_dob_i12_004 }),
    .d({\uimg/inst_dob_i18_005 ,\uimg/inst_dob_i14_004 }),
    .f({_al_u592_o,_al_u613_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b1010110000000000),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b1010110000000000),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u594|_al_u590  (
    .a({_al_u584_o,_al_u588_o}),
    .b({_al_u587_o,_al_u589_o}),
    .c({_al_u590_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u593_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u594_o,_al_u590_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u595|_al_u597  (
    .a({open_n2957,_al_u595_o}),
    .b({\uimg/inst_dob_i36_005 ,_al_u596_o}),
    .c({\uimg/inst_dob_i38_005 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u595_o,_al_u597_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u598|_al_u604  (
    .a({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[1]}),
    .b({lcd_rdaddr_piped_piped[2],lcd_rdaddr_piped_piped[2]}),
    .c({\uimg/inst_dob_i44_005 ,\uimg/inst_dob_i52_005 }),
    .d({\uimg/inst_dob_i46_005 ,\uimg/inst_dob_i54_005 }),
    .f({_al_u598_o,_al_u604_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u600|_al_u599  (
    .a({_al_u598_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u599_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i40_005 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i42_005 }),
    .f({_al_u600_o,_al_u599_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u606|_al_u605  (
    .a({_al_u604_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u605_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i48_005 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i50_005 }),
    .f({_al_u606_o,_al_u605_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b1010110000000000),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u607|_al_u603  (
    .a({_al_u597_o,_al_u601_o}),
    .b({_al_u600_o,_al_u602_o}),
    .c({_al_u603_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u606_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u607_o,_al_u603_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A*~(~D*B))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0101000000010000),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"))
    \_al_u608|_al_u609  (
    .a({_al_u594_o,_al_u608_o}),
    .b({_al_u607_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_005 }),
    .f({_al_u608_o,G_pad[2]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u610|_al_u612  (
    .a({open_n3086,_al_u610_o}),
    .b({\uimg/inst_dob_i4_004 ,_al_u611_o}),
    .c({\uimg/inst_dob_i6_004 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u610_o,_al_u612_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u615|_al_u614  (
    .a({_al_u613_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u614_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i8_004 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i10_004 }),
    .f({_al_u615_o,_al_u614_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u621|_al_u620  (
    .a({_al_u619_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u620_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i16_004 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i18_004 }),
    .f({_al_u621_o,_al_u620_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b1010110000000000),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b1010110000000000),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u622|_al_u618  (
    .a({_al_u612_o,_al_u616_o}),
    .b({_al_u615_o,_al_u617_o}),
    .c({_al_u618_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u621_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u622_o,_al_u618_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u623|_al_u625  (
    .a({open_n3179,_al_u623_o}),
    .b({\uimg/inst_dob_i40_004 ,_al_u624_o}),
    .c({\uimg/inst_dob_i42_004 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u623_o,_al_u625_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(~C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(~C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011111110),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011111110),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u628|_al_u627  (
    .a({_al_u626_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u627_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i32_004 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i34_004 }),
    .f({_al_u628_o,_al_u627_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u634|_al_u633  (
    .a({_al_u632_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u633_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i48_004 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i50_004 }),
    .f({_al_u634_o,_al_u633_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b1010110000000000),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u635|_al_u631  (
    .a({_al_u625_o,_al_u629_o}),
    .b({_al_u628_o,_al_u630_o}),
    .c({_al_u631_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u634_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u635_o,_al_u631_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(~D*B))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~A*~(~D*B))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0101000000010000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0101000000010000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u636|_al_u637  (
    .a({_al_u622_o,_al_u636_o}),
    .b({_al_u635_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_004 }),
    .f({_al_u636_o,B_pad[7]}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u642|_al_u641  (
    .a({open_n3288,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u641_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i52_003 }),
    .d({_al_u640_o,\uimg/inst_dob_i54_003 }),
    .f({_al_u642_o,_al_u641_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u643|_al_u639  (
    .a({_al_u642_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u638_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u639_o,\uimg/inst_dob_i60_003 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i62_003 }),
    .f({_al_u643_o,_al_u639_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u648|_al_u647  (
    .a({open_n3333,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u647_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i36_003 }),
    .d({_al_u646_o,\uimg/inst_dob_i38_003 }),
    .f({_al_u648_o,_al_u647_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u649|_al_u645  (
    .a({_al_u648_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u644_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u645_o,\uimg/inst_dob_i44_003 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i46_003 }),
    .f({_al_u649_o,_al_u645_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b1010110000000000),
    .MODE("LOGIC"))
    \_al_u650|_al_u775  (
    .a({_al_u643_o,lcd_rdaddr_piped_piped[4]}),
    .b({_al_u649_o,lcd_rdaddr_piped_piped[5]}),
    .c({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i32_009 }),
    .d({lcd_rdaddr_piped_piped[5],\uimg/inst_dob_i48_009 }),
    .f({_al_u650_o,_al_u775_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u655|_al_u654  (
    .a({open_n3398,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u654_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i20_003 }),
    .d({_al_u653_o,\uimg/inst_dob_i22_003 }),
    .f({_al_u655_o,_al_u654_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u656|_al_u652  (
    .a({_al_u655_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u651_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u652_o,\uimg/inst_dob_i28_003 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i30_003 }),
    .f({_al_u656_o,_al_u652_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u661|_al_u660  (
    .a({open_n3443,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u660_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i4_003 }),
    .d({_al_u659_o,\uimg/inst_dob_i6_003 }),
    .f({_al_u661_o,_al_u660_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u662|_al_u658  (
    .a({_al_u661_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u657_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u658_o,\uimg/inst_dob_i12_003 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i14_003 }),
    .f({_al_u662_o,_al_u658_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000010101100),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000010101100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u663|_al_u774  (
    .a({_al_u656_o,lcd_rdaddr_piped_piped[4]}),
    .b({_al_u662_o,lcd_rdaddr_piped_piped[5]}),
    .c({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i0_009 }),
    .d({lcd_rdaddr_piped_piped[5],\uimg/inst_dob_i16_009 }),
    .f({_al_u663_o,_al_u774_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(C*~(~D*~(~B*~A)))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b1111000000010000),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b1111000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u665|_al_u664  (
    .a({_al_u650_o,open_n3512}),
    .b({_al_u663_o,lcd_rden}),
    .c({_al_u664_o,\uimg/inst_dob_i64_003 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({B_pad[6],_al_u664_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u666|_al_u668  (
    .a({open_n3537,_al_u666_o}),
    .b({\uimg/inst_dob_i36_002 ,_al_u667_o}),
    .c({\uimg/inst_dob_i38_002 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u666_o,_al_u668_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u671|_al_u670  (
    .a({_al_u669_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u670_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i40_002 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i42_002 }),
    .f({_al_u671_o,_al_u670_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u677|_al_u676  (
    .a({_al_u675_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u676_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i60_002 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i62_002 }),
    .f({_al_u677_o,_al_u676_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u678|_al_u674  (
    .a({_al_u668_o,_al_u672_o}),
    .b({_al_u671_o,_al_u673_o}),
    .c({_al_u674_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u677_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u678_o,_al_u674_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u679|_al_u681  (
    .a({open_n3630,_al_u679_o}),
    .b({\uimg/inst_dob_i8_002 ,_al_u680_o}),
    .c({\uimg/inst_dob_i10_002 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u679_o,_al_u681_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(~C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(~C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011111110),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011111110),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u684|_al_u683  (
    .a({_al_u682_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u683_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i0_002 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i2_002 }),
    .f({_al_u684_o,_al_u683_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u690|_al_u689  (
    .a({_al_u688_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u689_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i28_002 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i30_002 }),
    .f({_al_u690_o,_al_u689_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u691|_al_u687  (
    .a({_al_u681_o,_al_u685_o}),
    .b({_al_u684_o,_al_u686_o}),
    .c({_al_u687_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u690_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u691_o,_al_u687_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(~D*B))"),
    //.LUTF1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(C*~A*~(~D*B))"),
    //.LUTG1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b0101000000010000),
    .INIT_LUTF1(16'b0000000010101100),
    .INIT_LUTG0(16'b0101000000010000),
    .INIT_LUTG1(16'b0000000010101100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u692|_al_u693  (
    .a({_al_u678_o,_al_u692_o}),
    .b({_al_u691_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_002 }),
    .f({_al_u692_o,B_pad[5]}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u698|_al_u697  (
    .a({open_n3739,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u697_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i52_001 }),
    .d({_al_u696_o,\uimg/inst_dob_i54_001 }),
    .f({_al_u698_o,_al_u697_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u699|_al_u695  (
    .a({_al_u698_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u694_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u695_o,\uimg/inst_dob_i60_001 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i62_001 }),
    .f({_al_u699_o,_al_u695_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u704|_al_u703  (
    .a({open_n3784,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u703_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i36_001 }),
    .d({_al_u702_o,\uimg/inst_dob_i38_001 }),
    .f({_al_u704_o,_al_u703_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u705|_al_u701  (
    .a({_al_u704_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u700_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u701_o,\uimg/inst_dob_i44_001 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i46_001 }),
    .f({_al_u705_o,_al_u701_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1010110000000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1010110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u706|_al_u771  (
    .a({_al_u699_o,lcd_rdaddr_piped_piped[4]}),
    .b({_al_u705_o,lcd_rdaddr_piped_piped[5]}),
    .c({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i32_010 }),
    .d({lcd_rdaddr_piped_piped[5],\uimg/inst_dob_i48_010 }),
    .f({_al_u706_o,_al_u771_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u711|_al_u710  (
    .a({open_n3853,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u710_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i20_001 }),
    .d({_al_u709_o,\uimg/inst_dob_i22_001 }),
    .f({_al_u711_o,_al_u710_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u712|_al_u708  (
    .a({_al_u711_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u707_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u708_o,\uimg/inst_dob_i28_001 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i30_001 }),
    .f({_al_u712_o,_al_u708_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000010010001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u717|_al_u716  (
    .a({open_n3898,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u716_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i4_001 }),
    .d({_al_u715_o,\uimg/inst_dob_i6_001 }),
    .f({_al_u717_o,_al_u716_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(B*~(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0000010010001100),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0000010010001100),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u718|_al_u714  (
    .a({_al_u717_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u713_o,lcd_rdaddr_piped_piped[2]}),
    .c({_al_u714_o,\uimg/inst_dob_i12_001 }),
    .d({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i14_001 }),
    .f({_al_u718_o,_al_u714_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u719|_al_u770  (
    .a({_al_u712_o,lcd_rdaddr_piped_piped[4]}),
    .b({_al_u718_o,lcd_rdaddr_piped_piped[5]}),
    .c({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i0_010 }),
    .d({lcd_rdaddr_piped_piped[5],\uimg/inst_dob_i16_010 }),
    .f({_al_u719_o,_al_u770_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(C*~(~D*~(~B*~A)))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b1111000000010000),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b1111000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u721|_al_u720  (
    .a({_al_u706_o,open_n3963}),
    .b({_al_u719_o,lcd_rden}),
    .c({_al_u720_o,\uimg/inst_dob_i64_001 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({B_pad[4],_al_u720_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0000111100110011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0000111100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u722|_al_u724  (
    .a({open_n3988,_al_u722_o}),
    .b({\uimg/inst_dob_i36_000 ,_al_u723_o}),
    .c({\uimg/inst_dob_i38_000 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u722_o,_al_u724_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u727|_al_u726  (
    .a({_al_u725_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u726_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i40_000 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i42_000 }),
    .f({_al_u727_o,_al_u726_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u733|_al_u732  (
    .a({_al_u731_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u732_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i60_000 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i62_000 }),
    .f({_al_u733_o,_al_u732_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u734|_al_u730  (
    .a({_al_u724_o,_al_u728_o}),
    .b({_al_u727_o,_al_u729_o}),
    .c({_al_u730_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u733_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u734_o,_al_u730_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0000111100110011),
    .MODE("LOGIC"))
    \_al_u735|_al_u737  (
    .a({open_n4081,_al_u735_o}),
    .b({\uimg/inst_dob_i4_000 ,_al_u736_o}),
    .c({\uimg/inst_dob_i6_000 ,lcd_rdaddr_piped_piped[2]}),
    .d({lcd_rdaddr_piped_piped[1],lcd_rdaddr_piped_piped[3]}),
    .f({_al_u735_o,_al_u737_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u740|_al_u739  (
    .a({_al_u738_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u739_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i8_000 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i10_000 }),
    .f({_al_u740_o,_al_u739_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u746|_al_u745  (
    .a({_al_u744_o,lcd_rdaddr_piped_piped[1]}),
    .b({_al_u745_o,lcd_rdaddr_piped_piped[2]}),
    .c({lcd_rdaddr_piped_piped[3],\uimg/inst_dob_i16_000 }),
    .d({lcd_rdaddr_piped_piped[4],\uimg/inst_dob_i18_000 }),
    .f({_al_u746_o,_al_u745_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b1010110000000000),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u747|_al_u743  (
    .a({_al_u737_o,_al_u741_o}),
    .b({_al_u740_o,_al_u742_o}),
    .c({_al_u743_o,lcd_rdaddr_piped_piped[2]}),
    .d({_al_u746_o,lcd_rdaddr_piped_piped[3]}),
    .f({_al_u747_o,_al_u743_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A*~(~D*B))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0101000000010000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u748|_al_u749  (
    .a({_al_u734_o,_al_u748_o}),
    .b({_al_u747_o,lcd_rdaddr_piped_piped[6]}),
    .c({lcd_rdaddr_piped_piped[5],lcd_rden}),
    .d({lcd_rdaddr_piped_piped[6],\uimg/inst_dob_i64_000 }),
    .f({_al_u748_o,B_pad[3]}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b1100100001000000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u750|_al_u767  (
    .a({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .b({lcd_rdaddr_piped_piped[5],lcd_rdaddr_piped_piped[5]}),
    .c({\uimg/inst_dob_i0_015 ,\uimg/inst_dob_i32_011 }),
    .d({\uimg/inst_dob_i16_015 ,\uimg/inst_dob_i48_011 }),
    .f({_al_u750_o,_al_u767_o}));
  // sources/rtl/cameraReader.v(37)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100100001000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u751|u_cameraReader/write_pixel_reg  (
    .a({lcd_rdaddr_piped_piped[4],open_n4206}),
    .b({lcd_rdaddr_piped_piped[5],\u_cameraReader/wrclk1 }),
    .c({\uimg/inst_dob_i32_015 ,\u_cameraReader/write_pixel }),
    .clk(\u_cameraReader/wrclk1 ),
    .d({\uimg/inst_dob_i48_015 ,\u_cameraReader/n29 }),
    .mi({open_n4218,\u_cameraReader/n2 }),
    .f({_al_u751_o,camera_wrreq}),
    .q({open_n4223,\u_cameraReader/write_pixel }));  // sources/rtl/cameraReader.v(37)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u753|_al_u752  (
    .a({_al_u750_o,open_n4224}),
    .b({_al_u751_o,lcd_rden}),
    .c({_al_u752_o,\uimg/inst_dob_i64_015 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({R_pad[7],_al_u752_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b0011001000010000),
    .INIT_LUTF1(16'b0011001000010000),
    .INIT_LUTG0(16'b0011001000010000),
    .INIT_LUTG1(16'b0011001000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u754|_al_u766  (
    .a({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .b({lcd_rdaddr_piped_piped[5],lcd_rdaddr_piped_piped[5]}),
    .c({\uimg/inst_dob_i0_014 ,\uimg/inst_dob_i0_011 }),
    .d({\uimg/inst_dob_i16_014 ,\uimg/inst_dob_i16_011 }),
    .f({_al_u754_o,_al_u766_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTF1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG0("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUTG1("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUTF0(16'b1100100001000000),
    .INIT_LUTF1(16'b1100100001000000),
    .INIT_LUTG0(16'b1100100001000000),
    .INIT_LUTG1(16'b1100100001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u755|_al_u763  (
    .a({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .b({lcd_rdaddr_piped_piped[5],lcd_rdaddr_piped_piped[5]}),
    .c({\uimg/inst_dob_i32_014 ,\uimg/inst_dob_i32_012 }),
    .d({\uimg/inst_dob_i48_014 ,\uimg/inst_dob_i48_012 }),
    .f({_al_u755_o,_al_u763_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u757|_al_u756  (
    .a({_al_u754_o,open_n4293}),
    .b({_al_u755_o,lcd_rden}),
    .c({_al_u756_o,\uimg/inst_dob_i64_014 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({R_pad[6],_al_u756_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    //.LUT1("(~B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT_LUT0(16'b0011001000010000),
    .INIT_LUT1(16'b0011001000010000),
    .MODE("LOGIC"))
    \_al_u758|_al_u762  (
    .a({lcd_rdaddr_piped_piped[4],lcd_rdaddr_piped_piped[4]}),
    .b({lcd_rdaddr_piped_piped[5],lcd_rdaddr_piped_piped[5]}),
    .c({\uimg/inst_dob_i0_013 ,\uimg/inst_dob_i0_012 }),
    .d({\uimg/inst_dob_i16_013 ,\uimg/inst_dob_i16_012 }),
    .f({_al_u758_o,_al_u762_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(C*~(~D*~B*~A))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(C*~(~D*~B*~A))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b1111000011100000),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b1111000011100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u761|_al_u760  (
    .a({_al_u758_o,open_n4334}),
    .b({_al_u759_o,lcd_rden}),
    .c({_al_u760_o,\uimg/inst_dob_i64_013 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({R_pad[5],_al_u760_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(C*~(~D*~B*~A))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(C*~(~D*~B*~A))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b1111000011100000),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b1111000011100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u765|_al_u764  (
    .a({_al_u762_o,open_n4359}),
    .b({_al_u763_o,lcd_rden}),
    .c({_al_u764_o,\uimg/inst_dob_i64_012 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({R_pad[4],_al_u764_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u769|_al_u768  (
    .a({_al_u766_o,open_n4384}),
    .b({_al_u767_o,lcd_rden}),
    .c({_al_u768_o,\uimg/inst_dob_i64_011 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({R_pad[3],_al_u768_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u773|_al_u772  (
    .a({_al_u770_o,open_n4405}),
    .b({_al_u771_o,lcd_rden}),
    .c({_al_u772_o,\uimg/inst_dob_i64_010 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({G_pad[7],_al_u772_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(C*~(~D*~B*~A))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(C*~(~D*~B*~A))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b1111000011100000),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b1111000011100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u777|_al_u776  (
    .a({_al_u774_o,open_n4426}),
    .b({_al_u775_o,lcd_rden}),
    .c({_al_u776_o,\uimg/inst_dob_i64_009 }),
    .d({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped_piped[6]}),
    .f({G_pad[6],_al_u776_o}));
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*D)"),
    //.LUT1("(~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011111111),
    .INIT_LUT1(16'b0000000011111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u778|u_cameraReader/vsync_passed_reg  (
    .c({open_n4455,\u_cameraReader/vsync_passed }),
    .clk(CSI_PCLK_pad),
    .d({CSI_RST_pad,CSI_VSYNC_pad}),
    .sr(CSI_RST_pad_neg),
    .f({CSI_RST_pad_neg,open_n4469}),
    .q({open_n4473,\u_cameraReader/vsync_passed }));  // sources/rtl/cameraReader.v(95)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
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
    \lcd_rdaddr_pipe_b1|lcd_rdaddr_piped_pipe_b1  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr[10],lcd_rdaddr_piped[1]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped[1],lcd_rdaddr_piped_piped[1]}));
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
    \lcd_rdaddr_pipe_b2|lcd_rdaddr_piped_pipe_b2  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr[11],lcd_rdaddr_piped[2]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped[2],lcd_rdaddr_piped_piped[2]}));
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
    \lcd_rdaddr_pipe_b3|lcd_rdaddr_piped_pipe_b3  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr[12],lcd_rdaddr_piped[3]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped[3],lcd_rdaddr_piped_piped[3]}));
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
    \lcd_rdaddr_pipe_b4|lcd_rdaddr_piped_pipe_b4  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr[13],lcd_rdaddr_piped[4]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped[4],lcd_rdaddr_piped_piped[4]}));
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
    \lcd_rdaddr_piped_pipe_b5|lcd_rdaddr_pipe_b5  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr_piped[5],lcd_rdaddr[14]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped_piped[5],lcd_rdaddr_piped[5]}));
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
    \lcd_rdaddr_piped_pipe_b6|lcd_rdaddr_pipe_b6  (
    .ce(lcd_rden),
    .clk(clk_lcd),
    .mi({lcd_rdaddr_piped[6],lcd_rdaddr[15]}),
    .sr(CSI_RST_pad_neg),
    .q({lcd_rdaddr_piped_piped[6],lcd_rdaddr_piped[6]}));
  EG_PHY_GCLK \pll/bufg_feedback  (
    .clki(\pll/clk0_buf ),
    .clko(clk_lcd));  // al_ip/ip_pll.v(36)
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
    \pll/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk_lcd),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(CLK_IN_pad),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n4671,open_n4672,clk_sccb,clk_cam,\pll/clk0_buf }));  // al_ip/ip_pll.v(67)
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/u11_al_u784  (
    .a({\u_cameraReader/pixel_counter [13],\u_cameraReader/pixel_counter [11]}),
    .b({\u_cameraReader/pixel_counter [14],\u_cameraReader/pixel_counter [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add0/c11 ),
    .f({\u_cameraReader/n8 [13],\u_cameraReader/n8 [11]}),
    .fco(\u_cameraReader/add0/c15 ),
    .fx({\u_cameraReader/n8 [14],\u_cameraReader/n8 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/u15_al_u785  (
    .a({\u_cameraReader/pixel_counter [17],\u_cameraReader/pixel_counter [15]}),
    .b({\u_cameraReader/pixel_counter [18],\u_cameraReader/pixel_counter [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add0/c15 ),
    .f({\u_cameraReader/n8 [17],\u_cameraReader/n8 [15]}),
    .fco(\u_cameraReader/add0/c19 ),
    .fx({\u_cameraReader/n8 [18],\u_cameraReader/n8 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/u19_al_u786  (
    .a({open_n4719,\u_cameraReader/pixel_counter [19]}),
    .c(2'b00),
    .d({open_n4724,1'b0}),
    .fci(\u_cameraReader/add0/c19 ),
    .f({open_n4741,\u_cameraReader/n8 [19]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/u3_al_u782  (
    .a({\u_cameraReader/pixel_counter [5],\u_cameraReader/pixel_counter [3]}),
    .b({\u_cameraReader/pixel_counter [6],\u_cameraReader/pixel_counter [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add0/c3 ),
    .f({\u_cameraReader/n8 [5],\u_cameraReader/n8 [3]}),
    .fco(\u_cameraReader/add0/c7 ),
    .fx({\u_cameraReader/n8 [6],\u_cameraReader/n8 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/u7_al_u783  (
    .a({\u_cameraReader/pixel_counter [9],\u_cameraReader/pixel_counter [7]}),
    .b({\u_cameraReader/pixel_counter [10],\u_cameraReader/pixel_counter [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add0/c7 ),
    .f({\u_cameraReader/n8 [9],\u_cameraReader/n8 [7]}),
    .fco(\u_cameraReader/add0/c11 ),
    .fx({\u_cameraReader/n8 [10],\u_cameraReader/n8 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add0/ucin_al_u781"),
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
    \u_cameraReader/add0/ucin_al_u781  (
    .a({\u_cameraReader/pixel_counter [1],1'b0}),
    .b({\u_cameraReader/pixel_counter [2],\u_cameraReader/pixel_counter [0]}),
    .c(2'b00),
    .clk(CSI_PCLK_pad),
    .d(2'b01),
    .e(2'b01),
    .mi(\u_cameraReader/n8 [1:0]),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .f({\u_cameraReader/n8 [1],open_n4796}),
    .fco(\u_cameraReader/add0/c3 ),
    .fx({\u_cameraReader/n8 [2],\u_cameraReader/n8 [0]}),
    .q(\u_cameraReader/pixel_counter [1:0]));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add1/ucin_al_u787"),
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
    \u_cameraReader/add1/u11_al_u790  (
    .a({camera_addr[13],camera_addr[11]}),
    .b({camera_addr[14],camera_addr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add1/c11 ),
    .f({\u_cameraReader/n9 [13],\u_cameraReader/n9 [11]}),
    .fco(\u_cameraReader/add1/c15 ),
    .fx({\u_cameraReader/n9 [14],\u_cameraReader/n9 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add1/ucin_al_u787"),
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
    \u_cameraReader/add1/u15_al_u791  (
    .a({open_n4815,camera_addr[15]}),
    .c(2'b00),
    .d({open_n4820,1'b0}),
    .fci(\u_cameraReader/add1/c15 ),
    .f({open_n4837,\u_cameraReader/n9 [15]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add1/ucin_al_u787"),
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
    \u_cameraReader/add1/u3_al_u788  (
    .a({camera_addr[5],camera_addr[3]}),
    .b({camera_addr[6],camera_addr[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add1/c3 ),
    .f({\u_cameraReader/n9 [5],\u_cameraReader/n9 [3]}),
    .fco(\u_cameraReader/add1/c7 ),
    .fx({\u_cameraReader/n9 [6],\u_cameraReader/n9 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add1/ucin_al_u787"),
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
    \u_cameraReader/add1/u7_al_u789  (
    .a({camera_addr[9],camera_addr[7]}),
    .b({camera_addr[10],camera_addr[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_cameraReader/add1/c7 ),
    .f({\u_cameraReader/n9 [9],\u_cameraReader/n9 [7]}),
    .fco(\u_cameraReader/add1/c11 ),
    .fx({\u_cameraReader/n9 [10],\u_cameraReader/n9 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_cameraReader/add1/ucin_al_u787"),
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
    \u_cameraReader/add1/ucin_al_u787  (
    .a({camera_addr[1],1'b0}),
    .b({camera_addr[2],camera_addr[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u_cameraReader/n9 [1],open_n4896}),
    .fco(\u_cameraReader/add1/c3 ),
    .fx({\u_cameraReader/n9 [2],\u_cameraReader/n9 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_0|u_cameraReader/lt0_cin  (
    .a(2'b00),
    .b({\u_cameraReader/pixel_counter [0],open_n4899}),
    .fco(\u_cameraReader/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_10|u_cameraReader/lt0_9  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [10:9]),
    .fci(\u_cameraReader/lt0_c9 ),
    .fco(\u_cameraReader/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_12|u_cameraReader/lt0_11  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [12:11]),
    .fci(\u_cameraReader/lt0_c11 ),
    .fco(\u_cameraReader/lt0_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_14|u_cameraReader/lt0_13  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [14:13]),
    .fci(\u_cameraReader/lt0_c13 ),
    .fco(\u_cameraReader/lt0_c15 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y4Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_16|u_cameraReader/lt0_15  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [16:15]),
    .fci(\u_cameraReader/lt0_c15 ),
    .fco(\u_cameraReader/lt0_c17 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y4Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_18|u_cameraReader/lt0_17  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [18:17]),
    .fci(\u_cameraReader/lt0_c17 ),
    .fco(\u_cameraReader/lt0_c19 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_2|u_cameraReader/lt0_1  (
    .a(2'b01),
    .b(\u_cameraReader/pixel_counter [2:1]),
    .fci(\u_cameraReader/lt0_c1 ),
    .fco(\u_cameraReader/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_4|u_cameraReader/lt0_3  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [4:3]),
    .fci(\u_cameraReader/lt0_c3 ),
    .fco(\u_cameraReader/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_6|u_cameraReader/lt0_5  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [6:5]),
    .fci(\u_cameraReader/lt0_c5 ),
    .fco(\u_cameraReader/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_8|u_cameraReader/lt0_7  (
    .a(2'b00),
    .b(\u_cameraReader/pixel_counter [8:7]),
    .fci(\u_cameraReader/lt0_c7 ),
    .fco(\u_cameraReader/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_cameraReader/lt0_0|u_cameraReader/lt0_cin"),
    //.R_POSITION("X0Y5Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_cameraReader/lt0_cout|u_cameraReader/lt0_19  (
    .a(2'b00),
    .b({1'b1,\u_cameraReader/pixel_counter [19]}),
    .fci(\u_cameraReader/lt0_c19 ),
    .f({\u_cameraReader/n29 ,open_n5159}));
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b0|u_cameraReader/reg0_b8  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [0],\u_cameraReader/current_pixel [8]}),
    .q({camera_wrdat[0],camera_wrdat[8]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b10|u_cameraReader/reg0_b7  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [10],\u_cameraReader/current_pixel [7]}),
    .q({camera_wrdat[10],camera_wrdat[7]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b11|u_cameraReader/reg0_b6  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [11],\u_cameraReader/current_pixel [6]}),
    .q({camera_wrdat[11],camera_wrdat[6]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b12|u_cameraReader/reg0_b5  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [12],\u_cameraReader/current_pixel [5]}),
    .q({camera_wrdat[12],camera_wrdat[5]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b13|u_cameraReader/reg0_b4  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [13],\u_cameraReader/current_pixel [4]}),
    .q({camera_wrdat[13],camera_wrdat[4]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b14|u_cameraReader/reg0_b3  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [14],\u_cameraReader/current_pixel [3]}),
    .q({camera_wrdat[14],camera_wrdat[3]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b15|u_cameraReader/reg0_b2  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [15],\u_cameraReader/current_pixel [2]}),
    .q({camera_wrdat[15],camera_wrdat[2]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(55)
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
    \u_cameraReader/reg0_b9|u_cameraReader/reg0_b1  (
    .clk(camera_wrreq),
    .mi({\u_cameraReader/current_pixel [9],\u_cameraReader/current_pixel [1]}),
    .q({camera_wrdat[9],camera_wrdat[1]}));  // sources/rtl/cameraReader.v(55)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b11|u_cameraReader/reg1_b9  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [11],\u_cameraReader/n8 [9]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [11],\u_cameraReader/pixel_counter [9]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b12|u_cameraReader/reg1_b8  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [12],\u_cameraReader/n8 [8]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [12],\u_cameraReader/pixel_counter [8]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b13|u_cameraReader/reg1_b7  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [13],\u_cameraReader/n8 [7]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [13],\u_cameraReader/pixel_counter [7]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b14|u_cameraReader/reg1_b6  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [14],\u_cameraReader/n8 [6]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [14],\u_cameraReader/pixel_counter [6]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b15|u_cameraReader/reg1_b5  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [15],\u_cameraReader/n8 [5]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [15],\u_cameraReader/pixel_counter [5]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b16|u_cameraReader/reg1_b4  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [16],\u_cameraReader/n8 [4]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [16],\u_cameraReader/pixel_counter [4]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b17|u_cameraReader/reg1_b3  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [17],\u_cameraReader/n8 [3]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [17],\u_cameraReader/pixel_counter [3]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg1_b18|u_cameraReader/reg1_b2  (
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/n8 [18],\u_cameraReader/n8 [2]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({\u_cameraReader/pixel_counter [18],\u_cameraReader/pixel_counter [2]}));  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \u_cameraReader/reg1_b19  (
    .clk(CSI_PCLK_pad),
    .mi({open_n5601,\u_cameraReader/n8 [19]}),
    .sr(\u_cameraReader/mux12_b0_sel_is_2_o ),
    .q({open_n5618,\u_cameraReader/pixel_counter [19]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b0|u_cameraReader/reg2_b9  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [0],\u_cameraReader/n9 [9]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[0],camera_addr[9]}),
    .q({camera_addr[0],camera_addr[9]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b10|u_cameraReader/reg2_b8  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [10],\u_cameraReader/n9 [8]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[10],camera_addr[8]}),
    .q({camera_addr[10],camera_addr[8]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b11|u_cameraReader/reg2_b7  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [11],\u_cameraReader/n9 [7]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[11],camera_addr[7]}),
    .q({camera_addr[11],camera_addr[7]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b12|u_cameraReader/reg2_b6  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [12],\u_cameraReader/n9 [6]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[12],camera_addr[6]}),
    .q({camera_addr[12],camera_addr[6]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b13|u_cameraReader/reg2_b5  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [13],\u_cameraReader/n9 [5]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[13],camera_addr[5]}),
    .q({camera_addr[13],camera_addr[5]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b14|u_cameraReader/reg2_b4  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [14],\u_cameraReader/n9 [4]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[14],camera_addr[4]}),
    .q({camera_addr[14],camera_addr[4]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b15|u_cameraReader/reg2_b3  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [15],\u_cameraReader/n9 [3]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[15],camera_addr[3]}),
    .q({camera_addr[15],camera_addr[3]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg2_b1|u_cameraReader/reg2_b2  (
    .a({\u_cameraReader/mux6_b0_sel_is_1_o ,\u_cameraReader/mux6_b0_sel_is_1_o }),
    .b({CSI_VSYNC_pad,CSI_VSYNC_pad}),
    .c({\u_cameraReader/n9 [1],\u_cameraReader/n9 [2]}),
    .ce(CSI_RST_pad_neg),
    .clk(CSI_PCLK_pad),
    .d({camera_addr[1],camera_addr[2]}),
    .q({camera_addr[1],camera_addr[2]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg3_b1|u_cameraReader/reg3_b7  (
    .ce(\u_cameraReader/mux14_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({OD_pad[6],OD_pad[0]}),
    .q({\u_cameraReader/subpixel [1],\u_cameraReader/subpixel [7]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg3_b2|u_cameraReader/reg3_b6  (
    .ce(\u_cameraReader/mux14_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({OD_pad[5],OD_pad[1]}),
    .q({\u_cameraReader/subpixel [2],\u_cameraReader/subpixel [6]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg3_b3|u_cameraReader/reg3_b5  (
    .ce(\u_cameraReader/mux14_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({OD_pad[4],OD_pad[2]}),
    .q({\u_cameraReader/subpixel [3],\u_cameraReader/subpixel [5]}));  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg3_b4  (
    .ce(\u_cameraReader/mux14_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({open_n5866,OD_pad[3]}),
    .q({open_n5884,\u_cameraReader/subpixel [4]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b10|u_cameraReader/reg4_b7  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [2],OD_pad[0]}),
    .q({\u_cameraReader/current_pixel [10],\u_cameraReader/current_pixel [7]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b11|u_cameraReader/reg4_b6  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [3],OD_pad[1]}),
    .q({\u_cameraReader/current_pixel [11],\u_cameraReader/current_pixel [6]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b12|u_cameraReader/reg4_b5  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [4],OD_pad[2]}),
    .q({\u_cameraReader/current_pixel [12],\u_cameraReader/current_pixel [5]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b13|u_cameraReader/reg4_b4  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [5],OD_pad[3]}),
    .q({\u_cameraReader/current_pixel [13],\u_cameraReader/current_pixel [4]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b14|u_cameraReader/reg4_b3  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [6],OD_pad[4]}),
    .q({\u_cameraReader/current_pixel [14],\u_cameraReader/current_pixel [3]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b15|u_cameraReader/reg4_b2  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [7],OD_pad[5]}),
    .q({\u_cameraReader/current_pixel [15],\u_cameraReader/current_pixel [2]}));  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
  // sources/rtl/cameraReader.v(95)
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
    \u_cameraReader/reg4_b8|u_cameraReader/reg4_b1  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({\u_cameraReader/subpixel [0],OD_pad[6]}),
    .q({\u_cameraReader/current_pixel [8],\u_cameraReader/current_pixel [1]}));  // sources/rtl/cameraReader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_cameraReader/reg4_b9  (
    .ce(\u_cameraReader/mux15_b0_sel_is_2_o ),
    .clk(CSI_PCLK_pad),
    .mi({open_n6076,\u_cameraReader/subpixel [1]}),
    .q({open_n6094,\u_cameraReader/current_pixel [9]}));  // sources/rtl/cameraReader.v(95)
  camera_init u_camera_init (
    .clk(clk_sccb),
    .reset_n(CSI_RST_pad),
    .sda_in(TESTA_pad),
    .scl(TESTB_pad),
    .sda(sda),
    .sda_oe(sda_oe));  // sources/rtl/test_camera.v(53)
  lcd_sync u_lcd_sync (
    .clk(clk_lcd),
    .rest_n(CSI_RST_pad),
    .addr(lcd_rdaddr),
    .img_ack(lcd_rden),
    .lcd_clk(LCD_CLK_pad),
    .lcd_de(LCD_DEN_pad),
    .lcd_hsync(LCD_HSYNC_pad),
    .lcd_pwm(LCD_PWM_pad),
    .lcd_vsync(LCD_VSYNC_pad));  // sources/rtl/test_camera.v(86)
  // address_offset=0;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0004"),
    //.WID("0x0004"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i0_008 ,\uimg/inst_dob_i0_007 ,\uimg/inst_dob_i0_006 ,\uimg/inst_dob_i0_005 ,\uimg/inst_dob_i0_004 ,\uimg/inst_dob_i0_003 ,\uimg/inst_dob_i0_002 ,\uimg/inst_dob_i0_001 ,\uimg/inst_dob_i0_000 }));
  // address_offset=0;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0005"),
    //.WID("0x0005"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_009  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6140,open_n6141,open_n6142,open_n6143,open_n6144,open_n6145,open_n6146,camera_wrdat[9],open_n6147}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6170,open_n6171,open_n6172,open_n6173,open_n6174,open_n6175,open_n6176,open_n6177,\uimg/inst_dob_i0_009 }));
  // address_offset=0;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0006"),
    //.WID("0x0006"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_010  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6178,open_n6179,open_n6180,open_n6181,open_n6182,open_n6183,open_n6184,camera_wrdat[10],open_n6185}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6208,open_n6209,open_n6210,open_n6211,open_n6212,open_n6213,open_n6214,open_n6215,\uimg/inst_dob_i0_010 }));
  // address_offset=0;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0007"),
    //.WID("0x0007"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_011  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6216,open_n6217,open_n6218,open_n6219,open_n6220,open_n6221,open_n6222,camera_wrdat[11],open_n6223}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6246,open_n6247,open_n6248,open_n6249,open_n6250,open_n6251,open_n6252,open_n6253,\uimg/inst_dob_i0_011 }));
  // address_offset=0;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0008"),
    //.WID("0x0008"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_012  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6254,open_n6255,open_n6256,open_n6257,open_n6258,open_n6259,open_n6260,camera_wrdat[12],open_n6261}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6284,open_n6285,open_n6286,open_n6287,open_n6288,open_n6289,open_n6290,open_n6291,\uimg/inst_dob_i0_012 }));
  // address_offset=0;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0009"),
    //.WID("0x0009"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_013  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6292,open_n6293,open_n6294,open_n6295,open_n6296,open_n6297,open_n6298,camera_wrdat[13],open_n6299}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6322,open_n6323,open_n6324,open_n6325,open_n6326,open_n6327,open_n6328,open_n6329,\uimg/inst_dob_i0_013 }));
  // address_offset=0;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000A"),
    //.WID("0x000A"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_014  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6330,open_n6331,open_n6332,open_n6333,open_n6334,open_n6335,open_n6336,camera_wrdat[14],open_n6337}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6360,open_n6361,open_n6362,open_n6363,open_n6364,open_n6365,open_n6366,open_n6367,\uimg/inst_dob_i0_014 }));
  // address_offset=0;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000B"),
    //.WID("0x000B"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_000000_015  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6368,open_n6369,open_n6370,open_n6371,open_n6372,open_n6373,open_n6374,camera_wrdat[15],open_n6375}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6398,open_n6399,open_n6400,open_n6401,open_n6402,open_n6403,open_n6404,open_n6405,\uimg/inst_dob_i0_015 }));
  // address_offset=1024;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000C"),
    //.WID("0x000C"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_001024_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i2_008 ,\uimg/inst_dob_i2_007 ,\uimg/inst_dob_i2_006 ,\uimg/inst_dob_i2_005 ,\uimg/inst_dob_i2_004 ,\uimg/inst_dob_i2_003 ,\uimg/inst_dob_i2_002 ,\uimg/inst_dob_i2_001 ,\uimg/inst_dob_i2_000 }));
  // address_offset=2048;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000D"),
    //.WID("0x000D"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_002048_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i4_008 ,\uimg/inst_dob_i4_007 ,\uimg/inst_dob_i4_006 ,\uimg/inst_dob_i4_005 ,\uimg/inst_dob_i4_004 ,\uimg/inst_dob_i4_003 ,\uimg/inst_dob_i4_002 ,\uimg/inst_dob_i4_001 ,\uimg/inst_dob_i4_000 }));
  // address_offset=3072;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000E"),
    //.WID("0x000E"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_003072_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i6_008 ,\uimg/inst_dob_i6_007 ,\uimg/inst_dob_i6_006 ,\uimg/inst_dob_i6_005 ,\uimg/inst_dob_i6_004 ,\uimg/inst_dob_i6_003 ,\uimg/inst_dob_i6_002 ,\uimg/inst_dob_i6_001 ,\uimg/inst_dob_i6_000 }));
  // address_offset=4096;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000F"),
    //.WID("0x000F"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_004096_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i8_008 ,\uimg/inst_dob_i8_007 ,\uimg/inst_dob_i8_006 ,\uimg/inst_dob_i8_005 ,\uimg/inst_dob_i8_004 ,\uimg/inst_dob_i8_003 ,\uimg/inst_dob_i8_002 ,\uimg/inst_dob_i8_001 ,\uimg/inst_dob_i8_000 }));
  // address_offset=5120;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0010"),
    //.WID("0x0010"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_005120_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i10_008 ,\uimg/inst_dob_i10_007 ,\uimg/inst_dob_i10_006 ,\uimg/inst_dob_i10_005 ,\uimg/inst_dob_i10_004 ,\uimg/inst_dob_i10_003 ,\uimg/inst_dob_i10_002 ,\uimg/inst_dob_i10_001 ,\uimg/inst_dob_i10_000 }));
  // address_offset=6144;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0011"),
    //.WID("0x0011"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_006144_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i12_008 ,\uimg/inst_dob_i12_007 ,\uimg/inst_dob_i12_006 ,\uimg/inst_dob_i12_005 ,\uimg/inst_dob_i12_004 ,\uimg/inst_dob_i12_003 ,\uimg/inst_dob_i12_002 ,\uimg/inst_dob_i12_001 ,\uimg/inst_dob_i12_000 }));
  // address_offset=7168;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0012"),
    //.WID("0x0012"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_007168_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i14_008 ,\uimg/inst_dob_i14_007 ,\uimg/inst_dob_i14_006 ,\uimg/inst_dob_i14_005 ,\uimg/inst_dob_i14_004 ,\uimg/inst_dob_i14_003 ,\uimg/inst_dob_i14_002 ,\uimg/inst_dob_i14_001 ,\uimg/inst_dob_i14_000 }));
  // address_offset=8192;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0013"),
    //.WID("0x0013"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n197 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n200 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i16_008 ,\uimg/inst_dob_i16_007 ,\uimg/inst_dob_i16_006 ,\uimg/inst_dob_i16_005 ,\uimg/inst_dob_i16_004 ,\uimg/inst_dob_i16_003 ,\uimg/inst_dob_i16_002 ,\uimg/inst_dob_i16_001 ,\uimg/inst_dob_i16_000 }));
  // address_offset=8192;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0014"),
    //.WID("0x0014"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_009  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6582,open_n6583,open_n6584,open_n6585,open_n6586,open_n6587,open_n6588,camera_wrdat[9],open_n6589}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6612,open_n6613,open_n6614,open_n6615,open_n6616,open_n6617,open_n6618,open_n6619,\uimg/inst_dob_i16_009 }));
  // address_offset=8192;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0015"),
    //.WID("0x0015"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_010  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6620,open_n6621,open_n6622,open_n6623,open_n6624,open_n6625,open_n6626,camera_wrdat[10],open_n6627}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6650,open_n6651,open_n6652,open_n6653,open_n6654,open_n6655,open_n6656,open_n6657,\uimg/inst_dob_i16_010 }));
  // address_offset=8192;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0016"),
    //.WID("0x0016"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_011  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6658,open_n6659,open_n6660,open_n6661,open_n6662,open_n6663,open_n6664,camera_wrdat[11],open_n6665}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6688,open_n6689,open_n6690,open_n6691,open_n6692,open_n6693,open_n6694,open_n6695,\uimg/inst_dob_i16_011 }));
  // address_offset=8192;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0017"),
    //.WID("0x0017"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_012  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6696,open_n6697,open_n6698,open_n6699,open_n6700,open_n6701,open_n6702,camera_wrdat[12],open_n6703}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6726,open_n6727,open_n6728,open_n6729,open_n6730,open_n6731,open_n6732,open_n6733,\uimg/inst_dob_i16_012 }));
  // address_offset=8192;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0018"),
    //.WID("0x0018"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_013  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6734,open_n6735,open_n6736,open_n6737,open_n6738,open_n6739,open_n6740,camera_wrdat[13],open_n6741}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6764,open_n6765,open_n6766,open_n6767,open_n6768,open_n6769,open_n6770,open_n6771,\uimg/inst_dob_i16_013 }));
  // address_offset=8192;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0019"),
    //.WID("0x0019"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_014  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6772,open_n6773,open_n6774,open_n6775,open_n6776,open_n6777,open_n6778,camera_wrdat[14],open_n6779}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6802,open_n6803,open_n6804,open_n6805,open_n6806,open_n6807,open_n6808,open_n6809,\uimg/inst_dob_i16_014 }));
  // address_offset=8192;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001A"),
    //.WID("0x001A"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_008192_015  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n6810,open_n6811,open_n6812,open_n6813,open_n6814,open_n6815,open_n6816,camera_wrdat[15],open_n6817}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n6840,open_n6841,open_n6842,open_n6843,open_n6844,open_n6845,open_n6846,open_n6847,\uimg/inst_dob_i16_015 }));
  // address_offset=9216;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001B"),
    //.WID("0x001B"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_009216_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n197 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n200 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i18_008 ,\uimg/inst_dob_i18_007 ,\uimg/inst_dob_i18_006 ,\uimg/inst_dob_i18_005 ,\uimg/inst_dob_i18_004 ,\uimg/inst_dob_i18_003 ,\uimg/inst_dob_i18_002 ,\uimg/inst_dob_i18_001 ,\uimg/inst_dob_i18_000 }));
  // address_offset=10240;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001C"),
    //.WID("0x001C"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_010240_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n197 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n200 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i20_008 ,\uimg/inst_dob_i20_007 ,\uimg/inst_dob_i20_006 ,\uimg/inst_dob_i20_005 ,\uimg/inst_dob_i20_004 ,\uimg/inst_dob_i20_003 ,\uimg/inst_dob_i20_002 ,\uimg/inst_dob_i20_001 ,\uimg/inst_dob_i20_000 }));
  // address_offset=11264;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001D"),
    //.WID("0x001D"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_011264_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n197 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n200 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i22_008 ,\uimg/inst_dob_i22_007 ,\uimg/inst_dob_i22_006 ,\uimg/inst_dob_i22_005 ,\uimg/inst_dob_i22_004 ,\uimg/inst_dob_i22_003 ,\uimg/inst_dob_i22_002 ,\uimg/inst_dob_i22_001 ,\uimg/inst_dob_i22_000 }));
  // address_offset=12288;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001E"),
    //.WID("0x001E"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_012288_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n213 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i24_008 ,\uimg/inst_dob_i24_007 ,\uimg/inst_dob_i24_006 ,\uimg/inst_dob_i24_005 ,\uimg/inst_dob_i24_004 ,\uimg/inst_dob_i24_003 ,\uimg/inst_dob_i24_002 ,\uimg/inst_dob_i24_001 ,\uimg/inst_dob_i24_000 }));
  // address_offset=13312;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001F"),
    //.WID("0x001F"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_013312_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n213 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i26_008 ,\uimg/inst_dob_i26_007 ,\uimg/inst_dob_i26_006 ,\uimg/inst_dob_i26_005 ,\uimg/inst_dob_i26_004 ,\uimg/inst_dob_i26_003 ,\uimg/inst_dob_i26_002 ,\uimg/inst_dob_i26_001 ,\uimg/inst_dob_i26_000 }));
  // address_offset=14336;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0020"),
    //.WID("0x0020"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_014336_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n213 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i28_008 ,\uimg/inst_dob_i28_007 ,\uimg/inst_dob_i28_006 ,\uimg/inst_dob_i28_005 ,\uimg/inst_dob_i28_004 ,\uimg/inst_dob_i28_003 ,\uimg/inst_dob_i28_002 ,\uimg/inst_dob_i28_001 ,\uimg/inst_dob_i28_000 }));
  // address_offset=15360;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0021"),
    //.WID("0x0021"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_015360_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n213 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i30_008 ,\uimg/inst_dob_i30_007 ,\uimg/inst_dob_i30_006 ,\uimg/inst_dob_i30_005 ,\uimg/inst_dob_i30_004 ,\uimg/inst_dob_i30_003 ,\uimg/inst_dob_i30_002 ,\uimg/inst_dob_i30_001 ,\uimg/inst_dob_i30_000 }));
  // address_offset=16384;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0022"),
    //.WID("0x0022"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n228 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n231 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i32_008 ,\uimg/inst_dob_i32_007 ,\uimg/inst_dob_i32_006 ,\uimg/inst_dob_i32_005 ,\uimg/inst_dob_i32_004 ,\uimg/inst_dob_i32_003 ,\uimg/inst_dob_i32_002 ,\uimg/inst_dob_i32_001 ,\uimg/inst_dob_i32_000 }));
  // address_offset=16384;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0023"),
    //.WID("0x0023"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_009  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7024,open_n7025,open_n7026,open_n7027,open_n7028,open_n7029,open_n7030,camera_wrdat[9],open_n7031}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7054,open_n7055,open_n7056,open_n7057,open_n7058,open_n7059,open_n7060,open_n7061,\uimg/inst_dob_i32_009 }));
  // address_offset=16384;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0024"),
    //.WID("0x0024"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_010  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7062,open_n7063,open_n7064,open_n7065,open_n7066,open_n7067,open_n7068,camera_wrdat[10],open_n7069}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7092,open_n7093,open_n7094,open_n7095,open_n7096,open_n7097,open_n7098,open_n7099,\uimg/inst_dob_i32_010 }));
  // address_offset=16384;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0025"),
    //.WID("0x0025"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_011  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7100,open_n7101,open_n7102,open_n7103,open_n7104,open_n7105,open_n7106,camera_wrdat[11],open_n7107}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7130,open_n7131,open_n7132,open_n7133,open_n7134,open_n7135,open_n7136,open_n7137,\uimg/inst_dob_i32_011 }));
  // address_offset=16384;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0026"),
    //.WID("0x0026"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_012  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7138,open_n7139,open_n7140,open_n7141,open_n7142,open_n7143,open_n7144,camera_wrdat[12],open_n7145}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7168,open_n7169,open_n7170,open_n7171,open_n7172,open_n7173,open_n7174,open_n7175,\uimg/inst_dob_i32_012 }));
  // address_offset=16384;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0027"),
    //.WID("0x0027"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_013  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7176,open_n7177,open_n7178,open_n7179,open_n7180,open_n7181,open_n7182,camera_wrdat[13],open_n7183}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7206,open_n7207,open_n7208,open_n7209,open_n7210,open_n7211,open_n7212,open_n7213,\uimg/inst_dob_i32_013 }));
  // address_offset=16384;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0028"),
    //.WID("0x0028"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_014  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7214,open_n7215,open_n7216,open_n7217,open_n7218,open_n7219,open_n7220,camera_wrdat[14],open_n7221}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7244,open_n7245,open_n7246,open_n7247,open_n7248,open_n7249,open_n7250,open_n7251,\uimg/inst_dob_i32_014 }));
  // address_offset=16384;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0029"),
    //.WID("0x0029"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_016384_015  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7252,open_n7253,open_n7254,open_n7255,open_n7256,open_n7257,open_n7258,camera_wrdat[15],open_n7259}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7282,open_n7283,open_n7284,open_n7285,open_n7286,open_n7287,open_n7288,open_n7289,\uimg/inst_dob_i32_015 }));
  // address_offset=17408;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002A"),
    //.WID("0x002A"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_017408_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n228 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n231 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i34_008 ,\uimg/inst_dob_i34_007 ,\uimg/inst_dob_i34_006 ,\uimg/inst_dob_i34_005 ,\uimg/inst_dob_i34_004 ,\uimg/inst_dob_i34_003 ,\uimg/inst_dob_i34_002 ,\uimg/inst_dob_i34_001 ,\uimg/inst_dob_i34_000 }));
  // address_offset=18432;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002B"),
    //.WID("0x002B"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_018432_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n228 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n231 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i36_008 ,\uimg/inst_dob_i36_007 ,\uimg/inst_dob_i36_006 ,\uimg/inst_dob_i36_005 ,\uimg/inst_dob_i36_004 ,\uimg/inst_dob_i36_003 ,\uimg/inst_dob_i36_002 ,\uimg/inst_dob_i36_001 ,\uimg/inst_dob_i36_000 }));
  // address_offset=19456;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002C"),
    //.WID("0x002C"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_019456_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n228 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n231 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i38_008 ,\uimg/inst_dob_i38_007 ,\uimg/inst_dob_i38_006 ,\uimg/inst_dob_i38_005 ,\uimg/inst_dob_i38_004 ,\uimg/inst_dob_i38_003 ,\uimg/inst_dob_i38_002 ,\uimg/inst_dob_i38_001 ,\uimg/inst_dob_i38_000 }));
  // address_offset=20480;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002D"),
    //.WID("0x002D"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_020480_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n244 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o_al_n247 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i40_008 ,\uimg/inst_dob_i40_007 ,\uimg/inst_dob_i40_006 ,\uimg/inst_dob_i40_005 ,\uimg/inst_dob_i40_004 ,\uimg/inst_dob_i40_003 ,\uimg/inst_dob_i40_002 ,\uimg/inst_dob_i40_001 ,\uimg/inst_dob_i40_000 }));
  // address_offset=21504;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002E"),
    //.WID("0x002E"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_021504_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n244 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o_al_n247 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i42_008 ,\uimg/inst_dob_i42_007 ,\uimg/inst_dob_i42_006 ,\uimg/inst_dob_i42_005 ,\uimg/inst_dob_i42_004 ,\uimg/inst_dob_i42_003 ,\uimg/inst_dob_i42_002 ,\uimg/inst_dob_i42_001 ,\uimg/inst_dob_i42_000 }));
  // address_offset=22528;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002F"),
    //.WID("0x002F"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_022528_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n244 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o_al_n247 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i44_008 ,\uimg/inst_dob_i44_007 ,\uimg/inst_dob_i44_006 ,\uimg/inst_dob_i44_005 ,\uimg/inst_dob_i44_004 ,\uimg/inst_dob_i44_003 ,\uimg/inst_dob_i44_002 ,\uimg/inst_dob_i44_001 ,\uimg/inst_dob_i44_000 }));
  // address_offset=23552;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0030"),
    //.WID("0x0030"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_023552_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n244 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_N_o_al_n247 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i46_008 ,\uimg/inst_dob_i46_007 ,\uimg/inst_dob_i46_006 ,\uimg/inst_dob_i46_005 ,\uimg/inst_dob_i46_004 ,\uimg/inst_dob_i46_003 ,\uimg/inst_dob_i46_002 ,\uimg/inst_dob_i46_001 ,\uimg/inst_dob_i46_000 }));
  // address_offset=24576;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0031"),
    //.WID("0x0031"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n260 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n263 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i48_008 ,\uimg/inst_dob_i48_007 ,\uimg/inst_dob_i48_006 ,\uimg/inst_dob_i48_005 ,\uimg/inst_dob_i48_004 ,\uimg/inst_dob_i48_003 ,\uimg/inst_dob_i48_002 ,\uimg/inst_dob_i48_001 ,\uimg/inst_dob_i48_000 }));
  // address_offset=24576;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0032"),
    //.WID("0x0032"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_009  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7466,open_n7467,open_n7468,open_n7469,open_n7470,open_n7471,open_n7472,camera_wrdat[9],open_n7473}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7496,open_n7497,open_n7498,open_n7499,open_n7500,open_n7501,open_n7502,open_n7503,\uimg/inst_dob_i48_009 }));
  // address_offset=24576;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0033"),
    //.WID("0x0033"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_010  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7504,open_n7505,open_n7506,open_n7507,open_n7508,open_n7509,open_n7510,camera_wrdat[10],open_n7511}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7534,open_n7535,open_n7536,open_n7537,open_n7538,open_n7539,open_n7540,open_n7541,\uimg/inst_dob_i48_010 }));
  // address_offset=24576;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0034"),
    //.WID("0x0034"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_011  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7542,open_n7543,open_n7544,open_n7545,open_n7546,open_n7547,open_n7548,camera_wrdat[11],open_n7549}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7572,open_n7573,open_n7574,open_n7575,open_n7576,open_n7577,open_n7578,open_n7579,\uimg/inst_dob_i48_011 }));
  // address_offset=24576;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0035"),
    //.WID("0x0035"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_012  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7580,open_n7581,open_n7582,open_n7583,open_n7584,open_n7585,open_n7586,camera_wrdat[12],open_n7587}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7610,open_n7611,open_n7612,open_n7613,open_n7614,open_n7615,open_n7616,open_n7617,\uimg/inst_dob_i48_012 }));
  // address_offset=24576;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0036"),
    //.WID("0x0036"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_013  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7618,open_n7619,open_n7620,open_n7621,open_n7622,open_n7623,open_n7624,camera_wrdat[13],open_n7625}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7648,open_n7649,open_n7650,open_n7651,open_n7652,open_n7653,open_n7654,open_n7655,\uimg/inst_dob_i48_013 }));
  // address_offset=24576;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0037"),
    //.WID("0x0037"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_014  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7656,open_n7657,open_n7658,open_n7659,open_n7660,open_n7661,open_n7662,camera_wrdat[14],open_n7663}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7686,open_n7687,open_n7688,open_n7689,open_n7690,open_n7691,open_n7692,open_n7693,\uimg/inst_dob_i48_014 }));
  // address_offset=24576;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0038"),
    //.WID("0x0038"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_024576_015  (
    .addra(camera_addr[12:0]),
    .addrb(lcd_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(lcd_rdaddr[15:13]),
    .dia({open_n7694,open_n7695,open_n7696,open_n7697,open_n7698,open_n7699,open_n7700,camera_wrdat[15],open_n7701}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({open_n7724,open_n7725,open_n7726,open_n7727,open_n7728,open_n7729,open_n7730,open_n7731,\uimg/inst_dob_i48_015 }));
  // address_offset=25600;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0039"),
    //.WID("0x0039"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_025600_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n260 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n263 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i50_008 ,\uimg/inst_dob_i50_007 ,\uimg/inst_dob_i50_006 ,\uimg/inst_dob_i50_005 ,\uimg/inst_dob_i50_004 ,\uimg/inst_dob_i50_003 ,\uimg/inst_dob_i50_002 ,\uimg/inst_dob_i50_001 ,\uimg/inst_dob_i50_000 }));
  // address_offset=26624;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003A"),
    //.WID("0x003A"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_026624_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n260 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n263 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i52_008 ,\uimg/inst_dob_i52_007 ,\uimg/inst_dob_i52_006 ,\uimg/inst_dob_i52_005 ,\uimg/inst_dob_i52_004 ,\uimg/inst_dob_i52_003 ,\uimg/inst_dob_i52_002 ,\uimg/inst_dob_i52_001 ,\uimg/inst_dob_i52_000 }));
  // address_offset=27648;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003B"),
    //.WID("0x003B"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_027648_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n260 ,camera_addr[11:10]}),
    .csb({\and_Nlcd_rdaddr[12]__o_al_n263 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i54_008 ,\uimg/inst_dob_i54_007 ,\uimg/inst_dob_i54_006 ,\uimg/inst_dob_i54_005 ,\uimg/inst_dob_i54_004 ,\uimg/inst_dob_i54_003 ,\uimg/inst_dob_i54_002 ,\uimg/inst_dob_i54_001 ,\uimg/inst_dob_i54_000 }));
  // address_offset=28672;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003C"),
    //.WID("0x003C"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_028672_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n276 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o_al_n279 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i56_008 ,\uimg/inst_dob_i56_007 ,\uimg/inst_dob_i56_006 ,\uimg/inst_dob_i56_005 ,\uimg/inst_dob_i56_004 ,\uimg/inst_dob_i56_003 ,\uimg/inst_dob_i56_002 ,\uimg/inst_dob_i56_001 ,\uimg/inst_dob_i56_000 }));
  // address_offset=29696;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003D"),
    //.WID("0x003D"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_029696_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n276 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o_al_n279 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i58_008 ,\uimg/inst_dob_i58_007 ,\uimg/inst_dob_i58_006 ,\uimg/inst_dob_i58_005 ,\uimg/inst_dob_i58_004 ,\uimg/inst_dob_i58_003 ,\uimg/inst_dob_i58_002 ,\uimg/inst_dob_i58_001 ,\uimg/inst_dob_i58_000 }));
  // address_offset=30720;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003E"),
    //.WID("0x003E"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_030720_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n276 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o_al_n279 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i60_008 ,\uimg/inst_dob_i60_007 ,\uimg/inst_dob_i60_006 ,\uimg/inst_dob_i60_005 ,\uimg/inst_dob_i60_004 ,\uimg/inst_dob_i60_003 ,\uimg/inst_dob_i60_002 ,\uimg/inst_dob_i60_001 ,\uimg/inst_dob_i60_000 }));
  // address_offset=31744;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003F"),
    //.WID("0x003F"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_031744_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({lcd_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(lcd_rden),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n276 ,camera_addr[11:10]}),
    .csb({\and_lcd_rdaddr[12]_l_o_al_n279 ,lcd_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .dob({\uimg/inst_dob_i62_008 ,\uimg/inst_dob_i62_007 ,\uimg/inst_dob_i62_006 ,\uimg/inst_dob_i62_005 ,\uimg/inst_dob_i62_004 ,\uimg/inst_dob_i62_003 ,\uimg/inst_dob_i62_002 ,\uimg/inst_dob_i62_001 ,\uimg/inst_dob_i62_000 }));
  // address_offset=32768;data_offset=0;depth=32;width=16;num_section=1;width_per_section=16;section_size=16;working_depth=512;working_width=18;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0040"),
    //.WID("0x0040"),
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .MODE("PDPW8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("OUTREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \uimg/inst_32800x16_sub_032768_000  (
    .addra({camera_addr[8:0],4'b1111}),
    .addrb({lcd_rdaddr[8:0],4'b1111}),
    .clka(CSI_PCLK_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[11]_o_and_camera_wrreq ,camera_addr[10:9]}),
    .csb({\and_Nlcd_rdaddr[11]__o_and_lcd_rden ,lcd_rdaddr[10:9]}),
    .dia(camera_wrdat[8:0]),
    .dib({open_n7888,open_n7889,camera_wrdat[15:9]}),
    .rsta(CSI_RST_pad),
    .rstb(CSI_RST_pad),
    .doa({\uimg/inst_dob_i64_008 ,\uimg/inst_dob_i64_007 ,\uimg/inst_dob_i64_006 ,\uimg/inst_dob_i64_005 ,\uimg/inst_dob_i64_004 ,\uimg/inst_dob_i64_003 ,\uimg/inst_dob_i64_002 ,\uimg/inst_dob_i64_001 ,\uimg/inst_dob_i64_000 }),
    .dob({open_n7894,open_n7895,\uimg/inst_dob_i64_015 ,\uimg/inst_dob_i64_014 ,\uimg/inst_dob_i64_013 ,\uimg/inst_dob_i64_012 ,\uimg/inst_dob_i64_011 ,\uimg/inst_dob_i64_010 ,\uimg/inst_dob_i64_009 }));

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
  wire [15:0] n186;
  wire [15:0] n187;
  wire [15:0] n189;
  wire [15:0] n190;
  wire [15:0] n193;
  wire [15:0] n197;
  wire [15:0] n198;
  wire [15:0] n200;
  wire [15:0] n202;
  wire [15:0] n203;
  wire [15:0] n205;
  wire [15:0] n206;
  wire [15:0] n208;
  wire [15:0] n210;
  wire [15:0] n213;
  wire [15:0] n214;
  wire [15:0] n215;
  wire [15:0] n216;
  wire [15:0] n217;
  wire [15:0] n221;
  wire [15:0] n225;
  wire [15:0] n227;
  wire [15:0] n246;
  wire [15:0] n247;
  wire [15:0] n258;
  wire [15:0] n275;
  wire [7:0] n369;
  wire [7:0] n372;
  wire [7:0] n373;
  wire [2:0] n385;
  wire [2:0] reg_address;  // sources/rtl/camera_init.v(33)
  wire  \sel0_b0/B4 ;
  wire  \sel0_b3/B3 ;
  wire [7:0] state_next;  // sources/rtl/camera_init.v(50)
  wire _al_u2838_o;
  wire _al_u2839_o;
  wire _al_u2842_o;
  wire _al_u2843_o;
  wire _al_u2844_o;
  wire _al_u2853_o;
  wire _al_u2854_o;
  wire _al_u2858_o;
  wire _al_u2860_o;
  wire _al_u2863_o;
  wire _al_u2865_o;
  wire _al_u2867_o;
  wire _al_u2869_o;
  wire _al_u2871_o;
  wire _al_u2872_o;
  wire _al_u2873_o;
  wire _al_u2874_o;
  wire _al_u2875_o;
  wire _al_u2877_o;
  wire _al_u2879_o;
  wire _al_u2882_o;
  wire _al_u2884_o;
  wire _al_u2885_o;
  wire _al_u2886_o;
  wire _al_u2887_o;
  wire _al_u2888_o;
  wire _al_u2889_o;
  wire _al_u2890_o;
  wire _al_u2891_o;
  wire _al_u2892_o;
  wire _al_u2894_o;
  wire _al_u2895_o;
  wire _al_u2897_o;
  wire _al_u2898_o;
  wire _al_u2899_o;
  wire _al_u2900_o;
  wire _al_u2902_o;
  wire _al_u2903_o;
  wire _al_u2904_o;
  wire _al_u2905_o;
  wire _al_u2906_o;
  wire _al_u2907_o;
  wire _al_u2908_o;
  wire _al_u2909_o;
  wire _al_u2911_o;
  wire _al_u2912_o;
  wire _al_u2913_o;
  wire _al_u2914_o;
  wire _al_u2915_o;
  wire _al_u2916_o;
  wire _al_u2917_o;
  wire _al_u2918_o;
  wire _al_u2919_o;
  wire _al_u2920_o;
  wire _al_u2921_o;
  wire _al_u2922_o;
  wire _al_u2923_o;
  wire _al_u2924_o;
  wire _al_u2925_o;
  wire _al_u2926_o;
  wire _al_u2927_o;
  wire _al_u2928_o;
  wire _al_u2929_o;
  wire _al_u2930_o;
  wire _al_u2932_o;
  wire _al_u2933_o;
  wire _al_u2935_o;
  wire _al_u2936_o;
  wire _al_u2937_o;
  wire _al_u2938_o;
  wire _al_u2939_o;
  wire _al_u2940_o;
  wire _al_u2941_o;
  wire _al_u2943_o;
  wire _al_u2945_o;
  wire _al_u2946_o;
  wire _al_u2947_o;
  wire _al_u2949_o;
  wire _al_u2950_o;
  wire _al_u2951_o;
  wire _al_u2952_o;
  wire _al_u2953_o;
  wire _al_u2955_o;
  wire _al_u2956_o;
  wire _al_u2958_o;
  wire _al_u2959_o;
  wire _al_u2963_o;
  wire _al_u2964_o;
  wire _al_u2965_o;
  wire _al_u2966_o;
  wire _al_u2968_o;
  wire _al_u2969_o;
  wire _al_u2970_o;
  wire _al_u2972_o;
  wire _al_u2974_o;
  wire _al_u2975_o;
  wire _al_u2976_o;
  wire _al_u2977_o;
  wire _al_u2979_o;
  wire _al_u2980_o;
  wire _al_u2982_o;
  wire _al_u2984_o;
  wire _al_u2985_o;
  wire _al_u2986_o;
  wire _al_u2987_o;
  wire _al_u2989_o;
  wire _al_u2990_o;
  wire _al_u2991_o;
  wire _al_u2993_o;
  wire _al_u2994_o;
  wire _al_u2995_o;
  wire _al_u2996_o;
  wire _al_u2997_o;
  wire _al_u2998_o;
  wire _al_u2999_o;
  wire _al_u3000_o;
  wire _al_u3001_o;
  wire _al_u3002_o;
  wire _al_u3003_o;
  wire _al_u3004_o;
  wire _al_u3005_o;
  wire _al_u3006_o;
  wire _al_u3007_o;
  wire _al_u3008_o;
  wire _al_u3010_o;
  wire _al_u3011_o;
  wire _al_u3012_o;
  wire _al_u3013_o;
  wire _al_u3014_o;
  wire _al_u3015_o;
  wire _al_u3016_o;
  wire _al_u3017_o;
  wire _al_u3019_o;
  wire _al_u3020_o;
  wire _al_u3021_o;
  wire _al_u3022_o;
  wire _al_u3023_o;
  wire _al_u3024_o;
  wire _al_u3025_o;
  wire _al_u3026_o;
  wire _al_u3027_o;
  wire _al_u3028_o;
  wire _al_u3030_o;
  wire _al_u3031_o;
  wire _al_u3032_o;
  wire _al_u3033_o;
  wire _al_u3034_o;
  wire _al_u3035_o;
  wire _al_u3036_o;
  wire _al_u3037_o;
  wire _al_u3038_o;
  wire _al_u3039_o;
  wire _al_u3040_o;
  wire _al_u3041_o;
  wire _al_u3042_o;
  wire _al_u3043_o;
  wire _al_u3044_o;
  wire _al_u3045_o;
  wire _al_u3046_o;
  wire _al_u3047_o;
  wire _al_u3048_o;
  wire _al_u3049_o;
  wire _al_u3050_o;
  wire _al_u3052_o;
  wire _al_u3054_o;
  wire _al_u3055_o;
  wire _al_u3056_o;
  wire _al_u3057_o;
  wire _al_u3058_o;
  wire _al_u3059_o;
  wire _al_u3061_o;
  wire _al_u3064_o;
  wire _al_u3065_o;
  wire _al_u3066_o;
  wire _al_u3067_o;
  wire _al_u3068_o;
  wire _al_u3069_o;
  wire _al_u3070_o;
  wire _al_u3071_o;
  wire _al_u3072_o;
  wire _al_u3073_o;
  wire _al_u3074_o;
  wire _al_u3075_o;
  wire _al_u3076_o;
  wire _al_u3077_o;
  wire _al_u3078_o;
  wire _al_u3079_o;
  wire _al_u3080_o;
  wire _al_u3081_o;
  wire _al_u3083_o;
  wire _al_u3084_o;
  wire _al_u3085_o;
  wire _al_u3086_o;
  wire _al_u3087_o;
  wire _al_u3088_o;
  wire _al_u3089_o;
  wire _al_u3090_o;
  wire _al_u3091_o;
  wire _al_u3092_o;
  wire _al_u3093_o;
  wire _al_u3094_o;
  wire _al_u3095_o;
  wire _al_u3096_o;
  wire _al_u3097_o;
  wire _al_u3098_o;
  wire _al_u3099_o;
  wire _al_u3101_o;
  wire _al_u3102_o;
  wire _al_u3103_o;
  wire _al_u3104_o;
  wire _al_u3105_o;
  wire _al_u3106_o;
  wire _al_u3107_o;
  wire _al_u3108_o;
  wire _al_u3109_o;
  wire _al_u3110_o;
  wire _al_u3111_o;
  wire _al_u3112_o;
  wire _al_u3113_o;
  wire _al_u3114_o;
  wire _al_u3115_o;
  wire _al_u3117_o;
  wire _al_u3118_o;
  wire _al_u3120_o;
  wire _al_u3121_o;
  wire _al_u3122_o;
  wire _al_u3124_o;
  wire _al_u3129_o;
  wire _al_u3132_o;
  wire _al_u3134_o;
  wire _al_u3135_o;
  wire _al_u3136_o;
  wire _al_u3137_o;
  wire _al_u3138_o;
  wire _al_u3139_o;
  wire _al_u3141_o;
  wire _al_u3142_o;
  wire _al_u3143_o;
  wire _al_u3144_o;
  wire _al_u3145_o;
  wire _al_u3146_o;
  wire _al_u3147_o;
  wire _al_u3148_o;
  wire _al_u3150_o;
  wire _al_u3151_o;
  wire _al_u3152_o;
  wire _al_u3153_o;
  wire _al_u3155_o;
  wire _al_u3156_o;
  wire _al_u3158_o;
  wire _al_u3160_o;
  wire _al_u3162_o;
  wire _al_u3163_o;
  wire _al_u3164_o;
  wire _al_u3165_o;
  wire _al_u3167_o;
  wire _al_u3168_o;
  wire _al_u3169_o;
  wire _al_u3171_o;
  wire _al_u3174_o;
  wire _al_u3176_o;
  wire _al_u3177_o;
  wire _al_u3180_o;
  wire _al_u3181_o;
  wire _al_u3182_o;
  wire _al_u3183_o;
  wire _al_u3184_o;
  wire _al_u3185_o;
  wire _al_u3186_o;
  wire _al_u3187_o;
  wire _al_u3188_o;
  wire _al_u3189_o;
  wire _al_u3191_o;
  wire _al_u3193_o;
  wire _al_u3194_o;
  wire _al_u3195_o;
  wire _al_u3196_o;
  wire _al_u3197_o;
  wire _al_u3198_o;
  wire _al_u3199_o;
  wire _al_u3200_o;
  wire _al_u3201_o;
  wire _al_u3202_o;
  wire _al_u3203_o;
  wire _al_u3204_o;
  wire _al_u3205_o;
  wire _al_u3206_o;
  wire _al_u3207_o;
  wire _al_u3208_o;
  wire _al_u3209_o;
  wire _al_u3210_o;
  wire _al_u3211_o;
  wire _al_u3213_o;
  wire _al_u3214_o;
  wire _al_u3215_o;
  wire _al_u3216_o;
  wire _al_u3217_o;
  wire _al_u3218_o;
  wire _al_u3219_o;
  wire _al_u3220_o;
  wire _al_u3221_o;
  wire _al_u3222_o;
  wire _al_u3223_o;
  wire _al_u3224_o;
  wire _al_u3225_o;
  wire _al_u3226_o;
  wire _al_u3227_o;
  wire _al_u3228_o;
  wire _al_u3229_o;
  wire _al_u3230_o;
  wire _al_u3231_o;
  wire _al_u3232_o;
  wire _al_u3233_o;
  wire _al_u3234_o;
  wire _al_u3235_o;
  wire _al_u3236_o;
  wire _al_u3237_o;
  wire _al_u3239_o;
  wire _al_u3240_o;
  wire _al_u3241_o;
  wire _al_u3244_o;
  wire _al_u3245_o;
  wire _al_u3249_o;
  wire _al_u3250_o;
  wire _al_u3252_o;
  wire _al_u3253_o;
  wire _al_u3256_o;
  wire _al_u3257_o;
  wire _al_u3258_o;
  wire _al_u3262_o;
  wire _al_u3263_o;
  wire _al_u3264_o;
  wire _al_u3265_o;
  wire _al_u3266_o;
  wire _al_u3267_o;
  wire _al_u3268_o;
  wire _al_u3269_o;
  wire _al_u3270_o;
  wire _al_u3271_o;
  wire _al_u3272_o;
  wire _al_u3273_o;
  wire _al_u3274_o;
  wire _al_u3275_o;
  wire _al_u3276_o;
  wire _al_u3277_o;
  wire _al_u3278_o;
  wire _al_u3279_o;
  wire _al_u3280_o;
  wire _al_u3281_o;
  wire _al_u3282_o;
  wire _al_u3283_o;
  wire _al_u3284_o;
  wire _al_u3286_o;
  wire _al_u3287_o;
  wire _al_u3289_o;
  wire _al_u3290_o;
  wire _al_u3291_o;
  wire _al_u3292_o;
  wire _al_u3293_o;
  wire _al_u3294_o;
  wire _al_u3295_o;
  wire _al_u3296_o;
  wire _al_u3297_o;
  wire _al_u3298_o;
  wire _al_u3299_o;
  wire _al_u3300_o;
  wire _al_u3301_o;
  wire _al_u3302_o;
  wire _al_u3304_o;
  wire _al_u3308_o;
  wire _al_u3311_o;
  wire _al_u3314_o;
  wire _al_u3315_o;
  wire _al_u3316_o;
  wire _al_u3317_o;
  wire _al_u3318_o;
  wire _al_u3319_o;
  wire _al_u3320_o;
  wire _al_u3321_o;
  wire _al_u3322_o;
  wire _al_u3323_o;
  wire _al_u3325_o;
  wire _al_u3326_o;
  wire _al_u3327_o;
  wire _al_u3330_o;
  wire _al_u3331_o;
  wire _al_u3332_o;
  wire _al_u3333_o;
  wire _al_u3334_o;
  wire _al_u3335_o;
  wire _al_u3336_o;
  wire _al_u3337_o;
  wire _al_u3338_o;
  wire _al_u3339_o;
  wire _al_u3340_o;
  wire _al_u3341_o;
  wire _al_u3342_o;
  wire _al_u3343_o;
  wire _al_u3344_o;
  wire _al_u3345_o;
  wire _al_u3348_o;
  wire _al_u3349_o;
  wire _al_u3352_o;
  wire _al_u3353_o;
  wire _al_u3354_o;
  wire _al_u3355_o;
  wire _al_u3357_o;
  wire _al_u3359_o;
  wire _al_u3360_o;
  wire _al_u3361_o;
  wire _al_u3362_o;
  wire _al_u3363_o;
  wire _al_u3364_o;
  wire _al_u3365_o;
  wire _al_u3366_o;
  wire _al_u3367_o;
  wire _al_u3368_o;
  wire _al_u3369_o;
  wire _al_u3370_o;
  wire _al_u3371_o;
  wire _al_u3372_o;
  wire _al_u3373_o;
  wire _al_u3374_o;
  wire _al_u3375_o;
  wire _al_u3376_o;
  wire _al_u3377_o;
  wire _al_u3378_o;
  wire _al_u3379_o;
  wire _al_u3380_o;
  wire _al_u3381_o;
  wire _al_u3382_o;
  wire _al_u3383_o;
  wire _al_u3384_o;
  wire _al_u3385_o;
  wire _al_u3386_o;
  wire _al_u3387_o;
  wire _al_u3388_o;
  wire _al_u3391_o;
  wire _al_u3393_o;
  wire _al_u3396_o;
  wire _al_u3397_o;
  wire _al_u3398_o;
  wire _al_u3400_o;
  wire _al_u3401_o;
  wire _al_u3402_o;
  wire _al_u3403_o;
  wire _al_u3406_o;
  wire _al_u3407_o;
  wire _al_u3408_o;
  wire _al_u3409_o;
  wire _al_u3410_o;
  wire _al_u3411_o;
  wire _al_u3412_o;
  wire _al_u3413_o;
  wire _al_u3414_o;
  wire _al_u3415_o;
  wire _al_u3416_o;
  wire _al_u3417_o;
  wire _al_u3418_o;
  wire _al_u3419_o;
  wire _al_u3420_o;
  wire _al_u3421_o;
  wire _al_u3422_o;
  wire _al_u3423_o;
  wire _al_u3425_o;
  wire _al_u3426_o;
  wire _al_u3427_o;
  wire _al_u3428_o;
  wire _al_u3429_o;
  wire _al_u3430_o;
  wire _al_u3431_o;
  wire _al_u3432_o;
  wire _al_u3433_o;
  wire _al_u3434_o;
  wire _al_u3435_o;
  wire _al_u3436_o;
  wire _al_u3437_o;
  wire _al_u3438_o;
  wire _al_u3439_o;
  wire _al_u3440_o;
  wire _al_u3441_o;
  wire _al_u3442_o;
  wire _al_u3443_o;
  wire _al_u3444_o;
  wire _al_u3445_o;
  wire _al_u3449_o;
  wire _al_u3453_o;
  wire _al_u3454_o;
  wire _al_u3455_o;
  wire _al_u3456_o;
  wire _al_u3457_o;
  wire _al_u3458_o;
  wire _al_u3459_o;
  wire _al_u3460_o;
  wire _al_u3462_o;
  wire _al_u3463_o;
  wire _al_u3464_o;
  wire _al_u3465_o;
  wire _al_u3467_o;
  wire _al_u3468_o;
  wire _al_u3471_o;
  wire _al_u3473_o;
  wire _al_u3474_o;
  wire _al_u3475_o;
  wire _al_u3476_o;
  wire _al_u3477_o;
  wire _al_u3478_o;
  wire _al_u3479_o;
  wire _al_u3480_o;
  wire _al_u3481_o;
  wire _al_u3482_o;
  wire _al_u3483_o;
  wire _al_u3484_o;
  wire _al_u3485_o;
  wire _al_u3486_o;
  wire _al_u3487_o;
  wire _al_u3488_o;
  wire _al_u3489_o;
  wire _al_u3490_o;
  wire _al_u3491_o;
  wire _al_u3492_o;
  wire _al_u3493_o;
  wire _al_u3494_o;
  wire _al_u3495_o;
  wire _al_u3496_o;
  wire _al_u3497_o;
  wire _al_u3499_o;
  wire _al_u3500_o;
  wire _al_u3501_o;
  wire _al_u3502_o;
  wire _al_u3503_o;
  wire _al_u3504_o;
  wire _al_u3505_o;
  wire _al_u3507_o;
  wire _al_u3508_o;
  wire _al_u3509_o;
  wire _al_u3510_o;
  wire _al_u3511_o;
  wire _al_u3512_o;
  wire _al_u3513_o;
  wire _al_u3514_o;
  wire _al_u3515_o;
  wire _al_u3516_o;
  wire _al_u3517_o;
  wire _al_u3518_o;
  wire _al_u3519_o;
  wire _al_u3520_o;
  wire _al_u3521_o;
  wire _al_u3522_o;
  wire _al_u3523_o;
  wire _al_u3524_o;
  wire _al_u3525_o;
  wire _al_u3530_o;
  wire _al_u3532_o;
  wire _al_u3533_o;
  wire _al_u3534_o;
  wire _al_u3535_o;
  wire _al_u3536_o;
  wire _al_u3537_o;
  wire _al_u3538_o;
  wire _al_u3539_o;
  wire _al_u3540_o;
  wire _al_u3541_o;
  wire _al_u3542_o;
  wire _al_u3545_o;
  wire _al_u3546_o;
  wire _al_u3547_o;
  wire _al_u3548_o;
  wire _al_u3549_o;
  wire _al_u3550_o;
  wire _al_u3551_o;
  wire _al_u3552_o;
  wire _al_u3553_o;
  wire _al_u3554_o;
  wire _al_u3555_o;
  wire _al_u3556_o;
  wire _al_u3557_o;
  wire _al_u3558_o;
  wire _al_u3559_o;
  wire _al_u3560_o;
  wire _al_u3562_o;
  wire _al_u3563_o;
  wire _al_u3564_o;
  wire _al_u3565_o;
  wire _al_u3566_o;
  wire _al_u3570_o;
  wire _al_u3574_o;
  wire _al_u3575_o;
  wire _al_u3576_o;
  wire _al_u3577_o;
  wire _al_u3578_o;
  wire _al_u3579_o;
  wire _al_u3580_o;
  wire _al_u3581_o;
  wire _al_u3582_o;
  wire _al_u3583_o;
  wire _al_u3584_o;
  wire _al_u3585_o;
  wire _al_u3586_o;
  wire _al_u3588_o;
  wire _al_u3589_o;
  wire _al_u3590_o;
  wire _al_u3591_o;
  wire _al_u3592_o;
  wire _al_u3593_o;
  wire _al_u3594_o;
  wire _al_u3595_o;
  wire _al_u3596_o;
  wire _al_u3598_o;
  wire _al_u3599_o;
  wire _al_u3600_o;
  wire _al_u3601_o;
  wire _al_u3602_o;
  wire _al_u3603_o;
  wire _al_u3604_o;
  wire _al_u3606_o;
  wire _al_u3607_o;
  wire _al_u3608_o;
  wire _al_u3609_o;
  wire _al_u3610_o;
  wire _al_u3611_o;
  wire _al_u3612_o;
  wire _al_u3613_o;
  wire _al_u3614_o;
  wire _al_u3615_o;
  wire _al_u3616_o;
  wire _al_u3617_o;
  wire _al_u3618_o;
  wire _al_u3619_o;
  wire _al_u3620_o;
  wire _al_u3621_o;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire \add2/c1 ;
  wire \add2/c3 ;
  wire \add2/c5 ;
  wire \add2/c7 ;
  wire bus_write;  // sources/rtl/camera_init.v(34)
  wire mux103_b1_sel_is_2_o;
  wire mux104_b11_sel_is_2_o;
  wire mux107_b0_sel_is_2_o;
  wire mux111_b0_sel_is_2_o;
  wire mux115_b2_sel_is_2_o;
  wire mux117_b5_sel_is_2_o;
  wire mux119_b3_sel_is_0_o;
  wire mux120_b3_sel_is_2_o;
  wire mux120_b7_sel_is_2_o;
  wire mux121_b7_sel_is_2_o;
  wire mux124_b0_sel_is_0_o;
  wire mux124_b11_sel_is_2_o;
  wire mux127_b5_sel_is_2_o;
  wire mux129_b0_sel_is_2_o;
  wire mux129_b8_sel_is_2_o;
  wire mux12_b9_sel_is_2_o_neg_lutinv;
  wire mux130_b1_sel_is_2_o;
  wire mux132_b0_sel_is_0_o;
  wire mux132_b3_sel_is_2_o;
  wire mux134_b0_sel_is_2_o;
  wire mux135_b11_sel_is_0_o;
  wire mux136_b0_sel_is_2_o;
  wire mux136_b1_sel_is_0_o;
  wire mux136_b7_sel_is_2_o;
  wire mux137_b2_sel_is_2_o;
  wire mux137_b5_sel_is_2_o;
  wire mux139_b0_sel_is_2_o;
  wire mux13_b2_sel_is_2_o;
  wire mux140_b11_sel_is_2_o;
  wire mux141_b1_sel_is_2_o;
  wire mux146_b12_sel_is_2_o;
  wire mux147_b12_sel_is_2_o;
  wire mux147_b3_sel_is_2_o;
  wire mux14_b0_sel_is_2_o;
  wire mux14_b11_sel_is_2_o;
  wire mux150_b0_sel_is_2_o;
  wire mux152_b0_sel_is_2_o;
  wire mux159_b3_sel_is_2_o;
  wire mux168_b4_sel_is_2_o;
  wire mux169_b0_sel_is_2_o;
  wire mux16_b11_sel_is_2_o;
  wire mux16_b1_sel_is_0_o;
  wire mux170_b10_sel_is_0_o;
  wire mux170_b2_sel_is_2_o;
  wire mux174_b0_sel_is_0_o;
  wire mux182_b0_sel_is_2_o;
  wire mux182_b1_sel_is_2_o;
  wire mux185_b0_sel_is_2_o;
  wire mux18_b6_sel_is_2_o;
  wire mux19_b2_sel_is_0_o;
  wire mux22_b11_sel_is_2_o;
  wire mux30_b12_sel_is_2_o;
  wire mux30_b1_sel_is_2_o;
  wire mux33_b0_sel_is_2_o;
  wire mux38_b12_sel_is_2_o;
  wire mux38_b1_sel_is_2_o;
  wire mux47_b0_sel_is_2_o;
  wire mux47_b1_sel_is_2_o;
  wire mux48_b1_sel_is_2_o;
  wire mux49_b0_sel_is_2_o;
  wire mux52_b1_sel_is_2_o;
  wire mux57_b3_sel_is_2_o;
  wire mux5_b5_sel_is_2_o;
  wire mux60_b10_sel_is_2_o;
  wire mux60_b1_sel_is_2_o;
  wire mux61_b0_sel_is_2_o;
  wire mux61_b3_sel_is_2_o;
  wire mux63_b12_sel_is_2_o;
  wire mux63_b1_sel_is_2_o;
  wire mux67_b0_sel_is_2_o;
  wire mux68_b1_sel_is_2_o;
  wire mux70_b2_sel_is_0_o;
  wire mux75_b5_sel_is_2_o;
  wire mux75_b6_sel_is_2_o;
  wire mux77_b8_sel_is_2_o;
  wire mux84_b4_sel_is_2_o;
  wire mux85_b0_sel_is_2_o;
  wire mux87_b0_sel_is_2_o;
  wire mux89_b1_sel_is_2_o;
  wire mux92_b0_sel_is_0_o;
  wire mux92_b7_sel_is_2_o;
  wire mux93_b3_sel_is_2_o;
  wire mux94_b0_sel_is_2_o;
  wire mux96_b0_sel_is_2_o;
  wire mux97_b15_sel_is_2_o;
  wire mux97_b5_sel_is_2_o;
  wire mux9_b12_sel_is_2_o;
  wire n376_lutinv;
  wire n377_lutinv;
  wire n378_lutinv;
  wire n380_lutinv;
  wire n381;
  wire ready_out;  // sources/rtl/camera_init.v(35)
  wire success_out;  // sources/rtl/camera_init.v(36)

  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~D*C*~B*A)"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000000000100000),
    .MODE("LOGIC"))
    \_al_u2839|_al_u2838  (
    .a({_al_u2838_o,open_n0}),
    .b({state_next[3],1'b0}),
    .c({state_next[4],1'b0}),
    .d({1'b0,state_next[2]}),
    .f({_al_u2839_o,_al_u2838_o}));
  // sources/rtl/camera_init.v(271)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u2840|ready_reg  (
    .b({state_next[0],state_next[0]}),
    .c({state_next[1],state_next[1]}),
    .clk(clk),
    .d({_al_u2839_o,_al_u2839_o}),
    .f({n381,open_n37}),
    .q({open_n41,ready}));  // sources/rtl/camera_init.v(271)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*~A)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(D*C*B*~A)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0100000000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0100000000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2842|_al_u2925  (
    .a({open_n42,counter[0]}),
    .b(counter[2:1]),
    .c(counter[3:2]),
    .d({counter[1],counter[3]}),
    .f({_al_u2842_o,_al_u2925_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*B*~A)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(D*~C*B*~A)"),
    //.LUTG1("(D*~C*B*A)"),
    .INIT_LUTF0(16'b0000010000000000),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000010000000000),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2843|_al_u2888  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2843_o,_al_u2888_o}));
  // sources/rtl/camera_init.v(434)
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
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u2856|reg1_b1  (
    .b({state_next[0],reset_n}),
    .c({state_next[1],state_next[1]}),
    .clk(divider2[8]),
    .d({_al_u2854_o,_al_u2854_o}),
    .mi({open_n97,1'b1}),
    .sr(mux182_b1_sel_is_2_o),
    .f({n378_lutinv,mux182_b1_sel_is_2_o}),
    .q({open_n112,reg_address[1]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u2857|_al_u2853  (
    .a({_al_u2838_o,open_n113}),
    .b({_al_u2853_o,state_next[4]}),
    .c({state_next[0],1'b0}),
    .d({state_next[1],state_next[3]}),
    .f({n376_lutinv,_al_u2853_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("~(~C*D)"),
    //.LUTG1("(~C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000011111111),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000011111111),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u2858|bus_write_reg  (
    .c({n376_lutinv,_al_u2860_o}),
    .clk(divider2[8]),
    .d({n378_lutinv,_al_u2858_o}),
    .sr(reset_n),
    .f({_al_u2858_o,open_n155}),
    .q({open_n159,bus_write}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u2860|_al_u2864  (
    .b({open_n162,state_next[0]}),
    .c({state_next[0],state_next[1]}),
    .d({_al_u2854_o,_al_u2854_o}),
    .f({_al_u2860_o,n380_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2863|_al_u3118  (
    .c({n376_lutinv,n378_lutinv}),
    .d({_al_u2854_o,_al_u3117_o}),
    .f({_al_u2863_o,_al_u3118_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2866|_al_u2868  (
    .b({open_n209,state_next[0]}),
    .c({state_next[1],state_next[1]}),
    .d({_al_u2860_o,_al_u2839_o}),
    .f({n377_lutinv,\sel0_b0/B4 }));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u2867|reg1_b0  (
    .b({n377_lutinv,open_n236}),
    .c({n381,reset_n}),
    .clk(divider2[8]),
    .d({_al_u2858_o,_al_u2858_o}),
    .mi({open_n248,1'b1}),
    .sr(mux182_b0_sel_is_2_o),
    .f({_al_u2867_o,mux182_b0_sel_is_2_o}),
    .q({open_n252,reg_address[0]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("~(A*~((~D*B))*~(C)+A*(~D*B)*~(C)+~(A)*(~D*B)*C+A*(~D*B)*C)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("~(A*~((~D*B))*~(C)+A*(~D*B)*~(C)+~(A)*(~D*B)*C+A*(~D*B)*C)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111010100110101),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111010100110101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2869|_al_u2871  (
    .a({\sel0_b0/B4 ,open_n253}),
    .b({n380_lutinv,_al_u2844_o}),
    .c({ready_out,success_out}),
    .d({success_out,n380_lutinv}),
    .f({_al_u2869_o,_al_u2871_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u2874|reg4_b4  (
    .a({open_n278,cnt[4]}),
    .b({open_n279,cnt[5]}),
    .c({_al_u2873_o,cnt[6]}),
    .ce(mux185_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d({_al_u2872_o,cnt[7]}),
    .mi({open_n290,n372[4]}),
    .f({_al_u2874_o,_al_u2872_o}),
    .q({open_n295,cnt[4]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(347)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*~D))"),
    //.LUT1("(~B*~(C)*~(D)+~B*C*~(D)+~(~B)*C*D+~B*C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001111110011),
    .INIT_LUT1(16'b1111000000110011),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u2875|reg0_b0  (
    .b({_al_u2860_o,_al_u2875_o}),
    .c({_al_u2874_o,state_next[0]}),
    .clk(divider2[8]),
    .d({_al_u2871_o,_al_u2865_o}),
    .sr(reset_n),
    .f({_al_u2875_o,open_n311}),
    .q({open_n315,state_next[0]}));  // sources/rtl/camera_init.v(347)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(~B*A))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1101000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u2878|_al_u2877  (
    .a({open_n316,_al_u2844_o}),
    .b({open_n317,_al_u2874_o}),
    .c({_al_u2877_o,ready_out}),
    .d({n380_lutinv,success_out}),
    .f({\sel0_b3/B3 ,_al_u2877_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2879|_al_u2865  (
    .b({\sel0_b3/B3 ,n380_lutinv}),
    .c({state_next[3],ready_out}),
    .d({_al_u2863_o,_al_u2863_o}),
    .f({_al_u2879_o,_al_u2865_o}));
  // sources/rtl/camera_init.v(347)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~A*~(D*B))"),
    //.LUT1("(~C*~(D)*~((~B*~A))+~C*D*~((~B*~A))+~(~C)*D*(~B*~A)+~C*D*(~B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111011111010),
    .INIT_LUT1(16'b0001111100001110),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u2882|reg0_b1  (
    .a({\sel0_b0/B4 ,_al_u2882_o}),
    .b({n380_lutinv,_al_u2863_o}),
    .c({ready_out,_al_u2871_o}),
    .clk(divider2[8]),
    .d({n378_lutinv,state_next[1]}),
    .sr(reset_n),
    .f({_al_u2882_o,open_n377}),
    .q({open_n381,state_next[1]}));  // sources/rtl/camera_init.v(347)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2887|_al_u2949  (
    .b({counter[0],counter[0]}),
    .c({counter[1],counter[1]}),
    .d({_al_u2886_o,_al_u2886_o}),
    .f({_al_u2887_o,_al_u2949_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~B*A)"),
    //.LUT1("(D*~C*B*A)"),
    .INIT_LUT0(16'b0010000000000000),
    .INIT_LUT1(16'b0000100000000000),
    .MODE("LOGIC"))
    \_al_u2891|_al_u2884  (
    .a({counter[0],counter[0]}),
    .b({counter[1],counter[1]}),
    .c({counter[2],counter[2]}),
    .d({counter[3],counter[3]}),
    .f({_al_u2891_o,_al_u2884_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u2893|_al_u2890  (
    .b({_al_u2890_o,open_n430}),
    .c({_al_u2892_o,_al_u2888_o}),
    .d({_al_u2889_o,_al_u2884_o}),
    .f({mux5_b5_sel_is_2_o,_al_u2890_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2894|_al_u2907  (
    .a({counter[0],counter[0]}),
    .b({counter[1],counter[1]}),
    .c({counter[2],counter[2]}),
    .d({counter[3],counter[3]}),
    .f({_al_u2894_o,_al_u2907_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2896|_al_u2895  (
    .c({_al_u2895_o,_al_u2888_o}),
    .d({_al_u2844_o,_al_u2894_o}),
    .f({n186[0],_al_u2895_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2898|_al_u2897  (
    .c({_al_u2886_o,counter[1]}),
    .d({_al_u2897_o,counter[0]}),
    .f({_al_u2898_o,_al_u2897_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2900|_al_u2901  (
    .b({open_n525,_al_u2900_o}),
    .c({_al_u2888_o,_al_u2888_o}),
    .d({_al_u2899_o,_al_u2898_o}),
    .f({_al_u2900_o,mux9_b12_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2903|_al_u2886  (
    .c({counter[3],counter[3]}),
    .d({counter[2],counter[2]}),
    .f({_al_u2903_o,_al_u2886_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*A*~(~D*~C))"),
    //.LUT1("(C*~B*D)"),
    .INIT_LUT0(16'b1000100010000000),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"))
    \_al_u2904|_al_u3167  (
    .a({open_n578,_al_u2903_o}),
    .b({counter[0],_al_u3010_o}),
    .c(counter[1:0]),
    .d({_al_u2903_o,counter[1]}),
    .f({_al_u2904_o,_al_u3167_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2908|_al_u2899  (
    .b({counter[2],counter[2]}),
    .c({counter[3],counter[3]}),
    .d({counter[1],counter[1]}),
    .f({_al_u2908_o,_al_u2899_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*A*(D@C))"),
    //.LUT1("(~C*~B*~(D*A))"),
    .INIT_LUT0(16'b0000100010000000),
    .INIT_LUT1(16'b0000000100000011),
    .MODE("LOGIC"))
    \_al_u2910|_al_u2906  (
    .a({_al_u2904_o,_al_u2905_o}),
    .b({_al_u2906_o,_al_u2888_o}),
    .c({_al_u2909_o,counter[0]}),
    .d({_al_u2888_o,counter[1]}),
    .f({mux13_b2_sel_is_2_o,_al_u2906_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~(B*A)*~(D)*~(C)+~(B*A)*D*~(C)+~(~(B*A))*D*C+~(B*A)*D*C)"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b1111011100000111),
    .MODE("LOGIC"))
    \_al_u2912|_al_u3060  (
    .a({_al_u2902_o,open_n645}),
    .b({mux13_b2_sel_is_2_o,_al_u2911_o}),
    .c({_al_u2911_o,counter[0]}),
    .d({counter[0],_al_u3059_o}),
    .f({_al_u2912_o,mux16_b1_sel_is_0_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2913|_al_u2905  (
    .c({counter[3],counter[3]}),
    .d({counter[2],counter[2]}),
    .f({_al_u2913_o,_al_u2905_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2915|_al_u2885  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2915_o,_al_u2885_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2918|_al_u2917  (
    .b({open_n720,_al_u2891_o}),
    .c({_al_u2917_o,_al_u2915_o}),
    .d({_al_u2916_o,_al_u2887_o}),
    .f({_al_u2918_o,_al_u2917_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A*~(D*C))"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(B*A*~(D*C))"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b0000100010001000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b0000100010001000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2919|_al_u2924  (
    .a({open_n745,_al_u2919_o}),
    .b({_al_u2918_o,_al_u2922_o}),
    .c({_al_u2915_o,_al_u2923_o}),
    .d({_al_u2912_o,counter[1]}),
    .f({_al_u2919_o,_al_u2924_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2922|_al_u2920  (
    .c({_al_u2921_o,_al_u2915_o}),
    .d({_al_u2920_o,_al_u2904_o}),
    .f({_al_u2922_o,_al_u2920_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2923|_al_u3155  (
    .c({_al_u2915_o,_al_u3010_o}),
    .d({_al_u2905_o,_al_u2905_o}),
    .f({_al_u2923_o,_al_u3155_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u2926|_al_u3026  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2926_o,_al_u3026_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2929|_al_u2927  (
    .c({_al_u2928_o,_al_u2926_o}),
    .d({_al_u2927_o,_al_u2925_o}),
    .f({_al_u2929_o,_al_u2927_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000010011000100),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000010011000100),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2934|_al_u2931  (
    .a({open_n874,_al_u2924_o}),
    .b({_al_u2932_o,_al_u2929_o}),
    .c({_al_u2933_o,_al_u2930_o}),
    .d({n217[6],counter[0]}),
    .f({n221[6],n217[6]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~D*~(C*B))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000111111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000111111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2937|_al_u2935  (
    .b({open_n901,_al_u2899_o}),
    .c({_al_u2936_o,counter[0]}),
    .d({_al_u2935_o,_al_u2898_o}),
    .f({_al_u2937_o,_al_u2935_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*~(~B*D))"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*~(~B*D))"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1100000011110000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1100000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2939|_al_u2938  (
    .b({_al_u2938_o,open_n928}),
    .c({_al_u2926_o,counter[0]}),
    .d({_al_u2937_o,_al_u2908_o}),
    .f({_al_u2939_o,_al_u2938_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2942|_al_u2941  (
    .c({_al_u2941_o,_al_u2926_o}),
    .d({_al_u2940_o,_al_u2842_o}),
    .f({mux47_b1_sel_is_2_o,_al_u2941_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u2944|_al_u2943  (
    .b({mux47_b1_sel_is_2_o,open_n979}),
    .c({_al_u2943_o,_al_u2926_o}),
    .d({_al_u2939_o,_al_u2907_o}),
    .f({mux47_b0_sel_is_2_o,_al_u2943_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2945|_al_u3010  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2945_o,_al_u3010_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u2948|_al_u2946  (
    .b({_al_u2946_o,open_n1026}),
    .c({_al_u2947_o,_al_u2945_o}),
    .d({mux47_b0_sel_is_2_o,_al_u2925_o}),
    .f({mux49_b0_sel_is_2_o,_al_u2946_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2950|_al_u3138  (
    .c({_al_u2887_o,_al_u2963_o}),
    .d({_al_u2949_o,_al_u2887_o}),
    .f({_al_u2950_o,_al_u3138_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2951|_al_u3220  (
    .c({_al_u2899_o,_al_u2993_o}),
    .d({_al_u2898_o,_al_u2899_o}),
    .f({_al_u2951_o,_al_u3220_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*~B))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("(~D*~(C*~B))"),
    //.LUTG1("(C*~(B*D))"),
    .INIT_LUTF0(16'b0000000011001111),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b0000000011001111),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2952|_al_u2954  (
    .b({_al_u2951_o,_al_u2953_o}),
    .c({_al_u2945_o,_al_u2945_o}),
    .d({_al_u2950_o,_al_u2952_o}),
    .f({_al_u2952_o,mux60_b10_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2953|_al_u3039  (
    .c({_al_u2908_o,_al_u2885_o}),
    .d({_al_u2907_o,_al_u2908_o}),
    .f({_al_u2953_o,_al_u3039_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2956|_al_u2892  (
    .c({_al_u2945_o,_al_u2888_o}),
    .d({_al_u2891_o,_al_u2891_o}),
    .f({_al_u2956_o,_al_u2892_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2957|_al_u2955  (
    .b({open_n1183,_al_u2884_o}),
    .c({_al_u2956_o,_al_u2945_o}),
    .d({_al_u2955_o,_al_u2914_o}),
    .f({mux52_b1_sel_is_2_o,_al_u2955_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~D*~C*B*A)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2960|_al_u2959  (
    .a({mux60_b10_sel_is_2_o,open_n1204}),
    .b({mux52_b1_sel_is_2_o,open_n1205}),
    .c({_al_u2958_o,_al_u2945_o}),
    .d({_al_u2959_o,_al_u2842_o}),
    .f({mux63_b1_sel_is_2_o,_al_u2959_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("~(C@D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000001111),
    .MODE("LOGIC"))
    \_al_u2962|_al_u2961  (
    .c({mux63_b12_sel_is_2_o,mux63_b1_sel_is_2_o}),
    .d({n221[6],mux49_b0_sel_is_2_o}),
    .f({n246[6],mux63_b12_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(~D*C*B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(~D*C*B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000000001000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000000001000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2963|_al_u3046  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2963_o,_al_u3046_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2967|_al_u2965  (
    .c({_al_u2966_o,counter[0]}),
    .d({_al_u2965_o,_al_u2964_o}),
    .f({mux75_b5_sel_is_2_o,_al_u2965_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2970|_al_u2969  (
    .b({open_n1308,_al_u2963_o}),
    .c({_al_u2969_o,counter[0]}),
    .d({_al_u2968_o,_al_u2899_o}),
    .f({_al_u2970_o,_al_u2969_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2971|_al_u3401  (
    .b({open_n1331,_al_u2970_o}),
    .c({_al_u2970_o,_al_u3139_o}),
    .d({mux75_b5_sel_is_2_o,_al_u3400_o}),
    .f({mux75_b6_sel_is_2_o,_al_u3401_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2973|_al_u2972  (
    .b({_al_u2972_o,_al_u2925_o}),
    .c({_al_u2963_o,_al_u2963_o}),
    .d({_al_u2914_o,_al_u2884_o}),
    .f({mux67_b0_sel_is_2_o,_al_u2972_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2974|_al_u3252  (
    .b({mux75_b6_sel_is_2_o,open_n1384}),
    .c({mux67_b0_sel_is_2_o,mux48_b1_sel_is_2_o}),
    .d({n246[6],mux63_b1_sel_is_2_o}),
    .f({_al_u2974_o,_al_u3252_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*C*~B*A)"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000000100000),
    .MODE("LOGIC"))
    \_al_u2975|_al_u2993  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2975_o,_al_u2993_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2978|_al_u2976  (
    .b({open_n1431,_al_u2884_o}),
    .c({_al_u2977_o,_al_u2975_o}),
    .d({_al_u2976_o,_al_u2914_o}),
    .f({mux84_b4_sel_is_2_o,_al_u2976_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2979|_al_u2977  (
    .c({_al_u2975_o,_al_u2975_o}),
    .d({_al_u2887_o,_al_u2891_o}),
    .f({_al_u2979_o,_al_u2977_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2981|_al_u2980  (
    .b({_al_u2979_o,open_n1482}),
    .c({_al_u2980_o,_al_u2975_o}),
    .d({mux84_b4_sel_is_2_o,_al_u2925_o}),
    .f({mux85_b0_sel_is_2_o,_al_u2980_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u2983|_al_u2982  (
    .b({open_n1509,_al_u2949_o}),
    .c({_al_u2982_o,_al_u2975_o}),
    .d({mux85_b0_sel_is_2_o,_al_u2898_o}),
    .f({mux87_b0_sel_is_2_o,_al_u2982_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u2985|_al_u2984  (
    .b({mux87_b0_sel_is_2_o,open_n1532}),
    .c({_al_u2984_o,_al_u2975_o}),
    .d({_al_u2974_o,_al_u2894_o}),
    .f({_al_u2985_o,_al_u2984_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2986|_al_u3078  (
    .c({_al_u2975_o,_al_u2975_o}),
    .d({_al_u2938_o,_al_u2898_o}),
    .f({_al_u2986_o,_al_u3078_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2988|_al_u2987  (
    .c({_al_u2987_o,_al_u2975_o}),
    .d({_al_u2986_o,_al_u2907_o}),
    .f({mux92_b0_sel_is_0_o,_al_u2987_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2990|_al_u2989  (
    .c({_al_u2975_o,counter[0]}),
    .d({_al_u2989_o,_al_u2908_o}),
    .f({_al_u2990_o,_al_u2989_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2992|_al_u2991  (
    .b({_al_u2990_o,open_n1635}),
    .c({_al_u2991_o,_al_u2975_o}),
    .d({mux92_b0_sel_is_0_o,_al_u2904_o}),
    .f({mux93_b3_sel_is_2_o,_al_u2991_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2996|_al_u2994  (
    .c({_al_u2995_o,_al_u2993_o}),
    .d({_al_u2994_o,_al_u2914_o}),
    .f({_al_u2996_o,_al_u2994_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3000|_al_u2999  (
    .b({_al_u2998_o,_al_u2975_o}),
    .c({_al_u2999_o,counter[0]}),
    .d({_al_u2997_o,_al_u2842_o}),
    .f({_al_u3000_o,_al_u2999_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3002|_al_u3001  (
    .a({mux93_b3_sel_is_2_o,open_n1706}),
    .b({_al_u2996_o,_al_u2975_o}),
    .c({_al_u3000_o,counter[0]}),
    .d({_al_u3001_o,_al_u2842_o}),
    .f({_al_u3002_o,_al_u3001_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111110000110000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111110000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3003|_al_u3006  (
    .b({_al_u3002_o,_al_u3004_o}),
    .c({_al_u2994_o,_al_u3005_o}),
    .d({_al_u2985_o,_al_u3003_o}),
    .f({_al_u3003_o,_al_u3006_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111110000001100),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111110000001100),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3004|_al_u2936  (
    .b({open_n1759,_al_u2899_o}),
    .c({_al_u2993_o,counter[0]}),
    .d({_al_u2936_o,_al_u2908_o}),
    .f({_al_u3004_o,_al_u2936_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3009|_al_u3008  (
    .c({_al_u3008_o,_al_u2993_o}),
    .d({_al_u3007_o,_al_u2842_o}),
    .f({mux111_b0_sel_is_2_o,_al_u3008_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3012|_al_u3011  (
    .c({_al_u3011_o,_al_u3010_o}),
    .d({mux111_b0_sel_is_2_o,_al_u2894_o}),
    .f({_al_u3012_o,_al_u3011_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3016|_al_u3014  (
    .c({_al_u3015_o,_al_u3010_o}),
    .d({_al_u3014_o,_al_u2884_o}),
    .f({_al_u3016_o,_al_u3014_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3017|_al_u3013  (
    .c({_al_u3016_o,_al_u3010_o}),
    .d({_al_u3013_o,_al_u2914_o}),
    .f({_al_u3017_o,_al_u3013_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3019|_al_u3021  (
    .b({open_n1882,_al_u3020_o}),
    .c({mux115_b2_sel_is_2_o,_al_u3010_o}),
    .d({_al_u3006_o,_al_u3019_o}),
    .f({_al_u3019_o,_al_u3021_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3023|_al_u3022  (
    .c({_al_u3022_o,_al_u3010_o}),
    .d({_al_u3021_o,_al_u2887_o}),
    .f({_al_u3023_o,_al_u3022_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3025|_al_u3024  (
    .c({_al_u3024_o,_al_u3010_o}),
    .d({_al_u3023_o,_al_u2898_o}),
    .f({_al_u3025_o,_al_u3024_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3029|_al_u3027  (
    .c({_al_u3028_o,_al_u3026_o}),
    .d({_al_u3027_o,_al_u2914_o}),
    .f({mux132_b0_sel_is_0_o,_al_u3027_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3031|_al_u3030  (
    .c({_al_u3030_o,_al_u3026_o}),
    .d({mux132_b0_sel_is_0_o,_al_u2884_o}),
    .f({_al_u3031_o,_al_u3030_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(~C*D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1100000011001100),
    .MODE("LOGIC"))
    \_al_u3033|_al_u3032  (
    .b({_al_u3031_o,open_n2009}),
    .c({_al_u3032_o,_al_u3010_o}),
    .d({_al_u3025_o,_al_u2936_o}),
    .f({_al_u3033_o,_al_u3032_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~B*(~C*~(D)*~(A)+~C*D*~(A)+~(~C)*D*A+~C*D*A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~B*(~C*~(D)*~(A)+~C*D*~(A)+~(~C)*D*A+~C*D*A))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0010001100000001),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0010001100000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3035|_al_u3028  (
    .a({_al_u3033_o,open_n2030}),
    .b({_al_u3034_o,open_n2031}),
    .c({_al_u3028_o,_al_u3026_o}),
    .d({_al_u3026_o,_al_u2891_o}),
    .f({_al_u3035_o,_al_u3028_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0011000011111100),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0011000011111100),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3038|_al_u3036  (
    .b({open_n2058,_al_u2885_o}),
    .c({_al_u3037_o,_al_u3035_o}),
    .d({_al_u3036_o,_al_u2884_o}),
    .f({_al_u3038_o,_al_u3036_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3041|_al_u3040  (
    .c({_al_u3040_o,_al_u2885_o}),
    .d({_al_u3039_o,_al_u2899_o}),
    .f({_al_u3041_o,_al_u3040_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3043|_al_u3044  (
    .b({_al_u3041_o,open_n2109}),
    .c({_al_u3042_o,counter[0]}),
    .d({_al_u3038_o,_al_u3041_o}),
    .f({_al_u3043_o,_al_u3044_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3045|_al_u3441  (
    .b({open_n2136,_al_u3044_o}),
    .c({_al_u3044_o,_al_u3196_o}),
    .d({_al_u3043_o,_al_u3440_o}),
    .f({_al_u3045_o,_al_u3441_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3048|_al_u3047  (
    .c({_al_u3047_o,_al_u2925_o}),
    .d({_al_u3045_o,_al_u3046_o}),
    .f({_al_u3048_o,_al_u3047_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3051|_al_u3049  (
    .b({open_n2191,_al_u2949_o}),
    .c({_al_u3050_o,_al_u3046_o}),
    .d({_al_u3049_o,_al_u2898_o}),
    .f({mux169_b0_sel_is_2_o,_al_u3049_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3052|_al_u3091  (
    .b({open_n2218,_al_u2899_o}),
    .c({_al_u3046_o,_al_u2993_o}),
    .d({_al_u2989_o,_al_u2989_o}),
    .f({_al_u3052_o,_al_u3091_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3055|reg2_b6  (
    .b({mux170_b2_sel_is_2_o,_al_u3114_o}),
    .c({_al_u3054_o,_al_u3118_o}),
    .clk(divider2[8]),
    .d({_al_u3048_o,_al_u3055_o}),
    .sr(reset_n),
    .f({_al_u3055_o,open_n2258}),
    .q({open_n2262,data_in_bus[6]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3058|_al_u3057  (
    .c({_al_u3057_o,_al_u2888_o}),
    .d({_al_u3056_o,_al_u2899_o}),
    .f({_al_u3058_o,_al_u3057_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~A*~(~D*B)))"),
    //.LUT1("(~C*~B*~(D*A))"),
    .INIT_LUT0(16'b1010000011100000),
    .INIT_LUT1(16'b0000000100000011),
    .MODE("LOGIC"))
    \_al_u3062|_al_u2909  (
    .a({_al_u2904_o,_al_u2907_o}),
    .b({_al_u2909_o,_al_u2908_o}),
    .c({_al_u3061_o,_al_u2888_o}),
    .d({_al_u2888_o,counter[0]}),
    .f({mux14_b11_sel_is_2_o,_al_u2909_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3065|_al_u2844  (
    .b({open_n2309,_al_u2843_o}),
    .c({_al_u2843_o,counter[0]}),
    .d({_al_u2842_o,_al_u2842_o}),
    .f({_al_u3065_o,_al_u2844_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A*~(~D*~C))"),
    //.LUTF1("(~C*~B*~(~D*A))"),
    //.LUTG0("(B*A*~(~D*~C))"),
    //.LUTG1("(~C*~B*~(~D*A))"),
    .INIT_LUTF0(16'b1000100010000000),
    .INIT_LUTF1(16'b0000001100000001),
    .INIT_LUTG0(16'b1000100010000000),
    .INIT_LUTG1(16'b0000001100000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3067|_al_u3066  (
    .a({_al_u3065_o,_al_u2913_o}),
    .b({_al_u2892_o,_al_u2888_o}),
    .c({_al_u3066_o,counter[0]}),
    .d({counter[0],counter[1]}),
    .f({_al_u3067_o,_al_u3066_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*A*~(D*C))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000100010001000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3069|_al_u3068  (
    .a({open_n2358,_al_u2886_o}),
    .b({_al_u3067_o,_al_u2888_o}),
    .c({_al_u3068_o,counter[0]}),
    .d({_al_u3064_o,counter[1]}),
    .f({_al_u3069_o,_al_u3068_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3070|_al_u2928  (
    .b({_al_u2918_o,open_n2381}),
    .c({_al_u2928_o,_al_u2926_o}),
    .d({_al_u3069_o,_al_u2894_o}),
    .f({_al_u3070_o,_al_u2928_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3072|_al_u3071  (
    .c({_al_u3071_o,_al_u2926_o}),
    .d({_al_u2933_o,_al_u2884_o}),
    .f({_al_u3072_o,_al_u3071_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3073|_al_u3255  (
    .c({_al_u3072_o,mux67_b0_sel_is_2_o}),
    .d({_al_u3070_o,n247[7]}),
    .f({_al_u3073_o,n258[7]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3075|_al_u3074  (
    .c({_al_u3074_o,_al_u2926_o}),
    .d({_al_u3073_o,_al_u2949_o}),
    .f({_al_u3075_o,_al_u3074_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3077|_al_u3076  (
    .b({open_n2484,_al_u2887_o}),
    .c({_al_u2977_o,_al_u2975_o}),
    .d({_al_u3076_o,_al_u2949_o}),
    .f({_al_u3077_o,_al_u3076_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3080|_al_u3079  (
    .c({_al_u3079_o,_al_u2975_o}),
    .d({_al_u3078_o,_al_u2899_o}),
    .f({_al_u3080_o,_al_u3079_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111001111000000),
    .MODE("LOGIC"))
    \_al_u3084|_al_u2914  (
    .b({_al_u3005_o,open_n2531}),
    .c({_al_u2897_o,_al_u2913_o}),
    .d({_al_u3083_o,_al_u2897_o}),
    .f({_al_u3084_o,_al_u2914_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3085|_al_u3015  (
    .c({_al_u3015_o,_al_u3010_o}),
    .d({_al_u3011_o,_al_u2925_o}),
    .f({_al_u3085_o,_al_u3015_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3086|_al_u3087  (
    .b({open_n2582,_al_u3008_o}),
    .c({_al_u3014_o,counter[0]}),
    .d({_al_u3085_o,_al_u3086_o}),
    .f({_al_u3086_o,_al_u3087_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3090|_al_u3007  (
    .b({_al_u3007_o,open_n2605}),
    .c({_al_u3089_o,_al_u2993_o}),
    .d({_al_u3088_o,_al_u2904_o}),
    .f({_al_u3090_o,_al_u3007_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*~(~C*~B)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(A*~(D*~(~C*~B)))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001010101010),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001010101010),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3092|_al_u3508  (
    .a({open_n2626,_al_u3090_o}),
    .b({open_n2627,_al_u2989_o}),
    .c({_al_u3091_o,_al_u2842_o}),
    .d({_al_u3090_o,_al_u2993_o}),
    .f({_al_u3092_o,_al_u3508_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3093|_al_u3413  (
    .b({_al_u3087_o,_al_u3087_o}),
    .c({_al_u3092_o,_al_u3013_o}),
    .d({_al_u3084_o,mux120_b7_sel_is_2_o}),
    .f({_al_u3093_o,_al_u3413_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~D*~(C*~B))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"))
    \_al_u3095|_al_u3094  (
    .b({_al_u2953_o,_al_u2842_o}),
    .c({_al_u3010_o,_al_u3010_o}),
    .d({_al_u3094_o,_al_u2904_o}),
    .f({_al_u3095_o,_al_u3094_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u3096 (
    .c({open_n2700,_al_u3095_o}),
    .d({open_n2703,_al_u3093_o}),
    .f({open_n2721,_al_u3096_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3097|_al_u3103  (
    .b({open_n2729,mux135_b11_sel_is_0_o}),
    .c({_al_u3031_o,_al_u3102_o}),
    .d({_al_u3096_o,_al_u3097_o}),
    .f({_al_u3097_o,_al_u3103_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3100|_al_u3099  (
    .c({_al_u3099_o,_al_u3026_o}),
    .d({_al_u3098_o,_al_u2949_o}),
    .f({mux135_b11_sel_is_0_o,_al_u3099_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(C*~(~B*~D))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b1111000011000000),
    .MODE("LOGIC"))
    \_al_u3105|_al_u3165  (
    .b({_al_u2894_o,_al_u2894_o}),
    .c({_al_u2885_o,_al_u3026_o}),
    .d({_al_u2925_o,_al_u2925_o}),
    .f({_al_u3105_o,_al_u3165_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*~D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1100110011000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3106|_al_u3104  (
    .b({_al_u3104_o,_al_u3026_o}),
    .c({_al_u3105_o,_al_u2842_o}),
    .d({_al_u3103_o,_al_u2904_o}),
    .f({_al_u3106_o,_al_u3104_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3109|_al_u3110  (
    .c({_al_u3108_o,_al_u3052_o}),
    .d({_al_u3106_o,_al_u3109_o}),
    .f({_al_u3109_o,_al_u3110_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3112|_al_u3111  (
    .c({_al_u3111_o,_al_u3046_o}),
    .d({_al_u3110_o,_al_u2904_o}),
    .f({_al_u3112_o,_al_u3111_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~(B*~(~D*A)))"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000001100001011),
    .MODE("LOGIC"))
    \_al_u3114|_al_u3113  (
    .a({_al_u3112_o,open_n2866}),
    .b({n377_lutinv,_al_u3046_o}),
    .c({n376_lutinv,counter[0]}),
    .d({_al_u3113_o,_al_u2842_o}),
    .f({_al_u3114_o,_al_u3113_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3116|_al_u3115  (
    .b({open_n2889,_al_u3046_o}),
    .c({_al_u3115_o,counter[0]}),
    .d({_al_u3111_o,_al_u2842_o}),
    .f({mux174_b0_sel_is_0_o,_al_u3115_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3117|_al_u3525  (
    .c({_al_u3113_o,state_next[1]}),
    .d({mux174_b0_sel_is_0_o,_al_u3113_o}),
    .f({_al_u3117_o,_al_u3525_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3120|_al_u3005  (
    .c({_al_u2888_o,_al_u2993_o}),
    .d({_al_u2886_o,_al_u2886_o}),
    .f({_al_u3120_o,_al_u3005_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3121|_al_u3390  (
    .b({open_n2964,_al_u3057_o}),
    .c({_al_u3120_o,_al_u3120_o}),
    .d({n186[0],n187[3]}),
    .f({_al_u3121_o,n193[4]}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3123|_al_u3122  (
    .b({open_n2991,_al_u2949_o}),
    .c({mux13_b2_sel_is_2_o,mux9_b12_sel_is_2_o}),
    .d({_al_u3122_o,_al_u3121_o}),
    .f({n197[2],_al_u3122_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3125|_al_u3124  (
    .c({_al_u3124_o,_al_u2915_o}),
    .d({_al_u2916_o,_al_u2884_o}),
    .f({mux19_b2_sel_is_0_o,_al_u3124_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3126|_al_u3063  (
    .b({mux19_b2_sel_is_0_o,open_n3038}),
    .c({mux16_b1_sel_is_0_o,mux14_b11_sel_is_2_o}),
    .d({n197[2],mux16_b1_sel_is_0_o}),
    .f({n214[2],mux16_b11_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3127|_al_u2932  (
    .b({_al_u3074_o,_al_u2891_o}),
    .c({_al_u2932_o,_al_u2926_o}),
    .d({_al_u3072_o,_al_u2887_o}),
    .f({mux38_b12_sel_is_2_o,_al_u2932_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3128|_al_u3488  (
    .b({open_n3087,_al_u2929_o}),
    .c({_al_u2929_o,_al_u2922_o}),
    .d({mux38_b12_sel_is_2_o,_al_u3487_o}),
    .f({mux38_b1_sel_is_2_o,_al_u3488_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~C*~D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011001100110000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3129|_al_u3130  (
    .b({open_n3110,_al_u2939_o}),
    .c({mux38_b1_sel_is_2_o,_al_u3074_o}),
    .d({n214[2],_al_u3129_o}),
    .f({_al_u3129_o,n227[2]}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3131|_al_u3495  (
    .b({open_n3133,_al_u2956_o}),
    .c({mux52_b1_sel_is_2_o,_al_u3494_o}),
    .d({mux60_b10_sel_is_2_o,_al_u3489_o}),
    .f({mux60_b1_sel_is_2_o,_al_u3495_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3132|_al_u3493  (
    .a({open_n3154,mux47_b1_sel_is_2_o}),
    .b({open_n3155,_al_u3492_o}),
    .c({_al_u2946_o,_al_u2946_o}),
    .d({mux60_b1_sel_is_2_o,_al_u2947_o}),
    .f({_al_u3132_o,_al_u3493_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3133|_al_u2947  (
    .c({_al_u2947_o,_al_u2945_o}),
    .d({mux47_b1_sel_is_2_o,_al_u2894_o}),
    .f({mux48_b1_sel_is_2_o,_al_u2947_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(B*~(D*~(C*A)))"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b1000000011001100),
    .MODE("LOGIC"))
    \_al_u3135|_al_u3134  (
    .a({n227[2],open_n3204}),
    .b({_al_u3132_o,_al_u2941_o}),
    .c({mux48_b1_sel_is_2_o,counter[0]}),
    .d({_al_u3134_o,_al_u2947_o}),
    .f({_al_u3135_o,_al_u3134_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D)"),
    //.LUTF1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D)"),
    //.LUTG1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUTF0(16'b0011001010101010),
    .INIT_LUTF1(16'b0000001111001111),
    .INIT_LUTG0(16'b0011001010101010),
    .INIT_LUTG1(16'b0000001111001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3137|_al_u3136  (
    .a({open_n3225,_al_u3135_o}),
    .b({_al_u2963_o,_al_u2904_o}),
    .c({_al_u3136_o,_al_u2907_o}),
    .d({_al_u2925_o,_al_u2945_o}),
    .f({_al_u3137_o,_al_u3136_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3140|_al_u3139  (
    .c({_al_u3139_o,_al_u2963_o}),
    .d({_al_u3138_o,_al_u2949_o}),
    .f({mux70_b2_sel_is_0_o,_al_u3139_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3141|_al_u2968  (
    .c({_al_u2968_o,_al_u2963_o}),
    .d({mux70_b2_sel_is_0_o,_al_u2898_o}),
    .f({_al_u3141_o,_al_u2968_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3145|_al_u3143  (
    .c({_al_u3144_o,_al_u2963_o}),
    .d({_al_u3143_o,_al_u2904_o}),
    .f({_al_u3145_o,_al_u3143_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3147|_al_u3146  (
    .b({_al_u3145_o,open_n3336}),
    .c({_al_u3146_o,_al_u2963_o}),
    .d({_al_u3142_o,_al_u2938_o}),
    .f({_al_u3147_o,_al_u3146_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3149|_al_u3081  (
    .a({mux92_b0_sel_is_0_o,mux92_b0_sel_is_0_o}),
    .b({_al_u3080_o,_al_u3077_o}),
    .c({mux97_b15_sel_is_2_o,_al_u3080_o}),
    .d({_al_u2990_o,_al_u2990_o}),
    .f({mux97_b5_sel_is_2_o,_al_u3081_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~(B)*~(C)+~D*B*~(C)+~(~D)*B*C+~D*B*C)"),
    //.LUTF1("(B*~(~C*D))"),
    //.LUTG0("~(~D*~(B)*~(C)+~D*B*~(C)+~(~D)*B*C+~D*B*C)"),
    //.LUTG1("(B*~(~C*D))"),
    .INIT_LUTF0(16'b0011111100110000),
    .INIT_LUTF1(16'b1100000011001100),
    .INIT_LUTG0(16'b0011111100110000),
    .INIT_LUTG1(16'b1100000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3150|_al_u3148  (
    .b({mux97_b5_sel_is_2_o,_al_u2884_o}),
    .c({_al_u2977_o,_al_u2975_o}),
    .d({_al_u3148_o,_al_u3147_o}),
    .f({_al_u3150_o,_al_u3148_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3152|_al_u3088  (
    .c({_al_u3088_o,_al_u2993_o}),
    .d({_al_u3151_o,_al_u2938_o}),
    .f({_al_u3152_o,_al_u3088_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3154|_al_u3153  (
    .c({_al_u3153_o,_al_u3010_o}),
    .d({_al_u3024_o,_al_u2949_o}),
    .f({mux119_b3_sel_is_0_o,_al_u3153_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3157|_al_u3156  (
    .b({open_n3465,counter[0]}),
    .c({_al_u3156_o,counter[1]}),
    .d({mux119_b3_sel_is_0_o,_al_u3155_o}),
    .f({mux120_b3_sel_is_2_o,_al_u3156_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3159|_al_u3158  (
    .b({open_n3492,_al_u2891_o}),
    .c({_al_u3158_o,_al_u3010_o}),
    .d({mux120_b3_sel_is_2_o,_al_u2887_o}),
    .f({mux120_b7_sel_is_2_o,_al_u3158_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3161|_al_u3160  (
    .b({open_n3515,counter[0]}),
    .c({_al_u3160_o,counter[1]}),
    .d({mux120_b7_sel_is_2_o,_al_u3155_o}),
    .f({mux121_b7_sel_is_2_o,_al_u3160_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~D*C*B*A)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"))
    \_al_u3163|_al_u3162  (
    .a({_al_u3152_o,open_n3536}),
    .b({mux121_b7_sel_is_2_o,open_n3537}),
    .c({mux115_b2_sel_is_2_o,counter[1]}),
    .d({_al_u3162_o,_al_u3155_o}),
    .f({_al_u3163_o,_al_u3162_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~D*C*~(~B*~A))"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000011100000),
    .MODE("LOGIC"))
    \_al_u3168|_al_u3164  (
    .a({_al_u3163_o,open_n3558}),
    .b({_al_u3164_o,open_n3559}),
    .c({mux129_b8_sel_is_2_o,counter[0]}),
    .d({_al_u3167_o,_al_u3162_o}),
    .f({_al_u3168_o,_al_u3164_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3170|_al_u3098  (
    .c({_al_u3098_o,_al_u3026_o}),
    .d({_al_u3102_o,_al_u2898_o}),
    .f({mux136_b1_sel_is_0_o,_al_u3098_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3171|_al_u3102  (
    .c({counter[0],counter[0]}),
    .d({_al_u3101_o,_al_u3101_o}),
    .f({_al_u3171_o,_al_u3102_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3175|_al_u3174  (
    .b({_al_u3174_o,_al_u2908_o}),
    .c({_al_u3026_o,_al_u3026_o}),
    .d({_al_u2904_o,_al_u2907_o}),
    .f({mux141_b1_sel_is_2_o,_al_u3174_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~D*~(C*B))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~D*~(C*B))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000111111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3178|_al_u3177  (
    .b({_al_u2894_o,_al_u2925_o}),
    .c({_al_u2885_o,_al_u2885_o}),
    .d({_al_u3177_o,_al_u2884_o}),
    .f({mux146_b12_sel_is_2_o,_al_u3177_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3179|_al_u3176  (
    .c({mux146_b12_sel_is_2_o,_al_u2885_o}),
    .d({_al_u3176_o,_al_u2914_o}),
    .f({mux147_b12_sel_is_2_o,_al_u3176_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1111110000110000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1111110000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3181|_al_u3180  (
    .a({open_n3712,mux137_b2_sel_is_2_o}),
    .b({_al_u3180_o,mux141_b1_sel_is_2_o}),
    .c({_al_u3176_o,mux147_b12_sel_is_2_o}),
    .d({_al_u3169_o,_al_u3104_o}),
    .f({_al_u3181_o,_al_u3180_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3183|_al_u3182  (
    .c({_al_u3182_o,_al_u2894_o}),
    .d({_al_u3047_o,_al_u3046_o}),
    .f({_al_u3183_o,_al_u3182_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3185|_al_u3184  (
    .c({_al_u3184_o,_al_u2884_o}),
    .d({_al_u3183_o,_al_u3046_o}),
    .f({_al_u3185_o,_al_u3184_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3186|_al_u3108  (
    .c({counter[0],counter[0]}),
    .d({_al_u3107_o,_al_u3107_o}),
    .f({_al_u3186_o,_al_u3108_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3187|_al_u3617  (
    .c({_al_u3186_o,_al_u3278_o}),
    .d({_al_u3185_o,_al_u3185_o}),
    .f({_al_u3187_o,_al_u3617_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3190|_al_u3189  (
    .b({open_n3847,_al_u2891_o}),
    .c({_al_u3189_o,_al_u2885_o}),
    .d({_al_u3188_o,_al_u2887_o}),
    .f({mux150_b0_sel_is_2_o,_al_u3189_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3192|_al_u3191  (
    .c({_al_u3191_o,_al_u2885_o}),
    .d({mux150_b0_sel_is_2_o,_al_u2935_o}),
    .f({mux152_b0_sel_is_2_o,_al_u3191_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3194|_al_u3107  (
    .b({_al_u3193_o,open_n3894}),
    .c({_al_u3107_o,_al_u2885_o}),
    .d({_al_u3034_o,_al_u2842_o}),
    .f({_al_u3194_o,_al_u3107_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~A*~(~D*B)))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(C*~(~A*~(~D*B)))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b1010000011100000),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b1010000011100000),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3196|_al_u3195  (
    .a({open_n3919,_al_u2907_o}),
    .b({_al_u3195_o,_al_u2908_o}),
    .c({_al_u2885_o,_al_u2885_o}),
    .d({_al_u2904_o,counter[0]}),
    .f({_al_u3196_o,_al_u3195_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3198|_al_u3199  (
    .b({_al_u3187_o,_al_u3046_o}),
    .c({_al_u3197_o,_al_u2891_o}),
    .d({_al_u3181_o,_al_u3198_o}),
    .f({_al_u3198_o,_al_u3199_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(C*~(~D*B)))"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111101010111010),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3200|reg2_b2  (
    .a({open_n3970,_al_u3200_o}),
    .b({_al_u3118_o,_al_u3241_o}),
    .c({mux170_b2_sel_is_2_o,n377_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3199_o,_al_u3113_o}),
    .sr(reset_n),
    .f({_al_u3200_o,open_n3984}),
    .q({open_n3988,data_in_bus[2]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3202|_al_u2889  (
    .c({_al_u3201_o,_al_u2888_o}),
    .d({_al_u2889_o,_al_u2887_o}),
    .f({_al_u3202_o,_al_u2889_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3205|_al_u3204  (
    .c({_al_u3124_o,_al_u2915_o}),
    .d({_al_u3204_o,_al_u2925_o}),
    .f({_al_u3205_o,_al_u3204_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~B*D))"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b0000110000001111),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u3206|_al_u3203  (
    .b({_al_u3205_o,_al_u2900_o}),
    .c({_al_u2909_o,_al_u2906_o}),
    .d({_al_u3203_o,_al_u3202_o}),
    .f({_al_u3206_o,_al_u3203_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3208|_al_u3207  (
    .c({_al_u3207_o,_al_u2915_o}),
    .d({_al_u3206_o,_al_u2887_o}),
    .f({_al_u3208_o,_al_u3207_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3210|_al_u3209  (
    .b({_al_u2920_o,open_n4093}),
    .c({_al_u3209_o,_al_u2915_o}),
    .d({_al_u3208_o,_al_u2936_o}),
    .f({_al_u3210_o,_al_u3209_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3212|_al_u3211  (
    .c({_al_u2929_o,counter[0]}),
    .d({_al_u3211_o,_al_u2930_o}),
    .f({mux33_b0_sel_is_2_o,_al_u3211_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(B*~(~C*A)))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~(B*~(~C*A)))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000111011),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000111011),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3213|_al_u3370  (
    .a({open_n4142,_al_u3369_o}),
    .b({open_n4143,mux33_b0_sel_is_2_o}),
    .c({mux33_b0_sel_is_2_o,_al_u2930_o}),
    .d({_al_u3210_o,_al_u2927_o}),
    .f({_al_u3213_o,_al_u3370_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(C*B*~(~D*~A))"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(C*B*~(~D*~A))"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b1100000010000000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b1100000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3215|_al_u3214  (
    .a({_al_u3214_o,open_n4168}),
    .b({mux49_b0_sel_is_2_o,_al_u2891_o}),
    .c({mux52_b1_sel_is_2_o,_al_u2926_o}),
    .d({_al_u3074_o,_al_u3213_o}),
    .f({_al_u3215_o,_al_u3214_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3216|_al_u3083  (
    .b({open_n4195,_al_u3081_o}),
    .c({_al_u3081_o,mux97_b15_sel_is_2_o}),
    .d({_al_u3215_o,_al_u3075_o}),
    .f({_al_u3216_o,_al_u3083_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3217|_al_u2997  (
    .c({_al_u2997_o,_al_u2993_o}),
    .d({_al_u3216_o,_al_u2925_o}),
    .f({_al_u3217_o,_al_u2997_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3219|_al_u3218  (
    .b({open_n4242,counter[0]}),
    .c({_al_u3218_o,counter[1]}),
    .d({_al_u2994_o,_al_u3005_o}),
    .f({_al_u3219_o,_al_u3218_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3222|_al_u3221  (
    .b({_al_u3219_o,open_n4265}),
    .c({_al_u3221_o,counter[0]}),
    .d({_al_u3217_o,_al_u3220_o}),
    .f({_al_u3222_o,_al_u3221_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3224|_al_u3223  (
    .b({open_n4292,_al_u2903_o}),
    .c({_al_u3020_o,_al_u2993_o}),
    .d({_al_u3223_o,_al_u3222_o}),
    .f({_al_u3224_o,_al_u3223_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3225|_al_u3511  (
    .c({_al_u3156_o,_al_u3156_o}),
    .d({_al_u3224_o,_al_u3162_o}),
    .f({_al_u3225_o,_al_u3511_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*~D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(~C*~(B*~D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000111100000011),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000111100000011),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3226|_al_u3437  (
    .b({_al_u3094_o,mux130_b1_sel_is_2_o}),
    .c({_al_u3030_o,_al_u3030_o}),
    .d({_al_u3225_o,_al_u3436_o}),
    .f({_al_u3226_o,_al_u3437_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3228|_al_u3227  (
    .c({_al_u3227_o,_al_u3026_o}),
    .d({_al_u3099_o,_al_u2887_o}),
    .f({_al_u3228_o,_al_u3227_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3229|_al_u3230  (
    .b({open_n4393,_al_u2905_o}),
    .c({_al_u3228_o,_al_u3026_o}),
    .d({_al_u3226_o,_al_u3229_o}),
    .f({_al_u3229_o,_al_u3230_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~A*~(D*C))"),
    //.LUT1("(D*~(~C*B))"),
    .INIT_LUT0(16'b0000000100010001),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"))
    \_al_u3231|_al_u3232  (
    .a({open_n4414,_al_u3231_o}),
    .b({_al_u2885_o,_al_u3044_o}),
    .c({_al_u2894_o,_al_u2907_o}),
    .d({_al_u3230_o,_al_u2885_o}),
    .f({_al_u3231_o,_al_u3232_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3233|_al_u3519  (
    .c({_al_u3108_o,_al_u3195_o}),
    .d({_al_u3232_o,_al_u3108_o}),
    .f({_al_u3233_o,_al_u3519_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*~D))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(B*~(~C*~D))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1100110011000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1100110011000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3236|_al_u3235  (
    .b({_al_u3234_o,_al_u3046_o}),
    .c({_al_u3235_o,_al_u2891_o}),
    .d({_al_u3233_o,_al_u2914_o}),
    .f({_al_u3236_o,_al_u3235_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3238|_al_u3237  (
    .c({_al_u3237_o,counter[0]}),
    .d({_al_u3052_o,_al_u3050_o}),
    .f({mux170_b10_sel_is_0_o,_al_u3237_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*~D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(B*~(~C*~D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1100110011000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1100110011000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3240|_al_u3239  (
    .b({_al_u3239_o,_al_u3046_o}),
    .c({_al_u3111_o,_al_u2907_o}),
    .d({mux170_b10_sel_is_0_o,_al_u2938_o}),
    .f({_al_u3240_o,_al_u3239_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3241|_al_u3361  (
    .c({_al_u3240_o,_al_u3047_o}),
    .d({_al_u3236_o,_al_u3360_o}),
    .f({_al_u3241_o,_al_u3361_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~(C*B*A))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000001111111),
    .MODE("LOGIC"))
    \_al_u3244|_al_u2911  (
    .a({_al_u3058_o,open_n4559}),
    .b({n190[7],open_n4560}),
    .c({mux14_b11_sel_is_2_o,_al_u2888_o}),
    .d({_al_u2911_o,_al_u2842_o}),
    .f({_al_u3244_o,_al_u2911_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3246|_al_u3245  (
    .c({_al_u3245_o,_al_u2915_o}),
    .d({_al_u2918_o,_al_u2949_o}),
    .f({mux22_b11_sel_is_2_o,_al_u3245_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3247|_al_u3059  (
    .c({_al_u3059_o,_al_u2915_o}),
    .d({_al_u3205_o,_al_u2894_o}),
    .f({mux18_b6_sel_is_2_o,_al_u3059_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u3248|_al_u3368  (
    .b({mux22_b11_sel_is_2_o,open_n4635}),
    .c({mux18_b6_sel_is_2_o,_al_u3124_o}),
    .d({_al_u3244_o,_al_u3367_o}),
    .f({n210[7],_al_u3368_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B*~(~D*~A)))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*~(B*~(~D*~A)))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000001100000111),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000001100000111),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3249|_al_u3250  (
    .a({open_n4656,_al_u3249_o}),
    .b({_al_u2922_o,mux38_b12_sel_is_2_o}),
    .c({mux33_b0_sel_is_2_o,_al_u3074_o}),
    .d({n210[7],_al_u2927_o}),
    .f({_al_u3249_o,_al_u3250_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(~D*~(C*~B))"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3251|_al_u3313  (
    .b({_al_u2935_o,_al_u2935_o}),
    .c({_al_u2926_o,_al_u2915_o}),
    .d({_al_u3250_o,n205[3]}),
    .f({n225[7],n208[3]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~D*~C*B*A)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~D*~C*B*A)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000001000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3254|_al_u3253  (
    .a({n225[7],open_n4707}),
    .b({_al_u3252_o,_al_u2907_o}),
    .c({_al_u3253_o,_al_u2926_o}),
    .d({_al_u2946_o,_al_u2938_o}),
    .f({n247[7],_al_u3253_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3257|_al_u3256  (
    .c({_al_u3256_o,_al_u2963_o}),
    .d({_al_u3145_o,_al_u2842_o}),
    .f({_al_u3257_o,_al_u3256_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3259|_al_u3335  (
    .c({_al_u3076_o,_al_u2984_o}),
    .d({_al_u3080_o,_al_u3334_o}),
    .f({mux89_b1_sel_is_2_o,_al_u3335_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u3260|_al_u3258  (
    .a({_al_u3257_o,mux92_b0_sel_is_0_o}),
    .b({_al_u3258_o,_al_u2990_o}),
    .c({mux89_b1_sel_is_2_o,_al_u2984_o}),
    .d({mux84_b4_sel_is_2_o,_al_u2980_o}),
    .f({mux92_b7_sel_is_2_o,_al_u3258_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3261|_al_u3262  (
    .c({mux92_b7_sel_is_2_o,_al_u3001_o}),
    .d({n258[7],n275[7]}),
    .f({n275[7],_al_u3262_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*~B))"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1100111100000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3265|_al_u3263  (
    .b({open_n4834,_al_u2897_o}),
    .c({_al_u3264_o,_al_u2993_o}),
    .d({_al_u3263_o,_al_u3262_o}),
    .f({_al_u3265_o,_al_u3263_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3266|_al_u3018  (
    .c({_al_u3012_o,_al_u3017_o}),
    .d({_al_u3265_o,_al_u3012_o}),
    .f({_al_u3266_o,mux115_b2_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3267|_al_u3510  (
    .c({mux121_b7_sel_is_2_o,_al_u3153_o}),
    .d({_al_u3266_o,_al_u3509_o}),
    .f({_al_u3267_o,_al_u3510_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(B*~(~C*~(~D*A)))"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100000011001000),
    .MODE("LOGIC"))
    \_al_u3269|_al_u3268  (
    .a({_al_u3267_o,open_n4907}),
    .b({mux129_b8_sel_is_2_o,_al_u3010_o}),
    .c({_al_u3268_o,counter[0]}),
    .d({_al_u3167_o,_al_u2842_o}),
    .f({_al_u3269_o,_al_u3268_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3271|_al_u3270  (
    .b({open_n4930,_al_u2925_o}),
    .c({_al_u3027_o,_al_u3026_o}),
    .d({_al_u3270_o,_al_u3269_o}),
    .f({_al_u3271_o,_al_u3270_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3273|_al_u3272  (
    .b({_al_u3171_o,_al_u2907_o}),
    .c({_al_u3272_o,_al_u3026_o}),
    .d({_al_u3271_o,_al_u2904_o}),
    .f({_al_u3273_o,_al_u3272_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3274|_al_u3536  (
    .c({mux146_b12_sel_is_2_o,mux85_b0_sel_is_2_o}),
    .d({_al_u3273_o,_al_u3535_o}),
    .f({_al_u3274_o,_al_u3536_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3275|_al_u3188  (
    .c({_al_u3188_o,_al_u2885_o}),
    .d({_al_u3274_o,_al_u2949_o}),
    .f({_al_u3275_o,_al_u3188_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~A*~(D)*~(C)+~A*D*~(C)+~(~A)*D*C+~A*D*C))"),
    //.LUT1("(~B*~(~C*~D))"),
    .INIT_LUT0(16'b0000001000110010),
    .INIT_LUT1(16'b0011001100110000),
    .MODE("LOGIC"))
    \_al_u3279|_al_u3277  (
    .a({open_n5025,_al_u3275_o}),
    .b({_al_u3278_o,_al_u3276_o}),
    .c({_al_u3195_o,_al_u3040_o}),
    .d({_al_u3277_o,counter[0]}),
    .f({_al_u3279_o,_al_u3277_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3280|_al_u3549  (
    .b({open_n5048,_al_u3235_o}),
    .c({_al_u3184_o,_al_u3423_o}),
    .d({_al_u3235_o,_al_u3548_o}),
    .f({_al_u3280_o,_al_u3549_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3281|_al_u3282  (
    .b({_al_u3280_o,mux170_b2_sel_is_2_o}),
    .c({_al_u3047_o,_al_u3111_o}),
    .d({_al_u3279_o,_al_u3281_o}),
    .f({_al_u3281_o,_al_u3282_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~A*~(C*~(~D*B)))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("~(~A*~(C*~(~D*B)))"),
    //.LUTG1("(~C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111101010111010),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111101010111010),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3283|reg2_b7  (
    .a({open_n5091,_al_u3283_o}),
    .b({n378_lutinv,_al_u3302_o}),
    .c({_al_u3113_o,n377_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3282_o,_al_u3113_o}),
    .sr(reset_n),
    .f({_al_u3283_o,open_n5109}),
    .q({open_n5113,data_in_bus[7]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3285|_al_u3284  (
    .c({_al_u3284_o,counter[0]}),
    .d({_al_u2922_o,_al_u2930_o}),
    .f({mux30_b1_sel_is_2_o,_al_u3284_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3288|_al_u3287  (
    .b({_al_u3286_o,counter[0]}),
    .c({_al_u3287_o,counter[1]}),
    .d({mux30_b1_sel_is_2_o,_al_u2923_o}),
    .f({mux30_b12_sel_is_2_o,_al_u3287_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3291|_al_u3290  (
    .b({open_n5162,_al_u2949_o}),
    .c({_al_u3067_o,_al_u2888_o}),
    .d({_al_u3290_o,_al_u2898_o}),
    .f({_al_u3291_o,_al_u3290_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3293|_al_u3292  (
    .b({_al_u2984_o,open_n5185}),
    .c({_al_u2980_o,counter[0]}),
    .d({_al_u3292_o,_al_u3256_o}),
    .f({_al_u3293_o,_al_u3292_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3294|_al_u3289  (
    .a({open_n5206,mux30_b12_sel_is_2_o}),
    .b({_al_u3291_o,mux33_b0_sel_is_2_o}),
    .c({_al_u3293_o,_al_u2976_o}),
    .d({_al_u3289_o,_al_u2945_o}),
    .f({_al_u3294_o,_al_u3289_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3295|_al_u2916  (
    .b({_al_u2917_o,open_n5233}),
    .c({_al_u3124_o,_al_u2915_o}),
    .d({_al_u2916_o,_al_u2914_o}),
    .f({_al_u3295_o,_al_u2916_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3298|_al_u3297  (
    .a({open_n5254,_al_u3294_o}),
    .b({_al_u2996_o,mux47_b0_sel_is_2_o}),
    .c({mux97_b15_sel_is_2_o,_al_u3296_o}),
    .d({_al_u3297_o,_al_u2963_o}),
    .f({_al_u3298_o,_al_u3297_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(~C*B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3300|_al_u3299  (
    .b({open_n5281,_al_u3220_o}),
    .c({_al_u3090_o,counter[0]}),
    .d({_al_u3299_o,_al_u3298_o}),
    .f({_al_u3300_o,_al_u3299_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3302|_al_u3301  (
    .c({_al_u3111_o,_al_u3052_o}),
    .d({_al_u3301_o,_al_u3300_o}),
    .f({_al_u3302_o,_al_u3301_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~B*~A*~(D*~C))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0001000000010001),
    .MODE("LOGIC"))
    \_al_u3305|_al_u3304  (
    .a({_al_u2844_o,open_n5334}),
    .b({_al_u2895_o,_al_u2925_o}),
    .c({_al_u2890_o,_al_u2888_o}),
    .d({_al_u3304_o,_al_u2884_o}),
    .f({n187[3],_al_u3304_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~C*B*~D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000000001100),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000000001100),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3306|_al_u3243  (
    .b({open_n5357,_al_u3067_o}),
    .c({n187[3],_al_u2844_o}),
    .d({_al_u2889_o,_al_u2889_o}),
    .f({n189[3],n190[7]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3307|_al_u3056  (
    .c({mux14_b11_sel_is_2_o,_al_u2888_o}),
    .d({_al_u3056_o,_al_u2989_o}),
    .f({mux14_b0_sel_is_2_o,_al_u3056_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(B*~(~D*~(C*A)))"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(B*~(~D*~(C*A)))"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1100110010000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1100110010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3309|_al_u3308  (
    .a({n189[3],open_n5410}),
    .b({mux14_b0_sel_is_2_o,_al_u2888_o}),
    .c({mux9_b12_sel_is_2_o,counter[0]}),
    .d({_al_u3308_o,_al_u2899_o}),
    .f({n198[3],_al_u3308_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3310|_al_u2902  (
    .b({open_n5437,n186[0]}),
    .c({_al_u3059_o,mux9_b12_sel_is_2_o}),
    .d({n198[3],mux5_b5_sel_is_2_o}),
    .f({n200[3],_al_u2902_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3312|_al_u3311  (
    .b({_al_u3311_o,open_n5464}),
    .c({_al_u3124_o,_al_u2915_o}),
    .d({n200[3],_al_u2891_o}),
    .f({n205[3],_al_u3311_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3315|_al_u2930  (
    .b({_al_u2920_o,open_n5487}),
    .c({_al_u2930_o,_al_u2915_o}),
    .d({mux38_b1_sel_is_2_o,_al_u2842_o}),
    .f({_al_u3315_o,_al_u2930_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*B))"),
    //.LUTF1("~(~C*~((~D*~A))*~(B)+~C*(~D*~A)*~(B)+~(~C)*(~D*~A)*B+~C*(~D*~A)*B)"),
    //.LUTG0("(D*~(~C*B))"),
    //.LUTG1("~(~C*~((~D*~A))*~(B)+~C*(~D*~A)*~(B)+~(~C)*(~D*~A)*B+~C*(~D*~A)*B)"),
    .INIT_LUTF0(16'b1111001100000000),
    .INIT_LUTF1(16'b1111110010111000),
    .INIT_LUTG0(16'b1111001100000000),
    .INIT_LUTG1(16'b1111110010111000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3317|_al_u3314  (
    .a({_al_u3314_o,open_n5512}),
    .b({_al_u3315_o,_al_u2923_o}),
    .c({_al_u3074_o,counter[1]}),
    .d({_al_u3316_o,n208[3]}),
    .f({_al_u3317_o,_al_u3314_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~(~D*~(~B*A)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~(~D*~(~B*A)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000010),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3320|_al_u3319  (
    .a({_al_u3317_o,open_n5537}),
    .b({_al_u3318_o,open_n5538}),
    .c({_al_u3253_o,_al_u2926_o}),
    .d({_al_u3319_o,_al_u2989_o}),
    .f({_al_u3320_o,_al_u3319_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3321|_al_u3330  (
    .c({_al_u2941_o,mux61_b3_sel_is_2_o}),
    .d({_al_u3320_o,_al_u3327_o}),
    .f({_al_u3321_o,_al_u3330_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3324|_al_u3322  (
    .b({open_n5589,_al_u2891_o}),
    .c({_al_u3323_o,_al_u2963_o}),
    .d({_al_u3322_o,_al_u2914_o}),
    .f({mux68_b1_sel_is_2_o,_al_u3322_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3326|_al_u3325  (
    .b({open_n5612,_al_u2894_o}),
    .c({_al_u3325_o,_al_u2963_o}),
    .d({mux68_b1_sel_is_2_o,_al_u2925_o}),
    .f({_al_u3326_o,_al_u3325_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3327|_al_u3491  (
    .c({_al_u2959_o,_al_u3325_o}),
    .d({_al_u3326_o,_al_u2959_o}),
    .f({_al_u3327_o,_al_u3491_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*~(C*~B)))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(A*~(D*~(C*~B)))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0010000010101010),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0010000010101010),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3328|_al_u3329  (
    .a({open_n5661,mux57_b3_sel_is_2_o}),
    .b({open_n5662,_al_u2904_o}),
    .c({_al_u2956_o,_al_u2953_o}),
    .d({_al_u2952_o,_al_u2945_o}),
    .f({mux57_b3_sel_is_2_o,mux61_b3_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3331|_al_u3398  (
    .b({_al_u3330_o,_al_u2946_o}),
    .c({_al_u2946_o,_al_u3397_o}),
    .d({_al_u3321_o,_al_u3134_o}),
    .f({_al_u3331_o,_al_u3398_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3333|_al_u3332  (
    .b({mux70_b2_sel_is_0_o,open_n5715}),
    .c({_al_u3332_o,_al_u2963_o}),
    .d({_al_u3331_o,_al_u2891_o}),
    .f({_al_u3333_o,_al_u3332_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3334|_al_u2964  (
    .b({_al_u3143_o,open_n5742}),
    .c({_al_u2964_o,_al_u2963_o}),
    .d({_al_u3333_o,_al_u2899_o}),
    .f({_al_u3334_o,_al_u2964_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3337|_al_u3336  (
    .b({_al_u3336_o,open_n5769}),
    .c({_al_u3076_o,_al_u2975_o}),
    .d({_al_u3335_o,_al_u2914_o}),
    .f({_al_u3337_o,_al_u3336_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3338|_al_u3169  (
    .c({mux93_b3_sel_is_2_o,mux132_b0_sel_is_0_o}),
    .d({_al_u3337_o,_al_u3168_o}),
    .f({_al_u3338_o,_al_u3169_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*A*~(D*~C))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1000000010001000),
    .MODE("LOGIC"))
    \_al_u3339|_al_u2995  (
    .a({_al_u3338_o,open_n5822}),
    .b({_al_u3000_o,open_n5823}),
    .c({_al_u2995_o,_al_u2993_o}),
    .d({_al_u2993_o,_al_u2884_o}),
    .f({_al_u3339_o,_al_u2995_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3341|_al_u3340  (
    .b({open_n5846,counter[0]}),
    .c({_al_u3340_o,counter[1]}),
    .d({_al_u3221_o,_al_u3005_o}),
    .f({_al_u3341_o,_al_u3340_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3342|_al_u3089  (
    .b({_al_u3341_o,open_n5873}),
    .c({_al_u3089_o,_al_u2993_o}),
    .d({_al_u3339_o,_al_u2907_o}),
    .f({_al_u3342_o,_al_u3089_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*D))"),
    //.LUTF1("(~B*~(C*~D))"),
    //.LUTG0("(B*~(~C*D))"),
    //.LUTG1("(~B*~(C*~D))"),
    .INIT_LUTF0(16'b1100000011001100),
    .INIT_LUTF1(16'b0011001100000011),
    .INIT_LUTG0(16'b1100000011001100),
    .INIT_LUTG1(16'b0011001100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3344|_al_u3343  (
    .b({_al_u3013_o,_al_u3087_o}),
    .c({_al_u3016_o,_al_u3008_o}),
    .d({_al_u3343_o,_al_u3342_o}),
    .f({_al_u3344_o,_al_u3343_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3346|_al_u3345  (
    .c({_al_u3345_o,_al_u3010_o}),
    .d({_al_u3164_o,_al_u2907_o}),
    .f({mux124_b0_sel_is_0_o,_al_u3345_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3349|_al_u3348  (
    .c({_al_u3348_o,_al_u3026_o}),
    .d({_al_u3094_o,_al_u2894_o}),
    .f({_al_u3349_o,_al_u3348_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3352|_al_u3351  (
    .a({open_n5972,mux124_b11_sel_is_2_o}),
    .b({mux132_b3_sel_is_2_o,mux130_b1_sel_is_2_o}),
    .c({mux137_b2_sel_is_2_o,mux132_b0_sel_is_0_o}),
    .d({_al_u3344_o,mux119_b3_sel_is_0_o}),
    .f({_al_u3352_o,mux132_b3_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3353|_al_u3034  (
    .c({_al_u3034_o,_al_u3026_o}),
    .d({_al_u3352_o,_al_u2938_o}),
    .f({_al_u3353_o,_al_u3034_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3355|_al_u3354  (
    .b({open_n6023,_al_u3026_o}),
    .c({_al_u3354_o,counter[0]}),
    .d({mux147_b12_sel_is_2_o,_al_u2842_o}),
    .f({_al_u3355_o,_al_u3354_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~C*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~B*~(~C*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0011001100110000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0011001100110000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3356|_al_u3613  (
    .b({open_n6046,_al_u3104_o}),
    .c({_al_u3104_o,_al_u3102_o}),
    .d({_al_u3355_o,_al_u3612_o}),
    .f({mux147_b3_sel_is_2_o,_al_u3613_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3357|_al_u3037  (
    .b({mux147_b3_sel_is_2_o,open_n6073}),
    .c({_al_u3037_o,_al_u2885_o}),
    .d({_al_u3353_o,_al_u2891_o}),
    .f({_al_u3357_o,_al_u3037_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~D*~(C*B))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000111111),
    .MODE("LOGIC"))
    \_al_u3358|_al_u3278  (
    .b({_al_u2907_o,_al_u2842_o}),
    .c({_al_u2885_o,_al_u2885_o}),
    .d({_al_u3278_o,_al_u2904_o}),
    .f({mux159_b3_sel_is_2_o,_al_u3278_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3360|_al_u3359  (
    .b({mux159_b3_sel_is_2_o,open_n6118}),
    .c({_al_u3359_o,_al_u2885_o}),
    .d({_al_u3357_o,_al_u2951_o}),
    .f({_al_u3360_o,_al_u3359_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~B*~(D*~C*A))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011000100110011),
    .MODE("LOGIC"))
    \_al_u3363|_al_u3234  (
    .a({_al_u3361_o,open_n6143}),
    .b({_al_u3234_o,open_n6144}),
    .c({_al_u3362_o,_al_u3046_o}),
    .d({mux170_b2_sel_is_2_o,_al_u2949_o}),
    .f({_al_u3363_o,_al_u3234_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*~D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(~C*B*~D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000000000001100),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000000000001100),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3364|_al_u3082  (
    .b({_al_u2991_o,_al_u3000_o}),
    .c({_al_u3001_o,_al_u3001_o}),
    .d({_al_u3081_o,_al_u2991_o}),
    .f({_al_u3364_o,mux97_b15_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3366|_al_u3365  (
    .b({_al_u3365_o,open_n6193}),
    .c({_al_u2892_o,counter[0]}),
    .d({_al_u2889_o,_al_u3065_o}),
    .f({_al_u3366_o,_al_u3365_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3367|_al_u3064  (
    .c({_al_u3366_o,mux16_b11_sel_is_2_o}),
    .d({_al_u3058_o,_al_u3058_o}),
    .f({_al_u3367_o,_al_u3064_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3369|_al_u2921  (
    .c({_al_u3368_o,_al_u2915_o}),
    .d({_al_u2921_o,_al_u2907_o}),
    .f({_al_u3369_o,_al_u2921_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*~B*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"))
    \_al_u3372|_al_u3371  (
    .b({_al_u2998_o,_al_u2891_o}),
    .c({_al_u3371_o,_al_u2926_o}),
    .d({_al_u3364_o,_al_u3370_o}),
    .f({_al_u3372_o,_al_u3371_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3374|_al_u3373  (
    .c({_al_u3218_o,_al_u2995_o}),
    .d({_al_u3373_o,_al_u3372_o}),
    .f({_al_u3374_o,_al_u3373_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3376|_al_u3375  (
    .b({open_n6314,_al_u3012_o}),
    .c({_al_u3014_o,_al_u3088_o}),
    .d({_al_u3375_o,_al_u3374_o}),
    .f({_al_u3376_o,_al_u3375_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3377|_al_u3607  (
    .c({_al_u3022_o,_al_u3007_o}),
    .d({mux119_b3_sel_is_0_o,_al_u3606_o}),
    .f({_al_u3377_o,_al_u3607_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3378|_al_u3434  (
    .c({_al_u3377_o,_al_u3088_o}),
    .d({_al_u3376_o,_al_u3433_o}),
    .f({_al_u3378_o,_al_u3434_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(D*~(~C*~B)))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000001010101010),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3379|_al_u3350  (
    .a({open_n6387,_al_u3349_o}),
    .b({open_n6388,_al_u2884_o}),
    .c({_al_u3349_o,_al_u2925_o}),
    .d({_al_u3378_o,_al_u3026_o}),
    .f({_al_u3379_o,mux130_b1_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3381|_al_u3382  (
    .b({open_n6411,_al_u2904_o}),
    .c({_al_u3102_o,_al_u3026_o}),
    .d({_al_u3380_o,_al_u3381_o}),
    .f({_al_u3381_o,_al_u3382_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~A*~(D*C))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(B*~A*~(D*C))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000010001000100),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000010001000100),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3384|_al_u3383  (
    .a({open_n6432,_al_u3186_o}),
    .b({_al_u3355_o,_al_u3183_o}),
    .c({_al_u3383_o,_al_u2907_o}),
    .d({_al_u3382_o,_al_u2885_o}),
    .f({_al_u3384_o,_al_u3383_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3385|_al_u3054  (
    .c({_al_u3054_o,_al_u3046_o}),
    .d({_al_u3384_o,_al_u2914_o}),
    .f({_al_u3385_o,_al_u3054_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3387|_al_u3386  (
    .b({open_n6487,_al_u2898_o}),
    .c({_al_u3240_o,_al_u3046_o}),
    .d({_al_u3386_o,_al_u3385_o}),
    .f({_al_u3387_o,_al_u3386_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*~D))"),
    //.LUTF1("(B*~(~C*D))"),
    //.LUTG0("~(~B*~(C*~D))"),
    //.LUTG1("(B*~(~C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100110011111100),
    .INIT_LUTF1(16'b1100000011001100),
    .INIT_LUTG0(16'b1100110011111100),
    .INIT_LUTG1(16'b1100000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3388|reg2_b3  (
    .b({n377_lutinv,_al_u3388_o}),
    .c({_al_u3113_o,_al_u3118_o}),
    .clk(divider2[8]),
    .d({_al_u3387_o,_al_u3363_o}),
    .sr(reset_n),
    .f({_al_u3388_o,open_n6527}),
    .q({open_n6531,data_in_bus[3]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(B*~(~D*~(C*A)))"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(B*~(~D*~(C*A)))"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100110010000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100110010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3391|_al_u3061  (
    .a({mux16_b11_sel_is_2_o,open_n6532}),
    .b({_al_u3295_o,_al_u2888_o}),
    .c({n193[4],counter[0]}),
    .d({_al_u3061_o,_al_u2842_o}),
    .f({_al_u3391_o,_al_u3061_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~C*D))"),
    //.LUT1("(~C*~(~B*~D))"),
    .INIT_LUT0(16'b0011000000110011),
    .INIT_LUT1(16'b0000111100001100),
    .MODE("LOGIC"))
    \_al_u3392|_al_u3393  (
    .b({_al_u3207_o,_al_u3209_o}),
    .c({_al_u3245_o,_al_u2923_o}),
    .d({_al_u3391_o,n206[4]}),
    .f({n206[4],_al_u3393_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000000011),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000000011),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3395|_al_u3394  (
    .b({open_n6581,_al_u2920_o}),
    .c({_al_u2927_o,_al_u2930_o}),
    .d({n215[4],_al_u3393_o}),
    .f({n216[4],n215[4]}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~D*~C*~B*A)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000000010),
    .MODE("LOGIC"))
    \_al_u3396|_al_u3318  (
    .a({n216[4],open_n6606}),
    .b({_al_u3318_o,open_n6607}),
    .c({_al_u3074_o,_al_u2926_o}),
    .d({_al_u2932_o,_al_u2937_o}),
    .f({_al_u3396_o,_al_u3318_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*~(~D*~A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*~(~D*~A))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000010),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3397|_al_u2940  (
    .a({_al_u3396_o,open_n6628}),
    .b({_al_u2940_o,open_n6629}),
    .c({_al_u3253_o,_al_u2926_o}),
    .d({_al_u3319_o,_al_u2904_o}),
    .f({_al_u3397_o,_al_u2940_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3400|_al_u3399  (
    .b({mux61_b0_sel_is_2_o,_al_u2914_o}),
    .c({_al_u3327_o,_al_u2945_o}),
    .d({_al_u3398_o,mux61_b3_sel_is_2_o}),
    .f({_al_u3400_o,mux61_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3402|_al_u2966  (
    .b({_al_u3256_o,open_n6682}),
    .c({_al_u2966_o,_al_u2963_o}),
    .d({_al_u3401_o,_al_u2908_o}),
    .f({_al_u3402_o,_al_u2966_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3405|_al_u2998  (
    .b({_al_u2998_o,open_n6705}),
    .c({_al_u2999_o,_al_u2993_o}),
    .d({mux94_b0_sel_is_2_o,_al_u2894_o}),
    .f({mux96_b0_sel_is_2_o,_al_u2998_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3406|_al_u3503  (
    .b({open_n6728,_al_u3077_o}),
    .c({_al_u3079_o,_al_u3079_o}),
    .d({mux96_b0_sel_is_2_o,_al_u3502_o}),
    .f({_al_u3406_o,_al_u3503_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~C*~(B*D))"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000001100001111),
    .MODE("LOGIC"))
    \_al_u3408|_al_u3409  (
    .b({_al_u3407_o,_al_u3005_o}),
    .c({_al_u2998_o,_al_u2997_o}),
    .d({_al_u3403_o,_al_u3408_o}),
    .f({_al_u3408_o,_al_u3409_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~B*~(~C*D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011000000110011),
    .MODE("LOGIC"))
    \_al_u3411|_al_u3410  (
    .b({_al_u3340_o,open_n6777}),
    .c({_al_u3410_o,_al_u2993_o}),
    .d({_al_u3409_o,_al_u2908_o}),
    .f({_al_u3411_o,_al_u3410_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~D*~(B*A)))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000111100001000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3412|_al_u3414  (
    .a({open_n6798,_al_u3412_o}),
    .b({open_n6799,_al_u3413_o}),
    .c({_al_u3007_o,_al_u3032_o}),
    .d({_al_u3411_o,_al_u3156_o}),
    .f({_al_u3412_o,_al_u3414_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3416|_al_u3415  (
    .c({_al_u3415_o,_al_u3010_o}),
    .d({_al_u3414_o,_al_u2903_o}),
    .f({_al_u3416_o,_al_u3415_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A*~(D*C))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(B*A*~(D*C))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000100010001000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000100010001000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3418|_al_u3417  (
    .a({open_n6848,_al_u2913_o}),
    .b({mux137_b2_sel_is_2_o,_al_u3026_o}),
    .c({_al_u3417_o,counter[0]}),
    .d({_al_u3416_o,counter[1]}),
    .f({_al_u3418_o,_al_u3417_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(~D*~(B*A)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~(~D*~(B*A)))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100001000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100001000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3419|_al_u3421  (
    .a({open_n6873,_al_u3419_o}),
    .b({open_n6874,_al_u3420_o}),
    .c({_al_u3034_o,_al_u3359_o}),
    .d({_al_u3418_o,_al_u3188_o}),
    .f({_al_u3419_o,_al_u3421_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3422|_al_u3425  (
    .b({open_n6901,mux168_b4_sel_is_2_o}),
    .c({_al_u3186_o,_al_u3052_o}),
    .d({_al_u3421_o,_al_u3422_o}),
    .f({_al_u3422_o,_al_u3425_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~A*~(D*C)))"),
    //.LUTF1("(~C*~B*~(D*~A))"),
    //.LUTG0("(B*~(~A*~(D*C)))"),
    //.LUTG1("(~C*~B*~(D*~A))"),
    .INIT_LUTF0(16'b1100100010001000),
    .INIT_LUTF1(16'b0000001000000011),
    .INIT_LUTG0(16'b1100100010001000),
    .INIT_LUTG1(16'b0000001000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3424|_al_u3423  (
    .a({_al_u2950_o,_al_u2898_o}),
    .b({_al_u3235_o,_al_u3046_o}),
    .c({_al_u3423_o,_al_u2899_o}),
    .d({_al_u3046_o,counter[0]}),
    .f({mux168_b4_sel_is_2_o,_al_u3423_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3427|_al_u3201  (
    .c({_al_u3211_o,_al_u2890_o}),
    .d({mux30_b12_sel_is_2_o,_al_u3065_o}),
    .f({_al_u3427_o,_al_u3201_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*~(~C*~B)))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(A*~(D*~(~C*~B)))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000001010101010),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000001010101010),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3429|_al_u3428  (
    .a({open_n6974,_al_u3366_o}),
    .b({mux16_b11_sel_is_2_o,_al_u2898_o}),
    .c({_al_u3056_o,_al_u2899_o}),
    .d({_al_u3428_o,_al_u2888_o}),
    .f({_al_u3429_o,_al_u3428_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3430|_al_u3431  (
    .c({_al_u3429_o,_al_u2927_o}),
    .d({_al_u3427_o,_al_u3430_o}),
    .f({_al_u3430_o,_al_u3431_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3432|_al_u3426  (
    .b({open_n7025,_al_u2963_o}),
    .c({_al_u3431_o,mux92_b7_sel_is_2_o}),
    .d({_al_u3426_o,mux63_b12_sel_is_2_o}),
    .f({_al_u3432_o,_al_u3426_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3433|_al_u3264  (
    .b({_al_u3264_o,_al_u3005_o}),
    .c({_al_u3000_o,_al_u2897_o}),
    .d({_al_u3432_o,_al_u3221_o}),
    .f({_al_u3433_o,_al_u3264_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    //.LUTF1("(~D*~(C*~B))"),
    //.LUTG0("(~(~B*A)*~(D)*~(C)+~(~B*A)*D*~(C)+~(~(~B*A))*D*C+~(~B*A)*D*C)"),
    //.LUTG1("(~D*~(C*~B))"),
    .INIT_LUTF0(16'b1111110100001101),
    .INIT_LUTF1(16'b0000000011001111),
    .INIT_LUTG0(16'b1111110100001101),
    .INIT_LUTG1(16'b0000000011001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3436|_al_u3435  (
    .a({open_n7068,_al_u3434_o}),
    .b({_al_u3014_o,_al_u3007_o}),
    .c({_al_u3010_o,_al_u3008_o}),
    .d({_al_u3435_o,counter[0]}),
    .f({_al_u3436_o,_al_u3435_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3439|_al_u3042  (
    .b({_al_u3042_o,open_n7095}),
    .c({_al_u3040_o,_al_u2885_o}),
    .d({_al_u3188_o,_al_u2898_o}),
    .f({_al_u3439_o,_al_u3042_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3440|_al_u3438  (
    .b({open_n7118,_al_u3102_o}),
    .c({_al_u3439_o,_al_u3354_o}),
    .d({_al_u3438_o,_al_u3437_o}),
    .f({_al_u3440_o,_al_u3438_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*~D))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1100110011000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3443|_al_u3442  (
    .b({_al_u3187_o,_al_u3046_o}),
    .c({_al_u3442_o,_al_u2891_o}),
    .d({_al_u3441_o,_al_u2887_o}),
    .f({_al_u3443_o,_al_u3442_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3444|_al_u3050  (
    .b({_al_u3052_o,open_n7167}),
    .c({_al_u3050_o,_al_u2899_o}),
    .d({_al_u3443_o,_al_u3046_o}),
    .f({_al_u3444_o,_al_u3050_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*D))"),
    //.LUT1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111110011001100),
    .INIT_LUT1(16'b0011000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3445|reg2_b4  (
    .b({_al_u3117_o,_al_u3445_o}),
    .c({n377_lutinv,_al_u3118_o}),
    .clk(divider2[8]),
    .d({_al_u3444_o,_al_u3425_o}),
    .sr(reset_n),
    .f({_al_u3445_o,open_n7203}),
    .q({open_n7207,data_in_bus[4]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*~(~D*~A))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*~(~D*~A))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000001000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000001000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3448|_al_u3447  (
    .a({open_n7208,_al_u3122_o}),
    .b({open_n7209,mux16_b11_sel_is_2_o}),
    .c({_al_u3124_o,_al_u3056_o}),
    .d({n200[0],_al_u3308_o}),
    .f({n202[0],n200[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3450|_al_u3449  (
    .b({_al_u2917_o,open_n7236}),
    .c({_al_u3449_o,_al_u2915_o}),
    .d({n202[0],_al_u2898_o}),
    .f({n210[0],_al_u3449_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3451|_al_u3452  (
    .c({_al_u2922_o,mux33_b0_sel_is_2_o}),
    .d({n210[0],n213[0]}),
    .f({n213[0],n216[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3454|_al_u3453  (
    .b({open_n7291,mux49_b0_sel_is_2_o}),
    .c({mux61_b0_sel_is_2_o,_al_u2932_o}),
    .d({_al_u3453_o,n216[0]}),
    .f({_al_u3454_o,_al_u3453_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3456|_al_u3455  (
    .b({open_n7318,_al_u3322_o}),
    .c({_al_u3139_o,_al_u2972_o}),
    .d({_al_u3455_o,_al_u3454_o}),
    .f({_al_u3456_o,_al_u3455_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3457|_al_u3142  (
    .b({open_n7345,_al_u3141_o}),
    .c({_al_u2965_o,mux75_b5_sel_is_2_o}),
    .d({_al_u3456_o,_al_u3137_o}),
    .f({_al_u3457_o,_al_u3142_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3458|_al_u3144  (
    .b({_al_u3146_o,open_n7368}),
    .c({_al_u3144_o,_al_u2963_o}),
    .d({_al_u3457_o,_al_u2907_o}),
    .f({_al_u3458_o,_al_u3144_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(B*~(C*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1100110000001100),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1100110000001100),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3459|_al_u3403  (
    .b({open_n7391,mux84_b4_sel_is_2_o}),
    .c({_al_u3292_o,_al_u3293_o}),
    .d({_al_u3458_o,_al_u3402_o}),
    .f({_al_u3459_o,_al_u3403_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3460|_al_u3407  (
    .b({_al_u3406_o,_al_u2982_o}),
    .c({mux87_b0_sel_is_2_o,_al_u2990_o}),
    .d({_al_u3459_o,_al_u3406_o}),
    .f({_al_u3460_o,_al_u3407_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3461|_al_u3151  (
    .c({_al_u3004_o,_al_u3005_o}),
    .d({_al_u3088_o,_al_u3150_o}),
    .f({mux107_b0_sel_is_2_o,_al_u3151_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("~(C@D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000001111),
    .MODE("LOGIC"))
    \_al_u3463|_al_u3462  (
    .b({open_n7468,mux107_b0_sel_is_2_o}),
    .c({mux111_b0_sel_is_2_o,_al_u3005_o}),
    .d({_al_u3462_o,_al_u3460_o}),
    .f({_al_u3463_o,_al_u3462_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3464|_al_u3473  (
    .b({mux120_b3_sel_is_2_o,mux139_b0_sel_is_2_o}),
    .c({_al_u3017_o,_al_u3355_o}),
    .d({_al_u3463_o,_al_u3467_o}),
    .f({_al_u3464_o,_al_u3473_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(~A*~(D*~B)))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~(~A*~(D*~B)))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000101100001010),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000101100001010),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3467|_al_u3465  (
    .a({open_n7515,_al_u3464_o}),
    .b({open_n7516,_al_u2935_o}),
    .c({mux129_b0_sel_is_2_o,_al_u3160_o}),
    .d({_al_u3465_o,_al_u3010_o}),
    .f({_al_u3467_o,_al_u3465_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3468|_al_u3380  (
    .b({open_n7543,_al_u3227_o}),
    .c({_al_u3028_o,_al_u3030_o}),
    .d({_al_u3227_o,_al_u3379_o}),
    .f({_al_u3468_o,_al_u3380_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3470|_al_u3469  (
    .b({open_n7566,_al_u3468_o}),
    .c({_al_u3027_o,_al_u3102_o}),
    .d({mux136_b7_sel_is_2_o,mux135_b11_sel_is_0_o}),
    .f({mux136_b0_sel_is_2_o,mux136_b7_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3472|_al_u3471  (
    .b({_al_u3171_o,open_n7593}),
    .c({_al_u3471_o,_al_u3026_o}),
    .d({mux136_b0_sel_is_2_o,_al_u2908_o}),
    .f({mux139_b0_sel_is_2_o,_al_u3471_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(B*~(~C*~D))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b1100110011000000),
    .MODE("LOGIC"))
    \_al_u3475|_al_u3474  (
    .b({mux152_b0_sel_is_2_o,_al_u2884_o}),
    .c({_al_u3474_o,_al_u2885_o}),
    .d({_al_u3473_o,_al_u2914_o}),
    .f({_al_u3475_o,_al_u3474_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3476|_al_u3276  (
    .c({_al_u3278_o,_al_u2885_o}),
    .d({_al_u3276_o,_al_u2953_o}),
    .f({_al_u3476_o,_al_u3276_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3478|_al_u3053  (
    .c({mux169_b0_sel_is_2_o,_al_u3052_o}),
    .d({_al_u3477_o,mux169_b0_sel_is_2_o}),
    .f({_al_u3478_o,mux170_b2_sel_is_2_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(~A*~(C*~(D*B)))"),
    //.LUT1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1011101011111010),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3479|reg2_b0  (
    .a({open_n7688,_al_u3479_o}),
    .b({mux174_b0_sel_is_0_o,_al_u3524_o}),
    .c({n378_lutinv,_al_u2860_o}),
    .clk(divider2[8]),
    .d({_al_u3478_o,_al_u3525_o}),
    .sr(reset_n),
    .f({_al_u3479_o,open_n7702}),
    .q({open_n7706,data_in_bus[0]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3480|_al_u3481  (
    .b({open_n7709,_al_u3308_o}),
    .c({_al_u3304_o,_al_u3068_o}),
    .d({_al_u3065_o,_al_u3480_o}),
    .f({_al_u3480_o,_al_u3481_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3483|_al_u3482  (
    .c({_al_u3482_o,_al_u2888_o}),
    .d({_al_u3481_o,_al_u2938_o}),
    .f({_al_u3483_o,_al_u3482_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*A*~(~D*C))"),
    //.LUTF1("(D*~(~C*~B))"),
    //.LUTG0("(~B*A*~(~D*C))"),
    //.LUTG1("(D*~(~C*~B))"),
    .INIT_LUTF0(16'b0010001000000010),
    .INIT_LUTF1(16'b1111110000000000),
    .INIT_LUTG0(16'b0010001000000010),
    .INIT_LUTG1(16'b1111110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3487|_al_u3485  (
    .a({open_n7754,_al_u3483_o}),
    .b({_al_u3486_o,_al_u2916_o}),
    .c({counter[0],_al_u3484_o}),
    .d({_al_u3485_o,counter[0]}),
    .f({_al_u3487_o,_al_u3485_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3489|_al_u2933  (
    .c({_al_u2933_o,_al_u2926_o}),
    .d({_al_u3488_o,_al_u2914_o}),
    .f({_al_u3489_o,_al_u2933_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~D*~C*B*~A)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3492|_al_u2958  (
    .a({_al_u2958_o,open_n7807}),
    .b({_al_u3491_o,open_n7808}),
    .c({_al_u2972_o,_al_u2945_o}),
    .d({_al_u2943_o,_al_u2904_o}),
    .f({_al_u3492_o,_al_u2958_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B*A))"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(D*~(~C*~B*A))"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b1111110100000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1111110100000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3494|_al_u3490  (
    .a({open_n7833,_al_u2937_o}),
    .b({_al_u3490_o,_al_u2938_o}),
    .c({_al_u3493_o,_al_u2949_o}),
    .d({mux60_b1_sel_is_2_o,_al_u2926_o}),
    .f({_al_u3494_o,_al_u3490_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3497|_al_u3496  (
    .c({_al_u2964_o,_al_u2963_o}),
    .d({_al_u3496_o,_al_u2953_o}),
    .f({_al_u3497_o,_al_u3496_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3500|_al_u3499  (
    .b({_al_u2984_o,_al_u2925_o}),
    .c({_al_u3499_o,_al_u2975_o}),
    .d({_al_u3256_o,_al_u2884_o}),
    .f({_al_u3500_o,_al_u3499_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3501|_al_u3498  (
    .a({open_n7912,_al_u3141_o}),
    .b({open_n7913,_al_u3497_o}),
    .c({_al_u3500_o,_al_u3143_o}),
    .d({mux77_b8_sel_is_2_o,_al_u3322_o}),
    .f({_al_u3501_o,mux77_b8_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(~C*~D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1100110011000000),
    .MODE("LOGIC"))
    \_al_u3502|_al_u3323  (
    .b({_al_u3501_o,open_n7940}),
    .c({_al_u3323_o,_al_u2963_o}),
    .d({_al_u3495_o,_al_u2884_o}),
    .f({_al_u3502_o,_al_u3323_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3504|_al_u3505  (
    .b({open_n7963,_al_u2991_o}),
    .c({_al_u2986_o,_al_u3000_o}),
    .d({_al_u3503_o,_al_u3504_o}),
    .f({_al_u3504_o,_al_u3505_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111110000110000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111110000110000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3509|_al_u3507  (
    .b({_al_u3508_o,mux103_b1_sel_is_2_o}),
    .c({_al_u3020_o,counter[0]}),
    .d({_al_u3507_o,_al_u3505_o}),
    .f({_al_u3509_o,_al_u3507_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*~D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000000000001100),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3512|_al_u3466  (
    .b({_al_u3511_o,mux129_b8_sel_is_2_o}),
    .c({_al_u3268_o,_al_u3167_o}),
    .d({_al_u3510_o,_al_u3164_o}),
    .f({_al_u3512_o,mux129_b0_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3513|_al_u3514  (
    .c({_al_u3028_o,_al_u3098_o}),
    .d({_al_u3512_o,_al_u3513_o}),
    .f({_al_u3513_o,_al_u3514_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~(~B*~(~C*A)))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011001110),
    .MODE("LOGIC"))
    \_al_u3515|_al_u3193  (
    .a({_al_u3514_o,open_n8060}),
    .b({_al_u3034_o,open_n8061}),
    .c({_al_u3471_o,_al_u3026_o}),
    .d({_al_u3193_o,_al_u2907_o}),
    .f({_al_u3515_o,_al_u3193_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3516|_al_u3521  (
    .b({open_n8084,_al_u3184_o}),
    .c({_al_u3354_o,_al_u3182_o}),
    .d({_al_u3515_o,_al_u3520_o}),
    .f({_al_u3516_o,_al_u3521_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3520|_al_u3518  (
    .b({open_n8111,_al_u3517_o}),
    .c({_al_u3519_o,_al_u3040_o}),
    .d({_al_u3518_o,_al_u3516_o}),
    .f({_al_u3520_o,_al_u3518_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3522|_al_u3362  (
    .c({_al_u3362_o,_al_u3046_o}),
    .d({_al_u3521_o,_al_u2887_o}),
    .f({_al_u3522_o,_al_u3362_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3524|_al_u3523  (
    .b({open_n8158,_al_u3052_o}),
    .c({_al_u3111_o,_al_u3423_o}),
    .d({_al_u3523_o,_al_u3522_o}),
    .f({_al_u3524_o,_al_u3523_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*~D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100110011000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3528|_al_u3527  (
    .b({open_n8181,mux16_b11_sel_is_2_o}),
    .c({mux19_b2_sel_is_0_o,_al_u2906_o}),
    .d({n200[5],_al_u2902_o}),
    .f({n203[5],n200[5]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~(~B*D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1100000011110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1100000011110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3529|_al_u3286  (
    .b({_al_u3286_o,_al_u2949_o}),
    .c({_al_u3207_o,_al_u2915_o}),
    .d({n203[5],_al_u2935_o}),
    .f({n208[5],_al_u3286_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*B))"),
    //.LUTF1("~(~D*~((~C*~A))*~(B)+~D*(~C*~A)*~(B)+~(~D)*(~C*~A)*B+~D*(~C*~A)*B)"),
    //.LUTG0("(D*~(~C*B))"),
    //.LUTG1("~(~D*~((~C*~A))*~(B)+~D*(~C*~A)*~(B)+~(~D)*(~C*~A)*B+~D*(~C*~A)*B)"),
    .INIT_LUTF0(16'b1111001100000000),
    .INIT_LUTF1(16'b1111101111001000),
    .INIT_LUTG0(16'b1111001100000000),
    .INIT_LUTG1(16'b1111101111001000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3531|_al_u3530  (
    .a({_al_u3530_o,open_n8228}),
    .b({mux38_b1_sel_is_2_o,_al_u2923_o}),
    .c({_al_u3316_o,counter[1]}),
    .d({_al_u2949_o,n208[5]}),
    .f({n221[5],_al_u3530_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3533|_al_u3532  (
    .b({open_n8255,_al_u2939_o}),
    .c({_al_u2972_o,_al_u2945_o}),
    .d({_al_u3532_o,n221[5]}),
    .f({_al_u3533_o,_al_u3532_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3535|_al_u3534  (
    .b({open_n8278,mux70_b2_sel_is_0_o}),
    .c({_al_u3292_o,mux75_b5_sel_is_2_o}),
    .d({_al_u3534_o,_al_u3533_o}),
    .f({_al_u3535_o,_al_u3534_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3537|_al_u3583  (
    .c({mux97_b5_sel_is_2_o,mux107_b0_sel_is_2_o}),
    .d({_al_u3536_o,_al_u3582_o}),
    .f({_al_u3537_o,_al_u3583_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3538|_al_u3597  (
    .b({_al_u3219_o,open_n8329}),
    .c({_al_u3340_o,_al_u3120_o}),
    .d({_al_u3537_o,_al_u2906_o}),
    .f({_al_u3538_o,mux12_b9_sel_is_2_o_neg_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3540|_al_u3539  (
    .b({mux111_b0_sel_is_2_o,_al_u3220_o}),
    .c({_al_u3088_o,counter[0]}),
    .d({_al_u3539_o,_al_u3538_o}),
    .f({_al_u3540_o,_al_u3539_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3542|_al_u3541  (
    .c({_al_u3541_o,counter[0]}),
    .d({_al_u3540_o,_al_u3008_o}),
    .f({_al_u3542_o,_al_u3541_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3543|_al_u3020  (
    .c({_al_u3158_o,_al_u3014_o}),
    .d({_al_u3020_o,_al_u3013_o}),
    .f({mux117_b5_sel_is_2_o,_al_u3020_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3545|_al_u3544  (
    .a({open_n8424,mux117_b5_sel_is_2_o}),
    .b({open_n8425,mux119_b3_sel_is_0_o}),
    .c({mux127_b5_sel_is_2_o,_al_u3155_o}),
    .d({_al_u3542_o,_al_u3415_o}),
    .f({_al_u3545_o,mux127_b5_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3546|_al_u3420  (
    .c({_al_u3417_o,mux150_b0_sel_is_2_o}),
    .d({_al_u3545_o,mux147_b3_sel_is_2_o}),
    .f({_al_u3546_o,_al_u3420_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3547|_al_u3173  (
    .c({mux137_b5_sel_is_2_o,_al_u3099_o}),
    .d({_al_u3546_o,mux137_b5_sel_is_2_o}),
    .f({_al_u3547_o,mux137_b2_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3548|_al_u3197  (
    .a({open_n8502,mux152_b0_sel_is_2_o}),
    .b({mux147_b3_sel_is_2_o,_al_u3194_o}),
    .c({_al_u3197_o,_al_u3196_o}),
    .d({_al_u3547_o,_al_u3041_o}),
    .f({_al_u3548_o,_al_u3197_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(~D*~B*~(C*A))"),
    //.LUT1("(D*~(C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111101100),
    .INIT_LUT1(16'b0011111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3550|reg2_b5  (
    .a({open_n8523,_al_u3550_o}),
    .b({_al_u3046_o,_al_u3566_o}),
    .c({_al_u2908_o,_al_u3118_o}),
    .clk(divider2[8]),
    .d({_al_u3549_o,n376_lutinv}),
    .sr(reset_n),
    .f({_al_u3550_o,open_n8537}),
    .q({open_n8541,data_in_bus[5]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3552|_al_u3551  (
    .c({_al_u3551_o,_al_u3066_o}),
    .d({_al_u3427_o,_al_u2889_o}),
    .f({_al_u3552_o,_al_u3551_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3554|_al_u3553  (
    .b({open_n8572,_al_u2932_o}),
    .c({_al_u3081_o,_al_u2927_o}),
    .d({_al_u3553_o,_al_u3552_o}),
    .f({_al_u3554_o,_al_u3553_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*~B))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1100111100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3556|_al_u3555  (
    .b({_al_u3090_o,_al_u2951_o}),
    .c({_al_u3008_o,_al_u2993_o}),
    .d({_al_u3555_o,_al_u3554_o}),
    .f({_al_u3556_o,_al_u3555_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3558|_al_u3557  (
    .b({open_n8621,_al_u2891_o}),
    .c({_al_u3557_o,_al_u3010_o}),
    .d({_al_u3556_o,_al_u2914_o}),
    .f({_al_u3558_o,_al_u3557_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(~D*C*B))"),
    //.LUT1("(~D*C*B*A)"),
    .INIT_LUT0(16'b0101010100010101),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"))
    \_al_u3559|_al_u3166  (
    .a({_al_u3558_o,_al_u3165_o}),
    .b({_al_u3031_o,_al_u2842_o}),
    .c({_al_u3095_o,_al_u3010_o}),
    .d({_al_u3165_o,counter[0]}),
    .f({_al_u3559_o,mux129_b8_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3561|_al_u3172  (
    .c({_al_u3174_o,_al_u3171_o}),
    .d({_al_u3171_o,mux136_b1_sel_is_0_o}),
    .f({mux140_b11_sel_is_2_o,mux137_b5_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3562|_al_u3560  (
    .c({mux140_b11_sel_is_2_o,_al_u3098_o}),
    .d({_al_u3560_o,_al_u3559_o}),
    .f({_al_u3562_o,_al_u3560_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3563|_al_u3564  (
    .b({_al_u3439_o,_al_u3187_o}),
    .c({_al_u3276_o,_al_u3054_o}),
    .d({_al_u3562_o,_al_u3563_o}),
    .f({_al_u3563_o,_al_u3564_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3565|_al_u3566  (
    .b({open_n8750,n377_lutinv}),
    .c({_al_u3240_o,_al_u3113_o}),
    .d({_al_u3564_o,_al_u3565_o}),
    .f({_al_u3565_o,_al_u3566_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    //.LUTF1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    //.LUTG1("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUTF0(16'b0000111010101010),
    .INIT_LUTF1(16'b1111110000110000),
    .INIT_LUTG0(16'b0000111010101010),
    .INIT_LUTG1(16'b1111110000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3569|_al_u3568  (
    .a({open_n8771,_al_u3121_o}),
    .b({mux14_b11_sel_is_2_o,_al_u2898_o}),
    .c({_al_u3061_o,_al_u2899_o}),
    .d({n193[1],_al_u2888_o}),
    .f({n197[1],n193[1]}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*A)"),
    //.LUT1("(~C*~(~B*~D))"),
    .INIT_LUT0(16'b0000000010000000),
    .INIT_LUT1(16'b0000111100001100),
    .MODE("LOGIC"))
    \_al_u3571|_al_u3570  (
    .a({open_n8796,n197[1]}),
    .b({_al_u2916_o,mux19_b2_sel_is_0_o}),
    .c({_al_u2917_o,mux16_b1_sel_is_0_o}),
    .d({_al_u3570_o,_al_u3204_o}),
    .f({n205[1],_al_u3570_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(B*~(~C*~(D*A)))"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b1100100011000000),
    .MODE("LOGIC"))
    \_al_u3572|_al_u3486  (
    .a({n205[1],open_n8817}),
    .b({mux30_b1_sel_is_2_o,open_n8818}),
    .c({_al_u3287_o,_al_u2923_o}),
    .d({_al_u3486_o,_al_u3449_o}),
    .f({n214[1],_al_u3486_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3574|_al_u3573  (
    .b({open_n8841,mux38_b1_sel_is_2_o}),
    .c({_al_u3252_o,_al_u3318_o}),
    .d({n225[1],n214[1]}),
    .f({_al_u3574_o,n225[1]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3575|_al_u3576  (
    .b({open_n8864,_al_u2949_o}),
    .c({mux68_b1_sel_is_2_o,_al_u2963_o}),
    .d({_al_u3574_o,_al_u3575_o}),
    .f({_al_u3575_o,_al_u3576_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~D*~(C*B))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000000111111),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000000111111),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3578|_al_u3577  (
    .b({_al_u3577_o,_al_u3256_o}),
    .c({_al_u3146_o,counter[0]}),
    .d({_al_u3576_o,_al_u3143_o}),
    .f({_al_u3578_o,_al_u3577_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3580|_al_u3579  (
    .b({mux89_b1_sel_is_2_o,open_n8917}),
    .c({_al_u3336_o,_al_u2984_o}),
    .d({_al_u3579_o,_al_u3578_o}),
    .f({_al_u3580_o,_al_u3579_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3581|_al_u3404  (
    .b({open_n8944,_al_u2991_o}),
    .c({mux94_b0_sel_is_2_o,_al_u3001_o}),
    .d({_al_u3580_o,mux92_b0_sel_is_0_o}),
    .f({_al_u3581_o,mux94_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3582|_al_u3506  (
    .b({mux103_b1_sel_is_2_o,open_n8967}),
    .c({_al_u2998_o,_al_u3005_o}),
    .d({_al_u3581_o,_al_u2994_o}),
    .f({_al_u3582_o,mux103_b1_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3585|_al_u3584  (
    .b({open_n8990,mux111_b0_sel_is_2_o}),
    .c({_al_u3557_o,_al_u3015_o}),
    .d({_al_u3584_o,_al_u3583_o}),
    .f({_al_u3585_o,_al_u3584_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3586|_al_u3347  (
    .b({mux124_b11_sel_is_2_o,open_n9017}),
    .c({_al_u3153_o,_al_u3155_o}),
    .d({_al_u3585_o,mux124_b0_sel_is_0_o}),
    .f({_al_u3586_o,mux124_b11_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3588|_al_u3587  (
    .b({open_n9040,_al_u3027_o}),
    .c({mux130_b1_sel_is_2_o,_al_u3099_o}),
    .d({mux134_b0_sel_is_2_o,_al_u3468_o}),
    .f({_al_u3588_o,mux134_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*~(~D*~A)))"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b0000001100000111),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u3590|_al_u3589  (
    .a({open_n9065,_al_u3586_o}),
    .b({mux136_b1_sel_is_0_o,_al_u3588_o}),
    .c({mux141_b1_sel_is_2_o,_al_u3099_o}),
    .d({_al_u3589_o,_al_u3345_o}),
    .f({_al_u3590_o,_al_u3589_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111110000110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111110000110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3592|_al_u3591  (
    .b({_al_u3191_o,_al_u3355_o}),
    .c({_al_u3189_o,_al_u3176_o}),
    .d({_al_u3591_o,_al_u3590_o}),
    .f({_al_u3592_o,_al_u3591_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3593|_al_u3517  (
    .c({_al_u3278_o,_al_u3037_o}),
    .d({_al_u3592_o,_al_u3176_o}),
    .f({_al_u3593_o,_al_u3517_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*~(D*A)))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(B*~(~C*~(D*A)))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1100100011000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1100100011000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3594|_al_u3477  (
    .a({open_n9136,_al_u3475_o}),
    .b({_al_u3049_o,_al_u3280_o}),
    .c({_al_u3362_o,_al_u3108_o}),
    .d({_al_u3280_o,_al_u3476_o}),
    .f({_al_u3594_o,_al_u3477_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("~(D*~((C*A))*~(B)+D*(C*A)*~(B)+~(D)*(C*A)*B+D*(C*A)*B)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b0100110001111111),
    .MODE("LOGIC"))
    \_al_u3596|_al_u3595  (
    .a({_al_u3593_o,open_n9161}),
    .b({_al_u3594_o,_al_u3050_o}),
    .c({_al_u3595_o,counter[0]}),
    .d({_al_u2898_o,_al_u3052_o}),
    .f({_al_u3596_o,_al_u3595_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(D*~(~C*B))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(D*~(~C*B))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b1111001100000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b1111001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3598|_al_u3484  (
    .b({mux12_b9_sel_is_2_o_neg_lutinv,_al_u2842_o}),
    .c({_al_u3484_o,_al_u2888_o}),
    .d({mux16_b1_sel_is_0_o,_al_u2904_o}),
    .f({_al_u3598_o,_al_u3484_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3599|_al_u3296  (
    .b({_al_u3245_o,_al_u3295_o}),
    .c({_al_u3204_o,_al_u3204_o}),
    .d({_al_u3598_o,mux38_b12_sel_is_2_o}),
    .f({_al_u3599_o,_al_u3296_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3600|_al_u3316  (
    .b({_al_u3316_o,open_n9232}),
    .c({_al_u3599_o,_al_u2897_o}),
    .d({_al_u2920_o,_al_u2923_o}),
    .f({_al_u3600_o,_al_u3316_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3602|_al_u3601  (
    .b({open_n9259,mux33_b0_sel_is_2_o}),
    .c({_al_u3494_o,_al_u3071_o}),
    .d({_al_u3601_o,_al_u3600_o}),
    .f({_al_u3602_o,_al_u3601_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~B*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000110000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000110000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3604|_al_u3603  (
    .b({open_n9286,_al_u2999_o}),
    .c({_al_u2994_o,_al_u3602_o}),
    .d({_al_u3603_o,_al_u2997_o}),
    .f({_al_u3604_o,_al_u3603_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3606|_al_u3605  (
    .b({open_n9313,_al_u2950_o}),
    .c({mux104_b11_sel_is_2_o,_al_u2993_o}),
    .d({_al_u3604_o,_al_u3264_o}),
    .f({_al_u3606_o,mux104_b11_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3608|_al_u3609  (
    .b({mux117_b5_sel_is_2_o,open_n9340}),
    .c({_al_u3011_o,_al_u3155_o}),
    .d({_al_u3607_o,_al_u3608_o}),
    .f({_al_u3608_o,_al_u3609_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*~A))"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b0000101110111011),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3611|_al_u3610  (
    .a({open_n9361,_al_u3609_o}),
    .b({open_n9362,mux124_b0_sel_is_0_o}),
    .c({_al_u3610_o,_al_u2904_o}),
    .d({_al_u3027_o,_al_u3010_o}),
    .f({_al_u3611_o,_al_u3610_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3612|_al_u3101  (
    .b({mux135_b11_sel_is_0_o,open_n9385}),
    .c({_al_u3101_o,_al_u3026_o}),
    .d({_al_u3611_o,_al_u2899_o}),
    .f({_al_u3612_o,_al_u3101_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3615|_al_u3614  (
    .b({open_n9412,_al_u2884_o}),
    .c({mux150_b0_sel_is_2_o,_al_u2885_o}),
    .d({_al_u3614_o,_al_u3613_o}),
    .f({_al_u3615_o,_al_u3614_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3618|_al_u3616  (
    .b({open_n9439,_al_u3040_o}),
    .c({_al_u3617_o,_al_u3044_o}),
    .d({_al_u3616_o,_al_u3615_o}),
    .f({_al_u3618_o,_al_u3616_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3619|_al_u3620  (
    .b({open_n9466,_al_u3046_o}),
    .c({_al_u3362_o,_al_u2908_o}),
    .d({_al_u3618_o,_al_u3619_o}),
    .f({_al_u3619_o,_al_u3620_o}));
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*~D))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("~(~B*~(C*~D))"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100110011111100),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b1100110011111100),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u3621|reg2_b1  (
    .b({_al_u3117_o,_al_u3621_o}),
    .c({n377_lutinv,_al_u3118_o}),
    .clk(divider2[8]),
    .d({_al_u3620_o,_al_u3596_o}),
    .sr(reset_n),
    .f({_al_u3621_o,open_n9506}),
    .q({open_n9510,data_in_bus[1]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3626"),
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
    \add0/u3_al_u3627  (
    .a({divider2[5],divider2[3]}),
    .b({divider2[6],divider2[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n0[5],n0[3]}),
    .fco(\add0/c7 ),
    .fx({n0[6],n0[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3626"),
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
    \add0/u7_al_u3628  (
    .a({open_n9529,divider2[7]}),
    .b({open_n9530,divider2[8]}),
    .c(2'b00),
    .d({open_n9533,1'b0}),
    .e({open_n9534,1'b0}),
    .fci(\add0/c7 ),
    .f({open_n9549,n0[7]}),
    .fx({open_n9551,n0[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3626"),
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
    \add0/ucin_al_u3626  (
    .a({divider2[1],1'b0}),
    .b({divider2[2],divider2[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n0[1:0]),
    .f({n0[1],open_n9568}),
    .fco(\add0/c3 ),
    .fx({n0[2],n0[0]}),
    .q(divider2[1:0]));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3629"),
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
    \add1/u3_al_u3630  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n372[5],n372[3]}),
    .fco(\add1/c7 ),
    .fx({n372[6],n372[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3629"),
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
    \add1/u7_al_u3631  (
    .a({open_n9587,cnt[7]}),
    .c(2'b00),
    .d({open_n9592,1'b0}),
    .fci(\add1/c7 ),
    .f({open_n9609,n372[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3629"),
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
    .SRMUX("0"))
    \add1/ucin_al_u3629  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .ce(mux185_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d(2'b01),
    .e(2'b01),
    .mi(n372[2:1]),
    .f({n372[1],open_n9628}),
    .fco(\add1/c3 ),
    .fx({n372[2],n372[0]}),
    .q(cnt[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u0|add2/ucin  (
    .a({counter[0],1'b0}),
    .b({1'b1,open_n9629}),
    .f({n373[0],open_n9649}),
    .fco(\add2/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u2|add2/u1  (
    .a(counter[2:1]),
    .b(2'b00),
    .fci(\add2/c1 ),
    .f(n373[2:1]),
    .fco(\add2/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u4|add2/u3  (
    .a(counter[4:3]),
    .b(2'b00),
    .fci(\add2/c3 ),
    .f(n373[4:3]),
    .fco(\add2/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u6|add2/u5  (
    .a(counter[6:5]),
    .b(2'b00),
    .fci(\add2/c5 ),
    .f(n373[6:5]),
    .fco(\add2/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u7_al_u3632  (
    .a({open_n9720,counter[7]}),
    .b({open_n9721,1'b0}),
    .fci(\add2/c7 ),
    .f({open_n9740,n373[7]}));
  i2c_module i2c_write_module (
    .address({1'b0,reg_address[1:0]}),
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
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("~(C*B*~(D*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0111111100111111),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b2|_al_u2854  (
    .a({_al_u2865_o,_al_u2853_o}),
    .b({_al_u2867_o,state_next[2]}),
    .c({_al_u2869_o,1'b0}),
    .clk(divider2[8]),
    .d({state_next[2],1'b0}),
    .sr(reset_n),
    .f({open_n9759,_al_u2854_o}),
    .q({state_next[2],open_n9763}));  // sources/rtl/camera_init.v(347)
  // sources/rtl/camera_init.v(347)
  // sources/rtl/camera_init.v(347)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*A*~(~D*C))"),
    //.LUTF1("(D*~(B)*~(C)+~(D)*~(B)*C+D*~(B)*C+D*B*C)"),
    //.LUTG0("~(B*A*~(~D*C))"),
    //.LUTG1("(D*~(B)*~(C)+~(D)*~(B)*C+D*~(B)*C+D*B*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111011111110111),
    .INIT_LUTF1(16'b1111001100110000),
    .INIT_LUTG0(16'b0111011111110111),
    .INIT_LUTG1(16'b1111001100110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b4|reg0_b3  (
    .a({open_n9764,_al_u2867_o}),
    .b({n369[3],_al_u2879_o}),
    .c({state_next[3],\sel0_b0/B4 }),
    .clk(divider2[8]),
    .d({state_next[4],ready_out}),
    .sr(reset_n),
    .f({open_n9782,n369[3]}),
    .q(state_next[4:3]));  // sources/rtl/camera_init.v(347)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg3_b1|reg3_b0  (
    .c(n373[1:0]),
    .ce(n381),
    .clk(divider2[8]),
    .d({_al_u2844_o,_al_u2844_o}),
    .sr(reset_n),
    .q(counter[1:0]));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg3_b2|reg3_b7  (
    .c({n373[2],n373[7]}),
    .ce(n381),
    .clk(divider2[8]),
    .d({_al_u2844_o,_al_u2844_o}),
    .sr(reset_n),
    .q({counter[2],counter[7]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg3_b3|reg3_b6  (
    .c({n373[3],n373[6]}),
    .ce(n381),
    .clk(divider2[8]),
    .d({_al_u2844_o,_al_u2844_o}),
    .sr(reset_n),
    .q({counter[3],counter[6]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg3_b4|reg3_b5  (
    .c({n373[4],n373[5]}),
    .ce(n381),
    .clk(divider2[8]),
    .d({_al_u2844_o,_al_u2844_o}),
    .sr(reset_n),
    .q({counter[4],counter[5]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b1100000000000000),
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
    \reg4_b3|reg4_b0  (
    .a({cnt[0],open_n9878}),
    .b({cnt[1],_al_u2844_o}),
    .c({cnt[2],reset_n}),
    .ce(mux185_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d({cnt[3],n381}),
    .mi({n372[3],n372[0]}),
    .f({_al_u2873_o,mux185_b0_sel_is_2_o}),
    .q({cnt[3],cnt[0]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(434)
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
    \reg4_b5|reg4_b7  (
    .ce(mux185_b0_sel_is_2_o),
    .clk(divider2[8]),
    .mi({n372[5],n372[7]}),
    .q({cnt[5],cnt[7]}));  // sources/rtl/camera_init.v(434)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg4_b6 (
    .ce(mux185_b0_sel_is_2_o),
    .clk(divider2[8]),
    .mi({open_n9939,n372[6]}),
    .q({open_n9946,cnt[6]}));  // sources/rtl/camera_init.v(434)
  // sources/rtl/camera_init.v(57)
  // sources/rtl/camera_init.v(57)
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
    \reg5_b2|reg5_b8  (
    .clk(clk),
    .mi({n0[2],n0[8]}),
    .q({divider2[2],divider2[8]}));  // sources/rtl/camera_init.v(57)
  // sources/rtl/camera_init.v(57)
  // sources/rtl/camera_init.v(57)
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
    \reg5_b3|reg5_b7  (
    .clk(clk),
    .mi({n0[3],n0[7]}),
    .q({divider2[3],divider2[7]}));  // sources/rtl/camera_init.v(57)
  // sources/rtl/camera_init.v(57)
  // sources/rtl/camera_init.v(57)
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
    \reg5_b4|reg5_b6  (
    .clk(clk),
    .mi({n0[4],n0[6]}),
    .q({divider2[4],divider2[6]}));  // sources/rtl/camera_init.v(57)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg5_b5 (
    .clk(clk),
    .mi({open_n10038,n0[5]}),
    .q({open_n10056,divider2[5]}));  // sources/rtl/camera_init.v(57)

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
  wire [10:0] n2;
  wire [11:0] n22;
  wire [39:0] n29;
  wire [10:0] n4;
  wire [12:0] n6;
  wire [6:0] n7;
  wire _al_u41_o;
  wire _al_u42_o;
  wire _al_u43_o;
  wire _al_u45_o;
  wire _al_u46_o;
  wire _al_u47_o;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire lt0_c1;
  wire lt0_c11;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire lt0_c9;
  wire lt1_c1;
  wire lt1_c11;
  wire lt1_c3;
  wire lt1_c5;
  wire lt1_c7;
  wire lt1_c9;
  wire lt2_c1;
  wire lt2_c11;
  wire lt2_c3;
  wire lt2_c5;
  wire lt2_c7;
  wire lt2_c9;
  wire lt3_c1;
  wire lt3_c11;
  wire lt3_c3;
  wire lt3_c5;
  wire lt3_c7;
  wire lt3_c9;
  wire lt4_c1;
  wire lt4_c11;
  wire lt4_c3;
  wire lt4_c5;
  wire lt4_c7;
  wire lt4_c9;
  wire lt5_c1;
  wire lt5_c11;
  wire lt5_c3;
  wire lt5_c5;
  wire lt5_c7;
  wire lt5_c9;
  wire lt6_c1;
  wire lt6_c11;
  wire lt6_c3;
  wire lt6_c5;
  wire lt6_c7;
  wire lt6_c9;
  wire lt7_c1;
  wire lt7_c11;
  wire lt7_c3;
  wire lt7_c5;
  wire lt7_c7;
  wire lt7_c9;
  wire lt8_2_c1;
  wire lt8_2_c11;
  wire lt8_2_c3;
  wire lt8_2_c5;
  wire lt8_2_c7;
  wire lt8_2_c9;
  wire lt9_2_c1;
  wire lt9_2_c11;
  wire lt9_2_c3;
  wire lt9_2_c5;
  wire lt9_2_c7;
  wire lt9_2_c9;
  wire mux3_b0_sel_is_0_o;
  wire n0;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n16;
  wire n18;
  wire n20;
  wire n23;
  wire n9;
  wire \sub0/c3 ;
  wire \sub1/c11 ;
  wire \sub1/c3 ;
  wire \sub1/c7 ;
  wire \u2/c11 ;
  wire \u2/c3 ;
  wire \u2/c7 ;

  assign lcd_pwm = rest_n;
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u20 (
    .c({open_n4,n10}),
    .d({open_n7,n9}),
    .f({open_n25,lcd_hsync}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u21 (
    .c({open_n35,n12}),
    .d({open_n38,n11}),
    .f({open_n56,lcd_vsync}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u23|_al_u42  (
    .a({n13,hsync_cnt[3]}),
    .b({n14,hsync_cnt[4]}),
    .c({n16,hsync_cnt[5]}),
    .d({n18,hsync_cnt[6]}),
    .f({lcd_de,_al_u42_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u24|_al_u22  (
    .b({n20,open_n88}),
    .c({n23,lcd_pwm}),
    .d({lcd_de,clk}),
    .f({img_ack,lcd_clk}));
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*~D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*~D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000011000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u44|reg2_b7  (
    .b({_al_u42_o,hsync_cnt[8]}),
    .c({_al_u43_o,hsync_cnt[9]}),
    .clk(clk),
    .d({_al_u41_o,hsync_cnt[7]}),
    .mi({open_n119,n4[7]}),
    .sr(mux3_b0_sel_is_0_o),
    .f({n0,_al_u41_o}),
    .q({open_n134,hsync_cnt[7]}));  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*A)"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(D*~C*~B*A)"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0000001000000000),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u45|_al_u47  (
    .a({open_n135,vsync_cnt[0]}),
    .b({vsync_cnt[8],vsync_cnt[1]}),
    .c({vsync_cnt[9],vsync_cnt[10]}),
    .d({vsync_cnt[7],vsync_cnt[2]}),
    .f({_al_u45_o,_al_u47_o}));
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u46|reg0_b4  (
    .a({vsync_cnt[3],_al_u45_o}),
    .b({vsync_cnt[4],_al_u46_o}),
    .c({vsync_cnt[5],_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({vsync_cnt[6],n2[4]}),
    .sr(lcd_pwm),
    .f({_al_u46_o,open_n176}),
    .q({open_n180,vsync_cnt[4]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u59|reg2_b10  (
    .a({_al_u41_o,hsync_cnt[0]}),
    .b({_al_u42_o,hsync_cnt[1]}),
    .c({_al_u43_o,hsync_cnt[10]}),
    .clk(clk),
    .d({lcd_pwm,hsync_cnt[2]}),
    .mi({open_n185,n4[10]}),
    .sr(mux3_b0_sel_is_0_o),
    .f({mux3_b0_sel_is_0_o,_al_u43_o}),
    .q({open_n200,hsync_cnt[10]}));  // sources/rtl/lcd_sync.v(56)
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
    .a({vsync_cnt[5],vsync_cnt[3]}),
    .b({vsync_cnt[6],vsync_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n2[5],n2[3]}),
    .fco(\add0/c7 ),
    .fx({n2[6],n2[4]}));
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
    .a({vsync_cnt[9],vsync_cnt[7]}),
    .b({vsync_cnt[10],vsync_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n2[9],n2[7]}),
    .fx({n2[10],n2[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u69"),
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
    \add0/ucin_al_u69  (
    .a({vsync_cnt[1],1'b0}),
    .b({vsync_cnt[2],vsync_cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n255}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u72"),
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
    \add1/u3_al_u73  (
    .a({hsync_cnt[5],hsync_cnt[3]}),
    .b({hsync_cnt[6],hsync_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n4[5],n4[3]}),
    .fco(\add1/c7 ),
    .fx({n4[6],n4[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u72"),
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
    \add1/u7_al_u74  (
    .a({hsync_cnt[9],hsync_cnt[7]}),
    .b({hsync_cnt[10],hsync_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c7 ),
    .f({n4[9],n4[7]}),
    .fx({n4[10],n4[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u72"),
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
    \add1/ucin_al_u72  (
    .a({hsync_cnt[1],1'b0}),
    .b({hsync_cnt[2],hsync_cnt[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n4[1:0]),
    .sr(mux3_b0_sel_is_0_o),
    .f({n4[1],open_n308}),
    .fco(\add1/c3 ),
    .fx({n4[2],n4[0]}),
    .q(hsync_cnt[1:0]));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_0|lt0_cin  (
    .a(2'b01),
    .b({hsync_cnt[0],open_n309}),
    .fco(lt0_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_10|lt0_9  (
    .a(2'b00),
    .b(hsync_cnt[10:9]),
    .fci(lt0_c9),
    .fco(lt0_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(2'b00),
    .b(hsync_cnt[2:1]),
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
    .a(2'b10),
    .b(hsync_cnt[4:3]),
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
    .a(2'b00),
    .b(hsync_cnt[6:5]),
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
    .b(hsync_cnt[8:7]),
    .fci(lt0_c7),
    .fco(lt0_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_cout_al_u77 (
    .a({open_n455,1'b0}),
    .b({open_n456,1'b1}),
    .fci(lt0_c11),
    .f({open_n475,n9}));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_0|lt1_cin  (
    .a({hsync_cnt[0],1'b0}),
    .b({1'b0,open_n481}),
    .fco(lt1_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_10|lt1_9  (
    .a(hsync_cnt[10:9]),
    .b(2'b00),
    .fci(lt1_c9),
    .fco(lt1_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_2|lt1_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
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
    .a(hsync_cnt[4:3]),
    .b(2'b10),
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
    .a(hsync_cnt[6:5]),
    .b(2'b11),
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
    .a(hsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt1_c7),
    .fco(lt1_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_cout_al_u78 (
    .a({open_n627,1'b0}),
    .b({open_n628,1'b1}),
    .fci(lt1_c11),
    .f({open_n647,n10}));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_0|lt2_cin  (
    .a(2'b01),
    .b({vsync_cnt[0],open_n653}),
    .fco(lt2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_10|lt2_9  (
    .a(2'b00),
    .b(vsync_cnt[10:9]),
    .fci(lt2_c9),
    .fco(lt2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_2|lt2_1  (
    .a(2'b01),
    .b(vsync_cnt[2:1]),
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
    .a(2'b01),
    .b(vsync_cnt[4:3]),
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
    .a(2'b00),
    .b(vsync_cnt[6:5]),
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
    .a(2'b00),
    .b(vsync_cnt[8:7]),
    .fci(lt2_c7),
    .fco(lt2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt2_cout_al_u79 (
    .a({open_n799,1'b0}),
    .b({open_n800,1'b1}),
    .fci(lt2_c11),
    .f({open_n819,n11}));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_0|lt3_cin  (
    .a({vsync_cnt[0],1'b0}),
    .b({1'b0,open_n825}),
    .fco(lt3_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_10|lt3_9  (
    .a(vsync_cnt[10:9]),
    .b(2'b00),
    .fci(lt3_c9),
    .fco(lt3_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_2|lt3_1  (
    .a(vsync_cnt[2:1]),
    .b(2'b10),
    .fci(lt3_c1),
    .fco(lt3_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_4|lt3_3  (
    .a(vsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt3_c3),
    .fco(lt3_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_6|lt3_5  (
    .a(vsync_cnt[6:5]),
    .b(2'b00),
    .fci(lt3_c5),
    .fco(lt3_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_8|lt3_7  (
    .a(vsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt3_c7),
    .fco(lt3_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_cout_al_u80 (
    .a({open_n971,1'b0}),
    .b({open_n972,1'b1}),
    .fci(lt3_c11),
    .f({open_n991,n12}));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_0|lt4_cin  (
    .a(2'b01),
    .b({hsync_cnt[0],open_n997}),
    .fco(lt4_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_10|lt4_9  (
    .a(2'b00),
    .b(hsync_cnt[10:9]),
    .fci(lt4_c9),
    .fco(lt4_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_2|lt4_1  (
    .a(2'b00),
    .b(hsync_cnt[2:1]),
    .fci(lt4_c1),
    .fco(lt4_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_4|lt4_3  (
    .a(2'b00),
    .b(hsync_cnt[4:3]),
    .fci(lt4_c3),
    .fco(lt4_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_6|lt4_5  (
    .a(2'b01),
    .b(hsync_cnt[6:5]),
    .fci(lt4_c5),
    .fco(lt4_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_8|lt4_7  (
    .a(2'b01),
    .b(hsync_cnt[8:7]),
    .fci(lt4_c7),
    .fco(lt4_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt4_cout_al_u81 (
    .a({open_n1143,1'b0}),
    .b({open_n1144,1'b1}),
    .fci(lt4_c11),
    .f({open_n1163,n13}));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_0|lt5_cin  (
    .a({hsync_cnt[0],1'b1}),
    .b({1'b0,open_n1169}),
    .fco(lt5_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_10|lt5_9  (
    .a(hsync_cnt[10:9]),
    .b(2'b01),
    .fci(lt5_c9),
    .fco(lt5_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_2|lt5_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
    .fci(lt5_c1),
    .fco(lt5_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_4|lt5_3  (
    .a(hsync_cnt[4:3]),
    .b(2'b00),
    .fci(lt5_c3),
    .fco(lt5_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_6|lt5_5  (
    .a(hsync_cnt[6:5]),
    .b(2'b01),
    .fci(lt5_c5),
    .fco(lt5_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_8|lt5_7  (
    .a(hsync_cnt[8:7]),
    .b(2'b10),
    .fci(lt5_c7),
    .fco(lt5_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt5_cout_al_u82 (
    .a({open_n1315,1'b0}),
    .b({open_n1316,1'b1}),
    .fci(lt5_c11),
    .f({open_n1335,n14}));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_0|lt6_cin  (
    .a(2'b11),
    .b({vsync_cnt[0],open_n1341}),
    .fco(lt6_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_10|lt6_9  (
    .a(2'b00),
    .b(vsync_cnt[10:9]),
    .fci(lt6_c9),
    .fco(lt6_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_2|lt6_1  (
    .a(2'b10),
    .b(vsync_cnt[2:1]),
    .fci(lt6_c1),
    .fco(lt6_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_4|lt6_3  (
    .a(2'b01),
    .b(vsync_cnt[4:3]),
    .fci(lt6_c3),
    .fco(lt6_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_6|lt6_5  (
    .a(2'b01),
    .b(vsync_cnt[6:5]),
    .fci(lt6_c5),
    .fco(lt6_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_8|lt6_7  (
    .a(2'b00),
    .b(vsync_cnt[8:7]),
    .fci(lt6_c7),
    .fco(lt6_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt6_cout_al_u83 (
    .a({open_n1487,1'b0}),
    .b({open_n1488,1'b1}),
    .fci(lt6_c11),
    .f({open_n1507,n16}));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_0|lt7_cin  (
    .a({vsync_cnt[0],1'b0}),
    .b({1'b1,open_n1513}),
    .fco(lt7_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_10|lt7_9  (
    .a(vsync_cnt[10:9]),
    .b(2'b01),
    .fci(lt7_c9),
    .fco(lt7_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_2|lt7_1  (
    .a(vsync_cnt[2:1]),
    .b(2'b10),
    .fci(lt7_c1),
    .fco(lt7_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_4|lt7_3  (
    .a(vsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt7_c3),
    .fco(lt7_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_6|lt7_5  (
    .a(vsync_cnt[6:5]),
    .b(2'b00),
    .fci(lt7_c5),
    .fco(lt7_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_8|lt7_7  (
    .a(vsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt7_c7),
    .fco(lt7_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt7_cout_al_u84 (
    .a({open_n1659,1'b0}),
    .b({open_n1660,1'b1}),
    .fci(lt7_c11),
    .f({open_n1679,n18}));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_0|lt8_2_cin  (
    .a({hsync_cnt[0],1'b0}),
    .b({1'b0,open_n1685}),
    .fco(lt8_2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_10|lt8_2_9  (
    .a(n7[5:4]),
    .b(2'b00),
    .fci(lt8_2_c9),
    .fco(lt8_2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_2|lt8_2_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
    .fci(lt8_2_c1),
    .fco(lt8_2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_4|lt8_2_3  (
    .a(hsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt8_2_c3),
    .fco(lt8_2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_6|lt8_2_5  (
    .a(n7[1:0]),
    .b(2'b10),
    .fci(lt8_2_c5),
    .fco(lt8_2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_8|lt8_2_7  (
    .a(n7[3:2]),
    .b(2'b01),
    .fci(lt8_2_c7),
    .fco(lt8_2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_cout|lt8_2_11  (
    .a({1'b0,n7[6]}),
    .b(2'b10),
    .fci(lt8_2_c11),
    .f({n20,open_n1849}));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_0|lt9_2_cin  (
    .a({n22[0],1'b0}),
    .b({1'b0,open_n1855}),
    .fco(lt9_2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_10|lt9_2_9  (
    .a(n22[10:9]),
    .b(2'b00),
    .fci(lt9_2_c9),
    .fco(lt9_2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_2|lt9_2_1  (
    .a(n22[2:1]),
    .b(2'b10),
    .fci(lt9_2_c1),
    .fco(lt9_2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_4|lt9_2_3  (
    .a(n22[4:3]),
    .b(2'b00),
    .fci(lt9_2_c3),
    .fco(lt9_2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_6|lt9_2_5  (
    .a(n22[6:5]),
    .b(2'b01),
    .fci(lt9_2_c5),
    .fco(lt9_2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_8|lt9_2_7  (
    .a(n22[8:7]),
    .b(2'b01),
    .fci(lt9_2_c7),
    .fco(lt9_2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_cout|lt9_2_11  (
    .a({1'b0,n22[11]}),
    .b(2'b10),
    .fci(lt9_2_c11),
    .f({n23,open_n2019}));
  EG_PHY_MULT18 #(
    .INPUTREGA("DISABLE"),
    .INPUTREGB("DISABLE"),
    .MODE("MULT18X18C"),
    .OUTPUTREG("DISABLE"),
    .SIGNEDAMUX("0"),
    .SIGNEDBMUX("0"))
    mult0_ (
    .a({5'b00000,n22[11],n22}),
    .b(18'b000000000000011001),
    .p({open_n2108,open_n2109,open_n2110,open_n2111,open_n2112,open_n2113,open_n2114,open_n2115,open_n2116,open_n2117,open_n2118,open_n2119,open_n2120,open_n2121,open_n2122,open_n2123,open_n2124,open_n2125,open_n2126,open_n2127,open_n2128,open_n2129,open_n2130,n29[15:3]}));
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b9  (
    .a({_al_u45_o,_al_u45_o}),
    .b({_al_u46_o,_al_u46_o}),
    .c({_al_u47_o,_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({n2[0],n2[9]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[0],vsync_cnt[9]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b8  (
    .a({_al_u45_o,_al_u45_o}),
    .b({_al_u46_o,_al_u46_o}),
    .c({_al_u47_o,_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({n2[10],n2[8]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[10],vsync_cnt[8]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b7  (
    .a({_al_u45_o,_al_u45_o}),
    .b({_al_u46_o,_al_u46_o}),
    .c({_al_u47_o,_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({n2[1],n2[7]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[1],vsync_cnt[7]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b6  (
    .a({_al_u45_o,_al_u45_o}),
    .b({_al_u46_o,_al_u46_o}),
    .c({_al_u47_o,_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({n2[2],n2[6]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[2],vsync_cnt[6]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B*A))"),
    //.LUTF1("(D*~(C*B*A))"),
    //.LUTG0("(D*~(C*B*A))"),
    //.LUTG1("(D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111111100000000),
    .INIT_LUTF1(16'b0111111100000000),
    .INIT_LUTG0(16'b0111111100000000),
    .INIT_LUTG1(16'b0111111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \reg0_b3|reg0_b5  (
    .a({_al_u45_o,_al_u45_o}),
    .b({_al_u46_o,_al_u46_o}),
    .c({_al_u47_o,_al_u47_o}),
    .ce(n0),
    .clk(clk),
    .d({n2[3],n2[5]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[3],vsync_cnt[5]}));  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b0|reg1_b2  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({hsync_cnt[0],hsync_cnt[2]}),
    .sr(lcd_pwm),
    .q({addr[0],addr[2]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b10|reg1_b1  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[7],hsync_cnt[1]}),
    .sr(lcd_pwm),
    .q({addr[10],addr[1]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b11|reg1_b9  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[8],n6[6]}),
    .sr(lcd_pwm),
    .q({addr[11],addr[9]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b12|reg1_b8  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[9],n6[5]}),
    .sr(lcd_pwm),
    .q({addr[12],addr[8]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b13|reg1_b7  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[10],n6[4]}),
    .sr(lcd_pwm),
    .q({addr[13],addr[7]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b14|reg1_b6  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[11],n6[3]}),
    .sr(lcd_pwm),
    .q({addr[14],addr[6]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b15|reg1_b5  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[12],n6[2]}),
    .sr(lcd_pwm),
    .q({addr[15],addr[5]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(81)
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
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b4  (
    .a({lcd_de,lcd_de}),
    .b({n20,n20}),
    .c({n23,n23}),
    .clk(clk),
    .d({n6[0],n6[1]}),
    .sr(lcd_pwm),
    .q({addr[3],addr[4]}));  // sources/rtl/lcd_sync.v(81)
  // sources/rtl/lcd_sync.v(56)
  // sources/rtl/lcd_sync.v(56)
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
    \reg2_b8|reg2_b2  (
    .clk(clk),
    .mi({n4[8],n4[2]}),
    .sr(mux3_b0_sel_is_0_o),
    .q({hsync_cnt[8],hsync_cnt[2]}));  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    reg2_b9 (
    .clk(clk),
    .mi({open_n2452,n4[9]}),
    .sr(mux3_b0_sel_is_0_o),
    .q({open_n2469,hsync_cnt[9]}));  // sources/rtl/lcd_sync.v(56)
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u75"),
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
    \sub0/u3_al_u76  (
    .a({hsync_cnt[10],hsync_cnt[8]}),
    .b({open_n2470,hsync_cnt[9]}),
    .c(2'b11),
    .d(2'b00),
    .e({open_n2473,1'b0}),
    .fci(\sub0/c3 ),
    .f({n7[5],n7[3]}),
    .fx({n7[6],n7[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u75"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h0005),
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
    \sub0/ucin_al_u75  (
    .a({hsync_cnt[6],1'b0}),
    .b({hsync_cnt[7],hsync_cnt[5]}),
    .c(2'b11),
    .clk(clk),
    .d(2'b01),
    .e(2'b11),
    .mi(n4[6:5]),
    .sr(mux3_b0_sel_is_0_o),
    .f({n7[1],open_n2504}),
    .fco(\sub0/c3 ),
    .fx({n7[2],n7[0]}),
    .q(hsync_cnt[6:5]));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u65"),
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
    \sub1/u3_al_u66  (
    .a({vsync_cnt[5],vsync_cnt[3]}),
    .b({vsync_cnt[6],vsync_cnt[4]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b00),
    .fci(\sub1/c3 ),
    .f({n22[5],n22[3]}),
    .fco(\sub1/c7 ),
    .fx({n22[6],n22[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u65"),
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
    \sub1/u7_al_u67  (
    .a({vsync_cnt[9],vsync_cnt[7]}),
    .b({vsync_cnt[10],vsync_cnt[8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\sub1/c7 ),
    .f({n22[9],n22[7]}),
    .fco(\sub1/c11 ),
    .fx({n22[10],n22[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u65"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/ucin_al_u65  (
    .a({vsync_cnt[1],1'b0}),
    .b({vsync_cnt[2],vsync_cnt[0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b11),
    .f({n22[1],open_n2558}),
    .fco(\sub1/c3 ),
    .fx({n22[2],n22[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u65"),
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
    \sub1/ucout_al_u68  (
    .c(2'b11),
    .fci(\sub1/c11 ),
    .f({open_n2585,n22[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u61"),
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
    \u2/u11_al_u64  (
    .a({open_n2591,n7[6]}),
    .b({open_n2592,n7[6]}),
    .c(2'b00),
    .d({open_n2595,n29[14]}),
    .e({open_n2596,n29[15]}),
    .fci(\u2/c11 ),
    .f({open_n2611,n6[11]}),
    .fx({open_n2613,n6[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u61"),
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
    \u2/u3_al_u62  (
    .a({n7[3],n7[1]}),
    .b({n7[4],n7[2]}),
    .c(2'b00),
    .d({n29[8],n29[6]}),
    .e({n29[9],n29[7]}),
    .fci(\u2/c3 ),
    .f({n6[5],n6[3]}),
    .fco(\u2/c7 ),
    .fx({n6[6],n6[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u61"),
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
    \u2/u7_al_u63  (
    .a(n7[6:5]),
    .b({n7[6],n7[6]}),
    .c(2'b00),
    .d({n29[12],n29[10]}),
    .e({n29[13],n29[11]}),
    .fci(\u2/c7 ),
    .f({n6[9],n6[7]}),
    .fco(\u2/c11 ),
    .fx({n6[10],n6[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u61"),
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
    \u2/ucin_al_u61  (
    .a({hsync_cnt[4],1'b0}),
    .b({n7[0],hsync_cnt[3]}),
    .c(2'b00),
    .clk(clk),
    .d({n29[4],1'b1}),
    .e({n29[5],n29[3]}),
    .mi(n4[4:3]),
    .sr(mux3_b0_sel_is_0_o),
    .f({n6[1],open_n2665}),
    .fco(\u2/c3 ),
    .fx({n6[2],n6[0]}),
    .q(hsync_cnt[4:3]));

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
  wire  \sel0_b0/B1 ;
  wire  \sel0_b0/B35 ;
  wire  \sel0_b1/B10 ;
  wire  \sel0_b1/B23 ;
  wire  \sel0_b2/B11 ;
  wire  \sel0_b2/B12 ;
  wire  \sel0_b2/B20 ;
  wire  \sel0_b2/B21 ;
  wire  \sel0_b2/B29 ;
  wire  \sel0_b2/B3 ;
  wire  \sel0_b2/B4 ;
  wire  \sel0_b3/B22 ;
  wire  \sel0_b3/B26 ;
  wire  \sel0_b3/B8 ;
  wire  \sel0_b4/B16 ;
  wire  \sel0_b4/B17 ;
  wire  \sel0_b4/B9 ;
  wire  \sel0_b5/B34 ;
  wire  \sel1/B33 ;
  wire  \sel5/B3 ;
  wire [7:0] slave_address;  // sources/rtl/i2c_module.v(86)
  wire [7:0] slave_data_1;  // sources/rtl/i2c_module.v(88)
  wire [7:0] slave_reg_address;  // sources/rtl/i2c_module.v(87)
  wire [7:0] state_next;  // sources/rtl/i2c_module.v(21)
  wire _al_u107_o;
  wire _al_u108_o;
  wire _al_u112_o;
  wire _al_u113_o;
  wire _al_u114_o;
  wire _al_u116_o;
  wire _al_u120_o;
  wire _al_u121_o;
  wire _al_u122_o;
  wire _al_u125_o;
  wire _al_u126_o;
  wire _al_u128_o;
  wire _al_u130_o;
  wire _al_u131_o;
  wire _al_u132_o;
  wire _al_u133_o;
  wire _al_u134_o;
  wire _al_u135_o;
  wire _al_u137_o;
  wire _al_u138_o;
  wire _al_u140_o;
  wire _al_u141_o;
  wire _al_u142_o;
  wire _al_u143_o;
  wire _al_u144_o;
  wire _al_u145_o;
  wire _al_u146_o;
  wire _al_u148_o;
  wire _al_u149_o;
  wire _al_u150_o;
  wire _al_u152_o;
  wire _al_u153_o;
  wire _al_u154_o;
  wire _al_u155_o;
  wire _al_u156_o;
  wire _al_u157_o;
  wire _al_u159_o;
  wire _al_u160_o;
  wire _al_u163_o;
  wire _al_u164_o;
  wire _al_u165_o;
  wire _al_u167_o;
  wire _al_u169_o;
  wire _al_u170_o;
  wire _al_u171_o;
  wire _al_u174_o;
  wire _al_u175_o;
  wire _al_u176_o;
  wire _al_u179_o;
  wire _al_u180_o;
  wire _al_u182_o;
  wire _al_u184_o;
  wire _al_u185_o;
  wire _al_u186_o;
  wire _al_u188_o;
  wire _al_u192_o;
  wire _al_u193_o;
  wire _al_u194_o;
  wire _al_u195_o;
  wire _al_u196_o;
  wire _al_u197_o;
  wire _al_u199_o;
  wire _al_u201_o;
  wire _al_u202_o;
  wire _al_u204_o;
  wire _al_u205_o;
  wire _al_u206_o;
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
  wire _al_u218_o;
  wire _al_u220_o;
  wire _al_u221_o;
  wire _al_u222_o;
  wire _al_u223_o;
  wire _al_u225_o;
  wire _al_u226_o;
  wire _al_u227_o;
  wire _al_u228_o;
  wire _al_u230_o;
  wire _al_u231_o;
  wire _al_u232_o;
  wire _al_u233_o;
  wire _al_u234_o;
  wire _al_u235_o;
  wire _al_u237_o;
  wire _al_u238_o;
  wire _al_u240_o;
  wire _al_u242_o;
  wire _al_u243_o;
  wire _al_u244_o;
  wire _al_u245_o;
  wire _al_u246_o;
  wire _al_u247_o;
  wire _al_u248_o;
  wire _al_u249_o;
  wire _al_u250_o;
  wire _al_u252_o;
  wire _al_u254_o;
  wire _al_u257_o;
  wire _al_u258_o;
  wire _al_u259_o;
  wire _al_u260_o;
  wire _al_u262_o;
  wire _al_u263_o;
  wire _al_u264_o;
  wire _al_u265_o;
  wire _al_u267_o;
  wire _al_u268_o;
  wire _al_u271_o;
  wire _al_u272_o;
  wire _al_u273_o;
  wire _al_u275_o;
  wire _al_u276_o;
  wire _al_u277_o;
  wire _al_u279_o;
  wire _al_u280_o;
  wire _al_u281_o;
  wire _al_u282_o;
  wire _al_u283_o;
  wire _al_u284_o;
  wire _al_u285_o;
  wire _al_u286_o;
  wire _al_u287_o;
  wire _al_u288_o;
  wire _al_u289_o;
  wire _al_u290_o;
  wire _al_u291_o;
  wire _al_u293_o;
  wire _al_u294_o;
  wire _al_u295_o;
  wire _al_u296_o;
  wire _al_u297_o;
  wire _al_u298_o;
  wire _al_u299_o;
  wire _al_u300_o;
  wire _al_u301_o;
  wire _al_u302_o;
  wire _al_u303_o;
  wire _al_u304_o;
  wire _al_u307_o;
  wire _al_u308_o;
  wire _al_u310_o;
  wire _al_u311_o;
  wire ack_ok;  // sources/rtl/i2c_module.v(143)
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire mux4_b0_sel_is_3_o;
  wire mux5_b0_sel_is_3_o;
  wire mux6_b0_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire mux9_b0_sel_is_0_o;
  wire n106_lutinv;
  wire n107_lutinv;
  wire n146_lutinv;
  wire n155_lutinv;
  wire n158_lutinv;
  wire n164_lutinv;
  wire n168_lutinv;
  wire n169_lutinv;
  wire n180_lutinv;
  wire n181_lutinv;
  wire n183_lutinv;
  wire n191_lutinv;
  wire n2;
  wire n28;
  wire n80_lutinv;
  wire n81_lutinv;
  wire n88_lutinv;
  wire n94_lutinv;
  wire scl_output_enable;  // sources/rtl/i2c_module.v(120)
  wire scl_output_zero;  // sources/rtl/i2c_module.v(121)
  wire \sel0_b3/or_or_B13_B14_o_or_B_o_lutinv ;
  wire success;  // sources/rtl/i2c_module.v(141)

  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1101000101010001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u107|_al_u202  (
    .a({state_next[4],_al_u201_o}),
    .b({state_next[5],n28}),
    .c({state_next[6],state_next[4]}),
    .d({state_next[7],state_next[5]}),
    .f({_al_u107_o,_al_u202_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u108|_al_u137  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u108_o,_al_u137_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~B*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u110|reg1_b0  (
    .b({open_n46,address[0]}),
    .c({reset_n,write}),
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .d({n146_lutinv,address[1]}),
    .mi({open_n50,writedata[0]}),
    .sr(mux9_b0_sel_is_0_o),
    .f({mux9_b0_sel_is_0_o,mux7_b0_sel_is_3_o}),
    .q({open_n65,control_reg[0]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u113|_al_u249  (
    .c(state_next[1:0]),
    .d({state_next[0],n28}),
    .f({_al_u113_o,_al_u249_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u115|_al_u114  (
    .b({_al_u113_o,open_n96}),
    .c({_al_u114_o,state_next[3]}),
    .d({_al_u112_o,state_next[2]}),
    .f({\sel0_b2/B3 ,_al_u114_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u116|_al_u148  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u116_o,_al_u148_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*~A)"),
    //.LUTF1("(D*~C*B*~A)"),
    //.LUTG0("(~D*~C*B*~A)"),
    //.LUTG1("(D*~C*B*~A)"),
    .INIT_LUTF0(16'b0000000000000100),
    .INIT_LUTF1(16'b0000010000000000),
    .INIT_LUTG0(16'b0000000000000100),
    .INIT_LUTG1(16'b0000010000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u120|_al_u140  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u120_o,_al_u140_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*A)"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b0000000000100000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u121|_al_u138  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u121_o,_al_u138_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(B*A*(D@C))"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0000100010000000),
    .MODE("LOGIC"))
    \_al_u124|_al_u119  (
    .a({_al_u107_o,_al_u112_o}),
    .b({_al_u114_o,_al_u114_o}),
    .c({state_next[0],state_next[0]}),
    .d({state_next[1],state_next[1]}),
    .f({n88_lutinv,\sel0_b2/B4 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u127|_al_u126  (
    .b({_al_u125_o,open_n211}),
    .c({_al_u126_o,state_next[1]}),
    .d({_al_u107_o,state_next[0]}),
    .f({\sel0_b3/B22 ,_al_u126_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u129|_al_u128  (
    .b({_al_u107_o,open_n238}),
    .c({_al_u114_o,state_next[1]}),
    .d({_al_u128_o,state_next[0]}),
    .f({\sel0_b2/B21 ,_al_u128_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u130|_al_u170  (
    .a({open_n263,_al_u130_o}),
    .b({\sel0_b3/B22 ,_al_u143_o}),
    .c({\sel0_b2/B21 ,_al_u150_o}),
    .d({n88_lutinv,_al_u169_o}),
    .f({_al_u130_o,_al_u170_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u131|_al_u135  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u131_o,_al_u135_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(A*~(~D*~C*~B))"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b1010101010101000),
    .MODE("LOGIC"))
    \_al_u134|_al_u133  (
    .a({_al_u107_o,open_n304}),
    .b({_al_u131_o,state_next[1]}),
    .c({_al_u132_o,state_next[3]}),
    .d({_al_u133_o,state_next[0]}),
    .f({_al_u134_o,_al_u133_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(~D*C*B*A)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"))
    \_al_u141|_al_u112  (
    .a({state_next[4],state_next[4]}),
    .b({state_next[5],state_next[5]}),
    .c({state_next[6],state_next[6]}),
    .d({state_next[7],state_next[7]}),
    .f({_al_u141_o,_al_u112_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u143|_al_u139  (
    .a({_al_u134_o,open_n345}),
    .b({n80_lutinv,_al_u137_o}),
    .c({n81_lutinv,_al_u138_o}),
    .d({_al_u142_o,_al_u107_o}),
    .f({_al_u143_o,n81_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(D*C*~B*~A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0001000000000000),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0001000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u144|_al_u153  (
    .a({state_next[4],state_next[4]}),
    .b({state_next[5],state_next[5]}),
    .c({state_next[6],state_next[6]}),
    .d({state_next[7],state_next[7]}),
    .f({_al_u144_o,_al_u153_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u147|_al_u117  (
    .c({_al_u116_o,_al_u116_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({\sel0_b4/B16 ,\sel0_b0/B35 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~(C*B)*~(D*A))"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(~(C*B)*~(D*A))"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b0001010100111111),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0001010100111111),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u150|_al_u149  (
    .a({_al_u145_o,_al_u107_o}),
    .b({_al_u146_o,_al_u112_o}),
    .c({\sel0_b4/B16 ,_al_u108_o}),
    .d({_al_u149_o,_al_u148_o}),
    .f({_al_u150_o,_al_u149_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u152|_al_u125  (
    .c({_al_u125_o,state_next[3]}),
    .d({_al_u112_o,state_next[2]}),
    .f({_al_u152_o,_al_u125_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*A))"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .INIT_LUT0(16'b0000011101110111),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"))
    \_al_u154|_al_u204  (
    .a({_al_u112_o,_al_u107_o}),
    .b({_al_u137_o,_al_u133_o}),
    .c({_al_u140_o,_al_u137_o}),
    .d({_al_u153_o,_al_u153_o}),
    .f({_al_u154_o,_al_u204_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u155|_al_u211  (
    .b({_al_u152_o,\sel0_b4/B9 }),
    .c({_al_u154_o,n28}),
    .d({\sel0_b4/B9 ,\sel0_b2/B3 }),
    .f({_al_u155_o,_al_u211_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u156|_al_u160  (
    .a({_al_u130_o,_al_u156_o}),
    .b({_al_u143_o,_al_u159_o}),
    .c({_al_u150_o,n28}),
    .d({_al_u155_o,scl_output_zero}),
    .f({_al_u156_o,_al_u160_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(D*C*B*~A)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(D*C*B*~A)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u157|_al_u132  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u157_o,_al_u132_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(~C*~B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u158|_al_u244  (
    .b({open_n558,_al_u157_o}),
    .c({_al_u157_o,_al_u140_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({n180_lutinv,_al_u244_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1100110000001111),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1100110000001111),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u159|_al_u185  (
    .b({open_n585,n28}),
    .c({n180_lutinv,_al_u184_o}),
    .d({\sel0_b0/B35 ,\sel0_b0/B35 }),
    .f({_al_u159_o,_al_u185_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u161|_al_u198  (
    .c({_al_u148_o,_al_u148_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({n181_lutinv,n164_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u162|_al_u195  (
    .c({_al_u153_o,\sel0_b5/B34 }),
    .d({_al_u148_o,\sel0_b2/B3 }),
    .f({\sel0_b5/B34 ,_al_u195_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1100110011110000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1100110011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u164|_al_u207  (
    .b({\sel0_b5/B34 ,\sel0_b2/B4 }),
    .c({scl_output_zero,_al_u152_o}),
    .d({_al_u163_o,_al_u206_o}),
    .f({_al_u164_o,_al_u207_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*B)*~(C*A))"),
    //.LUT1("(~(D*C)*~(B*A))"),
    .INIT_LUT0(16'b0001001101011111),
    .INIT_LUT1(16'b0000011101110111),
    .MODE("LOGIC"))
    \_al_u167|_al_u122  (
    .a({_al_u107_o,_al_u107_o}),
    .b({_al_u120_o,_al_u112_o}),
    .c({_al_u137_o,_al_u120_o}),
    .d({_al_u153_o,_al_u121_o}),
    .f({_al_u167_o,_al_u122_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000010000),
    .MODE("LOGIC"))
    \_al_u169|_al_u168  (
    .a({\sel0_b4/B9 ,open_n708}),
    .b({_al_u152_o,_al_u121_o}),
    .c({_al_u167_o,_al_u140_o}),
    .d({n94_lutinv,_al_u112_o}),
    .f({_al_u169_o,n94_lutinv}));
  // sources/rtl/i2c_module.v(167)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(C*~B)*~(D*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("CE"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1011101000110000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u171|success_out_reg  (
    .a({_al_u170_o,\sel0_b2/B3 }),
    .b({_al_u159_o,\sel0_b0/B35 }),
    .c({n28,success_out}),
    .ce(n28),
    .clk(divider2[7]),
    .d({success,success}),
    .f({_al_u171_o,open_n742}),
    .q({open_n746,success_out}));  // sources/rtl/i2c_module.v(167)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(C*~B)))"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(D*~(A*~(C*~B)))"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0111010100000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0111010100000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u174|_al_u175  (
    .a({open_n747,_al_u163_o}),
    .b({_al_u122_o,_al_u174_o}),
    .c({n180_lutinv,n28}),
    .d({\sel0_b0/B35 ,scl_output_enable}),
    .f({_al_u174_o,_al_u175_o}));
  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~D*C)*~(B*A))"),
    //.LUTF1("(~A*~(B*~(~D*~C)))"),
    //.LUTG0("(~(~D*C)*~(B*A))"),
    //.LUTG1("(~A*~(B*~(~D*~C)))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111011100000111),
    .INIT_LUTF1(16'b0001000100010101),
    .INIT_LUTG0(16'b0111011100000111),
    .INIT_LUTG1(16'b0001000100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u176|scl_output_enable_reg  (
    .a({_al_u175_o,_al_u176_o}),
    .b({\sel0_b2/B4 ,_al_u156_o}),
    .c({ack_ok,n28}),
    .clk(divider2[7]),
    .d({n28,scl_output_enable}),
    .sr(reset_n),
    .f({_al_u176_o,open_n789}),
    .q({open_n793,scl_output_enable}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u178|_al_u269  (
    .b({open_n796,_al_u113_o}),
    .c({_al_u114_o,_al_u114_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({n191_lutinv,\sel0_b2/B20 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u179|_al_u255  (
    .b({open_n823,_al_u179_o}),
    .c({\sel0_b5/B34 ,\sel0_b0/B35 }),
    .d({n191_lutinv,_al_u170_o}),
    .f({_al_u179_o,n183_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u180|_al_u228  (
    .c({_al_u179_o,_al_u179_o}),
    .d({_al_u170_o,n28}),
    .f({_al_u180_o,_al_u228_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(D)*~((~B*~A))+C*D*~((~B*~A))+~(C)*D*(~B*~A)+C*D*(~B*~A))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~(D)*~((~B*~A))+C*D*~((~B*~A))+~(C)*D*(~B*~A)+C*D*(~B*~A))"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000111100000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000111100000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u182|reg5_b7  (
    .a({open_n872,_al_u180_o}),
    .b({open_n873,n28}),
    .c({ack_ok,state_next[7]}),
    .clk(divider2[7]),
    .d({n168_lutinv,_al_u182_o}),
    .sr(n2),
    .f({_al_u182_o,open_n891}),
    .q({open_n895,state_next[7]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u184|_al_u197  (
    .b({ack_ok,ack_ok}),
    .c({n28,n28}),
    .d({_al_u122_o,_al_u122_o}),
    .f({_al_u184_o,_al_u197_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B*~(~C*~A)))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("~(D*~(B*~(~C*~A)))"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100100011111111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1100100011111111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u186|reg5_b6  (
    .a({open_n918,_al_u180_o}),
    .b({open_n919,state_next[6]}),
    .c({_al_u185_o,n28}),
    .clk(divider2[7]),
    .d({\sel0_b5/B34 ,_al_u186_o}),
    .sr(n2),
    .f({_al_u186_o,open_n937}),
    .q({open_n941,state_next[6]}));  // sources/rtl/i2c_module.v(510)
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~D*~C*~A))"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001100110010),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u188|reg5_b5  (
    .a({open_n942,_al_u180_o}),
    .b({open_n943,_al_u188_o}),
    .c({state_next[5],n28}),
    .clk(divider2[7]),
    .d({_al_u185_o,state_next[3]}),
    .sr(n2),
    .f({_al_u188_o,open_n957}),
    .q({open_n961,state_next[5]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*A))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000011101110111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u190|_al_u145  (
    .a({open_n962,_al_u112_o}),
    .b({open_n963,_al_u138_o}),
    .c({_al_u144_o,_al_u108_o}),
    .d({_al_u108_o,_al_u144_o}),
    .f({n169_lutinv,_al_u145_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u191|_al_u109  (
    .c({_al_u108_o,_al_u108_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({\sel0_b4/B17 ,n146_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(~D*~C*~B))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1010101010101000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u193|_al_u192  (
    .a({n169_lutinv,_al_u112_o}),
    .b({_al_u146_o,_al_u116_o}),
    .c({\sel0_b4/B17 ,_al_u138_o}),
    .d({_al_u192_o,_al_u140_o}),
    .f({_al_u193_o,_al_u192_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~C*~B*A)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000010),
    .MODE("LOGIC"))
    \_al_u194|_al_u151  (
    .a({_al_u193_o,open_n1032}),
    .b({\sel0_b2/B4 ,open_n1033}),
    .c({\sel0_b4/B9 ,_al_u132_o}),
    .d({_al_u152_o,_al_u112_o}),
    .f({_al_u194_o,\sel0_b4/B9 }));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~B*~(D*A))"),
    //.LUT1("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111011111100),
    .INIT_LUT1(16'b0111011100110101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u196|reg5_b4  (
    .a({_al_u194_o,_al_u180_o}),
    .b({_al_u195_o,_al_u196_o}),
    .c({n28,_al_u202_o}),
    .clk(divider2[7]),
    .d({state_next[4],state_next[4]}),
    .sr(n2),
    .f({_al_u196_o,open_n1067}),
    .q({open_n1071,state_next[4]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u199|_al_u209  (
    .b({n164_lutinv,n164_lutinv}),
    .c({n28,n28}),
    .d({n180_lutinv,n180_lutinv}),
    .f({_al_u199_o,_al_u209_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u201|_al_u200  (
    .b({_al_u199_o,_al_u148_o}),
    .c({\sel0_b0/B1 ,n28}),
    .d({_al_u197_o,_al_u112_o}),
    .f({_al_u201_o,\sel0_b0/B1 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(~D*C*~B*~A)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u206|_al_u205  (
    .a({n88_lutinv,open_n1124}),
    .b({\sel0_b2/B21 ,state_next[0]}),
    .c({_al_u204_o,state_next[1]}),
    .d({_al_u205_o,_al_u125_o}),
    .f({_al_u206_o,_al_u205_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~B*~(D*A))"),
    //.LUTF1("(~D*~(~C*B))"),
    //.LUTG0("~(C*~B*~(D*A))"),
    //.LUTG1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111001111),
    .INIT_LUTF1(16'b0000000011110011),
    .INIT_LUTG0(16'b1110111111001111),
    .INIT_LUTG1(16'b0000000011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u208|reg5_b3  (
    .a({open_n1149,_al_u180_o}),
    .b({n28,_al_u208_o}),
    .c({state_next[3],_al_u216_o}),
    .clk(divider2[7]),
    .d({_al_u207_o,state_next[3]}),
    .sr(n2),
    .f({_al_u208_o,open_n1167}),
    .q({open_n1171,state_next[3]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(D*~(~C*~B))"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111110000000000),
    .MODE("LOGIC"))
    \_al_u212|_al_u213  (
    .b({_al_u116_o,open_n1174}),
    .c({_al_u132_o,n28}),
    .d({_al_u107_o,_al_u212_o}),
    .f({_al_u212_o,_al_u213_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(~B*~D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(~C*~(~B*~D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000111100001100),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000111100001100),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u215|_al_u214  (
    .b({_al_u213_o,\sel0_b5/B34 }),
    .c({_al_u214_o,n28}),
    .d({_al_u211_o,n181_lutinv}),
    .f({_al_u215_o,_al_u214_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(C*~B*~D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"))
    \_al_u216|_al_u210  (
    .b({_al_u210_o,n28}),
    .c({_al_u215_o,state_next[3]}),
    .d({_al_u209_o,_al_u197_o}),
    .f({_al_u216_o,_al_u210_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u218|_al_u259  (
    .c({_al_u146_o,_al_u132_o}),
    .d({_al_u145_o,_al_u116_o}),
    .f({_al_u218_o,_al_u259_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u220|_al_u136  (
    .a({\sel0_b0/B35 ,open_n1271}),
    .b({n158_lutinv,_al_u121_o}),
    .c({n80_lutinv,_al_u135_o}),
    .d({n81_lutinv,_al_u107_o}),
    .f({_al_u220_o,n80_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u223|_al_u222  (
    .a({_al_u130_o,open_n1292}),
    .b({_al_u218_o,_al_u221_o}),
    .c({_al_u220_o,_al_u112_o}),
    .d({_al_u222_o,\sel0_b2/B4 }),
    .f({_al_u223_o,_al_u222_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(~D*C*B))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~A*~(~D*C*B))"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0101010100010101),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0101010100010101),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u226|_al_u225  (
    .a({open_n1313,\sel0_b2/B3 }),
    .b({_al_u214_o,n28}),
    .c({_al_u225_o,state_next[2]}),
    .d({\sel0_b3/or_or_B13_B14_o_or_B_o_lutinv ,state_next[0]}),
    .f({_al_u226_o,_al_u225_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(D*~(~C*~A)))"),
    //.LUT1("(B*~(~C*~D))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111101100110011),
    .INIT_LUT1(16'b1100110011000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u227|reg5_b2  (
    .a({open_n1338,_al_u180_o}),
    .b({_al_u226_o,_al_u227_o}),
    .c({n28,_al_u228_o}),
    .clk(divider2[7]),
    .d({_al_u223_o,state_next[2]}),
    .sr(n2),
    .f({_al_u227_o,open_n1352}),
    .q({open_n1356,state_next[2]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D*C)*~(B*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~(D*C)*~(B*A))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000011101110111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000011101110111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u230|_al_u142  (
    .a({open_n1357,_al_u107_o}),
    .b({open_n1358,_al_u140_o}),
    .c({_al_u142_o,_al_u108_o}),
    .d({n81_lutinv,_al_u141_o}),
    .f({_al_u230_o,_al_u142_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*~A))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000101110111011),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u233|_al_u234  (
    .a({open_n1383,_al_u233_o}),
    .b({open_n1384,n28}),
    .c({n180_lutinv,_al_u107_o}),
    .d({\sel0_b2/B3 ,_al_u184_o}),
    .f({_al_u233_o,_al_u234_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~D*~(~C*~B*A))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000011111101),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011111101),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u235|_al_u237  (
    .a({open_n1405,_al_u235_o}),
    .b({open_n1406,\sel0_b1/B10 }),
    .c({_al_u204_o,_al_u192_o}),
    .d({n88_lutinv,n28}),
    .f({_al_u235_o,_al_u237_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u236|_al_u276  (
    .b({open_n1433,_al_u137_o}),
    .c({_al_u137_o,_al_u275_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({\sel0_b1/B10 ,_al_u276_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*~(~D*~A)))"),
    //.LUT1("(~D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001110110011),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u238|reg5_b1  (
    .a({_al_u232_o,_al_u180_o}),
    .b({_al_u234_o,_al_u238_o}),
    .c({_al_u237_o,state_next[1]}),
    .clk(divider2[7]),
    .d({_al_u214_o,_al_u228_o}),
    .sr(n2),
    .f({_al_u238_o,open_n1467}),
    .q({open_n1471,state_next[1]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(C@B))"),
    //.LUT1("(~D*~(~C*B))"),
    .INIT_LUT0(16'b0011110000000000),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"))
    \_al_u240|_al_u231  (
    .b({_al_u152_o,state_next[0]}),
    .c({state_next[0],state_next[1]}),
    .d({\sel0_b2/B4 ,_al_u152_o}),
    .f({_al_u240_o,_al_u231_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u242|_al_u241  (
    .b({\sel0_b3/B26 ,open_n1496}),
    .c({_al_u146_o,_al_u131_o}),
    .d({\sel0_b2/B21 ,_al_u107_o}),
    .f({_al_u242_o,\sel0_b3/B26 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*~C*B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u245|_al_u243  (
    .a({\sel0_b4/B17 ,open_n1521}),
    .b({_al_u154_o,_al_u135_o}),
    .c({_al_u243_o,_al_u137_o}),
    .d({_al_u244_o,_al_u107_o}),
    .f({_al_u245_o,_al_u243_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*C*B*~A)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"))
    \_al_u246|_al_u274  (
    .a({_al_u197_o,open_n1542}),
    .b({_al_u240_o,open_n1543}),
    .c({_al_u242_o,_al_u153_o}),
    .d({_al_u245_o,_al_u137_o}),
    .f({_al_u246_o,\sel0_b1/B23 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~(~B*~A))"),
    //.LUT1("(~D*~(C*B))"),
    .INIT_LUT0(16'b0000111000000000),
    .INIT_LUT1(16'b0000000000111111),
    .MODE("LOGIC"))
    \_al_u248|_al_u247  (
    .a({open_n1564,n191_lutinv}),
    .b({n146_lutinv,\sel0_b5/B34 }),
    .c({control_reg[0],n28}),
    .d({_al_u247_o,state_next[0]}),
    .f({_al_u248_o,_al_u247_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(B*~(~C*~(~D*A)))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b1100000011001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u250|reg5_b0  (
    .a({_al_u246_o,open_n1585}),
    .b({_al_u248_o,_al_u250_o}),
    .c({_al_u249_o,state_next[0]}),
    .clk(divider2[7]),
    .d({_al_u228_o,_al_u180_o}),
    .sr(n2),
    .f({_al_u250_o,open_n1599}),
    .q({open_n1603,state_next[0]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(D*~(~C*~B*A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(D*~(~C*~B*A))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111110100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111110100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u254|_al_u253  (
    .a({_al_u170_o,open_n1604}),
    .b({\sel0_b0/B35 ,open_n1605}),
    .c({_al_u252_o,ready}),
    .d({n107_lutinv,n28}),
    .f({_al_u254_o,n107_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u257|_al_u219  (
    .c({_al_u149_o,_al_u120_o}),
    .d({n80_lutinv,_al_u107_o}),
    .f({_al_u257_o,n158_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(C*~B*D)"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"))
    \_al_u258|_al_u264  (
    .b({_al_u231_o,_al_u263_o}),
    .c({_al_u257_o,n28}),
    .d({_al_u218_o,_al_u258_o}),
    .f({_al_u258_o,_al_u264_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u260|_al_u252  (
    .b({_al_u167_o,open_n1682}),
    .c({_al_u259_o,state_next[0]}),
    .d({_al_u252_o,_al_u114_o}),
    .f({_al_u260_o,_al_u252_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u261|_al_u181  (
    .c({_al_u131_o,_al_u121_o}),
    .d({_al_u112_o,_al_u112_o}),
    .f({\sel0_b3/B8 ,n168_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u262|_al_u224  (
    .b({\sel0_b3/B26 ,ack_ok}),
    .c({\sel0_b3/B8 ,n28}),
    .d({n168_lutinv,n168_lutinv}),
    .f({_al_u262_o,\sel0_b3/or_or_B13_B14_o_or_B_o_lutinv }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B*A))"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~(~C*~B*A))"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000011111101),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000011111101),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u263|_al_u232  (
    .a({_al_u130_o,_al_u230_o}),
    .b({_al_u230_o,_al_u231_o}),
    .c({_al_u260_o,\sel0_b0/B35 }),
    .d({_al_u262_o,n28}),
    .f({_al_u263_o,_al_u232_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u268|reg2_b7  (
    .c({_al_u141_o,slave_address[7]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u267_o,n28}),
    .mi({open_n1780,writedata[7]}),
    .sr(n2),
    .f({_al_u268_o,_al_u267_o}),
    .q({open_n1795,slave_address[7]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~(C*B)*~(D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0001010100111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u273|reg3_b4  (
    .a({\sel0_b2/B20 ,open_n1796}),
    .b({\sel0_b2/B29 ,open_n1797}),
    .c({_al_u271_o,slave_reg_address[4]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u272_o,n28}),
    .mi({open_n1808,writedata[4]}),
    .sr(n2),
    .f({_al_u273_o,_al_u272_o}),
    .q({open_n1812,slave_reg_address[4]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u278|_al_u270  (
    .c({_al_u138_o,_al_u138_o}),
    .d({_al_u112_o,_al_u107_o}),
    .f({\sel0_b2/B11 ,\sel0_b2/B29 }));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~(D*B)*~(C*A))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0001001101011111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0001001101011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u281|reg4_b5  (
    .a({\sel0_b2/B11 ,open_n1837}),
    .b({\sel0_b1/B10 ,open_n1838}),
    .c({_al_u279_o,slave_data_1[5]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u280_o,n28}),
    .mi({open_n1842,writedata[5]}),
    .sr(n2),
    .f({_al_u281_o,_al_u279_o}),
    .q({open_n1857,slave_data_1[5]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(D*~C*A))"),
    //.LUT1("(D*C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000100110011),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u282|reg3_b7  (
    .a({_al_u268_o,\sel0_b1/B23 }),
    .b({_al_u273_o,_al_u276_o}),
    .c({_al_u277_o,n28}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u281_o,slave_reg_address[7]}),
    .mi({open_n1868,writedata[7]}),
    .sr(n2),
    .f({_al_u282_o,_al_u277_o}),
    .q({open_n1872,slave_reg_address[7]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u284|_al_u283  (
    .c({_al_u283_o,slave_address[0]}),
    .d({\sel0_b3/B26 ,n28}),
    .f({_al_u284_o,_al_u283_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0101001101011111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0101001101011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u287|reg3_b3  (
    .a({_al_u285_o,open_n1901}),
    .b({_al_u286_o,open_n1902}),
    .c({_al_u157_o,slave_reg_address[3]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u244_o,n28}),
    .mi({open_n1906,writedata[3]}),
    .sr(n2),
    .f({_al_u287_o,_al_u285_o}),
    .q({open_n1921,slave_reg_address[3]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u290|reg4_b1  (
    .a({_al_u152_o,open_n1922}),
    .b({\sel0_b3/B8 ,n28}),
    .c({_al_u288_o,slave_data_1[1]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u289_o,_al_u113_o}),
    .mi({open_n1933,writedata[1]}),
    .sr(n2),
    .f({_al_u290_o,_al_u288_o}),
    .q({open_n1937,slave_data_1[1]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u291|_al_u221  (
    .b({_al_u287_o,open_n1940}),
    .c({_al_u290_o,_al_u126_o}),
    .d({_al_u284_o,_al_u125_o}),
    .f({_al_u291_o,_al_u221_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u293|_al_u292  (
    .b({_al_u291_o,n28}),
    .c({\sel1/B33 ,sda}),
    .d({_al_u282_o,\sel0_b5/B34 }),
    .f({_al_u293_o,\sel1/B33 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~D*~(~C*~A)))"),
    //.LUTF1("(D*~(~B*~(~C*A)))"),
    //.LUTG0("(~B*~(~D*~(~C*~A)))"),
    //.LUTG1("(D*~(~B*~(~C*A)))"),
    .INIT_LUTF0(16'b0011001100000001),
    .INIT_LUTF1(16'b1100111000000000),
    .INIT_LUTG0(16'b0011001100000001),
    .INIT_LUTG1(16'b1100111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u299|_al_u163  (
    .a({\sel0_b2/B3 ,\sel0_b2/B3 }),
    .b({n181_lutinv,n181_lutinv}),
    .c({n28,\sel0_b5/B34 }),
    .d({sda,n28}),
    .f({_al_u299_o,_al_u163_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u301|_al_u300  (
    .b({open_n2013,n28}),
    .c({_al_u300_o,slave_data_1[0]}),
    .d({_al_u152_o,_al_u120_o}),
    .f({_al_u301_o,_al_u300_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*B)*~(C*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001001101011111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u305|reg2_b1  (
    .a({open_n2038,n155_lutinv}),
    .b({open_n2039,\sel0_b2/B12 }),
    .c({_al_u132_o,slave_address[1]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u107_o,slave_data_1[6]}),
    .mi({open_n2050,writedata[1]}),
    .sr(n2),
    .f({n155_lutinv,_al_u307_o}),
    .q({open_n2054,slave_address[1]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(~C*~B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u306|_al_u146  (
    .b({open_n2057,_al_u135_o}),
    .c({_al_u135_o,_al_u137_o}),
    .d({_al_u112_o,_al_u112_o}),
    .f({\sel0_b2/B12 ,_al_u146_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~(C*B)*~(D*A))"),
    //.LUT1("(~D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001010100111111),
    .INIT_LUT1(16'b0000000001111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u308|reg3_b2  (
    .a({_al_u303_o,n169_lutinv}),
    .b({_al_u304_o,n164_lutinv}),
    .c({_al_u307_o,slave_reg_address[2]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({n28,slave_data_1[7]}),
    .mi({open_n2092,writedata[2]}),
    .sr(n2),
    .f({_al_u308_o,_al_u304_o}),
    .q({open_n2096,slave_reg_address[2]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u310|_al_u309  (
    .c({_al_u195_o,sda}),
    .d({n106_lutinv,n28}),
    .f({_al_u310_o,n106_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(~D*~A))"),
    //.LUT1("(~D*~C*B*~A)"),
    .INIT_LUT0(16'b0000001100000010),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u311|_al_u302  (
    .a({_al_u297_o,_al_u298_o}),
    .b({_al_u302_o,_al_u299_o}),
    .c({_al_u308_o,_al_u301_o}),
    .d({_al_u310_o,n28}),
    .f({_al_u311_o,_al_u302_o}));
  // sources/rtl/i2c_module.v(76)
  // sources/rtl/i2c_module.v(153)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(D*~C*~(B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000101100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ack_ok_reg|clk_div_reg  (
    .a({\sel0_b2/B4 ,open_n2141}),
    .b({_al_u122_o,open_n2142}),
    .c({sda_in,open_n2143}),
    .clk(divider2[7]),
    .d({n28,n28}),
    .q({ack_ok,n28}));  // sources/rtl/i2c_module.v(76)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u316"),
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
    \add0/u3_al_u317  (
    .a({divider2[5],divider2[3]}),
    .b({divider2[6],divider2[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n1[5],n1[3]}),
    .fco(\add0/c7 ),
    .fx({n1[6],n1[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u316"),
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
    \add0/u7_al_u318  (
    .a({open_n2181,divider2[7]}),
    .c(2'b00),
    .d({open_n2186,1'b0}),
    .fci(\add0/c7 ),
    .f({open_n2203,n1[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u316"),
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
    \add0/ucin_al_u316  (
    .a({divider2[1],1'b0}),
    .b({divider2[2],divider2[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n1[1:0]),
    .f({n1[1],open_n2223}),
    .fco(\add0/c3 ),
    .fx({n1[2],n1[0]}),
    .q(divider2[1:0]));
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
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
    \reg0_b2|reg0_b7  (
    .clk(clk),
    .mi({n1[2],n1[7]}),
    .q({divider2[2],divider2[7]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
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
    \reg0_b3|reg0_b6  (
    .clk(clk),
    .mi({n1[3],n1[6]}),
    .q({divider2[3],divider2[6]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
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
    \reg0_b4|reg0_b5  (
    .clk(clk),
    .mi({n1[4],n1[5]}),
    .q({divider2[4],divider2[5]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b0|reg2_b6  (
    .b({address[0],open_n2309}),
    .c({write,slave_address[6]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({address[1],n28}),
    .mi({writedata[0],writedata[6]}),
    .sr(n2),
    .f({mux6_b0_sel_is_3_o,_al_u286_o}),
    .q({slave_address[0],slave_address[6]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b2|reg2_b3  (
    .c({slave_address[2],slave_address[3]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({n28,n28}),
    .mi({writedata[2],writedata[3]}),
    .sr(n2),
    .f({_al_u275_o,_al_u271_o}),
    .q({slave_address[2],slave_address[3]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b4|reg2_b5  (
    .b({_al_u135_o,_al_u121_o}),
    .c({slave_address[4],slave_address[5]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u107_o,_al_u107_o}),
    .mi({writedata[4],writedata[5]}),
    .sr(n2),
    .f({_al_u295_o,_al_u294_o}),
    .q({slave_address[4],slave_address[5]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~D*~(C*B))"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~D*~(C*B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000000000111111),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg3_b1|reg3_b0  (
    .b({\sel0_b4/B17 ,address[0]}),
    .c({slave_reg_address[1],write}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({n180_lutinv,address[1]}),
    .mi(writedata[1:0]),
    .sr(n2),
    .f({_al_u303_o,mux5_b0_sel_is_3_o}),
    .q(slave_reg_address[1:0]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D*B)))"),
    //.LUT1("(~C*~B*~(D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110100000101),
    .INIT_LUT1(16'b0000000100000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg3_b6|reg3_b5  (
    .a({\sel0_b3/B22 ,_al_u296_o}),
    .b({_al_u294_o,\sel0_b2/B21 }),
    .c({_al_u295_o,n28}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d(slave_reg_address[6:5]),
    .mi(writedata[6:5]),
    .sr(n2),
    .f({_al_u296_o,_al_u297_o}),
    .q(slave_reg_address[6:5]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg4_b0|reg4_b4  (
    .b({address[0],open_n2393}),
    .c({write,slave_data_1[4]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({address[1],n28}),
    .mi({writedata[0],writedata[4]}),
    .sr(n2),
    .f({mux4_b0_sel_is_3_o,_al_u280_o}),
    .q({slave_data_1[0],slave_data_1[4]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg4_b3|reg4_b2  (
    .a({\sel0_b4/B16 ,open_n2411}),
    .b({\sel0_b4/B9 ,open_n2412}),
    .c({slave_reg_address[0],slave_data_1[2]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({slave_data_1[3],n28}),
    .mi(writedata[3:2]),
    .sr(n2),
    .f({_al_u298_o,_al_u289_o}),
    .q(slave_data_1[3:2]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
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
    \reg4_b6|reg4_b7  (
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .mi({writedata[6],writedata[7]}),
    .sr(n2),
    .q({slave_data_1[6],slave_data_1[7]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(~D)"),
    //.LUTG1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000001111001111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000001111001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \scl_out_reg|_al_u313  (
    .b({scl_output_enable,open_n2455}),
    .c({scl_output_zero,open_n2456}),
    .clk(divider2[7]),
    .d({scl_out,reset_n}),
    .f({open_n2475,n2}),
    .q({scl_out,open_n2479}));  // sources/rtl/i2c_module.v(137)
  EG_PHY_MSLICE #(
    //.LUT0("(~(~D*C)*~(B*~A))"),
    //.LUT1("~(~C*~B*~D)"),
    .CEMUX("INV"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1011101100001011),
    .INIT_LUT1(16'b1111111111111100),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \scl_output_zero_reg|_al_u165  (
    .a({open_n2480,\sel0_b2/B4 }),
    .b({_al_u164_o,_al_u122_o}),
    .c({_al_u165_o,n28}),
    .ce(n2),
    .clk(divider2[7]),
    .d({_al_u160_o,scl_output_zero}),
    .f({open_n2494,_al_u165_o}),
    .q({scl_output_zero,open_n2498}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("~(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010111010000),
    .INIT_LUT1(16'b1111111111111100),
    .MODE("LOGIC"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \sda_oe_reg|_al_u265  (
    .a({open_n2499,_al_u195_o}),
    .b({_al_u264_o,n181_lutinv}),
    .c({_al_u265_o,sda_oe}),
    .clk(divider2[7]),
    .d({n183_lutinv,n28}),
    .sr(reset_n),
    .f({open_n2513,_al_u265_o}),
    .q({sda_oe,open_n2517}));  // sources/rtl/i2c_module.v(1066)
  // sources/rtl/i2c_module.v(1066)
  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~A*~(D*~C))"),
    //.LUTF1("~(C*B*~D)"),
    //.LUTG0("~(~B*~A*~(D*~C))"),
    //.LUTG1("~(C*B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111101110),
    .INIT_LUTF1(16'b1111111100111111),
    .INIT_LUTG0(16'b1110111111101110),
    .INIT_LUTG1(16'b1111111100111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \sda_reg|ready_reg  (
    .a({open_n2518,_al_u254_o}),
    .b({_al_u293_o,n183_lutinv}),
    .c({_al_u311_o,_al_u163_o}),
    .clk(divider2[7]),
    .d({n183_lutinv,ready}),
    .sr(reset_n),
    .q({sda,ready}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("~(~C*~A*~(D*~B))"),
    //.LUTG0("(A*(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("~(~C*~A*~(D*~B))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010100000001000),
    .INIT_LUTF1(16'b1111101111111010),
    .INIT_LUTG0(16'b1010100000001000),
    .INIT_LUTG1(16'b1111101111111010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \success_reg|_al_u172  (
    .a({_al_u171_o,\sel0_b2/B4 }),
    .b({_al_u163_o,ack_ok}),
    .c({\sel5/B3 ,n28}),
    .clk(divider2[7]),
    .d({success,success}),
    .sr(reset_n),
    .f({open_n2558,\sel5/B3 }),
    .q({success,open_n2562}));  // sources/rtl/i2c_module.v(1066)

endmodule 

