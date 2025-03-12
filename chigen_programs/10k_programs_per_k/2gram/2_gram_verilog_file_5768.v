// Seed: 955045529
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    output wand id_3,
    output tri1 id_4,
    input wor id_5,
    output wand id_6,
    input tri1 id_7,
    output tri id_8,
    output wand id_9,
    input wire id_10,
    input wor id_11,
    output uwire id_12,
    input tri id_13,
    output supply1 id_14,
    output tri1 id_15,
    input supply1 id_16,
    output wand id_17,
    input wor id_18
);
endmodule
module module_1 (
    input tri0 id_0,
    inout wor id_1,
    inout tri0 id_2,
    output supply1 id_3,
    input wor id_4,
    output supply1 id_5,
    output wand id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9
);
  assign id_6 = id_4;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_1,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_2,
      id_3,
      id_8,
      id_3,
      id_4
  );
  assign modCall_1.id_15 = 0;
endmodule
