// Seed: 2788467015
module module_0 (
    output wire id_0,
    input tri id_1,
    id_13,
    input supply1 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input wand id_6,
    input tri id_7,
    input tri0 id_8,
    input uwire id_9,
    input wor id_10,
    input tri1 id_11
);
  wire id_14;
  wire id_15;
  id_16(
      .id_0(1'b0),
      .id_1($),
      .id_2(id_0),
      .id_3(),
      .id_4(),
      .id_5(id_7),
      .id_6(-1),
      .id_7(1'd0),
      .id_8(1'b0),
      .id_9(1),
      .id_10(-1),
      .id_11(-1),
      .id_12(-1 + id_8),
      .id_13(id_5),
      .id_14(id_10)
  );
  assign id_15 = -{1};
endmodule
macromodule module_1 (
    output wor   id_0,
    output wire  id_1,
    input  tri   id_2,
    inout  logic id_3,
    input  tri0  id_4,
    input  wand  id_5,
    output wand  id_6,
    input  wor   id_7,
    input  tri1  id_8,
    input  tri0  id_9
);
  always_latch id_3 <= 1 + id_4;
  assign id_1 = id_8;
  wire id_11;
  id_12(
      id_1, -1'h0, -1, 1
  );
  wire id_13;
  wire id_14;
  wire id_15, id_16, id_17, id_18;
  wire id_19;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_5,
      id_4,
      id_8,
      id_4,
      id_9,
      id_2,
      id_2,
      id_9,
      id_9
  );
  assign modCall_1.type_19 = 0;
endmodule
