// Seed: 2111469965
module module_0 (
    output uwire id_0,
    input  tri   id_1,
    input  tri   id_2,
    output wand  id_3,
    input  wire  id_4,
    input  wire  id_5,
    input  tri1  id_6,
    input  tri0  id_7,
    input  wire  id_8,
    input  tri   id_9,
    output tri0  id_10,
    input  tri   id_11,
    input  wor   id_12,
    output wor   id_13,
    input  tri   id_14
);
  uwire id_16;
  logic [7:0][-1] id_17 (
      .id_0(1),
      .id_1(-1),
      .id_2(1'b0 & 1'b0),
      .id_3(-1'h0),
      .id_4(id_9),
      .id_5(id_16)
  );
  assign module_1.type_2 = 0;
  wire id_18, id_19;
  assign id_16 = -1 == 1'b0;
endmodule
macromodule module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    output tri id_4,
    output uwire id_5,
    output tri0 id_6
);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_6,
      id_1
  );
endmodule
