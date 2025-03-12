// Seed: 1474443037
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  integer ["" : 1] id_8;
  ;
  wire id_9;
  assign id_2 = id_4;
endmodule
module module_1 #(
    parameter id_12 = 32'd5
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
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  xnor primCall (id_6, id_4, id_7, id_5, id_10, id_3, id_9, id_2);
  output wire id_14;
  output wire id_13;
  inout wire _id_12;
  output wand id_11;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_3,
      id_8,
      id_2,
      id_6
  );
  input logic [7:0] id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_11 = 1'h0;
  logic [id_12 : 1] id_16;
  wire id_17;
  assign id_1  = id_10;
  assign id_11 = {{~1, id_4, -1 - id_10[id_12], id_4} {id_7}};
endmodule
