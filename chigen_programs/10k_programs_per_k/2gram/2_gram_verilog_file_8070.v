// Seed: 1767134499
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wand id_4,
    input supply1 id_5,
    output supply1 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output tri id_11,
    input tri0 id_12,
    output wand id_13,
    input wor id_14,
    input tri id_15,
    input wand id_16,
    input supply1 id_17,
    output wire id_18
);
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    output wor id_2,
    output wand id_3,
    input supply1 id_4,
    input supply1 id_5
);
  wire id_7 = id_5;
  tri  id_8;
  assign id_1 = id_8;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_5,
      id_0,
      id_7,
      id_4,
      id_1,
      id_7,
      id_3,
      id_5,
      id_4,
      id_8,
      id_5,
      id_3,
      id_4,
      id_5,
      id_5,
      id_8,
      id_3
  );
  assign id_3 = 1'b0;
  assign id_7 = id_7;
endmodule
