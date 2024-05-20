// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 5-bit SHIFT REGISTER (L-R)
************************************************/

module SR_LR(SO,clk,rst,SI);
	input SI,clk,rst;
	output SO;

	reg [4:0]SR;

	always@(posedge clk, negedge rst)
	if(rst)
		SR <= 5'd0;
	else
		SR <= {SR[3:0],SI};

	assign SO = SR[4];

	
endmodule