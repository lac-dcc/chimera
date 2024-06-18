// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

module DoubleDabble(
	input wire [15:0] Binary_i,	// Max 65535
	output reg [19:0] BCD_o
);
	
	integer i;
	
	always @(*) begin
		BCD_o = 0;
		
		// For each bit of input
		for(i=0; i<=15; i=i+1) begin
			
			//if a hex digit of 'BCD_o' is more than 4, add 3 to it. 
			if(BCD_o[3:0] >= 4'd5) 
				BCD_o[3:0] = BCD_o[3:0] + 4'd3;
			
			if(BCD_o[7:4] >= 4'd5)
				BCD_o[7:4] = BCD_o[7:4] + 4'd3;
			
			if(BCD_o[11:8] >= 4'd5)
				BCD_o[11:8] = BCD_o[11:8] + 4'd3;
				
			if(BCD_o[15:12] >= 4'd5)
				BCD_o[15:12] = BCD_o[15:12] + 4'd3; 
				
			if(BCD_o[19:16] >= 4'd5)
				BCD_o[19:12] = BCD_o[19:12] + 4'd3; 
			
			BCD_o = {BCD_o[18:0], Binary_i[15-i]};
		end
	end

endmodule