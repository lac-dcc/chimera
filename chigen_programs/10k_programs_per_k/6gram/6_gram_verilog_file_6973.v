// Seed: 1959964535
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wand id_2,
    output supply1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input wand id_6,
    output wire id_7,
    output tri1 id_8,
    output wand id_9
);
  assign id_8 = id_6;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input wor id_3,
    output tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    output wor id_7,
    output tri1 id_8,
    input wand id_9,
    input supply1 id_10,
    input tri1 id_11,
    input uwire id_12,
    input supply1 id_13,
    output wand id_14
);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.type_0 = 0;
  assign id_7 = id_3 == id_12;
endmodule
