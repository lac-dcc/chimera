// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2023-10-09 by mza
// last updated 2023-10-09 by mza

`ifndef IRSX_LIB
`define IRSX_LIB

//`include "lib/RAM8.v"
`include "RAM8.v"

module irsx_register_interface (
	input clock, reset,
	input [7:0] address,
	input [11:0] data_in,
	output [11:0] data_out,
	input write_enable,
	output reg sin, pclk, regclr,
	output sclk,
	input shout
);
	localparam MAX_REGISTER_ADDRESS = 255;
	localparam NUMBER_OF_ASIC_ADDRESS_BITS = 8;
	localparam NUMBER_OF_ASIC_DATA_BITS = 12;
	localparam NUMBER_OF_SIN_WORD_BITS = NUMBER_OF_ASIC_ADDRESS_BITS + NUMBER_OF_ASIC_DATA_BITS; // 20
	wire [9:0] upstream_address_10 = { 2'b00, address };
	reg [9:0] address_10 = 0;
	wire [11:0] data_intended;
	wire [11:0] data_readback;
	RAM_s6_1k_12bit_12bit intended_values (.reset(reset),
		.clock_a(clock), .address_a(upstream_address_10), .data_in_a(data_in), .write_enable_a(write_enable), .data_out_a(data_out),
		.clock_b(clock), .address_b(address_10), .data_out_b(data_intended));
	reg [9:0] readback_address_a_10 = 0;
	wire [0:NUMBER_OF_SIN_WORD_BITS-1] sin_word = { address_10[7:0], data_intended };
	reg [6:0] sin_counter = 0;
	reg [3:0] pclk_counter = 0;
	reg [0:NUMBER_OF_SIN_WORD_BITS-1] shout_word = 0;
	wire [11:0] data_from_shout;
	if (0) begin
		assign data_from_shout = shout_word[8:NUMBER_OF_SIN_WORD_BITS-1];
	end else begin
		assign data_from_shout = data_intended; // need to fake it here until we can write to OSH and SSHSH in misc_reg168
	end
	reg shout_write = 0;
	RAM_s6_1k_12bit_12bit actual_readback (.reset(reset),
		.clock_a(clock), .address_a(address_10), .data_in_a(data_from_shout), .write_enable_a(shout_write), .data_out_a(data_readback),
		.clock_b(clock), .address_b(address_10), .data_out_b());
	reg [1:0] mode = 0;
	assign sclk = sin_counter[1];
	always @(posedge clock) begin
		if (reset) begin
			sin <= 0;
			pclk <= 0;
			regclr <= 0;
			mode <= 2'b00; // scan for differences
			sin_counter <= 0;
			address_10 <= 0;
			pclk_counter <= 0;
		end else begin
			if (mode==2'b00) begin // scan for differences
				if (data_intended!=data_readback) begin
					mode <= 2'b01; // difference found, so write updated value to asic
					address_10 <= address_10 - 1'b1;
					sin_counter <= 0;
					pclk_counter <= 0;
					pclk <= 0;
					sin <= 0;
					shout_write <= 0;
				end else begin
					if (address_10<=MAX_REGISTER_ADDRESS) begin
						address_10 <= address_10 + 1'b1;
					end else begin
						address_10 <= 0;
					end
				end
			end else if (mode==2'b01) begin // difference found, so write updated value
				if (sin_counter<4*NUMBER_OF_SIN_WORD_BITS) begin
					sin <= sin_word[sin_counter[6:2]];
					sin_counter <= sin_counter + 1'b1;
					pclk_counter <= 0;
				end else if (pclk_counter==0) begin
					sin <= 1;
					pclk_counter <= pclk_counter + 1'b1;
				end else if (pclk_counter==1) begin
					pclk <= 1;
					pclk_counter <= pclk_counter + 1'b1;
				end else if (pclk_counter==2) begin
					pclk <= 0;
					pclk_counter <= pclk_counter + 1'b1;
				end else if (pclk_counter==3) begin
					sin <= 0;
					pclk_counter <= pclk_counter + 1'b1;
				end else if (pclk_counter==4) begin
					pclk <= 1;
					pclk_counter <= pclk_counter + 1'b1;
				end else begin
					pclk <= 0;
					sin <= 0;
					sin_counter <= 0;
					shout_write <= 0;
					mode <= 2'b10; // readback shout
				end
			end else if (mode==2'b10) begin // readback shout
				sin_counter <= sin_counter + 1'b1;
				if (sin_counter<4*NUMBER_OF_SIN_WORD_BITS) begin
					if (sin_counter[1]) begin
						shout_word[sin_counter[6:2]+1] <= shout;
					end
				end else if (sin_counter<4*NUMBER_OF_SIN_WORD_BITS+1) begin
					shout_write <= 1;
				end else if (sin_counter<4*NUMBER_OF_SIN_WORD_BITS+2) begin
					shout_write <= 0;
				end else begin
					mode <= 2'b00;
				end
			end else begin
				mode <= 2'b00;
			end
		end
	end
endmodule

module irsx_register_interface_tb ();
	localparam HALF_CLOCK_PERIOD = 1;
	localparam WHOLE_CLOCK_PERIOD = 2*HALF_CLOCK_PERIOD;
	localparam SEVERAL_CLOCK_PERIODS = 2*WHOLE_CLOCK_PERIOD;
	localparam MANY_CLOCK_PERIODS = 100*WHOLE_CLOCK_PERIOD;
	reg clock = 0;
	reg raw_reset = 1;
	reg reset = 1;
	wire shout;
	wire sin, sclk, pclk, regclr;
	reg [11:0] raw_write_data_word = 0;
	reg [11:0] write_data_word = 0;
	wire [11:0] read_data_word;
	reg [7:0] raw_address_word = 0;
	reg [7:0] address_word = 0;
	reg raw_write_strobe = 0;
	reg write_strobe = 0;
	reg [19:0] shift_register = 0;
	irsx_register_interface irsx_reg (.clock(clock), .reset(reset),
		.data_in(write_data_word), .data_out(read_data_word), .address(address_word), .write_enable(write_strobe),
		.sin(sin), .sclk(sclk), .pclk(pclk), .regclr(regclr), .shout(shout));
	always @(posedge clock) begin
		reset <= raw_reset;
		address_word <= raw_address_word;
		write_data_word <= raw_write_data_word;
		write_strobe <= raw_write_strobe;
	end
	always @(posedge sclk) begin
		shift_register <= { shift_register[18:0], sin };
	end
	assign shout = shift_register[19];
	always begin
		clock <= 1;
		#HALF_CLOCK_PERIOD;
		clock <= 0;
		#HALF_CLOCK_PERIOD;
	end
	initial begin
		repeat (50) begin // block ram needs a certain minimum clock cycles in reset?!?
			#WHOLE_CLOCK_PERIOD;
		end
		raw_reset <= 0;
		// -----------------------
		#SEVERAL_CLOCK_PERIODS;
		raw_write_data_word <= 12'h345;
		#SEVERAL_CLOCK_PERIODS;
		raw_address_word <= 8'h0a;
		#SEVERAL_CLOCK_PERIODS;
		raw_write_strobe <= 1'b1;
		#WHOLE_CLOCK_PERIOD;
		raw_write_strobe <= 1'b0;
		#SEVERAL_CLOCK_PERIODS;
		// -----------------------
		#SEVERAL_CLOCK_PERIODS;
		raw_write_data_word <= 12'h567;
		#SEVERAL_CLOCK_PERIODS;
		raw_address_word <= 8'h13;
		#SEVERAL_CLOCK_PERIODS;
		raw_write_strobe <= 1'b1;
		#WHOLE_CLOCK_PERIOD;
		raw_write_strobe <= 1'b0;
		// -----------------------
		#SEVERAL_CLOCK_PERIODS;
		raw_address_word <= 0;
		raw_write_data_word <= 0;
		#SEVERAL_CLOCK_PERIODS;
		if (0) begin
			repeat (255) begin
				raw_address_word <= raw_address_word + 1'b1;
				raw_write_data_word <= raw_write_data_word + 1'b1;
				#WHOLE_CLOCK_PERIOD;
				raw_write_strobe <= 1'b1;
				#WHOLE_CLOCK_PERIOD;
				raw_write_strobe <= 0;
				#WHOLE_CLOCK_PERIOD;
			end
		end
		// -----------------------
		#MANY_CLOCK_PERIODS;
	end
endmodule

`endif

