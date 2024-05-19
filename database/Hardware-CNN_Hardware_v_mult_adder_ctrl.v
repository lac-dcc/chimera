// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"
module mult_adder_ctrl(
  input clock,
  input reset,
  
  input start,
  output [`X_COORD_BITWIDTH:0] x_coord,
  output [`Y_COORD_BITWIDTH:0] y_coord,

  output pixel_rdy // indicates valid data at end of tree/pipeline
);

// wire declarations

// reg declarations
reg buffer_rdy;
reg rdy_shift_reg [`RDY_SHIFT_REG_SIZE-1:0];
reg [`X_COORD_BITWIDTH:0] x_counter;
reg [`Y_COORD_BITWIDTH:0] y_counter;


// assign statments
assign pixel_rdy = rdy_shift_reg[0];

assign x_coord = x_counter;
assign y_coord = y_counter;

// set enable when buffer_rdy strobes, unset at x/y max
always@(posedge clock or negedge reset) begin
  if(reset == 1'b0) begin
    buffer_rdy <= 1'b0; 
  end else begin
    if(start) begin 
      buffer_rdy <= 1'b1; 
		                                         // extra - 1 to prevent counter overflow from being latched
    end else if (x_counter == `X_COORD_MAX - 1 - 1 &
                 y_counter == `Y_COORD_MAX - 1) begin
      buffer_rdy <= 1'b0;
    end else begin
      buffer_rdy <= buffer_rdy;
    end
  end // reset
end // always

// x and y counters for window selectors
always@(posedge clock or negedge reset) begin
  if (reset == 1'b0) begin
    x_counter <= `X_COORD_WIDTH'd0;
    y_counter <= `Y_COORD_WIDTH'd0;
  end else if(buffer_rdy) begin
    if(x_counter < `X_COORD_MAX - 1) begin
      x_counter <= x_counter +`X_COORD_WIDTH'd1;
      y_counter <= y_counter;
    end else begin
      x_counter <= `X_COORD_WIDTH'd0;
      if(y_counter < `Y_COORD_MAX - 1)
        y_counter <= y_counter + `Y_COORD_WIDTH'd1;
      else
        y_counter <= `Y_COORD_WIDTH'd0;
    end
  end else begin // buffer is not ready
    x_counter <= `X_COORD_WIDTH'd0;
    y_counter <= `Y_COORD_WIDTH'd0;
  end // reset
end // always


// shift register to hold ready signal
genvar i;
generate
for (i=0; i < `RDY_SHIFT_REG_SIZE-1; i=i+1) begin : shift_reg_loop
  always@(posedge clock) begin
    rdy_shift_reg[i] <= rdy_shift_reg[i+1];
  end // always
end // for
endgenerate
// connect input to shift reg
always@(posedge clock) begin
  rdy_shift_reg[`RDY_SHIFT_REG_SIZE-1] <= buffer_rdy;
end

endmodule
