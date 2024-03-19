module add
(
	input	[4:0]	rs, rt,
	output	[31:0]	out
);

	ripple_carry rc(glob.r[rs], glob.r[rt], out);

endmodule
