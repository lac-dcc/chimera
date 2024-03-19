
module my_onchip_flash (
	clock,
	avmm_csr_addr,
	avmm_csr_read,
	avmm_csr_writedata,
	avmm_csr_write,
	avmm_csr_readdata,
	avmm_data_addr,
	avmm_data_read,
	avmm_data_writedata,
	avmm_data_write,
	avmm_data_readdata,
	avmm_data_waitrequest,
	avmm_data_readdatavalid,
	avmm_data_burstcount,
	reset_n);	

	input		clock;
	input		avmm_csr_addr;
	input		avmm_csr_read;
	input	[31:0]	avmm_csr_writedata;
	input		avmm_csr_write;
	output	[31:0]	avmm_csr_readdata;
	input	[16:0]	avmm_data_addr;
	input		avmm_data_read;
	input	[31:0]	avmm_data_writedata;
	input		avmm_data_write;
	output	[31:0]	avmm_data_readdata;
	output		avmm_data_waitrequest;
	output		avmm_data_readdatavalid;
	input	[1:0]	avmm_data_burstcount;
	input		reset_n;
endmodule
