// Seed: 3951652405
module module_0 (
    input wand id_0,
    output wand id_1,
    input wor id_2,
    input supply0 id_3,
    output tri1 id_4,
    input wor id_5,
    input supply0 id_6,
    output supply1 id_7,
    output tri0 id_8,
    input uwire id_9,
    input wor id_10
);
  assign id_7 = 1;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    output wor id_3,
    output wor id_4,
    input tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    input supply0 id_8,
    output supply0 id_9,
    input wor id_10
);
  xor primCall (id_3, id_1, id_2, id_0, id_7, id_5, id_8, id_6);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_7,
      id_9,
      id_1,
      id_10,
      id_9,
      id_3,
      id_10,
      id_10
  );
  wand id_12 = 1;
  assign id_4 = 1;
endmodule
