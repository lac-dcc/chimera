// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module fm_coord_sr (
  input clock,
  input reset,
  
  input [`X_COORD_BITWIDTH:0] x_coord, // from mult adder ctrl
  input [`Y_COORD_BITWIDTH:0] y_coord, // from mult adder ctrl
  output [`X_COORD_BITWIDTH:0] fm_x_coord, // from mult adder ctrl
  output [`Y_COORD_BITWIDTH:0] fm_y_coord // from mult adder ctrl
);

// reg declarations
reg [`X_COORD_BITWIDTH:0] xc [`FM_COORD_SR_DEPTH-1:0];
reg [`Y_COORD_BITWIDTH:0] yc [`FM_COORD_SR_DEPTH-1:0];


// assign statments
assign fm_x_coord = xc[`FM_COORD_SR_DEPTH-1];
assign fm_y_coord = yc[`FM_COORD_SR_DEPTH-1];


// input to shift reg
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    xc[0] <= `X_COORD_WIDTH'd0;
    yc[0] <= `Y_COORD_WIDTH'd0;
  end else begin 
    xc[0] <= x_coord;
    yc[0] <= y_coord;
  end // reset 
end // always

// loop to build shift reg
genvar i;
generate
for (i=0; i<`FM_COORD_SR_DEPTH-1; i=i+1) begin : coord_sr_gen
  always@(posedge clock or negedge reset) begin 
    if(reset == 1'b0) begin
      xc[i+1] <= `X_COORD_WIDTH'd0;
      yc[i+1] <= `Y_COORD_WIDTH'd0;
    end else begin
      xc[i+1] <= xc[i];
      yc[i+1] <= yc[i];
    end // reset
  end // always
end // for
endgenerate

endmodule

