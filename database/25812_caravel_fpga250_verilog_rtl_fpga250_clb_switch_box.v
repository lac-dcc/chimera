// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module clb_switch_box 
  #(
    parameter WS = 8,
    parameter WD = 8 // WD must be multiple of 2
    ) 
   (
    inout [WS-1:0] 	    north_single, east_single, south_single, west_single,
    inout [WD-1:0] 	    north_double, east_double, south_double, west_double,
    input [(WS+WD/2)*6-1:0] c
    );
   
   universal_switch_box 
     #(
       .W(WS)
       )
   susb
     (
      .north(north_single),
      .east(east_single),
      .south(south_single),
      .west(west_single),
      .c(c[WS*6-1:0])
      );
   
   universal_switch_box 
     #(
       .W(WD/2)
       )
   dusb
     (
      .north(north_double[WD/2-1:0]),
      .east(east_double[WD-1:WD/2]),
      .south(south_double[WD-1:WD/2]),
      .west(west_double[WD/2-1:0]),
      .c(c[(WS+WD/2)*6-1:WS*6])
      );
   
   genvar 		    i;
   generate
      for(i = 0; i < WD / 2; i = i + 1) begin : double_direct_connection
         // tran(north_double[i+WD/2], south_double[i]);
         // tran(east_double[i], west_double[i+WD/2]);
         assign north_double[i+WD/2] = south_double[i];
         assign east_double[i] = west_double[i+WD/2];
      end
   endgenerate
   
endmodule
