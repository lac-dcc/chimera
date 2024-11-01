// Seed: 2690565212
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    output uwire id_3,
    input wire id_4
);
  assign id_3 = 1 << id_2;
  logic [7:0] id_6, id_7;
  id_8(
      .id_0(1),
      .id_1(id_1),
      .id_2(1),
      .id_3(id_7),
      .id_4(id_3),
      .id_5(id_7),
      .id_6((id_1)),
      .id_7(id_6),
      .id_8(id_1),
      .id_9(id_1),
      .id_10(),
      .id_11(id_6),
      .id_12(1),
      .id_13(1),
      .id_14(id_0 >> id_4),
      .id_15(1),
      .id_16(!id_0)
  );
  assign id_6[1] = 1;
  wire id_9;
endmodule
module module_1 (
    input  tri0  id_0
    , id_14,
    input  tri0  id_1,
    output wor   id_2,
    output wand  id_3,
    input  tri0  id_4,
    input  wire  id_5,
    input  wor   id_6,
    input  wor   id_7,
    output tri0  id_8,
    input  wand  id_9,
    input  uwire id_10,
    input  wire  id_11,
    input  tri   id_12
);
  wor id_15 = 1, id_16;
  module_0(
      id_6, id_2, id_10, id_3, id_1
  );
endmodule
