// This program was cloned from: https://github.com/myriadrf/LimeSDR-PCIe_GW
// License: Apache License 2.0


module ddr2_traffic_gen (
	clk,
	reset_n,
	pass,
	fail,
	test_complete,
	avl_ready,
	avl_addr,
	avl_size,
	avl_wdata,
	avl_rdata,
	avl_write_req,
	avl_read_req,
	avl_rdata_valid,
	avl_be,
	avl_burstbegin,
	pnf_per_bit,
	pnf_per_bit_persist);	

	input		clk;
	input		reset_n;
	output		pass;
	output		fail;
	output		test_complete;
	input		avl_ready;
	output	[24:0]	avl_addr;
	output	[1:0]	avl_size;
	output	[31:0]	avl_wdata;
	input	[31:0]	avl_rdata;
	output		avl_write_req;
	output		avl_read_req;
	input		avl_rdata_valid;
	output	[3:0]	avl_be;
	output		avl_burstbegin;
	output	[31:0]	pnf_per_bit;
	output	[31:0]	pnf_per_bit_persist;
endmodule
