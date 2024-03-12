`default_nettype none

module soc_toplevel_qsys(/*autoport*/
//inout
           DRAM_DQ,
           EEP_I2C_SDAT,
           ENET_MDIO,
           FAN_CTRL,
           FS_DQ,
           GPIO,
           G_SENSOR_SDAT,
           HSMC_CLKOUT_N1,
           HSMC_CLKOUT_N2,
           HSMC_CLKOUT_P1,
           HSMC_CLKOUT_P2,
           HSMC_D,
           HSMC_I2C_SDAT,
           HSMC_RX_D_N,
           HSMC_RX_D_P,
           HSMC_TX_D_N,
           HSMC_TX_D_P,
           I2C_SDAT,
           LCD_DATA,
           SD_CMD,
           SD_DAT,
           SSRAM_BE,
//output
           DRAM_ADDR,
           DRAM_BA,
           DRAM_CAS_N,
           DRAM_CKE,
           DRAM_CLK,
           DRAM_CS_N,
           DRAM_DQM,
           DRAM_RAS_N,
           DRAM_WE_N,
           EEP_I2C_SCLK,
           ENET_GTX_CLK,
           ENET_MDC,
           ENET_RST_N,
           ENET_TX_DATA,
           ENET_TX_EN,
           ENET_TX_ER,
           FL_CE_N,
           FL_OE_N,
           FL_WE_N,
           FL_WP_N,
           FL_RESET_N,
           FS_ADDR,
           G_SENSOR_SCLK,
           HEX0,
           HEX1,
           HEX2,
           HEX3,
           HEX4,
           HEX5,
           HEX6,
           HEX7,
           HSMC_CLKOUT0,
           HSMC_I2C_SCLK,
           I2C_SCLK,
           LCD_EN,
           LCD_ON,
           LCD_RS,
           LCD_RW,
           LEDG,
           LEDR,
           PCIE_WAKE_N,
           SD_CLK,
           SMA_CLKOUT,
           SSRAM_ADSC_N,
           SSRAM_ADSP_N,
           SSRAM_ADV_N,
           SSRAM_CLK,
           SSRAM_GW_N,
           SSRAM_OE_N,
           SSRAM_WE_N,
           SSRAM0_CE_N,
           SSRAM1_CE_N,
           TD_RESET_N,
           UART_RTS,
           UART_TXD,
           VGA_B,
           VGA_BLANK_N,
           VGA_CLK,
           VGA_G,
           VGA_HS,
           VGA_R,
           VGA_SYNC_N,
           VGA_VS,
//input
           CLOCK2_50,
           CLOCK3_50,
           CLOCK_50,
           ENET_INT_N,
           ENET_LINK100,
           ENET_RX_CLK,
           ENET_RX_COL,
           ENET_RX_CRS,
           ENET_RX_DATA,
           ENET_RX_DV,
           ENET_RX_ER,
           ENET_TX_CLK,
           FL_RY,
           G_SENSOR_INT1,
           HSMC_CLKIN0,
           HSMC_CLKIN_N1,
           HSMC_CLKIN_N2,
           HSMC_CLKIN_P1,
           HSMC_CLKIN_P2,
           IRDA_RXD,
           KEY,
           PCIE_PERST_N,
           SD_WP_N,
           SMA_CLKIN,
           SW,
           TD_CLK27,
           TD_DATA,
           TD_HS,
           TD_VS,
           UART_CTS,
           UART_RXD);

//=======================================================
//  PORT declarations
//=======================================================

///////////CLOCK2/////////////
input                                              CLOCK2_50;

///////// CLOCK3 /////////
input                                              CLOCK3_50;

///////// CLOCK /////////
input                                              CLOCK_50;

///////// DRAM /////////
output                        [12:0]               DRAM_ADDR;
output                        [1:0]                DRAM_BA;
output                                             DRAM_CAS_N;
output                                             DRAM_CKE;
output                                             DRAM_CLK;
output                                             DRAM_CS_N;
inout                         [31:0]               DRAM_DQ;
output                        [3:0]                DRAM_DQM;
output                                             DRAM_RAS_N;
output                                             DRAM_WE_N;

///////// EEP /////////
output                                             EEP_I2C_SCLK;
inout                                              EEP_I2C_SDAT;

///////// ENET /////////
output                                             ENET_GTX_CLK;
input                                              ENET_INT_N;
input                                              ENET_LINK100;
output                                             ENET_MDC;
inout                                              ENET_MDIO;
output                                             ENET_RST_N;
input                                              ENET_RX_CLK;
input                                              ENET_RX_COL;
input                                              ENET_RX_CRS;
input                         [3:0]                ENET_RX_DATA;
input                                              ENET_RX_DV;
input                                              ENET_RX_ER;
input                                              ENET_TX_CLK;
output                        [3:0]                ENET_TX_DATA;
output                                             ENET_TX_EN;
output                                             ENET_TX_ER;

///////// FAN /////////
inout                                              FAN_CTRL;

///////// FL /////////
output                                             FL_CE_N;
output                                             FL_OE_N;
input                                              FL_RY;
output                                             FL_WE_N;
output                                             FL_WP_N;
output                                             FL_RESET_N;
///////// FS /////////
inout                         [31:0]               FS_DQ;
output                        [26:0]               FS_ADDR;
///////// GPIO /////////
inout                         [35:0]               GPIO;

///////// G /////////
input                                              G_SENSOR_INT1;
output                                             G_SENSOR_SCLK;
inout                                              G_SENSOR_SDAT;

///////// HEX0 /////////
output                        [6:0]                HEX0;

///////// HEX1 /////////
output                        [6:0]                HEX1;

///////// HEX2 /////////
output                        [6:0]                HEX2;

///////// HEX3 /////////
output                        [6:0]                HEX3;

///////// HEX4 /////////
output                        [6:0]                HEX4;

///////// HEX5 /////////
output                        [6:0]                HEX5;

///////// HEX6 /////////
output                        [6:0]                HEX6;

///////// HEX7 /////////
output                        [6:0]                HEX7;

///////// HSMC /////////
input                                              HSMC_CLKIN0;
input                                              HSMC_CLKIN_N1;
input                                              HSMC_CLKIN_N2;
input                                              HSMC_CLKIN_P1;
input                                              HSMC_CLKIN_P2;
output                                             HSMC_CLKOUT0;
inout                                              HSMC_CLKOUT_N1;
inout                                              HSMC_CLKOUT_N2;
inout                                              HSMC_CLKOUT_P1;
inout                                              HSMC_CLKOUT_P2;
inout                         [3:0]                HSMC_D;
output                                             HSMC_I2C_SCLK;
inout                                              HSMC_I2C_SDAT;
inout                         [16:0]               HSMC_RX_D_N;
inout                         [16:0]               HSMC_RX_D_P;
inout                         [16:0]               HSMC_TX_D_N;
inout                         [16:0]               HSMC_TX_D_P;

///////// I2C /////////
output                                             I2C_SCLK;
inout                                              I2C_SDAT;

///////// IRDA /////////
input                                              IRDA_RXD;

///////// KEY /////////
input                         [3:0]                KEY;

///////// LCD /////////
inout                         [7:0]                LCD_DATA;
output                                             LCD_EN;
output                                             LCD_ON;
output                                             LCD_RS;
output                                             LCD_RW;

///////// LEDG /////////
output                        [8:0]                LEDG;

///////// LEDR /////////
output                        [17:0]               LEDR;

///////// PCIE /////////
input                                              PCIE_PERST_N;
//input                                              PCIE_REFCLK_P;
//input                         [1:0]                PCIE_RX_P;
//output                        [1:0]                PCIE_TX_P;
output                                             PCIE_WAKE_N;

///////// SD /////////
output                                             SD_CLK;
inout                                              SD_CMD;
inout                         [3:0]                SD_DAT;
input                                              SD_WP_N;

///////// SMA /////////
input                                              SMA_CLKIN;
output                                             SMA_CLKOUT;

///////// SSRAM /////////
output                                             SSRAM_ADSC_N;
output                                             SSRAM_ADSP_N;
output                                             SSRAM_ADV_N;
inout                         [3:0]                SSRAM_BE;
output                                             SSRAM_CLK;
output                                             SSRAM_GW_N;
output                                             SSRAM_OE_N;
output                                             SSRAM_WE_N;
output                                             SSRAM0_CE_N;
output                                             SSRAM1_CE_N;

///////// SW /////////
input                         [17:0]               SW;

///////// TD /////////
input                                              TD_CLK27;
input                         [7:0]                TD_DATA;
input                                              TD_HS;
output                                             TD_RESET_N;
input                                              TD_VS;

///////// UART /////////
input                                             UART_CTS;
output                                              UART_RTS;
input                                              UART_RXD;
output                                             UART_TXD;

///////// VGA /////////
output                        [7:0]                VGA_B;
output                                             VGA_BLANK_N;
output                                             VGA_CLK;
output                        [7:0]                VGA_G;
output                                             VGA_HS;
output                        [7:0]                VGA_R;
output                                             VGA_SYNC_N;
output                                             VGA_VS;


wire clk_high,clk_high_shift,clk,locked,locked_other,rst_n,rst_other_n;
wire clk_uart, clk_uart_pll;
wire clk_tick;
wire [31:0] led_export;
wire mdio_out, mdio_oe_n;
wire			enet_tx_clk_mac;
wire			enet_tx_clk_phy;
wire			enet_rx_clk_mac;
wire [23:0] dummy24;
wire [1:0] dummy2;
wire spi0_irq;
reg  g_sensor_int_reg;
reg [21:0] g_sensor_int_cnt;
reg [1:0] g_sensor_int_d;

sys_pll pll1(
    .areset(1'b0),
    .inclk0(CLOCK_50),
    .c0(clk),
    //.c1(clk2x),
    .c2(clk_uart_pll),
    .c3(clk_tick),
    .locked(locked));
clk_ctrl clk_ctrl1(/*autoinst*/
         .rst_out_n(rst_n),
         .clk(clk),
         .rst_in_n(locked & KEY[0]));
hf_pll pll2(
	.areset(1'b0),
	.inclk0(CLOCK2_50),
	.c0(clk_high),
	.c1(clk_high_shift),
	.locked(locked_other));
clk_ctrl clk_ctrl2(/*autoinst*/
         .rst_out_n(rst_other_n),
         .clk(clk_high),
         .rst_in_n(locked_other & KEY[0]));

naive_mips_soc_cache soc(
		.clk_cpu_clk(clk),                    //   clk_cpu.clk
		.clk_other_clk(clk_high),                  // clk_other.clk
		.clk_uart_clk(clk_uart_pll),                   //  clk_uart.clk
		.debugger_dbg_txd(GPIO[0]), // debugger.dbg_txd
		.debugger_dbg_rxd(GPIO[1]), //         .dbg_rxd
		.flash_bus_tcm_address_out(FS_ADDR),      // flash_bus.tcm_address_out
		.flash_bus_tcm_read_n_out(FL_OE_N),       //          .tcm_read_n_out
		.flash_bus_tcm_reset_n_out(FL_RESET_N),      //          .tcm_reset_n_out
		.flash_bus_tcm_write_n_out(FL_WE_N),      //          .tcm_write_n_out
		.flash_bus_tcm_data_out(FS_DQ),         //          .tcm_data_out
		.flash_bus_tcm_chipselect_n_out(FL_CE_N), //          .tcm_chipselect_n_out
		.i2c_scl_pad_io(G_SENSOR_SCLK),                 //       i2c.scl_pad_io
		.i2c_sda_pad_io(G_SENSOR_SDAT),                 //          .sda_pad_io
		//.irq_irq(G_SENSOR_INT1 & SW[1]),                        //       irq.irq
		.led_export(led_export),       //      led.export

		.mac_mdio_mdc(ENET_MDC),                   //   mac_mdio.mdc
		.mac_mdio_mdio_in(ENET_MDIO),               //           .mdio_in
		.mac_mdio_mdio_out(mdio_out),              //           .mdio_out
		.mac_mdio_mdio_oen(mdio_oe_n),              //           .mdio_oen
		.mac_misc_ff_tx_crc_fwd(1'b0),         //   mac_misc.ff_tx_crc_fwd
		.mac_misc_ff_tx_septy(),           //           .ff_tx_septy
		.mac_misc_tx_ff_uflow(),           //           .tx_ff_uflow
		.mac_misc_ff_tx_a_full(),          //           .ff_tx_a_full
		.mac_misc_ff_tx_a_empty(),         //           .ff_tx_a_empty
		.mac_misc_rx_err_stat(),           //           .rx_err_stat
		.mac_misc_rx_frm_type(),           //           .rx_frm_type
		.mac_misc_ff_rx_dsav(),            //           .ff_rx_dsav
		.mac_misc_ff_rx_a_full(),          //           .ff_rx_a_full
		.mac_misc_ff_rx_a_empty(),         //           .ff_rx_a_empty
		.mac_rgmii_rgmii_in(ENET_RX_DATA),             //  mac_rgmii.rgmii_in
		.mac_rgmii_rgmii_out(ENET_TX_DATA),            //           .rgmii_out
		.mac_rgmii_rx_control(ENET_RX_DV),           //           .rx_control
		.mac_rgmii_tx_control(ENET_TX_EN),           //           .tx_control
		.mac_rxclk_clk(enet_rx_clk_mac),                  //  mac_rxclk.clk
		.mac_status_set_10(1'b0),              // mac_status.set_10
		.mac_status_set_1000(1'b0),            //           .set_1000
		.mac_status_eth_mode(),            //           .eth_mode
		.mac_status_ena_10(),              //           .ena_10
		.mac_txclk_clk(enet_tx_clk_mac),                  //  mac_txclk.clk

	/*	
		.usb_bus_tcm_address_out({GPIO[17],dummy2}),        //   usb_bus.tcm_address_out
		.usb_bus_tcm_read_n_out(GPIO[23]),         //          .tcm_read_n_out
		.usb_bus_tcm_reset_n_out(GPIO[15]),        //          .tcm_reset_n_out
		.usb_bus_tcm_write_n_out(GPIO[21]),        //          .tcm_write_n_out
		.usb_bus_tcm_data_out({dummy24,GPIO[10],GPIO[12],GPIO[14],GPIO[16],GPIO[18],GPIO[20],GPIO[22],GPIO[24]}),           //          .tcm_data_out
		.usb_bus_tcm_chipselect_n_out(GPIO[25]),    //          .tcm_chipselect_n_out
	*/
		.rst_cpu_reset_n(rst_n),  //  rst_cpu.reset_n
		.rst_other_reset_n(rst_other_n & KEY[0]),              // rst_other.reset_n
		.sdram_addr(DRAM_ADDR),       //    sdram.addr
		.sdram_ba(DRAM_BA),         //         .ba
		.sdram_cas_n(DRAM_CAS_N),      //         .cas_n
		.sdram_cke(DRAM_CKE),        //         .cke
		.sdram_cs_n(DRAM_CS_N),       //         .cs_n
		.sdram_dq(DRAM_DQ),         //         .dq
		.sdram_dqm(DRAM_DQM),        //         .dqm
		.sdram_ras_n(DRAM_RAS_N),      //         .ras_n
		.sdram_we_n(DRAM_WE_N),       //         .we_n
//		.sdram_clk_clk(DRAM_CLK),      // sdram_clk.clk
		.sw_export({g_sensor_int_reg&SW[1],GPIO[19],spi0_irq,11'b0,SW}), //       sw.export

		.spi_MISO                       (SD_DAT[0]),                       //        spi.MISO
        .spi_MOSI                       (SD_CMD),                       //           .MOSI
        .spi_SCLK                       (SD_CLK),                       //           .SCLK
        .spi_SS_n                       (SD_DAT[3]),                       //           .SS_n
        .spi_0_irq_irq                  (spi0_irq),                   //  spi_0_irq.irq

		.uart_rxd(UART_RXD),         //     uart.rxd
		.uart_txd(UART_TXD)          //         .txd
	);
	
	assign DRAM_CLK = clk_high_shift;
	
wire eth_pll_locked;
// Ethernet RX PLL
enet_rx_clk_pll enet_rx_clk_pll
(
		.inclk0(ENET_RX_CLK),
		.c0(enet_rx_clk_mac),
		.c1(enet_tx_clk_mac),
		.c2(enet_tx_clk_phy),
//		.c3(eth_sample_clk),
		.locked(eth_pll_locked)
);
ddr_o phy_ckgen
(
		.datain_h(1'b1),
		.datain_l(1'b0),
		.outclock(enet_tx_clk_phy),
		.dataout(ENET_GTX_CLK)
);
//assign ENET_GTX_CLK = enet_tx_clk_phy;
	
SEG7_LUT_8 segs(HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7, led_export);

assign FL_WP_N  = 1'b1;
assign {LEDR,LEDG[7:0]} = led_export;
assign ENET_MDIO = ~mdio_oe_n ? mdio_out : 1'bz;
assign ENET_RST_N	= rst_n;

assign LEDG[8] = eth_pll_locked;

assign GPIO[13] = 1'b1; //DACK not used

always@(posedge clk)begin
    g_sensor_int_d <= {g_sensor_int_d[0], G_SENSOR_INT1 | SW[2]}; //SW[2] for debug
    if(~g_sensor_int_d[1]) begin
        g_sensor_int_cnt <= 0;
    end else begin
        g_sensor_int_cnt <= g_sensor_int_cnt+1;
    end
    g_sensor_int_reg <= (0 < g_sensor_int_cnt && g_sensor_int_cnt < 16384);
end

endmodule
