// Seed: 1258815276
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri0 id_9
    , id_12,
    output supply1 id_10
);
  always force id_12 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    output tri id_2,
    input tri0 id_3,
    output wand id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri0 id_8,
    input tri0 id_9,
    input logic id_10,
    input tri id_11,
    input supply1 id_12,
    output uwire id_13
);
  always force id_13 = id_10;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_6,
      id_9,
      id_9,
      id_9,
      id_6,
      id_8,
      id_11,
      id_3,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
