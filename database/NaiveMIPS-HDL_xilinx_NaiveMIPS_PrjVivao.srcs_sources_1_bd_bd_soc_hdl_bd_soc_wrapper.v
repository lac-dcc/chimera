//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
//Date        : Mon May  7 06:04:10 2018
//Host        : a6f209d2376e running 64-bit unknown
//Command     : generate_target bd_soc_wrapper.bd
//Design      : bd_soc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_soc_wrapper
   (LCD_csel,
    LCD_nrst,
    LCD_rd,
    LCD_rs,
    LCD_wr,
    MDIO_mdc,
    MII_col,
    MII_crs,
    MII_rst_n,
    MII_rx_clk,
    MII_rx_dv,
    MII_rx_er,
    MII_rxd,
    MII_tx_clk,
    MII_tx_en,
    MII_txd,
    PS2_CLK_i,
    PS2_CLK_o,
    PS2_CLK_t,
    PS2_DAT_i,
    PS2_DAT_o,
    PS2_DAT_t,
    SW,
    UART_baudoutn,
    UART_ctsn,
    UART_dcdn,
    UART_ddis,
    UART_dsrn,
    UART_dtrn,
    UART_out1n,
    UART_out2n,
    UART_ri,
    UART_rtsn,
    UART_rxd,
    UART_rxrdyn,
    UART_txd,
    UART_txrdyn,
    VGA_INTF_blue,
    VGA_INTF_clk,
    VGA_INTF_de,
    VGA_INTF_dps,
    VGA_INTF_green,
    VGA_INTF_hsync,
    VGA_INTF_red,
    VGA_INTF_vsync,
    aux_reset_n,
    cfg_flash_io0_io,
    cfg_flash_io1_io,
    cfg_flash_ss_io,
    cpu_clk,
    ddr3_addr,
    ddr3_ba,
    ddr3_cas_n,
    ddr3_ck_n,
    ddr3_ck_p,
    ddr3_cke,
    ddr3_dm,
    ddr3_dq,
    ddr3_dqs_n,
    ddr3_dqs_p,
    ddr3_odt,
    ddr3_ras_n,
    ddr3_reset_n,
    ddr3_we_n,
    ddr_ref_clk,
    ddr_sys_clk,
    iaddr,
    lcd_data_tri_io,
    led,
    led_rg0,
    led_rg1,
    mdio_mdio_io,
    num_data,
    spi_flash_io0_io,
    spi_flash_io1_io,
    spi_flash_io2_io,
    spi_flash_io3_io,
    spi_flash_sck_io,
    spi_flash_ss_io,
    sys_rst,
    triple_byte_w);
  output LCD_csel;
  output LCD_nrst;
  output LCD_rd;
  output LCD_rs;
  output LCD_wr;
  output MDIO_mdc;
  input MII_col;
  input MII_crs;
  output MII_rst_n;
  input MII_rx_clk;
  input MII_rx_dv;
  input MII_rx_er;
  input [3:0]MII_rxd;
  input MII_tx_clk;
  output MII_tx_en;
  output [3:0]MII_txd;
  input PS2_CLK_i;
  output PS2_CLK_o;
  output PS2_CLK_t;
  input PS2_DAT_i;
  output PS2_DAT_o;
  output PS2_DAT_t;
  input [31:0]SW;
  output UART_baudoutn;
  input UART_ctsn;
  input UART_dcdn;
  output UART_ddis;
  input UART_dsrn;
  output UART_dtrn;
  output UART_out1n;
  output UART_out2n;
  input UART_ri;
  output UART_rtsn;
  input UART_rxd;
  output UART_rxrdyn;
  output UART_txd;
  output UART_txrdyn;
  output [5:0]VGA_INTF_blue;
  output VGA_INTF_clk;
  output VGA_INTF_de;
  output VGA_INTF_dps;
  output [5:0]VGA_INTF_green;
  output VGA_INTF_hsync;
  output [5:0]VGA_INTF_red;
  output VGA_INTF_vsync;
  input aux_reset_n;
  inout cfg_flash_io0_io;
  inout cfg_flash_io1_io;
  inout [0:0]cfg_flash_ss_io;
  input cpu_clk;
  output [12:0]ddr3_addr;
  output [2:0]ddr3_ba;
  output ddr3_cas_n;
  output [0:0]ddr3_ck_n;
  output [0:0]ddr3_ck_p;
  output [0:0]ddr3_cke;
  output [1:0]ddr3_dm;
  inout [15:0]ddr3_dq;
  inout [1:0]ddr3_dqs_n;
  inout [1:0]ddr3_dqs_p;
  output [0:0]ddr3_odt;
  output ddr3_ras_n;
  output ddr3_reset_n;
  output ddr3_we_n;
  input ddr_ref_clk;
  input ddr_sys_clk;
  output [31:0]iaddr;
  inout [15:0]lcd_data_tri_io;
  output [15:0]led;
  output [1:0]led_rg0;
  output [1:0]led_rg1;
  inout mdio_mdio_io;
  output [31:0]num_data;
  inout spi_flash_io0_io;
  inout spi_flash_io1_io;
  inout spi_flash_io2_io;
  inout spi_flash_io3_io;
  inout spi_flash_sck_io;
  inout [0:0]spi_flash_ss_io;
  input sys_rst;
  output triple_byte_w;

  wire LCD_csel;
  wire LCD_nrst;
  wire LCD_rd;
  wire LCD_rs;
  wire LCD_wr;
  wire MDIO_mdc;
  wire MII_col;
  wire MII_crs;
  wire MII_rst_n;
  wire MII_rx_clk;
  wire MII_rx_dv;
  wire MII_rx_er;
  wire [3:0]MII_rxd;
  wire MII_tx_clk;
  wire MII_tx_en;
  wire [3:0]MII_txd;
  wire PS2_CLK_i;
  wire PS2_CLK_o;
  wire PS2_CLK_t;
  wire PS2_DAT_i;
  wire PS2_DAT_o;
  wire PS2_DAT_t;
  wire [31:0]SW;
  wire UART_baudoutn;
  wire UART_ctsn;
  wire UART_dcdn;
  wire UART_ddis;
  wire UART_dsrn;
  wire UART_dtrn;
  wire UART_out1n;
  wire UART_out2n;
  wire UART_ri;
  wire UART_rtsn;
  wire UART_rxd;
  wire UART_rxrdyn;
  wire UART_txd;
  wire UART_txrdyn;
  wire [5:0]VGA_INTF_blue;
  wire VGA_INTF_clk;
  wire VGA_INTF_de;
  wire VGA_INTF_dps;
  wire [5:0]VGA_INTF_green;
  wire VGA_INTF_hsync;
  wire [5:0]VGA_INTF_red;
  wire VGA_INTF_vsync;
  wire aux_reset_n;
  wire cfg_flash_io0_i;
  wire cfg_flash_io0_io;
  wire cfg_flash_io0_o;
  wire cfg_flash_io0_t;
  wire cfg_flash_io1_i;
  wire cfg_flash_io1_io;
  wire cfg_flash_io1_o;
  wire cfg_flash_io1_t;
  wire [0:0]cfg_flash_ss_i_0;
  wire [0:0]cfg_flash_ss_io_0;
  wire [0:0]cfg_flash_ss_o_0;
  wire cfg_flash_ss_t;
  wire cpu_clk;
  wire [12:0]ddr3_addr;
  wire [2:0]ddr3_ba;
  wire ddr3_cas_n;
  wire [0:0]ddr3_ck_n;
  wire [0:0]ddr3_ck_p;
  wire [0:0]ddr3_cke;
  wire [1:0]ddr3_dm;
  wire [15:0]ddr3_dq;
  wire [1:0]ddr3_dqs_n;
  wire [1:0]ddr3_dqs_p;
  wire [0:0]ddr3_odt;
  wire ddr3_ras_n;
  wire ddr3_reset_n;
  wire ddr3_we_n;
  wire ddr_ref_clk;
  wire ddr_sys_clk;
  wire [31:0]iaddr;
  wire [0:0]lcd_data_tri_i_0;
  wire [1:1]lcd_data_tri_i_1;
  wire [10:10]lcd_data_tri_i_10;
  wire [11:11]lcd_data_tri_i_11;
  wire [12:12]lcd_data_tri_i_12;
  wire [13:13]lcd_data_tri_i_13;
  wire [14:14]lcd_data_tri_i_14;
  wire [15:15]lcd_data_tri_i_15;
  wire [2:2]lcd_data_tri_i_2;
  wire [3:3]lcd_data_tri_i_3;
  wire [4:4]lcd_data_tri_i_4;
  wire [5:5]lcd_data_tri_i_5;
  wire [6:6]lcd_data_tri_i_6;
  wire [7:7]lcd_data_tri_i_7;
  wire [8:8]lcd_data_tri_i_8;
  wire [9:9]lcd_data_tri_i_9;
  wire [0:0]lcd_data_tri_io_0;
  wire [1:1]lcd_data_tri_io_1;
  wire [10:10]lcd_data_tri_io_10;
  wire [11:11]lcd_data_tri_io_11;
  wire [12:12]lcd_data_tri_io_12;
  wire [13:13]lcd_data_tri_io_13;
  wire [14:14]lcd_data_tri_io_14;
  wire [15:15]lcd_data_tri_io_15;
  wire [2:2]lcd_data_tri_io_2;
  wire [3:3]lcd_data_tri_io_3;
  wire [4:4]lcd_data_tri_io_4;
  wire [5:5]lcd_data_tri_io_5;
  wire [6:6]lcd_data_tri_io_6;
  wire [7:7]lcd_data_tri_io_7;
  wire [8:8]lcd_data_tri_io_8;
  wire [9:9]lcd_data_tri_io_9;
  wire [0:0]lcd_data_tri_o_0;
  wire [1:1]lcd_data_tri_o_1;
  wire [10:10]lcd_data_tri_o_10;
  wire [11:11]lcd_data_tri_o_11;
  wire [12:12]lcd_data_tri_o_12;
  wire [13:13]lcd_data_tri_o_13;
  wire [14:14]lcd_data_tri_o_14;
  wire [15:15]lcd_data_tri_o_15;
  wire [2:2]lcd_data_tri_o_2;
  wire [3:3]lcd_data_tri_o_3;
  wire [4:4]lcd_data_tri_o_4;
  wire [5:5]lcd_data_tri_o_5;
  wire [6:6]lcd_data_tri_o_6;
  wire [7:7]lcd_data_tri_o_7;
  wire [8:8]lcd_data_tri_o_8;
  wire [9:9]lcd_data_tri_o_9;
  wire [0:0]lcd_data_tri_t_0;
  wire [1:1]lcd_data_tri_t_1;
  wire [10:10]lcd_data_tri_t_10;
  wire [11:11]lcd_data_tri_t_11;
  wire [12:12]lcd_data_tri_t_12;
  wire [13:13]lcd_data_tri_t_13;
  wire [14:14]lcd_data_tri_t_14;
  wire [15:15]lcd_data_tri_t_15;
  wire [2:2]lcd_data_tri_t_2;
  wire [3:3]lcd_data_tri_t_3;
  wire [4:4]lcd_data_tri_t_4;
  wire [5:5]lcd_data_tri_t_5;
  wire [6:6]lcd_data_tri_t_6;
  wire [7:7]lcd_data_tri_t_7;
  wire [8:8]lcd_data_tri_t_8;
  wire [9:9]lcd_data_tri_t_9;
  wire [15:0]led;
  wire [1:0]led_rg0;
  wire [1:0]led_rg1;
  wire mdio_mdio_i;
  wire mdio_mdio_io;
  wire mdio_mdio_o;
  wire mdio_mdio_t;
  wire [31:0]num_data;
  wire spi_flash_io0_i;
  wire spi_flash_io0_io;
  wire spi_flash_io0_o;
  wire spi_flash_io0_t;
  wire spi_flash_io1_i;
  wire spi_flash_io1_io;
  wire spi_flash_io1_o;
  wire spi_flash_io1_t;
  wire spi_flash_io2_i;
  wire spi_flash_io2_io;
  wire spi_flash_io2_o;
  wire spi_flash_io2_t;
  wire spi_flash_io3_i;
  wire spi_flash_io3_io;
  wire spi_flash_io3_o;
  wire spi_flash_io3_t;
  wire spi_flash_sck_i;
  wire spi_flash_sck_io;
  wire spi_flash_sck_o;
  wire spi_flash_sck_t;
  wire [0:0]spi_flash_ss_i_0;
  wire [0:0]spi_flash_ss_io_0;
  wire [0:0]spi_flash_ss_o_0;
  wire spi_flash_ss_t;
  wire sys_rst;
  wire triple_byte_w;

  bd_soc bd_soc_i
       (.CFG_FLASH_io0_i(cfg_flash_io0_i),
        .CFG_FLASH_io0_o(cfg_flash_io0_o),
        .CFG_FLASH_io0_t(cfg_flash_io0_t),
        .CFG_FLASH_io1_i(cfg_flash_io1_i),
        .CFG_FLASH_io1_o(cfg_flash_io1_o),
        .CFG_FLASH_io1_t(cfg_flash_io1_t),
        .CFG_FLASH_ss_i(cfg_flash_ss_i_0),
        .CFG_FLASH_ss_o(cfg_flash_ss_o_0),
        .CFG_FLASH_ss_t(cfg_flash_ss_t),
        .LCD_csel(LCD_csel),
        .LCD_data_tri_i({lcd_data_tri_i_15,lcd_data_tri_i_14,lcd_data_tri_i_13,lcd_data_tri_i_12,lcd_data_tri_i_11,lcd_data_tri_i_10,lcd_data_tri_i_9,lcd_data_tri_i_8,lcd_data_tri_i_7,lcd_data_tri_i_6,lcd_data_tri_i_5,lcd_data_tri_i_4,lcd_data_tri_i_3,lcd_data_tri_i_2,lcd_data_tri_i_1,lcd_data_tri_i_0}),
        .LCD_data_tri_o({lcd_data_tri_o_15,lcd_data_tri_o_14,lcd_data_tri_o_13,lcd_data_tri_o_12,lcd_data_tri_o_11,lcd_data_tri_o_10,lcd_data_tri_o_9,lcd_data_tri_o_8,lcd_data_tri_o_7,lcd_data_tri_o_6,lcd_data_tri_o_5,lcd_data_tri_o_4,lcd_data_tri_o_3,lcd_data_tri_o_2,lcd_data_tri_o_1,lcd_data_tri_o_0}),
        .LCD_data_tri_t({lcd_data_tri_t_15,lcd_data_tri_t_14,lcd_data_tri_t_13,lcd_data_tri_t_12,lcd_data_tri_t_11,lcd_data_tri_t_10,lcd_data_tri_t_9,lcd_data_tri_t_8,lcd_data_tri_t_7,lcd_data_tri_t_6,lcd_data_tri_t_5,lcd_data_tri_t_4,lcd_data_tri_t_3,lcd_data_tri_t_2,lcd_data_tri_t_1,lcd_data_tri_t_0}),
        .LCD_nrst(LCD_nrst),
        .LCD_rd(LCD_rd),
        .LCD_rs(LCD_rs),
        .LCD_wr(LCD_wr),
        .MDIO_mdc(MDIO_mdc),
        .MDIO_mdio_i(mdio_mdio_i),
        .MDIO_mdio_o(mdio_mdio_o),
        .MDIO_mdio_t(mdio_mdio_t),
        .MII_col(MII_col),
        .MII_crs(MII_crs),
        .MII_rst_n(MII_rst_n),
        .MII_rx_clk(MII_rx_clk),
        .MII_rx_dv(MII_rx_dv),
        .MII_rx_er(MII_rx_er),
        .MII_rxd(MII_rxd),
        .MII_tx_clk(MII_tx_clk),
        .MII_tx_en(MII_tx_en),
        .MII_txd(MII_txd),
        .PS2_CLK_i(PS2_CLK_i),
        .PS2_CLK_o(PS2_CLK_o),
        .PS2_CLK_t(PS2_CLK_t),
        .PS2_DAT_i(PS2_DAT_i),
        .PS2_DAT_o(PS2_DAT_o),
        .PS2_DAT_t(PS2_DAT_t),
        .SPI_FLASH_io0_i(spi_flash_io0_i),
        .SPI_FLASH_io0_o(spi_flash_io0_o),
        .SPI_FLASH_io0_t(spi_flash_io0_t),
        .SPI_FLASH_io1_i(spi_flash_io1_i),
        .SPI_FLASH_io1_o(spi_flash_io1_o),
        .SPI_FLASH_io1_t(spi_flash_io1_t),
        .SPI_FLASH_io2_i(spi_flash_io2_i),
        .SPI_FLASH_io2_o(spi_flash_io2_o),
        .SPI_FLASH_io2_t(spi_flash_io2_t),
        .SPI_FLASH_io3_i(spi_flash_io3_i),
        .SPI_FLASH_io3_o(spi_flash_io3_o),
        .SPI_FLASH_io3_t(spi_flash_io3_t),
        .SPI_FLASH_sck_i(spi_flash_sck_i),
        .SPI_FLASH_sck_o(spi_flash_sck_o),
        .SPI_FLASH_sck_t(spi_flash_sck_t),
        .SPI_FLASH_ss_i(spi_flash_ss_i_0),
        .SPI_FLASH_ss_o(spi_flash_ss_o_0),
        .SPI_FLASH_ss_t(spi_flash_ss_t),
        .SW(SW),
        .UART_baudoutn(UART_baudoutn),
        .UART_ctsn(UART_ctsn),
        .UART_dcdn(UART_dcdn),
        .UART_ddis(UART_ddis),
        .UART_dsrn(UART_dsrn),
        .UART_dtrn(UART_dtrn),
        .UART_out1n(UART_out1n),
        .UART_out2n(UART_out2n),
        .UART_ri(UART_ri),
        .UART_rtsn(UART_rtsn),
        .UART_rxd(UART_rxd),
        .UART_rxrdyn(UART_rxrdyn),
        .UART_txd(UART_txd),
        .UART_txrdyn(UART_txrdyn),
        .VGA_INTF_blue(VGA_INTF_blue),
        .VGA_INTF_clk(VGA_INTF_clk),
        .VGA_INTF_de(VGA_INTF_de),
        .VGA_INTF_dps(VGA_INTF_dps),
        .VGA_INTF_green(VGA_INTF_green),
        .VGA_INTF_hsync(VGA_INTF_hsync),
        .VGA_INTF_red(VGA_INTF_red),
        .VGA_INTF_vsync(VGA_INTF_vsync),
        .aux_reset_n(aux_reset_n),
        .cpu_clk(cpu_clk),
        .ddr3_addr(ddr3_addr),
        .ddr3_ba(ddr3_ba),
        .ddr3_cas_n(ddr3_cas_n),
        .ddr3_ck_n(ddr3_ck_n),
        .ddr3_ck_p(ddr3_ck_p),
        .ddr3_cke(ddr3_cke),
        .ddr3_dm(ddr3_dm),
        .ddr3_dq(ddr3_dq),
        .ddr3_dqs_n(ddr3_dqs_n),
        .ddr3_dqs_p(ddr3_dqs_p),
        .ddr3_odt(ddr3_odt),
        .ddr3_ras_n(ddr3_ras_n),
        .ddr3_reset_n(ddr3_reset_n),
        .ddr3_we_n(ddr3_we_n),
        .ddr_ref_clk(ddr_ref_clk),
        .ddr_sys_clk(ddr_sys_clk),
        .iaddr(iaddr),
        .led(led),
        .led_rg0(led_rg0),
        .led_rg1(led_rg1),
        .num_data(num_data),
        .sys_rst(sys_rst),
        .triple_byte_w(triple_byte_w));
  IOBUF cfg_flash_io0_iobuf
       (.I(cfg_flash_io0_o),
        .IO(cfg_flash_io0_io),
        .O(cfg_flash_io0_i),
        .T(cfg_flash_io0_t));
  IOBUF cfg_flash_io1_iobuf
       (.I(cfg_flash_io1_o),
        .IO(cfg_flash_io1_io),
        .O(cfg_flash_io1_i),
        .T(cfg_flash_io1_t));
  IOBUF cfg_flash_ss_iobuf_0
       (.I(cfg_flash_ss_o_0),
        .IO(cfg_flash_ss_io[0]),
        .O(cfg_flash_ss_i_0),
        .T(cfg_flash_ss_t));
  IOBUF lcd_data_tri_iobuf_0
       (.I(lcd_data_tri_o_0),
        .IO(lcd_data_tri_io[0]),
        .O(lcd_data_tri_i_0),
        .T(lcd_data_tri_t_0));
  IOBUF lcd_data_tri_iobuf_1
       (.I(lcd_data_tri_o_1),
        .IO(lcd_data_tri_io[1]),
        .O(lcd_data_tri_i_1),
        .T(lcd_data_tri_t_1));
  IOBUF lcd_data_tri_iobuf_10
       (.I(lcd_data_tri_o_10),
        .IO(lcd_data_tri_io[10]),
        .O(lcd_data_tri_i_10),
        .T(lcd_data_tri_t_10));
  IOBUF lcd_data_tri_iobuf_11
       (.I(lcd_data_tri_o_11),
        .IO(lcd_data_tri_io[11]),
        .O(lcd_data_tri_i_11),
        .T(lcd_data_tri_t_11));
  IOBUF lcd_data_tri_iobuf_12
       (.I(lcd_data_tri_o_12),
        .IO(lcd_data_tri_io[12]),
        .O(lcd_data_tri_i_12),
        .T(lcd_data_tri_t_12));
  IOBUF lcd_data_tri_iobuf_13
       (.I(lcd_data_tri_o_13),
        .IO(lcd_data_tri_io[13]),
        .O(lcd_data_tri_i_13),
        .T(lcd_data_tri_t_13));
  IOBUF lcd_data_tri_iobuf_14
       (.I(lcd_data_tri_o_14),
        .IO(lcd_data_tri_io[14]),
        .O(lcd_data_tri_i_14),
        .T(lcd_data_tri_t_14));
  IOBUF lcd_data_tri_iobuf_15
       (.I(lcd_data_tri_o_15),
        .IO(lcd_data_tri_io[15]),
        .O(lcd_data_tri_i_15),
        .T(lcd_data_tri_t_15));
  IOBUF lcd_data_tri_iobuf_2
       (.I(lcd_data_tri_o_2),
        .IO(lcd_data_tri_io[2]),
        .O(lcd_data_tri_i_2),
        .T(lcd_data_tri_t_2));
  IOBUF lcd_data_tri_iobuf_3
       (.I(lcd_data_tri_o_3),
        .IO(lcd_data_tri_io[3]),
        .O(lcd_data_tri_i_3),
        .T(lcd_data_tri_t_3));
  IOBUF lcd_data_tri_iobuf_4
       (.I(lcd_data_tri_o_4),
        .IO(lcd_data_tri_io[4]),
        .O(lcd_data_tri_i_4),
        .T(lcd_data_tri_t_4));
  IOBUF lcd_data_tri_iobuf_5
       (.I(lcd_data_tri_o_5),
        .IO(lcd_data_tri_io[5]),
        .O(lcd_data_tri_i_5),
        .T(lcd_data_tri_t_5));
  IOBUF lcd_data_tri_iobuf_6
       (.I(lcd_data_tri_o_6),
        .IO(lcd_data_tri_io[6]),
        .O(lcd_data_tri_i_6),
        .T(lcd_data_tri_t_6));
  IOBUF lcd_data_tri_iobuf_7
       (.I(lcd_data_tri_o_7),
        .IO(lcd_data_tri_io[7]),
        .O(lcd_data_tri_i_7),
        .T(lcd_data_tri_t_7));
  IOBUF lcd_data_tri_iobuf_8
       (.I(lcd_data_tri_o_8),
        .IO(lcd_data_tri_io[8]),
        .O(lcd_data_tri_i_8),
        .T(lcd_data_tri_t_8));
  IOBUF lcd_data_tri_iobuf_9
       (.I(lcd_data_tri_o_9),
        .IO(lcd_data_tri_io[9]),
        .O(lcd_data_tri_i_9),
        .T(lcd_data_tri_t_9));
  IOBUF mdio_mdio_iobuf
       (.I(mdio_mdio_o),
        .IO(mdio_mdio_io),
        .O(mdio_mdio_i),
        .T(mdio_mdio_t));
  IOBUF spi_flash_io0_iobuf
       (.I(spi_flash_io0_o),
        .IO(spi_flash_io0_io),
        .O(spi_flash_io0_i),
        .T(spi_flash_io0_t));
  IOBUF spi_flash_io1_iobuf
       (.I(spi_flash_io1_o),
        .IO(spi_flash_io1_io),
        .O(spi_flash_io1_i),
        .T(spi_flash_io1_t));
  IOBUF spi_flash_io2_iobuf
       (.I(spi_flash_io2_o),
        .IO(spi_flash_io2_io),
        .O(spi_flash_io2_i),
        .T(spi_flash_io2_t));
  IOBUF spi_flash_io3_iobuf
       (.I(spi_flash_io3_o),
        .IO(spi_flash_io3_io),
        .O(spi_flash_io3_i),
        .T(spi_flash_io3_t));
  IOBUF spi_flash_sck_iobuf
       (.I(spi_flash_sck_o),
        .IO(spi_flash_sck_io),
        .O(spi_flash_sck_i),
        .T(spi_flash_sck_t));
  IOBUF spi_flash_ss_iobuf_0
       (.I(spi_flash_ss_o_0),
        .IO(spi_flash_ss_io[0]),
        .O(spi_flash_ss_i_0),
        .T(spi_flash_ss_t));
endmodule
