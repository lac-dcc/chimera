// Seed: 3144795651
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    input tri1 id_2,
    output wor id_3,
    output tri id_4,
    input tri1 id_5,
    output tri0 id_6,
    input tri1 id_7,
    output wand id_8,
    output supply1 id_9,
    output tri1 id_10,
    input uwire id_11,
    input supply1 id_12,
    input wand id_13,
    input tri id_14,
    output wor id_15
);
  assign id_15 = 1 || id_14 || 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    input wire id_9
);
  assign id_4 = id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_1,
      id_1,
      id_6,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_9,
      id_4
  );
  wire id_11;
endmodule
