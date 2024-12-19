// Seed: 955283051
module module_0 (
    output tri0  id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  wor   id_5,
    input  wire  id_6,
    output uwire id_7
);
  final $display(1);
  tri1 id_9 = 1;
  assign id_7 = id_6;
  id_10(
      .id_0(id_7), .id_1(1), .id_2(), .id_3(id_6), .id_4(1'b0 - 1)
  );
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  uwire id_3
);
  id_5(
      .id_0(id_3), .id_1(1), .id_2(!1), .id_3(id_3)
  );
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_0
  );
  wire id_6;
endmodule
