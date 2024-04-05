`default_nettype none
module fifo (
	input [17:0] Data,
	input Clock,
	input WrEn,
	input RdEn,
	input Reset,
	output [17:0] Q,
	output Empty,
	output Full
);

FIFO # (
	.width(18),
	.widthad(10),
	.numwords(1024)
) sfifo_inst (
	.CLK(Clock),     //in      System Clock
	.nRST(~Reset),   //in      Reset
	.D(Data),        //in      Data
	.Q(Q),           //out     Data
	.WR(WrEn),       //in      Write Request
	.RD(RdEn),       //in      Read Request
	.FULL(Full),     //out     Full Flag
	.EMPTY(Empty)    //out     Empty Flag
);

endmodule
`default_nettype wire
