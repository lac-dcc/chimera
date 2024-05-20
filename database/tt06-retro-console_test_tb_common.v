// This program was cloned from: https://github.com/toivoh/tt06-retro-console
// License: Apache License 2.0

`default_nettype none

// set RAM_ADDR_BITS <= ADDR_PINS*2**LOG2_CYCLES
module serial_ram #( parameter ADDR_PINS=4, DATA_PINS=4, LOG2_CYCLES=2, RAM_ADDR_BITS=12, DELAY=2) (
		input wire clk,
		input wire reset,
		input wire enable,

		input wire  [ADDR_PINS-1:0] addr_in,
		output wire [DATA_PINS-1:0] data_out
	);

	localparam CYCLES = 2**LOG2_CYCLES;

	localparam ADDR_BITS = ADDR_PINS*CYCLES;
	localparam DATA_BITS = DATA_PINS*CYCLES;

	reg [LOG2_CYCLES-1:0] counter;
	reg [ADDR_BITS-1:0] addr;
	reg [DATA_BITS-1:0] data;

	reg [DATA_BITS-1:0] ram[2**RAM_ADDR_BITS];

	reg [DATA_PINS*DELAY-1:0] sr;

	always @(posedge clk) begin
		if (reset) begin
			counter <= 1;
		end else if (enable) begin
			addr[ADDR_PINS*counter + ADDR_PINS-1 -: ADDR_PINS] <= addr_in;
			if (counter == 0) data <= ram[addr[RAM_ADDR_BITS-1:0]];
			else data <= data >> DATA_PINS;
			counter <= counter + 1;

			sr <= {data[DATA_PINS-1:0], sr[DATA_PINS*DELAY-1:DATA_PINS]};
		end
	end

	assign data_out = sr[DATA_PINS-1:0];
endmodule
