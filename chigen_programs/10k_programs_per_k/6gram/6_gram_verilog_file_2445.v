// Seed: 1616924684
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri id_5
    , id_15,
    input supply1 id_6,
    output tri id_7,
    input supply0 id_8,
    input wor id_9,
    input tri0 id_10,
    input tri id_11,
    input supply1 id_12,
    output tri0 id_13
);
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    output tri0 id_6,
    input supply1 id_7
);
  xor primCall (id_6, id_0, id_5, id_2, id_4);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4,
      id_5,
      id_6,
      id_3,
      id_3,
      id_0,
      id_7,
      id_5,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
