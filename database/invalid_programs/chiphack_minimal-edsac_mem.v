module mem #(parameter ABITS=9) (
	input clk,
	input [ABITS-1:0] addr,
	input [15:0] d,
	input rd,
	input wr,
	output reg [15:0] q,
	output wait
);

//`define testwithdelay 1
	reg [15:0] m[0:(1<<ABITS)-1];
	wire rdenable = rd & ~wait;
	wire wrenable = wr & ~wait;
	always @(posedge clk) begin
		if (rdenable)
			q <= m[addr];
		if (wrenable)
			m[addr] <= d;
	end

`ifndef testwithdelay
	assign wait = 0;
`else
	reg [1:0] delay;
	assign wait = delay != 2'd3;
	always @(posedge clk)
	if (~(rd|wr))
		delay <= 0;
	else if (delay != 2'd3)
		delay <= delay + 1;
`endif

endmodule
