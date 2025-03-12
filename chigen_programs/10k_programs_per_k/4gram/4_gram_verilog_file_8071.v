// Seed: 2964253300
module module_0 (
    output tri   id_0,
    input  tri1  id_1,
    output wand  id_2,
    output tri   id_3,
    input  uwire id_4,
    output wand  id_5,
    output tri0  id_6
);
  wire id_8;
endmodule
module module_1 #(
    parameter id_23 = 32'd59
) (
    input wand id_0,
    input wire id_1,
    output wire id_2,
    input wand id_3,
    output supply0 id_4,
    output wor id_5,
    output tri0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input tri0 id_9,
    input tri id_10,
    input tri0 id_11,
    input wand id_12,
    output wand id_13,
    input supply0 id_14,
    output wand id_15,
    input tri0 id_16,
    input supply0 id_17,
    input tri1 id_18,
    input tri1 id_19,
    input wand id_20,
    output tri1 id_21,
    input wor id_22,
    input supply0 _id_23,
    input supply0 id_24
);
  logic id_26[id_23 : 1] = id_24;
  xnor primCall (
      id_2,
      id_0,
      id_3,
      id_24,
      id_22,
      id_19,
      id_12,
      id_10,
      id_1,
      id_20,
      id_26,
      id_14,
      id_18,
      id_16,
      id_7,
      id_17,
      id_11,
      id_9
  );
  module_0 modCall_1 (
      id_6,
      id_9,
      id_15,
      id_8,
      id_22,
      id_15,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
