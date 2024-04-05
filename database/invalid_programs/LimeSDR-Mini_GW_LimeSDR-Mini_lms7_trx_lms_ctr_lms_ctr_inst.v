	lms_ctr u0 (
		.clk_clk                                 (<connected-to-clk_clk>),                                 //                              clk.clk
		.dac_spi_ext_MISO                        (<connected-to-dac_spi_ext_MISO>),                        //                      dac_spi_ext.MISO
		.dac_spi_ext_MOSI                        (<connected-to-dac_spi_ext_MOSI>),                        //                                 .MOSI
		.dac_spi_ext_SCLK                        (<connected-to-dac_spi_ext_SCLK>),                        //                                 .SCLK
		.dac_spi_ext_SS_n                        (<connected-to-dac_spi_ext_SS_n>),                        //                                 .SS_n
		.exfifo_if_d_export                      (<connected-to-exfifo_if_d_export>),                      //                      exfifo_if_d.export
		.exfifo_if_rd_export                     (<connected-to-exfifo_if_rd_export>),                     //                     exfifo_if_rd.export
		.exfifo_if_rdempty_export                (<connected-to-exfifo_if_rdempty_export>),                //                exfifo_if_rdempty.export
		.exfifo_of_d_export                      (<connected-to-exfifo_of_d_export>),                      //                      exfifo_of_d.export
		.exfifo_of_wr_export                     (<connected-to-exfifo_of_wr_export>),                     //                     exfifo_of_wr.export
		.exfifo_of_wrfull_export                 (<connected-to-exfifo_of_wrfull_export>),                 //                 exfifo_of_wrfull.export
		.exfifo_rst_export                       (<connected-to-exfifo_rst_export>),                       //                       exfifo_rst.export
		.flash_spi_MISO                          (<connected-to-flash_spi_MISO>),                          //                        flash_spi.MISO
		.flash_spi_MOSI                          (<connected-to-flash_spi_MOSI>),                          //                                 .MOSI
		.flash_spi_SCLK                          (<connected-to-flash_spi_SCLK>),                          //                                 .SCLK
		.flash_spi_SS_n                          (<connected-to-flash_spi_SS_n>),                          //                                 .SS_n
		.fpga_spi_ext_MISO                       (<connected-to-fpga_spi_ext_MISO>),                       //                     fpga_spi_ext.MISO
		.fpga_spi_ext_MOSI                       (<connected-to-fpga_spi_ext_MOSI>),                       //                                 .MOSI
		.fpga_spi_ext_SCLK                       (<connected-to-fpga_spi_ext_SCLK>),                       //                                 .SCLK
		.fpga_spi_ext_SS_n                       (<connected-to-fpga_spi_ext_SS_n>),                       //                                 .SS_n
		.i2c_scl_export                          (<connected-to-i2c_scl_export>),                          //                          i2c_scl.export
		.i2c_sda_export                          (<connected-to-i2c_sda_export>),                          //                          i2c_sda.export
		.leds_external_connection_export         (<connected-to-leds_external_connection_export>),         //         leds_external_connection.export
		.lms_ctr_gpio_external_connection_export (<connected-to-lms_ctr_gpio_external_connection_export>), // lms_ctr_gpio_external_connection.export
		.switch_external_connection_export       (<connected-to-switch_external_connection_export>),       //       switch_external_connection.export
		.uart_external_connection_rxd            (<connected-to-uart_external_connection_rxd>),            //         uart_external_connection.rxd
		.uart_external_connection_txd            (<connected-to-uart_external_connection_txd>)             //                                 .txd
	);

