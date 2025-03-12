// Seed: 135059037
module module_0 (
    input tri id_0,
    input tri1 id_1,
    output tri id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri id_10,
    input uwire id_11,
    output uwire id_12,
    input wor id_13,
    input uwire id_14,
    output wor id_15,
    input tri id_16,
    output tri id_17,
    input wire id_18,
    output supply1 id_19,
    input tri0 id_20,
    input tri0 id_21,
    output wand id_22
);
  logic id_24;
endmodule
module module_1 (
    output tri  id_0,
    input  wor  id_1,
    output wor  id_2,
    output wor  id_3,
    input  tri  id_4,
    input  wire id_5
);
  wire id_7 = id_1;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_0,
      id_1,
      id_5,
      id_1,
      id_0,
      id_0,
      id_5,
      id_5,
      id_1,
      id_4,
      id_2,
      id_4,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_5,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
