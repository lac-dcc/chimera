// Seed: 2906007938
module module_0 (
    input uwire id_0,
    input wand id_1,
    input wor id_2,
    input tri1 id_3
    , id_16,
    output uwire id_4,
    output wor id_5,
    input uwire id_6,
    input wand id_7,
    input wire id_8,
    input tri0 id_9,
    input supply0 id_10,
    output tri id_11,
    output wand id_12,
    output uwire id_13,
    output wor id_14
);
  tri0 id_17 = id_9;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    input  wand  id_2,
    output uwire id_3,
    input  uwire id_4,
    output wand  id_5
    , id_7
);
  genvar id_8, id_9;
  wire id_10 = 1;
  tri0 id_11 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_5,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_5,
      id_5,
      id_3,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
