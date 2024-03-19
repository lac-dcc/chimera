module uartrx #(parameter CLKDIV = (100000000/115200)) (
	input 		 clk,
	input 		 rst,
	input 		 rx,
	output reg [7:0] q,
	output reg 	 strobe,
	output [1:0] 	 leds);

	localparam
		Idle = 0, ReadingStartBit = 1,
		ReadingData = 2, ReadingStopBit = 3;

	reg [1:0] state, nextstate;
	reg [15:0] bitclock;
	reg [2:0] bitcount;

	wire fullbittime = bitclock == CLKDIV-1;
	wire halfbittime = bitclock == (CLKDIV/2);
	wire [2:0]maxbit = 3'd7;
	wire lastbit = bitcount == 0;
	assign leds = state;
   
	always @(*) begin
		nextstate = state;
		case (state)
		Idle:
			if (~rx) nextstate = ReadingStartBit;
		ReadingStartBit:
			if (rx) nextstate = Idle;
			else if (halfbittime) nextstate = ReadingData;
		ReadingData:
			if (fullbittime & lastbit) nextstate = ReadingStopBit;
		ReadingStopBit:
			if (fullbittime) nextstate = Idle;
		endcase
	end

	always @(posedge clk)
	if (rst)
		state <= Idle;
	else
		state <= nextstate;

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
	if (rst) begin
		q <= 0;
		strobe <= 0;
	end else case (state)
		ReadingData:
			if (fullbittime) begin
				q <= {rx, q[7:1]};
				if (lastbit)
					strobe <= 1'b1;
			end
		default:
			strobe <= 0;
	endcase

endmodule
