module glob;

	//32 32-bit MIPS registers
	reg [31:0] r[0:31];

	initial begin: loop
	integer i;
  	for (i = 0; i < 32; i = i + 1)
  		r[i] = 32'b0000000000000000000000000000000;
	end

endmodule
