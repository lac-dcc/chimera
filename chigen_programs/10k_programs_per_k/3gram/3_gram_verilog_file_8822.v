// Seed: 3137585804
module module_0 (
    input  tri   id_0
    , id_11,
    input  tri0  id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  tri1  id_4,
    output wor   id_5,
    input  wor   id_6,
    input  uwire id_7,
    output wire  id_8,
    input  tri   id_9
);
  tri  id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  id_16(
      .id_0(1 - id_6 & 1), .id_1(1'b0)
  );
  wire id_17;
  assign id_12 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri id_2,
    output tri1 id_3,
    output tri id_4,
    input uwire id_5,
    input supply0 id_6,
    inout wire id_7,
    input wand id_8,
    output supply1 id_9,
    input tri1 id_10,
    input tri id_11
);
  wire id_13;
  nor primCall (id_9, id_6, id_11, id_1, id_10, id_0, id_7, id_13);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_9,
      id_7,
      id_10,
      id_4,
      id_8
  );
  assign modCall_1.type_4 = 0;
  wire id_14;
  wire id_15;
  final $display(id_11);
  wor id_16 = id_5;
endmodule
