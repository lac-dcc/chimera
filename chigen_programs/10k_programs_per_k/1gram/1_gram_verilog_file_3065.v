// Seed: 3304797762
module module_0 (
    input uwire id_0,
    input wand id_1
    , id_19,
    output wand id_2,
    output tri0 id_3,
    input tri1 id_4
    , id_20,
    output wand id_5,
    input supply0 id_6,
    input wire id_7,
    input wor id_8,
    input wire id_9,
    input wor id_10,
    output wor id_11,
    input tri0 id_12,
    input tri id_13
    , id_21,
    output tri id_14
    , id_22,
    input wor id_15,
    output supply0 id_16,
    input wire id_17
);
  wire id_23;
  assign id_20 = id_13;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri0  id_1
    , id_5,
    input  uwire id_2,
    input  wire  id_3
);
  logic id_6, id_7 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_14 = 0;
endmodule
