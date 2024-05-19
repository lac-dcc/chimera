// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module accumulator
#(
	parameter	A_IN_PRECISION	= 16,
	parameter	B_IN_PRECISION	= 10,
	parameter	O_OUT_PRECISION	= 8,
	parameter	MULT_LATENCY	= 0
)
(
	input	i_arst,
	input	i_sysclk,
	input	i_en,
	input	i_load,
	input	[A_IN_PRECISION-1:0]i_a,
	input	[B_IN_PRECISION-1:0]i_b,
	output	o_en,
	output	[O_OUT_PRECISION:0]o_O
);

wire	[A_IN_PRECISION+B_IN_PRECISION-1:0]w_mult_out;
reg		r_en_1P;
reg		[A_IN_PRECISION+B_IN_PRECISION-8-1:0]r_adder_1P;

mult_a_signed_b_signed
#(
	.A_WIDTH(A_IN_PRECISION),
	.B_WIDTH(B_IN_PRECISION),
	.LATENCY(MULT_LATENCY)
)
inst_mult
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(i_a),
	.b		(i_b),
	.o		(w_mult_out)
);

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_en_1P		<= 1'b0;
		r_adder_1P	<= {A_IN_PRECISION+B_IN_PRECISION-8{1'b0}};
	end
	else
	begin
		r_en_1P	<= i_en;
		if (i_en)
		begin
			if (i_load)
				r_adder_1P	<= w_mult_out[A_IN_PRECISION+B_IN_PRECISION-1:8];
			else
				r_adder_1P	<= r_adder_1P+w_mult_out[A_IN_PRECISION+B_IN_PRECISION-1:8];
		end
	end
end

assign	o_en	= r_en_1P;
assign	o_O		= r_adder_1P[O_OUT_PRECISION+2:2];

endmodule
