// Seed: 469417968
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    output tri1 id_3,
    input tri id_4,
    input wire module_0,
    input tri1 id_6,
    input uwire id_7,
    output tri id_8,
    output wor id_9,
    input uwire id_10,
    input wor id_11,
    input tri id_12,
    output tri id_13,
    input supply0 id_14,
    input uwire id_15,
    input wand id_16,
    output supply0 id_17,
    output supply1 id_18
);
  wire id_20;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    output tri1 id_2,
    input wor id_3,
    input wire id_4,
    output tri id_5,
    input supply1 id_6,
    output wand id_7
);
  assign id_7 = id_6 ^ 1 ? 1 : id_4;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_6,
      id_4,
      id_6,
      id_6,
      id_7,
      id_5,
      id_0,
      id_0,
      id_6,
      id_7,
      id_3,
      id_6,
      id_0,
      id_7,
      id_7
  );
  assign modCall_1.id_1 = 0;
  wire id_9;
endmodule
