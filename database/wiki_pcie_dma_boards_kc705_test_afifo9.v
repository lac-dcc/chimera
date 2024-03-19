`default_nettype none
module afifo9 (
	input wire [8:0] Data,
	input wire WrClock,
	input wire RdClock,
	input wire WrEn,
	input wire RdEn,
	input wire Reset,
	input wire RPReset,
	output wire [8:0] Q,
	output wire Empty,
	output wire Full
);

asfifo # (
	.DATA_WIDTH(9),
	.ADDRESS_WIDTH(10)
) asfifo_inst (
	.dout(Q), 
	.empty(Empty),
	.rd_en(RdEn),
	.rd_clk(RdClock),        
	.din(Data),  
	.full(Full),
	.wr_en(WrEn),
	.wr_clk(WrClock),
	.rst(Reset)
);

endmodule
`default_nettype wire
