// Seed: 104366946
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input tri id_2,
    output wire id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    input supply0 id_7,
    input wire id_8,
    output wand id_9,
    input wand id_10,
    input uwire id_11,
    input wand id_12,
    output tri0 id_13,
    input supply1 id_14,
    input wor id_15,
    input tri0 id_16
);
  assign id_3 = id_2.id_12;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input wand id_3,
    input wand id_4,
    output tri0 id_5,
    output wire id_6
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_0,
      id_4,
      id_0,
      id_0,
      id_5,
      id_3,
      id_4,
      id_4,
      id_6,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.type_7 = 0;
endmodule
