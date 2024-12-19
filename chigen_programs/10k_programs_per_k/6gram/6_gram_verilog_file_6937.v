// Seed: 875219963
module module_0 (
    input  wor   id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  wand  id_3,
    input  wire  id_4,
    output uwire id_5,
    input  wand  id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  wire  id_9,
    input  tri0  id_10,
    input  tri   id_11,
    input  uwire id_12
);
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    input  uwire id_2,
    output tri1  id_3,
    output tri0  id_4,
    output uwire id_5,
    input  uwire id_6,
    output tri   id_7
);
  id_9(
      .id_0(~1), .id_1(id_4), .id_2(1)
  );
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_6,
      id_3,
      id_6,
      id_6,
      id_0,
      id_2,
      id_6,
      id_0,
      id_0
  );
  assign modCall_1.type_8 = 0;
  id_10(
      .id_0(1'h0),
      .id_1(1),
      .id_2(id_4),
      .id_3(1),
      .id_4(id_0),
      .id_5("" << 1),
      .id_6(1 >= id_2),
      .id_7(id_5),
      .id_8(id_7)
  );
endmodule
