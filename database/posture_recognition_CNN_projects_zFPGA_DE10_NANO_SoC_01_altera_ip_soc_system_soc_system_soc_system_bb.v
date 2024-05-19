// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0


module soc_system (
	avalon_clk_clk,
	avalon_reset_reset_n,
	avalon_clk_lw_clk,
	avalon_reset_lw_reset_n,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_spim1_inst_CLK,
	hps_io_hps_io_spim1_inst_MOSI,
	hps_io_hps_io_spim1_inst_MISO,
	hps_io_hps_io_spim1_inst_SS0,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	hps_io_hps_io_i2c0_inst_SDA,
	hps_io_hps_io_i2c0_inst_SCL,
	hps_io_hps_io_i2c1_inst_SDA,
	hps_io_hps_io_i2c1_inst_SCL,
	hps_io_hps_io_gpio_inst_GPIO09,
	hps_io_hps_io_gpio_inst_GPIO35,
	hps_io_hps_io_gpio_inst_GPIO40,
	hps_io_hps_io_gpio_inst_GPIO53,
	hps_io_hps_io_gpio_inst_GPIO54,
	hps_io_hps_io_gpio_inst_GPIO61,
	hps_0_f2h_cold_reset_req_reset_n,
	hps_0_f2h_debug_reset_req_reset_n,
	hps_0_f2h_stm_hw_events_stm_hwevents,
	hps_0_f2h_warm_reset_req_reset_n,
	hps_0_h2f_reset_reset_n,
	avalon_f2s0_address,
	avalon_f2s0_burstcount,
	avalon_f2s0_waitrequest,
	avalon_f2s0_readdata,
	avalon_f2s0_readdatavalid,
	avalon_f2s0_read,
	avalon_f2s0_writedata,
	avalon_f2s0_byteenable,
	avalon_f2s0_write,
	led_pio_external_connection_export,
	avalon_f2h_address,
	avalon_f2h_waitrequest,
	avalon_f2h_burstcount,
	avalon_f2h_byteenable,
	avalon_f2h_beginbursttransfer,
	avalon_f2h_begintransfer,
	avalon_f2h_read,
	avalon_f2h_readdata,
	avalon_f2h_readdatavalid,
	avalon_f2h_write,
	avalon_f2h_writedata,
	avalon_h2f_address,
	avalon_h2f_write,
	avalon_h2f_read,
	avalon_h2f_readdata,
	avalon_h2f_writedata,
	avalon_h2f_begintransfer,
	avalon_h2f_beginbursttransfer,
	avalon_h2f_burstcount,
	avalon_h2f_byteenable,
	avalon_h2f_readdatavalid,
	avalon_h2f_waitrequest,
	avalon_h2f_lw_address,
	avalon_h2f_lw_write,
	avalon_h2f_lw_read,
	avalon_h2f_lw_readdata,
	avalon_h2f_lw_writedata,
	avalon_h2f_lw_begintransfer,
	avalon_h2f_lw_beginbursttransfer,
	avalon_h2f_lw_burstcount,
	avalon_h2f_lw_byteenable,
	avalon_h2f_lw_readdatavalid,
	avalon_h2f_lw_waitrequest,
	cnn_inst_info_export,
	video_block_number_export,
	avalon_f2s1_address,
	avalon_f2s1_burstcount,
	avalon_f2s1_waitrequest,
	avalon_f2s1_readdata,
	avalon_f2s1_readdatavalid,
	avalon_f2s1_read,
	avalon_f2s1_writedata,
	avalon_f2s1_byteenable,
	avalon_f2s1_write,
	pd_bbox_frame_export,
	pd_bbox_h2f_lw_address,
	pd_bbox_h2f_lw_write,
	pd_bbox_h2f_lw_read,
	pd_bbox_h2f_lw_readdata,
	pd_bbox_h2f_lw_writedata,
	pd_bbox_h2f_lw_begintransfer,
	pd_bbox_h2f_lw_beginbursttransfer,
	pd_bbox_h2f_lw_burstcount,
	pd_bbox_h2f_lw_byteenable,
	pd_bbox_h2f_lw_readdatavalid,
	pd_bbox_h2f_lw_waitrequest,
	avalon_f2s2_address,
	avalon_f2s2_burstcount,
	avalon_f2s2_waitrequest,
	avalon_f2s2_readdata,
	avalon_f2s2_readdatavalid,
	avalon_f2s2_read,
	avalon_f2s2_writedata,
	avalon_f2s2_byteenable,
	avalon_f2s2_write);	

	input		avalon_clk_clk;
	input		avalon_reset_reset_n;
	input		avalon_clk_lw_clk;
	input		avalon_reset_lw_reset_n;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	output		hps_io_hps_io_spim1_inst_CLK;
	output		hps_io_hps_io_spim1_inst_MOSI;
	input		hps_io_hps_io_spim1_inst_MISO;
	output		hps_io_hps_io_spim1_inst_SS0;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	inout		hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_io_hps_io_i2c0_inst_SCL;
	inout		hps_io_hps_io_i2c1_inst_SDA;
	inout		hps_io_hps_io_i2c1_inst_SCL;
	inout		hps_io_hps_io_gpio_inst_GPIO09;
	inout		hps_io_hps_io_gpio_inst_GPIO35;
	inout		hps_io_hps_io_gpio_inst_GPIO40;
	inout		hps_io_hps_io_gpio_inst_GPIO53;
	inout		hps_io_hps_io_gpio_inst_GPIO54;
	inout		hps_io_hps_io_gpio_inst_GPIO61;
	input		hps_0_f2h_cold_reset_req_reset_n;
	input		hps_0_f2h_debug_reset_req_reset_n;
	input	[27:0]	hps_0_f2h_stm_hw_events_stm_hwevents;
	input		hps_0_f2h_warm_reset_req_reset_n;
	output		hps_0_h2f_reset_reset_n;
	input	[29:0]	avalon_f2s0_address;
	input	[7:0]	avalon_f2s0_burstcount;
	output		avalon_f2s0_waitrequest;
	output	[31:0]	avalon_f2s0_readdata;
	output		avalon_f2s0_readdatavalid;
	input		avalon_f2s0_read;
	input	[31:0]	avalon_f2s0_writedata;
	input	[3:0]	avalon_f2s0_byteenable;
	input		avalon_f2s0_write;
	output	[7:0]	led_pio_external_connection_export;
	input	[31:0]	avalon_f2h_address;
	output		avalon_f2h_waitrequest;
	input	[3:0]	avalon_f2h_burstcount;
	input	[3:0]	avalon_f2h_byteenable;
	input		avalon_f2h_beginbursttransfer;
	input		avalon_f2h_begintransfer;
	input		avalon_f2h_read;
	output	[31:0]	avalon_f2h_readdata;
	output		avalon_f2h_readdatavalid;
	input		avalon_f2h_write;
	input	[31:0]	avalon_f2h_writedata;
	output	[21:0]	avalon_h2f_address;
	output		avalon_h2f_write;
	output		avalon_h2f_read;
	input	[31:0]	avalon_h2f_readdata;
	output	[31:0]	avalon_h2f_writedata;
	output		avalon_h2f_begintransfer;
	output		avalon_h2f_beginbursttransfer;
	output	[3:0]	avalon_h2f_burstcount;
	output	[3:0]	avalon_h2f_byteenable;
	input		avalon_h2f_readdatavalid;
	input		avalon_h2f_waitrequest;
	output	[15:0]	avalon_h2f_lw_address;
	output		avalon_h2f_lw_write;
	output		avalon_h2f_lw_read;
	input	[31:0]	avalon_h2f_lw_readdata;
	output	[31:0]	avalon_h2f_lw_writedata;
	output		avalon_h2f_lw_begintransfer;
	output		avalon_h2f_lw_beginbursttransfer;
	output	[3:0]	avalon_h2f_lw_burstcount;
	output	[3:0]	avalon_h2f_lw_byteenable;
	input		avalon_h2f_lw_readdatavalid;
	input		avalon_h2f_lw_waitrequest;
	input	[31:0]	cnn_inst_info_export;
	input	[31:0]	video_block_number_export;
	input	[29:0]	avalon_f2s1_address;
	input	[7:0]	avalon_f2s1_burstcount;
	output		avalon_f2s1_waitrequest;
	output	[31:0]	avalon_f2s1_readdata;
	output		avalon_f2s1_readdatavalid;
	input		avalon_f2s1_read;
	input	[31:0]	avalon_f2s1_writedata;
	input	[3:0]	avalon_f2s1_byteenable;
	input		avalon_f2s1_write;
	output	[7:0]	pd_bbox_frame_export;
	output	[11:0]	pd_bbox_h2f_lw_address;
	output		pd_bbox_h2f_lw_write;
	output		pd_bbox_h2f_lw_read;
	input	[31:0]	pd_bbox_h2f_lw_readdata;
	output	[31:0]	pd_bbox_h2f_lw_writedata;
	output		pd_bbox_h2f_lw_begintransfer;
	output		pd_bbox_h2f_lw_beginbursttransfer;
	output	[3:0]	pd_bbox_h2f_lw_burstcount;
	output	[3:0]	pd_bbox_h2f_lw_byteenable;
	input		pd_bbox_h2f_lw_readdatavalid;
	input		pd_bbox_h2f_lw_waitrequest;
	input	[29:0]	avalon_f2s2_address;
	input	[7:0]	avalon_f2s2_burstcount;
	output		avalon_f2s2_waitrequest;
	output	[31:0]	avalon_f2s2_readdata;
	output		avalon_f2s2_readdatavalid;
	input		avalon_f2s2_read;
	input	[31:0]	avalon_f2s2_writedata;
	input	[3:0]	avalon_f2s2_byteenable;
	input		avalon_f2s2_write;
endmodule
