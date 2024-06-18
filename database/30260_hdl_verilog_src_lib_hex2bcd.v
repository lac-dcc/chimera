// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-06-29 by mza
// originally from file mza-test003.double-dabble.v
// updated 2020-05-29 by mza
// last updated 2021-02-05 by mza

// implemented after watching computerphile video https://www.youtube.com/watch?v=eXIfZ1yKFlA
// 0x0000000f (1) :         15  (2)
// 0x000000ff (2) :        255  (3)
// 0x00000fff (3) :       4095  (4)
// 0x0000ffff (4) :      65535  (5)
// 0x000fffff (5) :    1048575  (7)
// 0x00ffffff (6) :   16777215  (8)
// 0x0fffffff (7) :  268435455  (9)
// 0xffffffff (8) : 4294967295 (10)
// so INPUT_SIZE_IN_NYBBLES + 2 should be enough...

module hex2bcd #(
	parameter INPUT_SIZE_IN_NYBBLES = 2,
	parameter INPUT_SIZE_IN_BITS = INPUT_SIZE_IN_NYBBLES*4,
	parameter OUTPUT_SIZE_IN_BITS = INPUT_SIZE_IN_BITS + 8
) (
	input clock,
	input reset,
	input [INPUT_SIZE_IN_BITS-1:0] hex_in,
	output reg sync = 0,
	output reg [OUTPUT_SIZE_IN_BITS-1:0] bcd_out = 0
);
	localparam total_size_in_bits = INPUT_SIZE_IN_BITS + OUTPUT_SIZE_IN_BITS;
	reg [total_size_in_bits-1:0] shift_register = 0; // size of input plus size of output
	reg [INPUT_SIZE_IN_BITS-1:0] bit_counter = 0;
	integer offset = 0;
	always @(posedge clock) begin
		sync <= 0;
		if (reset) begin
			bcd_out <= 0;
			bit_counter <= 0;
			shift_register <= 0;
		end else begin
			if (bit_counter == 0) begin // bit_counter is 0
				bit_counter <= (INPUT_SIZE_IN_BITS << 1); // should be 16
				shift_register[INPUT_SIZE_IN_BITS-1:0] <= hex_in; // lower part
				shift_register[total_size_in_bits-1:INPUT_SIZE_IN_BITS] <= 0; // upper part
				sync <= 1'b1;
			end else if (bit_counter == 1) begin // bit_counter is 1
				bit_counter <= bit_counter - 1'b1;
				bcd_out <= shift_register[total_size_in_bits-1:INPUT_SIZE_IN_BITS]; // upper part
			end else begin
				if (bit_counter[0] == 0) begin // bit_counter is 18,16,14,12,10,8,6,4,2
					bit_counter <= bit_counter - 1'b1;
					shift_register[total_size_in_bits-1:1] <= shift_register[total_size_in_bits-2:0];
				end else begin // bit_counter is 17,15,13,11,9,7,5,3
					bit_counter <= bit_counter - 1'b1;
//					shift_register[0] <= 0; // not necessary because it ends before dealing with these
					for (offset = 0; offset < OUTPUT_SIZE_IN_BITS; offset = offset + 4) begin
						if (shift_register[INPUT_SIZE_IN_BITS+offset+:4] >= 5) begin
							shift_register[INPUT_SIZE_IN_BITS+offset+:4] <= shift_register[INPUT_SIZE_IN_BITS+offset+:4] + 3; // add 3 to the nybble if >= 5; input nybble can be at most 4'b0111 because of being shifted in one bit at a time, so the result can be 4'b1010 at most which doesn't overflow
						end
					end
				end
			end
		end
	end
endmodule // hex2bcd

`ifndef SYNTHESIS
module hex2bcd_tb;
	wire [23:0] bcd;
	reg [15:0] data = 0;
	reg reset = 1;
	reg clock = 0;
	wire sync;
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(4)) h2binst (.clock(clock), .reset(reset), .hex_in(data), .bcd_out(bcd), .sync(sync));
	task automatic wait_for_sync;
		begin
			@(posedge sync);
//			wait (sync==1);
		end
	endtask
	initial begin
		data <= 16'd54321;
		#100;
		reset <= 0;
		wait_for_sync;
		wait_for_sync;
		$display("%t %04d, %06x", $time, data, bcd);
		#100;
		data <= 16'd12345;
		wait_for_sync;
		wait_for_sync;
		$display("%t %04d, %06x", $time, data, bcd);
		#100;
		data <= 16'd55555;
		wait_for_sync;
		wait_for_sync;
		$display("%t %04d, %06x", $time, data, bcd);
		#100;
		$finish;
	end
	always begin
		#0.5;
		clock = ~clock;
	end
endmodule // hex2bcd_tb
`endif

