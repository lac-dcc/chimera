// Seed: 2229201022
module module_0 (
    input supply1 id_0,
    output wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    output tri id_4,
    input wand id_5,
    input wor id_6,
    input tri1 id_7,
    input supply0 id_8,
    input wire id_9,
    input wand id_10,
    input tri0 id_11,
    input wor id_12,
    output supply0 id_13,
    input supply1 id_14,
    output wor id_15,
    output tri id_16
);
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    input tri1 id_2
);
  wire id_4 = id_0;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.id_16 = 0;
endmodule
