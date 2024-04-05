`include "_parameter.v"

module r_mem (
	address,
	clock,
	q);

	input	[`ADDR_WIDTH - 1: 0]  address;
	input	  clock;
	wire	[`DATA_WIDTH - 1: 0]  data;
	wire	  wren;
	output	[`DATA_WIDTH - 1: 0]  q;

	wire [`DATA_WIDTH - 1 : 0] sub_wire0;
	wire [`DATA_WIDTH - 1 : 0] q = sub_wire0[`DATA_WIDTH - 1 : 0];

	assign wren = 0;
	assign data = 8'h00000000;
	
	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.data_a (data),
				.wren_a (wren),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=r",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.maximum_depth = `TOTAL_ADDR,
		altsyncram_component.numwords_a = `TOTAL_ADDR,
		altsyncram_component.operation_mode = "SINGLE_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "TRUE",
		altsyncram_component.ram_block_type = "M4K",
		altsyncram_component.widthad_a = `ADDR_WIDTH,
		altsyncram_component.width_a = `DATA_WIDTH,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.init_file = "rMem.mif";

endmodule
