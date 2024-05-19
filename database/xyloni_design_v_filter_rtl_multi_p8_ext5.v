// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module multi_p8_ext5
#(
	parameter	D_WIDTH	= 8
)
(
	input	i_arst,
	input	i_clk,
	
	input	[D_WIDTH-1:0]i_d,
	output	[D_WIDTH+5-1:0]o_q
);

reg		[D_WIDTH+5-1:0]r_q_1P;

wire	[D_WIDTH+5-1:0]w_d_0P;

assign	w_d_0P	= {2'b0, i_d, 3'b000};

always@(posedge i_arst or posedge i_clk)
begin
	if (i_arst)
		r_q_1P	<= {D_WIDTH+5{1'b0}};
	else
		r_q_1P	<= w_d_0P;
end

assign	o_q	= r_q_1P;

endmodule
