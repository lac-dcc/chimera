module uarttx #(parameter CLKDIV = (100000000/115200)) (
	input clk,
	input rst,
	input [7:0] d,
	input start,
	output tx,
	output wait);

	localparam
		Idle = 0, Writing = 1;

	reg [1:0] state;
	reg [15:0] bitclock;
	reg [3:0] bitcount;
	reg [8:0] data;

	assign tx = data[0];
	assign wait = state == Writing;
	wire fullbittime = bitclock == CLKDIV - 1'd1;
	wire [3:0] maxbit = 4'd9;
	wire lastbit = bitcount == 0;

	always @(posedge clk)
	if (rst)
		state <= Idle;
	else case (state)
		Idle:
			if (start) state <= Writing;
		Writing:
			if (fullbittime & lastbit) state <= Idle;
	endcase

	always @(posedge clk)
	case (state)
		Idle:
			bitcount <= maxbit;
		Writing:
			if (fullbittime) bitcount <= bitcount - 1'd1;
	endcase

	always @(posedge clk)
	case (state)
		Idle:
			bitclock <= 0;
		Writing:
			if (fullbittime) bitclock <= 0;
			else bitclock <= bitclock + 1'd1;
	endcase

	always @(posedge clk)
	if (rst)
		data <= ~0;
	else case (state)
		Idle:
			if (start)
				data <= {d,1'b0};
		Writing:
			if (fullbittime)
				data <= {1'b1,data[8:1]};
	endcase

endmodule
