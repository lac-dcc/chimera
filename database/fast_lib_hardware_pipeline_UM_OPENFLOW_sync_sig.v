// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/*
Filename: sync_sig.v
Dscription: 
	1)synchronize signal to Des Clock filed
	2)

Author : lxj
Revision List（修订列表）:
	rn1:	date:	modifier:	description:
	rn2:	date:	modifier:	description:
	rn3:	date:	modifier:	description:
*/
`timescale 1 ns / 1 ps
module sync_sig(
	input clk,
	input rst_n,
	input in_sig,
	output out_sig
);
parameter SHIFT_WIDTH = 2;

reg[SHIFT_WIDTH-1:0] sig_dly;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		sig_dly <= {SHIFT_WIDTH{1'b0}};
	end
	else begin//Sync signal
		sig_dly[0] <= in_sig;
		sig_dly[SHIFT_WIDTH-1:1] <= sig_dly[SHIFT_WIDTH-2:0];
  end
end

assign out_sig = &sig_dly;

endmodule