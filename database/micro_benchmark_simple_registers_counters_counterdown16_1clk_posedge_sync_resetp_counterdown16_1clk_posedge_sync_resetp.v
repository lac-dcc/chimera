// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: 16 bit down counter 
////////////////////////////////////////

module counterdown16_1clk_posedge_sync_resetp(clock0, reset, count);

	input clock0, reset;
	output [15:0] count;
	reg [15:0] count;                                   
	
	initial begin
      	  count <= 16'hffff;
    	end 

	always @ (posedge clock0) begin
		if (reset == 1'b1) begin
			count <= 16'hffff;
		end 
		else begin
			count <= count - 1;
		end
	end

endmodule
