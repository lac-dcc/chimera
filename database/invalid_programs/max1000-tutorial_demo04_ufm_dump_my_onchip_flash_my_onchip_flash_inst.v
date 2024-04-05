	my_onchip_flash u0 (
		.clock                   (<connected-to-clock>),                   //    clk.clk
		.avmm_csr_addr           (<connected-to-avmm_csr_addr>),           //    csr.address
		.avmm_csr_read           (<connected-to-avmm_csr_read>),           //       .read
		.avmm_csr_writedata      (<connected-to-avmm_csr_writedata>),      //       .writedata
		.avmm_csr_write          (<connected-to-avmm_csr_write>),          //       .write
		.avmm_csr_readdata       (<connected-to-avmm_csr_readdata>),       //       .readdata
		.avmm_data_addr          (<connected-to-avmm_data_addr>),          //   data.address
		.avmm_data_read          (<connected-to-avmm_data_read>),          //       .read
		.avmm_data_writedata     (<connected-to-avmm_data_writedata>),     //       .writedata
		.avmm_data_write         (<connected-to-avmm_data_write>),         //       .write
		.avmm_data_readdata      (<connected-to-avmm_data_readdata>),      //       .readdata
		.avmm_data_waitrequest   (<connected-to-avmm_data_waitrequest>),   //       .waitrequest
		.avmm_data_readdatavalid (<connected-to-avmm_data_readdatavalid>), //       .readdatavalid
		.avmm_data_burstcount    (<connected-to-avmm_data_burstcount>),    //       .burstcount
		.reset_n                 (<connected-to-reset_n>)                  // nreset.reset_n
	);

