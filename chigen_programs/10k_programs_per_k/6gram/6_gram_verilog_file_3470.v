// Seed: 3187073211
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    output uwire id_6,
    input  uwire id_7,
    input  wand  id_8
);
  wire id_10;
  wire id_11 = id_3;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output wire  id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  wire  id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  tri1  id_8,
    output uwire id_9
);
  wire id_11;
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_2,
      id_3,
      id_7,
      id_1
  );
endmodule
