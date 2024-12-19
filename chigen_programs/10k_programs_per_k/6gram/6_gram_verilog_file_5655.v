// Seed: 1758114237
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output wand id_2,
    input supply0 id_3,
    input uwire id_4,
    output wire id_5,
    input supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri1 id_9,
    input wire id_10,
    input tri0 id_11,
    input uwire id_12
    , id_16,
    input tri id_13,
    output wire id_14
);
  wire id_17;
  id_18(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_6),
      .id_7(1),
      .id_8({1'b0, id_17, id_3 == 1'h0, id_1 == id_5}),
      .id_9(1)
  );
  assign id_14 = id_13;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri0 id_1,
    output wire id_2
);
  assign id_2 = id_0;
  assign id_2 = 1 ? 1 == ('b0) : 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_8 = 0;
endmodule
