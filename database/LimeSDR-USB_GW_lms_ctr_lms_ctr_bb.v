
module lms_ctr (
	clk_clk,
	exfifo_if_d_export,
	exfifo_if_rd_export,
	exfifo_if_rdempty_export,
	exfifo_of_d_export,
	exfifo_of_wr_export,
	exfifo_of_wrfull_export,
	exfifo_rst_export,
	leds_external_connection_export,
	lms_ctr_gpio_external_connection_export,
	scl_exp_export,
	sda_exp_export,
	spi_1_adf_external_MISO,
	spi_1_adf_external_MOSI,
	spi_1_adf_external_SCLK,
	spi_1_adf_external_SS_n,
	spi_1_dac_external_MISO,
	spi_1_dac_external_MOSI,
	spi_1_dac_external_SCLK,
	spi_1_dac_external_SS_n,
	spi_lms_external_MISO,
	spi_lms_external_MOSI,
	spi_lms_external_SCLK,
	spi_lms_external_SS_n,
	switch_external_connection_export);	

	input		clk_clk;
	input	[31:0]	exfifo_if_d_export;
	output		exfifo_if_rd_export;
	input		exfifo_if_rdempty_export;
	output	[31:0]	exfifo_of_d_export;
	output		exfifo_of_wr_export;
	input		exfifo_of_wrfull_export;
	output		exfifo_rst_export;
	output	[7:0]	leds_external_connection_export;
	output	[3:0]	lms_ctr_gpio_external_connection_export;
	inout		scl_exp_export;
	inout		sda_exp_export;
	input		spi_1_adf_external_MISO;
	output		spi_1_adf_external_MOSI;
	output		spi_1_adf_external_SCLK;
	output		spi_1_adf_external_SS_n;
	input		spi_1_dac_external_MISO;
	output		spi_1_dac_external_MOSI;
	output		spi_1_dac_external_SCLK;
	output		spi_1_dac_external_SS_n;
	input		spi_lms_external_MISO;
	output		spi_lms_external_MOSI;
	output		spi_lms_external_SCLK;
	output	[4:0]	spi_lms_external_SS_n;
	input	[7:0]	switch_external_connection_export;
endmodule
