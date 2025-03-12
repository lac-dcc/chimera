// Seed: 3173087804
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output wor id_2,
    input wor id_3,
    output uwire id_4,
    input tri id_5,
    output wire id_6,
    input wand id_7,
    output tri0 id_8,
    input tri1 id_9,
    input wire id_10,
    output tri id_11,
    input tri1 id_12,
    input wand id_13,
    input wor id_14,
    output wire id_15,
    input wor id_16,
    output supply0 id_17
);
  assign id_2.id_10 = id_16;
endmodule
module module_1 #(
    parameter id_0 = 32'd28
) (
    input  uwire _id_0,
    input  wire  id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wand  id_4
);
  parameter id_6 = -1;
  wire id_7;
  xnor primCall (id_4, id_10, id_9, id_7);
  logic id_8, id_9;
  parameter id_10 = id_6[id_0+:-1];
  parameter id_11 = (id_6) - 1;
  assign id_8 = id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_2,
      id_3,
      id_4,
      id_2,
      id_2,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
