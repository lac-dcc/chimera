module sub
(
	input	[4:0]	rs, rt,
	output	[31:0]	out
);

	wire [31:0] temp;
	
	// ripple_carry rc1(1, ~glob.r[rt], temp);
	// ripple_carry rc2(glob.r[rs], temp, out);
	ripple_carry rc(glob.r[rs], ~glob.r[rt] + 1, out);

endmodule
