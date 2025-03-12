// Seed: 2542494691
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4,
    input wand id_5,
    input wire id_6,
    input tri id_7,
    output supply1 id_8,
    input wor id_9,
    input wire id_10,
    input uwire id_11,
    output tri0 id_12,
    input wand id_13,
    input uwire id_14,
    output supply0 id_15,
    input supply0 id_16,
    output supply0 id_17
);
  wire id_19;
  always_ff assign id_8 = id_14;
endmodule
module module_1 (
    output wor  id_0,
    input  tri1 id_1,
    input  tri  id_2,
    input  tri  id_3,
    output wand id_4
);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
