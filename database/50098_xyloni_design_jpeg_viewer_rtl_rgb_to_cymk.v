// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module rgb_to_cymk
#(
	parameter	COLOR_PRECISION	= 8
)
(
	input	i_arst,
	input	i_sysclk,
	
	input	[COLOR_PRECISION-1:0]i_R,
	input	[COLOR_PRECISION-1:0]i_G,
	input	[COLOR_PRECISION-1:0]i_B,
	
	output	[COLOR_PRECISION-1:0]o_C,
	output	[COLOR_PRECISION-1:0]o_M,
	output	[COLOR_PRECISION-1:0]o_Y,
	output	[COLOR_PRECISION-1:0]o_K
);

reg		[COLOR_PRECISION-1:0]r_R_1P, r_G_1P, r_B_1P, r_K_1P;
reg		[COLOR_PRECISION-1:0]r_R_2P, r_G_2P, r_B_2P, r_K_2P;
reg		[COLOR_PRECISION-1:0]r_C_3P, r_M_3P, r_Y_3P, r_K_3P;

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
	end
	else
	begin
		if (i_R > i_G)
			r_K_1P	<= i_R;
		else
			r_K_1P	<= i_G;
		
		if (r_B_1P > r_K_1P)
			r_K_2P	<= {COLOR_PRECISION{1'b1}} - r_B_1P;
		else
			r_K_2P	<= {COLOR_PRECISION{1'b1}} - r_K_1P;
		
		r_C_3P	<= r_R_2P - r_K_2P;
		r_M_3P	<= r_G_2P - r_K_2P;
		r_Y_3P	<= r_B_2P - r_K_2P;
	end
end

endmodule
