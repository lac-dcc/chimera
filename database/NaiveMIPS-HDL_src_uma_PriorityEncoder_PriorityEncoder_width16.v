/********************************************************************************
	Module: PriorityEncoder16
	Function: Width 16 priority encoder, highly optimized with very low latency
	Author: Shengjia ZHAO
	Status: complete
********************************************************************************/

module PriorityEncoder16(enable_n, data, result, result_valid);
	input 		      enable_n;      // Set to LOW to enable the encoder, if HIGH, result will be HIGH, and resultValid will be LOW
	input  [15:0]     data;		     // Zero is the highest bit
	output [3:0]      result;        // Location of the first appearing 1
	output		      result_valid;  // HIGH if at least one bit is 1 and enable_n is LOW
	
	wire r3Raw = |data[7:0];
	wire r2Raw = |data[3:0] | 
					(|data[11:8]  & ~|{data[7:4]});
	wire r1Raw = |data[1:0] | 
					(|data[5:4]   & ~|{data[3:2]}) | 
					(|data[9:8]   & ~|{data[3:2], data[7:6]}) |
					(|data[13:12] & ~|{data[3:2], data[7:6], data[11:10]});
	wire r0Raw = data[0]  |
					(data[2]  & ~data[1]) | 
					(data[4]  & ~data[1] & ~data[3]) |
					(data[6]  & ~data[1] & ~data[3] & ~data[5]) |
					(data[8]  & ~data[1] & ~data[3] & ~data[5] & ~data[7]) | 
					(data[10] & ~data[1] & ~data[3] & ~data[5] & ~data[7] & ~data[9]) |
					(data[12] & ~data[1] & ~data[3] & ~data[5] & ~data[7] & ~data[9] & ~data[11]) |
					(data[14] & ~data[1] & ~data[3] & ~data[5] & ~data[7] & ~data[9] & ~data[11] & ~data[13]);
	wire [3:0]   result = {enable_n, enable_n, enable_n, enable_n} | ~{r3Raw, r2Raw, r1Raw, r0Raw};					 
	wire         result_valid = |data & ~enable_n;
endmodule