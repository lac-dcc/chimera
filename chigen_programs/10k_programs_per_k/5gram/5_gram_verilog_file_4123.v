// Seed: 1850588319
module module_0 (
    output tri id_0,
    output supply1 id_1,
    input supply1 id_2,
    output tri id_3,
    input supply0 id_4,
    input uwire id_5,
    input supply0 id_6,
    output uwire id_7,
    output wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    output supply0 id_11,
    output wor id_12,
    input tri0 id_13,
    input tri id_14
);
  assign id_7 = id_5;
  assign id_8 = id_5 ^ id_6;
  assign id_3 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1
);
  tri0 id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.type_4 = 0;
endmodule
