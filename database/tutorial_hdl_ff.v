// This program was cloned from: https://github.com/learn-cocotb/tutorial
// License: BSD 2-Clause "Simplified" License

module ff(
	input wire CLK,
	input wire RST_N,
	input wire [7:0] D_IN,
	input wire EN,
	output wire RDY,
	output wire [7:0] D_OUT
);

reg [7:0] dff;
assign D_OUT=dff;
assign RDY=1;
always @(posedge CLK or negedge RST_N)begin
	if (! RST_N)
		dff<=0;
	else if(EN)dff<=D_IN;
end
endmodule


