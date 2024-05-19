// This program was cloned from: https://github.com/myriadrf/LimeSDR-USB_GW
// License: Apache License 2.0

	lms_ctr u0 (
		.clk_clk                                 (<connected-to-clk_clk>),                                 //                              clk.clk
		.exfifo_if_d_export                      (<connected-to-exfifo_if_d_export>),                      //                      exfifo_if_d.export
		.exfifo_if_rd_export                     (<connected-to-exfifo_if_rd_export>),                     //                     exfifo_if_rd.export
		.exfifo_if_rdempty_export                (<connected-to-exfifo_if_rdempty_export>),                //                exfifo_if_rdempty.export
		.exfifo_of_d_export                      (<connected-to-exfifo_of_d_export>),                      //                      exfifo_of_d.export
		.exfifo_of_wr_export                     (<connected-to-exfifo_of_wr_export>),                     //                     exfifo_of_wr.export
		.exfifo_of_wrfull_export                 (<connected-to-exfifo_of_wrfull_export>),                 //                 exfifo_of_wrfull.export
		.exfifo_rst_export                       (<connected-to-exfifo_rst_export>),                       //                       exfifo_rst.export
		.leds_external_connection_export         (<connected-to-leds_external_connection_export>),         //         leds_external_connection.export
		.lms_ctr_gpio_external_connection_export (<connected-to-lms_ctr_gpio_external_connection_export>), // lms_ctr_gpio_external_connection.export
		.scl_exp_export                          (<connected-to-scl_exp_export>),                          //                          scl_exp.export
		.sda_exp_export                          (<connected-to-sda_exp_export>),                          //                          sda_exp.export
		.spi_1_adf_external_MISO                 (<connected-to-spi_1_adf_external_MISO>),                 //               spi_1_adf_external.MISO
		.spi_1_adf_external_MOSI                 (<connected-to-spi_1_adf_external_MOSI>),                 //                                 .MOSI
		.spi_1_adf_external_SCLK                 (<connected-to-spi_1_adf_external_SCLK>),                 //                                 .SCLK
		.spi_1_adf_external_SS_n                 (<connected-to-spi_1_adf_external_SS_n>),                 //                                 .SS_n
		.spi_1_dac_external_MISO                 (<connected-to-spi_1_dac_external_MISO>),                 //               spi_1_dac_external.MISO
		.spi_1_dac_external_MOSI                 (<connected-to-spi_1_dac_external_MOSI>),                 //                                 .MOSI
		.spi_1_dac_external_SCLK                 (<connected-to-spi_1_dac_external_SCLK>),                 //                                 .SCLK
		.spi_1_dac_external_SS_n                 (<connected-to-spi_1_dac_external_SS_n>),                 //                                 .SS_n
		.spi_lms_external_MISO                   (<connected-to-spi_lms_external_MISO>),                   //                 spi_lms_external.MISO
		.spi_lms_external_MOSI                   (<connected-to-spi_lms_external_MOSI>),                   //                                 .MOSI
		.spi_lms_external_SCLK                   (<connected-to-spi_lms_external_SCLK>),                   //                                 .SCLK
		.spi_lms_external_SS_n                   (<connected-to-spi_lms_external_SS_n>),                   //                                 .SS_n
		.switch_external_connection_export       (<connected-to-switch_external_connection_export>)        //       switch_external_connection.export
	);

