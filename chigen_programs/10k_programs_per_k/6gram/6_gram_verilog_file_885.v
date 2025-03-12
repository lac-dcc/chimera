// Seed: 3971173995
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    output tri id_5,
    input wire id_6,
    input wire id_7,
    output wor id_8,
    input supply1 id_9,
    output tri id_10,
    output wand id_11,
    input wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    input wire id_17,
    input tri1 id_18,
    output tri id_19
);
  assign module_1.id_0 = 0;
  assign id_5 = 1 ~^ id_18 & id_3 ? id_14 : 1;
endmodule
module module_1 (
    input  tri1 id_0,
    output wor  id_1,
    output tri  id_2,
    input  tri  id_3,
    output wand id_4
);
  assign id_4 = 1;
  buf primCall (id_4, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_3,
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_4
  );
endmodule
