// Seed: 908298799
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input tri1 id_6,
    output wor id_7,
    input tri1 id_8,
    input wor id_9,
    input wire id_10,
    input tri id_11,
    input wand id_12
);
  wire id_14;
  assign id_0 = 1;
  wire id_15;
  wire id_16;
  wire id_17;
  assign id_7 = id_16;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    input  wand  id_3,
    input  wire  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  uwire id_7,
    input  tri0  id_8
);
  always id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_6,
      id_2,
      id_3,
      id_0,
      id_8,
      id_0,
      id_5
  );
  assign modCall_1.id_8 = 0;
  assign id_2 = id_1;
endmodule
