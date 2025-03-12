// Seed: 2588101812
module module_0 (
    output supply0 id_0,
    output wand id_1,
    input wire id_2,
    input uwire id_3,
    output tri id_4,
    output supply1 id_5,
    output tri0 id_6,
    input tri1 void id_7,
    input tri0 id_8,
    output supply0 id_9,
    input uwire id_10,
    input wire id_11
);
  struct packed {
    logic id_13;
    logic id_14;
    logic id_15;
  } id_16 = id_16.id_13;
endmodule
module module_1 #(
    parameter id_3 = 32'd82
) (
    output tri1 id_0,
    output wire id_1,
    input tri1 id_2,
    input tri _id_3,
    output wand id_4,
    input supply0 id_5,
    output wand id_6,
    output supply1 id_7,
    input wire id_8,
    input supply1 id_9,
    input tri id_10,
    output tri id_11,
    input supply0 id_12,
    input uwire id_13,
    input uwire void id_14
);
  logic [7:0] id_16;
  xnor primCall (id_7, id_10, id_16, id_12, id_2, id_14, id_13, id_5, id_9, id_8);
  final id_16[id_3] = id_14;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_14,
      id_13,
      id_4,
      id_4,
      id_7,
      id_5,
      id_10,
      id_6,
      id_9,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule
