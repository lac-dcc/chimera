module alu
(
   	 input      [31:0] rs, rt, 
	 input	    [4:0] shamt, 
	 input	    [5:0] funct,
   	 output     [31:0] rd
);

	wire [31:0] out1, out2, out3;

	add add(rs, rt, out1);
	sub sub(rs, rt, out2);
	srl srl(rt, shamt, out3);

	mux mux(out1, out2, out3, funct, rd);
	
endmodule
