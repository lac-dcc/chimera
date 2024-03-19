/*
 * @file 		ad9361_rx_top.v
 * @brief 		AD9361 receive function program, top module file.
 * @author 		Tang Tao, DSP Lab.
 * @date 		2017.10.22
 *
 **/
`timescale 1ns / 1ps

module ad9361_tx_top(
	input 					sys_clk_p_200M,		// 200MHz LVDS differential clock input P.
	input 					sys_clk_n_200M,		// 200MHz LVDS differential clock input N.
	input 					sys_rst,			// Input high valid reset signal.
	
	output 					ad9361_spi_cs,		// AD9361 SPI control interface "CSn" signal.
	output 					ad9361_spi_sclk,	// AD9361 SPI control interface "sclk" signal.
	output 					ad9361_spi_mosi,	// AD9361 SPI control interface "Di" signal.
	input 					ad9361_spi_miso,	// AD9361 SPI control interface "Do" signal.
	
	output 					en_agc,				// AD9361 control pins, constant value.
	output 					enable,				// AD9361 control pins, constant value.
	output 					resetb,				// AD9361 control pins, constant value.
	output 					txnrx,				// AD9361 control pins, constant value.
	output 					sync_in,			// AD9361 control pins, constant value.
	output 			[3 : 0] ctrl_in,			// AD9361 control pins, constant value.
	input  			[7 : 0]	ctrl_out,			// AD9361 control pins, not used.
	
	input 					data_clk,			// AD9361 data interface clock signal input.
	input 					rx_frame,			// AD9361 data interface frame signal input.
	input signed   [11 : 0]	p0_d,				// AD9361 data interface 12-bit data signal input.

	output					fb_clk,				// AD9361 data interface clock signal output.
	output					tx_frame,			// AD9361 data interface frame signal output.
	output signed [11 : 0]	p1_d,				// AD9361 data interface 12-bit data signal output.
	
	output 		   [7 : 0]  led,				// 8-bit LED, identify the status of the AD9361 init process.
	
	output 					user_gpio_p,		// Used for debug, GPIO SMA.
	output 					user_gpio_n			// Used for debug, GPIO SMA.
);

	/**
	 * Clock manager module. Use the input 200MHz LVDS differential clock signal to generate
	 * 20MHz SPI interface clock.
	 **/
	 
	/* 20MHz SPI interface clock. */
	wire sys_clk_20M;
	
	/* Clock manager module inst. */
	clk_wiz_0 clk_wiz_i0 (
		.clk_out1(sys_clk_20M),				// Used to AD9361 SPI interface, 20MHz.
		.reset(sys_rst),
		.clk_in1_p(sys_clk_p_200M),
		.clk_in1_n(sys_clk_n_200M)
	);
	
	/**
	 * AD9361 init and data receiv module. Init the AD9361 via SPI interface and receive the 
	 * baseband I, Q data from AD9361.
	 **/
	
	/* 36MHz data clock input, from AD9361 to FPGA. */
	wire rx_data_clk;
	
	/* Global clock buffer. */
	BUFG BUFG_i0 (
      .O(rx_data_clk), 		// 1-bit output: Clock output, 36MHz.
      .I(data_clk)	  		// 1-bit input: Clock input, 36MHz.
    );
	
	/* 18MHz I and Q data clock signal. */
	wire iq_data_clk;
	
	/* AD9361 init and data receive module inst. */
	ad9361_unit ad9361_unit_i0 (
		.sys_clk(sys_clk_20M),
		.sys_rst(sys_rst),

		.ad9361_spi_cs(ad9361_spi_cs),
		.ad9361_spi_sclk(ad9361_spi_sclk),
		.ad9361_spi_mosi(ad9361_spi_mosi),
		.ad9361_spi_miso(ad9361_spi_miso),

		.en_agc(en_agc),
		.enable(enable),
		.resetb(resetb),
		.txnrx(txnrx),
		.sync_in(sync_in),
		.ctrl_in(ctrl_in),
		.ctrl_out(ctrl_out),

		.data_clk(rx_data_clk),
		.rx_frame(rx_frame),
		.p0_d(p0_d),
		.fb_clk(fb_clk),
		.tx_frame(tx_frame),
		.p1_d(p1_d),

		.led(led)
	);
	
	/* User GPIO pins, for debug use. */
	assign user_gpio_p = rx_data_clk;
	// assign user_gpio_n = p1_d[1];

endmodule
