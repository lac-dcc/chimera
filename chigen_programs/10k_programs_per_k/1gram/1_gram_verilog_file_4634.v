// Seed: 3567902369
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[1 : 1],
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
endmodule
module module_1 #(
    parameter id_10 = 32'd91,
    parameter id_2  = 32'd89,
    parameter id_9  = 32'd27
) (
    id_1,
    _id_2[id_2 : 1'd0],
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[id_9 : 1],
    id_8,
    _id_9,
    _id_10,
    id_11
);
  output wire id_11;
  input wire _id_10;
  input wire _id_9;
  inout wire id_8;
  input logic [7:0] id_7;
  output wire id_6;
  inout wand id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  input logic [7:0] _id_2;
  output wire id_1;
  parameter id_12 = 1;
  logic id_13;
  logic id_14;
  module_0 modCall_1 (
      id_13,
      id_6,
      id_13,
      id_8,
      id_4,
      id_13,
      id_12,
      id_5,
      id_14,
      id_12
  );
  assign id_5 = -1;
  wire [(  1  -  id_10  ) : -1] id_15;
  assign id_4[1'b0] = id_10 - id_8 | 1 ? 1'b0 : 1;
endmodule
