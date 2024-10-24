// Seed: 2353965116
`define pp_13 0
`resetall
`define pp_14 0
`timescale 1 ps / 1 ps
`define pp_15 0
`define pp_16 0
`default_nettype id_11 `timescale 1ps / 1ps
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input id_13;
  input id_12;
  inout id_11;
  output id_10;
  output id_9;
  input id_8;
  output id_7;
  input id_6;
  output id_5;
  inout id_4;
  inout id_3;
  output id_2;
  input id_1;
  always @(id_8 * id_6 / id_11 or posedge id_4) id_2 = 1;
  always @(posedge id_8 or posedge id_13) begin
    if ({1'h0, id_11}) begin
      id_4 = id_12;
    end else begin
      id_3[1] = 1;
    end
  end
  sample id_13;
  assign id_5[1'b0] = id_12;
  logic id_14 = 1;
  assign {id_13 != 1'd0, id_6} = id_14;
  logic id_15;
  logic id_16;
endmodule
