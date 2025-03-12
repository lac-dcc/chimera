// Seed: 2900670995
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input wire id_4,
    output wand id_5,
    output supply1 id_6,
    output wand id_7,
    input tri1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    output wor id_11,
    input tri1 id_12,
    input supply0 id_13,
    input wand id_14
);
  wire id_16, id_17, id_18, id_19;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    output wor id_2,
    input tri0 id_3,
    inout supply1 id_4,
    output tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    output wor id_9,
    input wor id_10,
    output tri id_11
);
  wire id_13 = id_13;
  assign id_13 = id_8;
  and primCall (id_11, id_0, id_13, id_4, id_3, id_6, id_14, id_10, id_8);
  wire id_14;
  assign id_5 = id_10;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_3,
      id_8,
      id_9,
      id_11,
      id_5,
      id_4,
      id_2,
      id_10,
      id_2,
      id_4,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
