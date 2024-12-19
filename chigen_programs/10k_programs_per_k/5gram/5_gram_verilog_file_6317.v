// Seed: 2546210525
module module_0 (
    input tri id_0,
    input wand id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output wire id_6,
    input wire id_7,
    input wand id_8,
    output wor id_9,
    input wire id_10,
    input wire id_11,
    output tri0 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    output tri0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    input tri id_19
);
  assign id_6 = 1;
  wire id_21;
endmodule
module module_1 (
    input wand id_0,
    output tri1 id_1,
    output supply1 id_2,
    input tri1 id_3
);
  assign id_2 = id_0;
  assign id_1 = id_3 ? 1 : (id_3);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0,
      id_2,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
