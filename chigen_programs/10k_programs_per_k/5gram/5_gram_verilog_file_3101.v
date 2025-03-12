// Seed: 3938733123
module module_0 (
    output wand id_0,
    output uwire id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri id_9,
    output tri id_10,
    input wor id_11,
    output uwire id_12,
    input wor id_13
);
  assign id_1 = 1 ? id_9 : id_8 >> 1;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output tri id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wand id_5,
    input tri1 id_6,
    input wor id_7,
    output supply1 id_8,
    input tri id_9
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_9,
      id_9,
      id_8,
      id_2,
      id_1,
      id_1,
      id_1,
      id_8,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_6 = 0;
  parameter id_11 = 1 - 1;
endmodule
