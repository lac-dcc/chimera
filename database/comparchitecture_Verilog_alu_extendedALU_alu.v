module alu
(
   	 input	[4:0]	rs, rt, rd, shamt, 
	 input	[5:0]	funct
);

	wire [31:0] out1, out2, out3, out4, out5, out6;

	add add(rs, rt, out1);
	sub sub(rs, rt, out2);
	srl srl(rt, shamt, out3);
	AND AND(rs, rt, out4);
	OR OR(rs, rt, out5);
	slt slt(rs, rt, out6);

	mux mux(out1, out2, out3, out4, out5, out6, funct, rd);

	
endmodule
