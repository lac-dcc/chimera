// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: 16 bit up counter 
////////////////////////////////////////

module counterup16_1clk_posedge_async_resetn(clock0, reset, count);

	input clock0, reset;
	output [15:0] count;
	reg [15:0] count;  

	initial begin
      	  count <= 0;
    	end                                    

	always @ (posedge clock0 or negedge reset) begin
		if (reset == 1'b0) begin
			count <= 0;
		end 
		else begin
			count <= count + 1;
		end
	end 

endmodule
