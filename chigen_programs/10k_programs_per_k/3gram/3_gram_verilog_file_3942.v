// Seed: 2973454634
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input tri id_6,
    input wire id_7,
    input tri1 id_8,
    input tri1 id_9,
    input wor id_10,
    input tri id_11,
    output wire id_12,
    input uwire id_13,
    input wand id_14,
    input tri0 id_15,
    output tri0 id_16,
    output tri0 id_17,
    output wand id_18,
    output uwire id_19
);
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    output tri0 id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri1 id_5
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_5,
      id_0,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule
