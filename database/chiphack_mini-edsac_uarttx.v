module uarttx #(parameter CLKDIV = (100000000/115200)) (
	input clk,
	input rst,
	input [7:0] d,
	input strobe,
	output tx,
	output reg busy,
   output [1:0] leds 
   );

	localparam
		Idle = 0, Writing = 1;

	reg [1:0] state, nextstate;
	reg [15:0] bitclock;
	reg [5:0] bitcount;
	reg [8:0] data;

	assign tx = data[0];
	wire fullbittime = bitclock == CLKDIV-1;
	wire [5:0]maxbit = 5'd9;
	wire lastbit = bitcount == 0;
   assign leds = state;
   
	always @(*) begin
		nextstate = state;
		case (state)
		Idle:
			if (strobe) nextstate = Writing;
		Writing:
			if (fullbittime & lastbit) nextstate = Idle;
		endcase
	end

	always @(posedge clk)
	if (rst)
		state <= Idle;
	else
		state <= nextstate;

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
	if (rst) begin
		data <= ~0;
		busy <= 0;
	end else case (state)
		Idle:
			if (strobe) begin
				data <= {d,1'b0};
				busy <= 1'b1;
			end
		Writing:
			if (fullbittime) begin
				data <= {1'b1,data[8:1]};
				if (lastbit) busy <= 0;
			end
	endcase

endmodule
