// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

////////////////////////////////////////
//  Functionality: 16 bit down counter 
////////////////////////////////////////

module counterdown16(clk, reset, count);
	input clk, reset;
	output [15:0] count;
	reg [15:0] count;                                   

	initial begin
      	  count <= 16'hffff;
    	end   	
	
	always @ (posedge clk or negedge reset) begin
		if (reset == 1'b0)
		  count <= 16'hffff;
		else 
		  count <= count - 1;
	end

endmodule  
