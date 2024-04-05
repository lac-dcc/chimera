	factory u0 (
		.bridge_0_address     (<connected-to-bridge_0_address>),     // bridge_0.address
		.bridge_0_byte_enable (<connected-to-bridge_0_byte_enable>), //         .byte_enable
		.bridge_0_read        (<connected-to-bridge_0_read>),        //         .read
		.bridge_0_write       (<connected-to-bridge_0_write>),       //         .write
		.bridge_0_write_data  (<connected-to-bridge_0_write_data>),  //         .write_data
		.bridge_0_acknowledge (<connected-to-bridge_0_acknowledge>), //         .acknowledge
		.bridge_0_read_data   (<connected-to-bridge_0_read_data>),   //         .read_data
		.clk_clk              (<connected-to-clk_clk>),              //      clk.clk
		.extfifo_of_d         (<connected-to-extfifo_of_d>),         //  extfifo.of_d
		.extfifo_of_wr        (<connected-to-extfifo_of_wr>),        //         .of_wr
		.extfifo_of_wrfull    (<connected-to-extfifo_of_wrfull>),    //         .of_wrfull
		.extfifo_if_d         (<connected-to-extfifo_if_d>),         //         .if_d
		.extfifo_if_rd        (<connected-to-extfifo_if_rd>),        //         .if_rd
		.extfifo_if_rdempty   (<connected-to-extfifo_if_rdempty>),   //         .if_rdempty
		.extfifo_fifo_rst     (<connected-to-extfifo_fifo_rst>),     //         .fifo_rst
		.pio_0_export         (<connected-to-pio_0_export>),         //    pio_0.export
		.reset_reset_n        (<connected-to-reset_reset_n>),        //    reset.reset_n
		.scl_export           (<connected-to-scl_export>),           //      scl.export
		.sda_export           (<connected-to-sda_export>)            //      sda.export
	);

