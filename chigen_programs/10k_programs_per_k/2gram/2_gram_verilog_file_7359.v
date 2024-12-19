// Seed: 1928970082
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    input tri id_4,
    output wire id_5,
    input tri0 id_6,
    input uwire id_7
    , id_21,
    input tri0 id_8,
    input wor id_9,
    output wire id_10,
    output wand id_11,
    output tri0 id_12,
    input wand id_13,
    input tri0 id_14,
    input uwire id_15,
    output tri id_16,
    output tri1 id_17,
    output wire id_18,
    input wand id_19
);
  wire id_22;
  wire id_23;
  assign id_16 = 1;
  assign id_2  = id_8;
  wire id_24;
  tri  id_25 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    output wire id_1
);
  assign id_1 = 1;
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.type_33 = 0;
  tri1 id_4;
  always #1 id_4 = id_0 - 1;
endmodule
