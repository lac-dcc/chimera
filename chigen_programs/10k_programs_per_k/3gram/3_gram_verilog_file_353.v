// Seed: 2860398389
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri id_3,
    output supply0 id_4,
    input wor id_5,
    input wor id_6,
    input supply1 id_7,
    input wire id_8,
    input supply1 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input wor id_14,
    input wire id_15,
    output supply0 id_16,
    input tri0 id_17,
    output tri1 id_18
);
  assign id_11 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output uwire id_3,
    output wor   id_4
);
  assign id_3 = 1;
  or primCall (id_0, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2,
      id_0
  );
endmodule
