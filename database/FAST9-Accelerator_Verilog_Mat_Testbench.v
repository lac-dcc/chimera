module Mat_Testbench;
	reg clock;
	reg nReset;
	
	wire [239:0] position;
	wire isMatching;
	
	always begin
		#10 clock = ~clock;
	end
	
	// FAST-9 and SAD Matching Top Module
	Accelerator_Top accelerator(
		.clock(clock),
		.nReset(nReset),
		.position(position),
		.isMatching(isMatching)
	);

	initial begin
		clock = 1'b0;
		nReset = 1'b1;
		#100 nReset = 1'b0;
		#100 nReset = 1'b1;
		
		#10000000 $finish;
	end
endmodule 