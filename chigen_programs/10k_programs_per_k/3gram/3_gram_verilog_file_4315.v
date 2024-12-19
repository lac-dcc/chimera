// Seed: 373731304
module module_0 (
    input tri0 id_0,
    input wand id_1,
    output wand id_2,
    output wand id_3,
    input tri1 id_4,
    output tri1 id_5,
    input wor id_6,
    output wand id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wor id_10,
    input wor id_11,
    input tri0 id_12,
    input supply0 id_13,
    output tri id_14,
    input tri0 id_15
);
  supply0 id_17 = id_13;
endmodule
module module_1 (
    output tri  id_0,
    output tri0 id_1,
    input  wor  id_2,
    input  tri1 id_3,
    input  tri1 id_4
);
  logic [7:0] id_6;
  assign id_6[1] = id_3;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_1,
      id_2,
      id_1,
      id_4,
      id_0,
      id_2,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.id_14 = 0;
endmodule
