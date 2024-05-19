// This program was cloned from: https://github.com/alan4186/Hardware-CNN
// License: MIT License

`include "../network_params.h"module window_selector(
  input clock,
  input reset,
  input [`BUFFER_OUT_VECTOR_BITWIDTH:0] buffer_vector,
  input [`X_COORD_BITWIDTH:0] x,
  input [`Y_COORD_BITWIDTH:0] y,
  output reg[`CAMERA_PIXEL_BITWIDTH:0] value_out
);

// wire declarations
wire [`CAMERA_PIXEL_BITWIDTH:0] buffer_wire [`BUFFER_BW:0][`BUFFER_BH:0];

// reg declarations
reg[`CAMERA_PIXEL_BITWIDTH:0] width_selector_wire [`BUFFER_BH:0];

genvar j;
genvar i;
generate 
for (j=0; j<`BUFFER_H; j=j+1) begin : buffer_height_loop
  for(i=0; i<`BUFFER_W; i=i+1) begin : buffer_width_loop
    assign buffer_wire[i][j] = buffer_vector[
    (`CAMERA_PIXEL_WIDTH*i)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*j) +`CAMERA_PIXEL_BITWIDTH:
    (`CAMERA_PIXEL_WIDTH*i)+(`BUFFER_W*`CAMERA_PIXEL_WIDTH*j)
    ];  
  end // for i
end // for j
endgenerate


// width selector
genvar m;
generate
for (m=0; m<`BUFFER_H; m=m+1) begin : width_selector
  always@(*) begin
    case(x)
      `X_COORD_WIDTH'd0: width_selector_wire[m] = buffer_wire[0][m];
      `X_COORD_WIDTH'd1: width_selector_wire[m] = buffer_wire[1][m];
      `X_COORD_WIDTH'd2: width_selector_wire[m] = buffer_wire[2][m];
      `X_COORD_WIDTH'd3: width_selector_wire[m] = buffer_wire[3][m];
      `X_COORD_WIDTH'd4: width_selector_wire[m] = buffer_wire[4][m];
      `X_COORD_WIDTH'd5: width_selector_wire[m] = buffer_wire[5][m];
      `X_COORD_WIDTH'd6: width_selector_wire[m] = buffer_wire[6][m];
      `X_COORD_WIDTH'd7: width_selector_wire[m] = buffer_wire[7][m];
      `X_COORD_WIDTH'd8: width_selector_wire[m] = buffer_wire[8][m];
      `X_COORD_WIDTH'd9: width_selector_wire[m] = buffer_wire[9][m];
      `X_COORD_WIDTH'd10: width_selector_wire[m] = buffer_wire[10][m];
      `X_COORD_WIDTH'd11: width_selector_wire[m] = buffer_wire[11][m];
      `X_COORD_WIDTH'd12: width_selector_wire[m] = buffer_wire[12][m];
      `X_COORD_WIDTH'd13: width_selector_wire[m] = buffer_wire[13][m];
      `X_COORD_WIDTH'd14: width_selector_wire[m] = buffer_wire[14][m];
      `X_COORD_WIDTH'd15: width_selector_wire[m] = buffer_wire[15][m];
      `X_COORD_WIDTH'd16: width_selector_wire[m] = buffer_wire[16][m];
      `X_COORD_WIDTH'd17: width_selector_wire[m] = buffer_wire[17][m];
      `X_COORD_WIDTH'd18: width_selector_wire[m] = buffer_wire[18][m];
      `X_COORD_WIDTH'd19: width_selector_wire[m] = buffer_wire[19][m];
      `X_COORD_WIDTH'd20: width_selector_wire[m] = buffer_wire[20][m];
      `X_COORD_WIDTH'd21: width_selector_wire[m] = buffer_wire[21][m];
      `X_COORD_WIDTH'd22: width_selector_wire[m] = buffer_wire[22][m];
      `X_COORD_WIDTH'd23: width_selector_wire[m] = buffer_wire[23][m];
      `X_COORD_WIDTH'd24: width_selector_wire[m] = buffer_wire[24][m];
      `X_COORD_WIDTH'd25: width_selector_wire[m] = buffer_wire[25][m];
      `X_COORD_WIDTH'd26: width_selector_wire[m] = buffer_wire[26][m];
      `X_COORD_WIDTH'd27: width_selector_wire[m] = buffer_wire[27][m];
      default: width_selector_wire[m] = `CAMERA_PIXEL_WIDTH'd0;    endcase
  end //always
end //for
endgenerate

always@(*) begin
  case(y)
    `Y_COORD_WIDTH'd0: value_out = width_selector_wire[0];
    `Y_COORD_WIDTH'd1: value_out = width_selector_wire[1];
    `Y_COORD_WIDTH'd2: value_out = width_selector_wire[2];
    `Y_COORD_WIDTH'd3: value_out = width_selector_wire[3];
    `Y_COORD_WIDTH'd4: value_out = width_selector_wire[4];
    `Y_COORD_WIDTH'd5: value_out = width_selector_wire[5];
    `Y_COORD_WIDTH'd6: value_out = width_selector_wire[6];
    `Y_COORD_WIDTH'd7: value_out = width_selector_wire[7];
    `Y_COORD_WIDTH'd8: value_out = width_selector_wire[8];
    `Y_COORD_WIDTH'd9: value_out = width_selector_wire[9];
    `Y_COORD_WIDTH'd10: value_out = width_selector_wire[10];
    `Y_COORD_WIDTH'd11: value_out = width_selector_wire[11];
    `Y_COORD_WIDTH'd12: value_out = width_selector_wire[12];
    `Y_COORD_WIDTH'd13: value_out = width_selector_wire[13];
    `Y_COORD_WIDTH'd14: value_out = width_selector_wire[14];
    `Y_COORD_WIDTH'd15: value_out = width_selector_wire[15];
    `Y_COORD_WIDTH'd16: value_out = width_selector_wire[16];
    `Y_COORD_WIDTH'd17: value_out = width_selector_wire[17];
    `Y_COORD_WIDTH'd18: value_out = width_selector_wire[18];
    `Y_COORD_WIDTH'd19: value_out = width_selector_wire[19];
    `Y_COORD_WIDTH'd20: value_out = width_selector_wire[20];
    `Y_COORD_WIDTH'd21: value_out = width_selector_wire[21];
    `Y_COORD_WIDTH'd22: value_out = width_selector_wire[22];
    `Y_COORD_WIDTH'd23: value_out = width_selector_wire[23];
    `Y_COORD_WIDTH'd24: value_out = width_selector_wire[24];
    `Y_COORD_WIDTH'd25: value_out = width_selector_wire[25];
    `Y_COORD_WIDTH'd26: value_out = width_selector_wire[26];
    `Y_COORD_WIDTH'd27: value_out = width_selector_wire[27];
    default: value_out = `CAMERA_PIXEL_WIDTH'd0;
  endcase
end // always

endmodule
