/********************************************************************************
	Module: PriorityEncoder8
	Function: Width 8 priority encoder, highly optimized with very low latency
	Author: Shengjia ZHAO
	Status: complete
********************************************************************************/

module PriorityEncoder8(enable_n, data, result, result_valid);
	input 		      enable_n;      // Set to LOW to enable the encoder, if HIGH, result will be HIGH, and resultValid will be LOW
	input  [7:0]      data;		     // Zero is the highest bit
	output [2:0]      result;        // Location of the first appearing 1
	output		      result_valid;  // HIGH if at least one bit is 1 and enable_n is LOW
	
	wire r2Raw = |data[3:0];
	wire r1Raw = |data[1:0] | 
					(|data[5:4]  & ~|{data[3:2]});
	wire r0Raw = data[0]  |
					(data[2]  & ~data[1]) | 
					(data[4]  & ~data[1] & ~data[3]) |
					(data[6]  & ~data[1] & ~data[3] & ~data[5]);
	wire [2:0]   result = {enable_n, enable_n, enable_n} | ~{r2Raw, r1Raw, r0Raw};					 
	wire         result_valid = |data & ~enable_n;
endmodule