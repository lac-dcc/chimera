// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module rect_linear(
  input clock,
  input reset,
  input [`RECT_IN_BITWIDTH:0] rect_in, 
  output reg [`RECT_OUT_BITWIDTH:0] rect_out
		   );
   
   always@(posedge clock or negedge reset)begin
      if (reset == 1'b0) begin
	 rect_out <= `RECT_OUT_WIDTH'd0;
      end else begin
	 if (rect_in[`RECT_IN_BITWIDTH]) begin
	    rect_out <= `RECT_OUT_WIDTH'd0; 
	 end else begin
	    rect_out <= rect_in;
	 end
      end
   end
   
endmodule
