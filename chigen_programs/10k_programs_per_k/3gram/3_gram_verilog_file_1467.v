// Seed: 4252029293
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    input  wand  id_2,
    output wire  id_3,
    input  tri   id_4,
    input  uwire id_5,
    input  uwire id_6,
    output wand  id_7,
    output tri0  id_8
);
  id_10(
      .id_0(1), .id_1((1))
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output wire  id_1,
    input  tri1  id_2,
    input  uwire id_3,
    input  tri0  id_4
);
  wire id_6;
  or primCall (id_1, id_6, id_4, id_0);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
