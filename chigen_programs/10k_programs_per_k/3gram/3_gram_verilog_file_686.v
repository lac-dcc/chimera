// Seed: 2919518126
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    input uwire id_5
);
  final $display(1 * id_1 - id_0);
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    inout  wor   id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wire  id_4,
    input  wand  id_5,
    input  tri1  id_6,
    input  uwire id_7
);
  wire  id_9;
  uwire id_10;
  tri   id_11 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_6,
      id_6,
      id_1
  );
  wand id_12;
  assign id_10 = 1;
  id_13(
      .id_0(id_12), .id_1(id_12), .id_2(1), .id_3(1), .id_4(id_12 == 1), .id_5(1), .id_6(id_12)
  );
endmodule
