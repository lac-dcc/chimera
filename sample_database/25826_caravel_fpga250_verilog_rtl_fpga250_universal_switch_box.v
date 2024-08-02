// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module universal_switch_box 
  #(
    parameter W = 8
    ) 
   (
    inout [W-1:0]   north, east, south, west,
    input [W*6-1:0] c
    );
   
   genvar 	    i;
   generate
      for(i = 0; i < W / 2; i = i + 1) begin : switch_box_element_two
	 switch_box_element_two elem
	      (
	       .north(north[i*2+1:i*2]),
	       .east(east[i*2+1:i*2]),
	       .south(south[i*2+1:i*2]),
	       .west(west[i*2+1:i*2]),
	       .c(c[12*(i+1)-1:12*i])
	       );
      end
      if(W%2 == 1) begin : switch_box_element_one
	 switch_box_element_one elem 
	   (
	    .north(north[W-1]),
	    .east(east[W-1]),
	    .south(south[W-1]),
	    .west(west[W-1]),
	    .c(c[W*6-1:(W-1)*6])
	    );
      end
   endgenerate
   
endmodule
