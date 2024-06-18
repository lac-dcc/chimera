// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

////////////////////////////////////////
//  Functionality: 16 bit up counter 
//  Coder: M Usman Kiani
////////////////////////////////////////

module counterup16_1clk_async_resetp(clk, reset, count);
	input clk, reset;
	output [15:0] count;
	reg [15:0] count;                                   

    initial begin
      count <= 0;
    end
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
		  count <= 0;
		else 
		  count <= count + 1;
	end

endmodule  
