// Seed: 2052063363
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    output wor id_5,
    input tri id_6,
    input uwire id_7,
    input wire id_8,
    output supply0 id_9,
    input wor id_10,
    input tri0 id_11
    , id_22,
    input tri1 id_12,
    input tri0 id_13,
    input wire id_14,
    output supply0 id_15,
    input tri1 id_16,
    input tri0 id_17,
    output wand id_18,
    input tri0 id_19,
    output wand id_20
);
  wire id_23;
  assign module_1.type_12 = 0;
  assign id_18 = id_22 || 1 > id_8;
  wire id_24;
  assign id_2 = id_6;
endmodule
module module_1 (
    output supply0 id_0,
    output tri id_1
    , id_10,
    input uwire id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    output supply1 id_6
    , id_11,
    input logic id_7,
    output supply1 id_8
);
  initial #1 force id_0 = id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_2,
      id_0,
      id_2,
      id_4,
      id_5,
      id_2,
      id_3,
      id_8,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
endmodule
