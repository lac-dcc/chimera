// Seed: 2019736960
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input wire id_6,
    input supply0 id_7,
    input wor id_8,
    input tri0 id_9,
    output tri0 id_10,
    input tri0 id_11,
    input wor id_12,
    output tri id_13,
    output tri0 id_14,
    input tri id_15,
    output supply1 id_16
);
  wire id_18;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri id_2,
    output supply1 id_3,
    input wand id_4,
    input tri id_5,
    input tri1 id_6,
    input wor id_7,
    output wand id_8
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_0,
      id_5,
      id_3,
      id_6,
      id_6,
      id_0,
      id_2,
      id_8,
      id_0,
      id_5,
      id_1,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
