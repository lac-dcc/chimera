// Seed: 3735034607
module module_0 (
    output tri   id_0,
    input  wor   id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    input  wire  id_6,
    id_11,
    input  tri0  id_7,
    input  wand  id_8,
    output wand  id_9
);
  id_12(
      .id_0(id_8),
      .id_1(-1),
      .id_2(1'b0),
      .id_3(id_0),
      .id_4(1),
      .id_5(-1),
      .id_6(id_9),
      .id_7(id_3),
      .id_8(id_6),
      .id_9(id_8)
  ); specify
    if (-1) (posedge id_13 *> (id_14 +: -1)) = (-1 > id_11  : id_1 == id_8  : 1, id_8);
    specparam id_15 = -1'b0;
  endspecify
  wand id_16 = -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    output wor id_3,
    input wire id_4,
    input tri0 id_5,
    output tri id_6,
    output wand id_7,
    output wor id_8,
    output wand id_9,
    output tri1 id_10,
    output tri id_11,
    input uwire id_12,
    output wand id_13
);
  uwire id_15 = id_12, id_16;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_15,
      id_5,
      id_1,
      id_1,
      id_15,
      id_4,
      id_15,
      id_16
  );
endmodule
