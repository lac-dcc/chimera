/**************************************************************************
 *
 * @file 		ad9361_init.v
 * @brief 		AD9361 init module, config AD9361 via SPI interface.
 * @author 		Tang Tao, DSP Lab.
 * @date 		2017.6.12
 *
 **************************************************************************/
`timescale 1ns / 1ps

module ad9361_init(
	// Input clock and reset signal.
	input 					sys_clk,
	input 					sys_rst,
	
	// AD9361 SPI interface signal.
	output 					ad9361_spi_cs,
	output 					ad9361_spi_sclk,
	output 					ad9361_spi_mosi,
	input 					ad9361_spi_miso,
	
	// AD9361 control signal.
	output 					en_agc,
	output 					enable,
	output 					resetb,
	output 					txnrx,
	output 					sync_in,
	output 		[3 : 0]  	ctrl_in,
	input  		[7 : 0]		ctrl_out,
	
	// Output LED status signal.
	output reg	[7 : 0]  	led
);

	// Internal wire.
	wire 					ad9361_id_chk;
	wire 					ad9361_bbpll_cal_done;
	wire					ad9361_rx_rfpll_cp_done;
	wire 					ad9361_tx_rfpll_cp_done;
	wire					ad9361_rx_rfpll_vco_done;
	wire					ad9361_tx_rfpll_vco_done;
	wire 					ad9361_rx_bb_flt_done;
	wire 					ad9361_tx_bb_flt_done;
	wire 					ad9361_bbdc_cal_done;
	wire 					ad9361_rfdc_cal_done;
	wire 					ad9361_tx_quad_done;
	wire 					ad9361_spi_ok;
	
	// AD9361 SPI module inst.
	ad9361_spi_ctrl uut_ad9361_spi_ctrl (
		.sys_clk(sys_clk),
		.sys_rst(sys_rst),
		.ad9361_spi_cs(ad9361_spi_cs),
		.ad9361_spi_sclk(ad9361_spi_sclk),
		.ad9361_spi_mosi(ad9361_spi_mosi),
		.ad9361_spi_miso(ad9361_spi_miso),
		.ad9361_id_chk(ad9361_id_chk),
		.ad9361_bbpll_cal_done(ad9361_bbpll_cal_done),
		.ad9361_rx_rfpll_cp_done(ad9361_rx_rfpll_cp_done),
		.ad9361_tx_rfpll_cp_done(ad9361_tx_rfpll_cp_done),
		.ad9361_rx_rfpll_vco_done(ad9361_rx_rfpll_vco_done),
		.ad9361_tx_rfpll_vco_done(ad9361_tx_rfpll_vco_done),
		.ad9361_rx_bb_flt_done(ad9361_rx_bb_flt_done),
		.ad9361_tx_bb_flt_done(ad9361_tx_bb_flt_done),
		.ad9361_bbdc_cal_done(ad9361_bbdc_cal_done),
		.ad9361_rfdc_cal_done(ad9361_rfdc_cal_done),
		.ad9361_tx_quad_done(ad9361_tx_quad_done),
		.ad9361_spi_ok(ad9361_spi_ok)
	);
	
	// AD9361 control signal.
	assign en_agc  = 1'b0;
	assign enable  = 1'b0;
	assign resetb  = ~sys_rst;
	assign txnrx   = 1'b0;
	assign sync_in = 1'b0;
	assign ctrl_in = 4'b0000;
	
	/* According to the output flag, control the LED status. */
	always @ (posedge sys_clk or posedge sys_rst) begin
		if (sys_rst)
			led <= 8'h00;
		else begin
			/* Check the AD9361 product ID. */
			if (ad9361_id_chk)
				led[0] <= 1'b1;
			
			/* Check AD9361 BBPLL VCO cal done status. */
			if (ad9361_bbpll_cal_done)
				led[1] <= 1'b1;
			
			/* Check AD9361 Rx RFPLL CP & VCO cal done status. */
			if (ad9361_rx_rfpll_cp_done & ad9361_rx_rfpll_vco_done)
				led[2] <= 1'b1;
				
			/* Check AD9361 Tx RFPLL CP & VCO cal done status. */
			if (ad9361_tx_rfpll_cp_done & ad9361_tx_rfpll_vco_done)
				led[3] <= 1'b1;
			
			
			if (ad9361_rx_bb_flt_done & ad9361_tx_bb_flt_done)
				led[4] <= 1'b1;
			
			/* Check AD9361 BB & RF DC offset cal done status. */
			if (ad9361_bbdc_cal_done & ad9361_rfdc_cal_done)
				led[5] <= 1'b1;
			
			/* Check AD9361 Tx quad cal done status. */
			if (ad9361_tx_quad_done)
				led[6] <= 1'b1;
			
			/* Check AD9361 configuration completed status. */
			if (ad9361_spi_ok)
				led[7] <= 1'b1;
		end
	end

endmodule
