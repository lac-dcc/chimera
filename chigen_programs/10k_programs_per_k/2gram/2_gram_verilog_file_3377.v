// Seed: 3534105410
module module_0 (
    input supply1 id_0,
    output wand id_1,
    output tri1 id_2,
    input wor id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    input tri1 id_8,
    input supply0 id_9,
    output wire id_10,
    input tri0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    output wor id_14,
    output supply0 id_15
);
  wire id_17;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input supply0 id_2,
    output wire id_3,
    input wire id_4,
    input tri0 id_5
);
  wire id_7;
  buf primCall (id_3, id_4);
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2,
      id_3,
      id_3
  );
endmodule
