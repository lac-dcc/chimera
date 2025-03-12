// Seed: 1776276615
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output reg id_1;
  logic [7:0] id_4;
  always assume (1) id_1 <= id_4[{-1'b0}];
  struct packed {logic id_5 = 1;} id_6;
  genvar id_7;
endmodule
module module_1 #(
    parameter id_10 = 32'd23
) (
    id_1,
    id_2,
    id_3[1 :-1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11
);
  output wire id_11;
  input wire _id_10;
  input wire id_9;
  output reg id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_5
  );
  input wire id_1;
  assign id_4 = id_9;
  logic id_12;
  always
    if (1 - ~1) id_8 <= id_12[id_10];
    else if (1) if (1);
endmodule
