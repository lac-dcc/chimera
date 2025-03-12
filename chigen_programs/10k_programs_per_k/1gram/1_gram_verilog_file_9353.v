// Seed: 3142866395
module module_0 (
    output tri   id_0,
    output uwire id_1,
    output uwire id_2,
    output tri1  id_3,
    output uwire id_4
);
  assign id_4 = 1'd0;
  wire id_6;
endmodule
module module_1 (
    output wor  id_0,
    output wand id_1,
    input  wire id_2,
    input  wor  id_3,
    input  tri  id_4,
    input  tri0 id_5,
    input  wire id_6,
    output wand id_7,
    input  wire id_8
);
  logic id_10;
  ;
  nand primCall (id_7, id_10, id_8, id_6, id_12, id_4, id_2, id_3, id_5);
  wire id_11;
  wire id_12, id_13;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_7,
      id_1,
      id_7
  );
  assign modCall_1.id_3 = 0;
  wire id_14;
endmodule
