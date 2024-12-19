// Seed: 3111633617
module module_0 (
    input  wand id_0,
    output tri0 id_1,
    output tri1 id_2,
    input  tri1 id_3,
    input  wor  module_0,
    input  wand id_5
);
  supply0 id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14 = id_12;
  wire id_15;
  tri0 id_16 = id_10 == 1;
  wand id_17 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    input supply0 id_4,
    input tri id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_5,
      id_3
  );
  assign modCall_1.type_23 = 0;
  assign id_0 = id_2;
endmodule
