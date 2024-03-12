`include "network_params.h"
module testIm_ctrl(
  input clock,
  input reset,
  
  input [`SCREEN_X_BITWIDTH:0] x_coord,
  input [`SCREEN_Y_BITWIDTH:0] y_coord,

  output reg [9:0] test_addr
);


// shift left control
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    test_addr <= 0;
  end else if( x_coord >= 300 &&
               x_coord < (300 + `SCREEN_X_WIDTH'd`BUFFER_W) &&
               y_coord >= 300 &&
               y_coord < (300 + `SCREEN_Y_WIDTH'd`BUFFER_H)
              )   
    //shift_left <= 1'd1;
    test_addr <= test_addr + 1;
//  else if (x_coord == (300 + `SCREEN_X_WIDTH'd`BUFFER_W) &&
//          y_coord >= 300 &&
//               y_coord < (300 + `SCREEN_Y_WIDTH'd`BUFFER_H - 1) 
//          )   
//    //shift_up <= 1'd1;
//    test_addr <= test_addr + 1;
  else if (x_coord == 0 & y_coord == 0)
    test_addr <= 0;
  else
    test_addr <= test_addr;
end // always

endmodule
