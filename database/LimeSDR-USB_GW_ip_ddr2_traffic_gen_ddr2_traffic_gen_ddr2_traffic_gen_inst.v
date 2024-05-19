// This program was cloned from: https://github.com/myriadrf/LimeSDR-USB_GW
// License: Apache License 2.0

	ddr2_traffic_gen u0 (
		.clk                 (<connected-to-clk>),                 // avl_clock.clk
		.reset_n             (<connected-to-reset_n>),             // avl_reset.reset_n
		.pass                (<connected-to-pass>),                //    status.pass
		.fail                (<connected-to-fail>),                //          .fail
		.test_complete       (<connected-to-test_complete>),       //          .test_complete
		.avl_ready           (<connected-to-avl_ready>),           //       avl.waitrequest_n
		.avl_addr            (<connected-to-avl_addr>),            //          .address
		.avl_size            (<connected-to-avl_size>),            //          .burstcount
		.avl_wdata           (<connected-to-avl_wdata>),           //          .writedata
		.avl_rdata           (<connected-to-avl_rdata>),           //          .readdata
		.avl_write_req       (<connected-to-avl_write_req>),       //          .write
		.avl_read_req        (<connected-to-avl_read_req>),        //          .read
		.avl_rdata_valid     (<connected-to-avl_rdata_valid>),     //          .readdatavalid
		.avl_be              (<connected-to-avl_be>),              //          .byteenable
		.avl_burstbegin      (<connected-to-avl_burstbegin>),      //          .beginbursttransfer
		.pnf_per_bit         (<connected-to-pnf_per_bit>),         //       pnf.pnf_per_bit
		.pnf_per_bit_persist (<connected-to-pnf_per_bit_persist>)  //          .pnf_per_bit_persist
	);

