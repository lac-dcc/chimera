// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: 16 bit negedge triggered down counter 
////////////////////////////////////////

module counterdown16_1clk_negedge_async_resetn(clock0, reset, count);

	input clock0, reset;
	output [15:0] count;
	reg [15:0] count;                                   
	
	initial begin
      	  count <= 16'hffff;
    	end 

	always @ (negedge clock0 or negedge reset) begin
		if (reset == 1'b0) begin
			count <= 16'hffff;
		end 
		else begin
			count <= count - 1;
		end
	end

endmodule