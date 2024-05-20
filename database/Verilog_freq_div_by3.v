// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 FREQUENCY DIVIDER BY 3
************************************************/
module div_3(
	input clk,
	input reset,
	output clk_out);


	reg[1:0] pos_cnt;
	reg [1:0]neg_cnt;

	always@(posedge clk)
		if(reset)
			pos_cnt<= 0;
		else if(pos_cnt==2)
			pos_cnt<= 0;
		else
			pos_cnt<= pos_cnt+1;

	always@(negedge clk)
	if(reset)
		neg_cnt<= 0;
	else if(neg_cnt==2)
		neg_cnt<= 0;
	else neg_cnt<= neg_cnt+1;

	assign clk_out=((pos_cnt==2) | (neg_cnt==2));

endmodule