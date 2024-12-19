// Seed: 1284443460
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    input supply1 id_6
);
  assign id_2 = id_6;
  tri0 id_8, id_9, id_10;
  wire id_11, id_12, id_13;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    input supply1 id_9,
    input wand id_10,
    input wire id_11
);
  assign id_5 = id_11;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_8,
      id_5,
      id_11,
      id_4
  );
  assign modCall_1.type_2 = 0;
endmodule
