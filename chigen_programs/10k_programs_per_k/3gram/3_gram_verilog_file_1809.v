// Seed: 342743937
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
    id_15
);
  input wire id_15;
  output wire id_14;
  inout wand id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wand id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  assign id_13 = -1;
  logic id_16 = id_3[-1 : {(-1-1==-1'b0), 1, 1}];
  assign id_9 = 1;
endmodule
module module_1 #(
    parameter id_5 = 32'd28
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_1,
      id_7,
      id_4,
      id_6,
      id_7,
      id_10,
      id_8,
      id_2,
      id_8,
      id_2,
      id_6,
      id_2,
      id_9
  );
  inout logic [7:0] id_1;
  wire id_12;
  wire id_13;
  assign id_1[id_5] = id_7;
  wire id_14;
endmodule
