// Seed: 1820491859
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
    id_17
);
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd24,
    parameter id_2 = 32'd0,
    parameter id_4 = 32'd36,
    parameter id_5 = 32'd52
) (
    output uwire _id_0,
    output wor   id_1,
    inout  wire  _id_2,
    output tri   id_3,
    input  uwire _id_4,
    input  tri0  _id_5
    , id_9,
    input  tri   id_6,
    output wor   id_7
);
  supply1 [id_2 : id_4] id_10 = 1;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_9,
      id_10,
      id_9,
      id_10,
      id_9,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_10,
      id_9,
      id_10
  );
  logic [id_5 : id_0] id_11;
  initial assume (-1'b0);
  or primCall (id_1, id_10, id_9, id_6);
endmodule
