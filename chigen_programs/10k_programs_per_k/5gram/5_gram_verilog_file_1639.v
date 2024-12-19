// Seed: 2163545104
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7,
    input supply0 id_8,
    input supply0 id_9,
    input wor id_10,
    output uwire id_11,
    input wor id_12,
    input uwire id_13,
    input wire id_14,
    output uwire id_15,
    input tri id_16,
    input supply1 id_17,
    output tri1 id_18
);
  wire id_20;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    output wire id_2,
    output tri0 id_3,
    input wire id_4,
    output wire id_5,
    output supply0 id_6
);
  wand id_8 = 1;
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_1,
      id_0,
      id_0,
      id_4,
      id_5,
      id_0,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
