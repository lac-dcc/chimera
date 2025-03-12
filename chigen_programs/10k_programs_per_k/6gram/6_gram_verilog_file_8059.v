// Seed: 2704090938
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  timeunit 1ps;
  always disable id_21;
endmodule
module module_1 #(
    parameter id_10 = 32'd93,
    parameter id_15 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_8,
      id_8,
      id_11,
      id_5,
      id_13,
      id_3,
      id_13,
      id_1,
      id_13,
      id_8,
      id_5,
      id_7,
      id_13,
      id_8,
      id_5,
      id_8,
      id_8,
      id_13
  );
  inout wire _id_10;
  output reg id_9;
  inout wire id_8;
  input wire id_7;
  input logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_9 = -1'b0;
  logic [7:0] id_14;
  wire _id_15 = -1;
  logic id_16;
  always @(id_14[id_10] or negedge !id_7)
    if (1 || 1) begin : LABEL_0
      id_9 <= #1 1;
    end else begin : LABEL_1
      id_16 = {(id_6[id_15] && 1)};
    end
endmodule
