// Seed: 705939764
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    output uwire id_2,
    output tri0  id_3,
    input  uwire id_4,
    output wire  id_5,
    input  tri0  id_6,
    output uwire id_7,
    input  wire  id_8,
    input  uwire id_9,
    output uwire id_10,
    output wor   id_11,
    output tri0  id_12,
    input  wor   id_13,
    input  uwire id_14
);
  wire id_16;
  tri1 id_17 = 1;
  wire id_18;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri  id_1,
    output wire id_2,
    output wand id_3,
    input  tri0 id_4,
    input  tri1 id_5,
    input  wand id_6,
    input  tri0 id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_3,
      id_1,
      id_6,
      id_1,
      id_5,
      id_2,
      id_6,
      id_0,
      id_3,
      id_2,
      id_3,
      id_7,
      id_4
  );
  assign modCall_1.id_0 = 0;
  wire id_9;
endmodule
