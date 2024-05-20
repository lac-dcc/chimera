// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// from SBTICETechnologyLibrary201504.pdf with some tweaks

// last updated 2020-06-01 by mza
`define icestick

module top(input CLK, output J1_3);
	reg [15:0] read_data;
	reg [10:0] read_address = 8'h45;
	wire read_clock;
	reg read_clock_enable = 1;
	reg read_enable = 1;
	reg [10:0] write_address = 8'h99;
	wire write_clock;
	reg write_clock_enable = 1;
	reg [15:0] write_data = 16'ha50f;
	reg write_enable = 1;
	reg [15:0] bitmask = 16'h0000;
	// mode(0)=16bit, mode(1)=8bit
	SB_RAM40_4K #(.WRITE_MODE(1), .READ_MODE(1)) ram40_4k_inst (
//		.MASK(bitmask),
		.WADDR(write_address),
		.WDATA(write_data),
		.WE(write_enable),
		.WCLKE(write_clock_enable),
		.WCLK(write_clock),
		.RADDR(read_address),
		.RDATA(read_data),
		.RE(read_enable),
		.RCLKE(read_clock_enable),
		.RCLK(read_clock)
	);
	//defparam ram40_4k_inst.INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_0 = {32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000 };
	defparam ram40_4k_inst.INIT_1 = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_3 = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_5 = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_7 = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_9 = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_B = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_D = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	defparam ram40_4k_inst.INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	defparam ram40_4k_inst.INIT_F = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
	assign read_clock = CLK;
	assign write_clock = CLK;
	assign J1_3 = read_data[0];
endmodule // top

