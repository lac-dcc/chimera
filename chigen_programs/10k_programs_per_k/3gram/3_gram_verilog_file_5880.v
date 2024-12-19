// Seed: 2132512597
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    input tri0 id_5,
    output uwire id_6,
    input tri0 id_7,
    input wire id_8,
    input wand id_9,
    output supply0 id_10,
    input supply1 id_11,
    input uwire id_12,
    input wand id_13,
    input wor id_14,
    output tri0 id_15,
    input wand id_16,
    output wire id_17,
    input wand id_18,
    input tri id_19
);
  assign module_1.id_4 = 0;
  assign id_0 = id_19;
endmodule
module module_1 (
    input wire id_0#(.id_6({1{1}})),
    input wand id_1,
    output wor id_2,
    output tri0 id_3,
    output supply1 id_4
);
  tri1 id_7 = id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_7,
      id_0,
      id_7,
      id_0,
      id_7,
      id_1,
      id_0,
      id_1,
      id_3,
      id_1,
      id_7,
      id_0,
      id_1,
      id_7,
      id_1,
      id_3,
      id_1,
      id_7
  );
endmodule
