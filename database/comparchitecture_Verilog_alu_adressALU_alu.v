module alu
(
   	 input	[4:0]	rs, rt, rd, shamt, 
	 input	[5:0]	funct
);

	wire [31:0] out1, out2, out3;

	add add(rs, rt, out1);
	sub sub(rs, rt, out2);
	srl srl(rt, shamt, out3);

	mux mux(out1, out2, out3, funct, rd);

	
endmodule
