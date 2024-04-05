module uartrx #(parameter CLKDIV = (100000000/115200)) (
	input clk,
	input rst,
	input rx,
	input start,
	output reg [7:0] q,
	output wait);

	localparam
		Idle = 0, ReadingStartBit = 1,
		ReadingData = 2, ReadingStopBit = 3;

	reg [7:0] rxbuf;
	reg [1:0] state;
	reg [15:0] bitclock;
	reg [2:0] bitcount;
	reg ready;
	assign wait = ~ready;

	wire fullbittime = bitclock == CLKDIV-1;
	wire halfbittime = bitclock == (CLKDIV/2);
	wire [2:0]maxbit = 3'd7;
	wire lastbit = bitcount == 0;
	
	reg [1:0] rxsync;
	always @(posedge clk)
		rxsync <= {rxsync[0], rx};
	wire rxin = rxsync[1];

	always @(posedge clk)
	if (rst)
		state <= Idle;
	else case (state)
		Idle:
			if (~rxin) state <= ReadingStartBit;
		ReadingStartBit:
			if (rxin) state <= Idle;
			else if (halfbittime) state <= ReadingData;
		ReadingData:
			if (fullbittime & lastbit) state <= ReadingStopBit;
		ReadingStopBit:
			if (fullbittime) state <= Idle;
	endcase

	always @(posedge clk)
	case (state)
		ReadingStartBit:
			bitcount <= maxbit;
		ReadingData:
			if (fullbittime) bitcount <= bitcount - 1'd1;
		default:
			bitcount <= 0;
	endcase

	always @(posedge clk)
	case (state)
		Idle:
			bitclock <= 0;
		ReadingStartBit:
			if (halfbittime) bitclock <= 0;
			else bitclock <= bitclock + 1'd1;
		default:
			if (fullbittime) bitclock <= 0;
			else bitclock <= bitclock + 1'd1;
	endcase

	always @(posedge clk)
	if (rst)
		rxbuf <= 0;
	else if (state == ReadingData && fullbittime)
		rxbuf <= {rxin, rxbuf[7:1]};

	always @(posedge clk)
	if (rst) begin
		q <= 0;
		ready <= 0;
	end else if (state == ReadingStopBit && fullbittime) begin
		q <= rxbuf;
		ready <= 1'b1;
	end else if (start)
		ready <= 0;

endmodule
