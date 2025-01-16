// Seed: 1120275455
module module_0 (
    input tri id_0,
    output tri id_1,
    output tri1 id_2,
    input tri0 id_3,
    output wand id_4,
    output supply1 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wire id_8,
    input wire id_9,
    output wand id_10,
    output wand id_11,
    output wand id_12,
    input supply0 id_13,
    input supply1 id_14,
    output wand id_15,
    input wand id_16,
    output tri id_17,
    input tri id_18,
    input wire id_19,
    input wor id_20,
    output wire id_21,
    input supply0 id_22,
    input tri1 id_23,
    input wire id_24
);
  initial #id_26 id_15 = -1'b0;
  assign id_21 = id_13 && id_24;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    output supply0 id_2
);
  always id_2 = id_0(id_0);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
  id_4(
      -1, -1, id_2, -1'b0, -1'b0, id_0 != id_2, -1, id_0, 1 ^ id_5
  );
  tri0 id_6;
  always id_2 = id_6;
endmodule
