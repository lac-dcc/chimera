// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module hex_out_final(
		   input 				     clock,
		   input 				     reset,
		   input [(`FFN_OUT_WIDTH*`NUM_CLASSES)-1:0] data, 
		   output reg [6:0] 			     hex
		   );

   wire signed [`FFN_OUT_BITWIDTH:0] 				     a0;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a1;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a2;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a3;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a4;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a5;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a6;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a7;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a8;
   wire signed [`FFN_OUT_BITWIDTH:0] 				     a9;
   
   assign a0 = data[(`FFN_OUT_WIDTH*0)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*0];
   assign a1 = data[(`FFN_OUT_WIDTH*1)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*1];
   assign a2 = data[(`FFN_OUT_WIDTH*2)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*2];
   assign a3 = data[(`FFN_OUT_WIDTH*3)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*3];
   assign a4 = data[(`FFN_OUT_WIDTH*4)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*4];
   assign a5 = data[(`FFN_OUT_WIDTH*5)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*5];
   assign a6 = data[(`FFN_OUT_WIDTH*6)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*6];
   assign a7 = data[(`FFN_OUT_WIDTH*7)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*7];
   assign a8 = data[(`FFN_OUT_WIDTH*8)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*8];
   assign a9 = data[(`FFN_OUT_WIDTH*9)+`FFN_OUT_BITWIDTH:`FFN_OUT_WIDTH*9];
   
   always@(posedge clock or negedge reset)begin
      if (reset == 1'b0) begin
	 hex <= 7'b1110111;
      end else begin
	 if (a0>a1) begin // 0 > 1
	    if (a0>a2) begin // 0 > 2
	       if (a0>a3) begin // 0 > 3
		  if (a0>a4) begin // 0 > 4
		     if (a0>a5) begin // 0 > 5
			if (a0>a6) begin // 0 > 6
			   if (a0>a7) begin // 0 > 7
			      if (a0>a8) begin // 0 > 8
				 if (a0>a9) begin // 0 > 9
				    hex <= 7'b1000000;/*0*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a1>a0) begin // 1 > 0
	    if (a1>a2) begin // 1 > 2
	       if (a1>a3) begin // 1 > 3
		  if (a1>a4) begin // 1 > 4
		     if (a1>a5) begin // 1 > 5
			if (a1>a6) begin // 1 > 6
			   if (a1>a7) begin // 1 > 7
			      if (a1>a8) begin // 1 > 8
				 if (a1>a9) begin // 1 > 9
				    hex <= 7'b1111001;/*1*/ 
				 end // 1 > 9
			      end// 1 > 8
			   end// 1 > 7
			end // 1 > 6
		     end // 1 > 5
		  end // 1 > 4
	       end // 1 > 3
	    end // 1 > 2
	 end // 1 > 0
	 if (a2>a1) begin // 2 > 1
	    if (a2>a0) begin // 2 > 0
	       if (a2>a3) begin // 2 > 3
		  if (a2>a4) begin // 2 > 4
		     if (a2>a5) begin // 2 > 5
			if (a2>a6) begin // 2 > 6
			   if (a2>a7) begin // 2 > 7
			      if (a2>a8) begin // 2 > 8
				 if (a2>a9) begin // 2 > 9
				    hex <= 7'b0100100;/*2*/ 
				 end // 2 > 9
			      end// 2 > 8
			   end// 2 > 7
			end // 2 > 6
		     end // 2 > 5
		  end // 2 > 4
	       end // 2 > 3
	    end // 2 > 0
	 end // 2 > 1
	 if (a3>a1) begin // 3 > 1
	    if (a3>a2) begin // 3 > 2
	       if (a3>a0) begin // 3 > 0
		  if (a3>a4) begin // 3 > 4
		     if (a3>a5) begin // 3 > 5
			if (a3>a6) begin // 3 > 6
			   if (a3>a7) begin // 3 > 7
			      if (a3>a8) begin // 3 > 8
				 if (a3>a9) begin // 3 > 9
				    hex <= 7'b0110000;/*3*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a4>a1) begin // 4 > 1
	    if (a4>a2) begin // 4 > 2
	       if (a4>a3) begin // 4 > 3
		  if (a4>a0) begin // 4 > 0
		     if (a4>a5) begin // 4 > 5
			if (a4>a6) begin // 4 > 6
			   if (a4>a7) begin // 4 > 7
			      if (a4>a8) begin // 4 > 8
				 if (a4>a9) begin // 4 > 9
				    hex <= 7'b0011001;/*4*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a5>a1) begin // 5 > 1
	    if (a5>a2) begin // 5 > 2
	       if (a5>a3) begin // 5 > 3
		  if (a5>a4) begin // 5 > 4
		     if (a5>a0) begin // 5 >0
			if (a5>a6) begin // 5 > 6
			   if (a5>a7) begin // 5 > 7
			      if (a5>a8) begin // 5 > 8
				 if (a5>a9) begin // 5 > 9
				    hex <= 7'b0010010;/*5*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a6>a1) begin // 0 > 1
	    if (a6>a2) begin // 0 > 2
	       if (a6>a3) begin // 0 > 3
		  if (a6>a4) begin // 0 > 4
		     if (a6>a5) begin // 0 > 5
			if (a6>a0) begin // 0 > 6
			   if (a6>a7) begin // 0 > 7
			      if (a6>a8) begin // 0 > 8
				 if (a6>a9) begin // 0 > 9
				    hex <= 7'b0000010;/*6*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a7>a1) begin // 0 > 1
	    if (a7>a2) begin // 0 > 2
	       if (a7>a3) begin // 0 > 3
		  if (a7>a4) begin // 0 > 4
		     if (a7>a5) begin // 0 > 5
			if (a7>a6) begin // 0 > 6
			   if (a7>a0) begin // 0 > 7
			      if (a7>a8) begin // 0 > 8
				 if (a7>a9) begin // 0 > 9
				    hex <= 7'b1111000;/*7*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a8>a1) begin // 0 > 1
	    if (a8>a2) begin // 0 > 2
	       if (a8>a3) begin // 0 > 3
		  if (a8>a4) begin // 0 > 4
		     if (a8>a5) begin // 0 > 5
			if (a8>a6) begin // 0 > 6
			   if (a8>a7) begin // 0 > 7
			      if (a8>a0) begin // 0 > 8
				 if (a8>a9) begin // 0 > 9
				    hex <= 7'b0000000;/*8*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 if (a9>a1) begin // 0 > 1
	    if (a9>a2) begin // 0 > 2
	       if (a9>a3) begin // 0 > 3
		  if (a9>a4) begin // 0 > 4
		     if (a9>a5) begin // 0 > 5
			if (a9>a6) begin // 0 > 6
			   if (a9>a7) begin // 0 > 7
			      if (a9>a8) begin // 0 > 8
				 if (a9>a0) begin // 0 > 9
				    hex <= 7'b0011000;/*9*/ 
				 end // 0 > 9
			      end// 0 > 8
			   end// 0 > 7
			end // 0 > 6
		     end // 0 > 5
		  end // 0 > 4
	       end // 0 > 3
	    end // 0 > 2
	 end // 0 > 1
	 end
	 
      end // else: !if(reset == 1'b0)      
endmodule // rect_linear

				 