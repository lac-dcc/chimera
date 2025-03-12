// Seed: 1027827936
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    output tri1 id_4,
    output supply0 id_5,
    input wire id_6,
    input tri0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    output tri0 id_10
    , id_23,
    input supply1 id_11,
    input tri0 id_12,
    output tri id_13,
    input tri1 id_14,
    input tri0 id_15,
    output uwire id_16,
    output tri1 id_17,
    output tri0 id_18,
    output wor id_19
    , id_24,
    input supply0 id_20,
    input wire id_21
);
  assign id_8 = 1;
  assign id_17 = id_15 - 1 - id_12;
  assign module_1._id_4 = 0;
  always_latch if (1);
endmodule
module module_1 #(
    parameter id_4 = 32'd88
) (
    output wand id_0,
    input  tri  id_1,
    input  wand id_2,
    output wand id_3,
    input  tri0 _id_4#(.id_6(-1))
);
  assign id_3 = id_6 & id_1;
  wire id_7[id_4 : ""];
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_1,
      id_2,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_2
  );
endmodule
