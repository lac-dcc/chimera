// Seed: 3174392659
module module_0 (
    output uwire id_0,
    output supply1 id_1,
    input tri id_2,
    inout wand id_3,
    output tri0 id_4
);
  wire id_6;
  assign id_0 = id_3;
endmodule
module module_1 (
    input  wire  id_0,
    inout  wand  id_1,
    output tri   id_2,
    input  tri0  id_3,
    output wire  id_4,
    input  tri   id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  tri1  id_8,
    input  tri   id_9,
    output wire  id_10,
    input  uwire id_11
);
  wire id_13;
  nor primCall (id_2, id_8, id_1, id_9, id_7, id_13, id_0, id_5, id_3, id_6);
  module_0 modCall_1 (
      id_2,
      id_10,
      id_8,
      id_1,
      id_2
  );
  assign modCall_1.type_1 = 0;
endmodule
