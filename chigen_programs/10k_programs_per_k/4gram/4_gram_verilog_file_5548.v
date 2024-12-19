// Seed: 3852848514
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    output wire id_6,
    input wand id_7,
    output tri id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    input wor id_12,
    input supply1 id_13,
    input tri id_14,
    output wor id_15
);
  id_17(
      id_4, 1
  ); id_18(
      .id_0(id_14),
      .id_1(id_6),
      .id_2(1),
      .id_3(id_9),
      .id_4(1'b0),
      .id_5(1),
      .id_6({1 - 1'b0, 1 - 1} || id_8 || 1),
      .id_7(id_9),
      .id_8((1)),
      .id_9('d0),
      .id_10(!id_5),
      .id_11(1'b0),
      .id_12(id_3)
  );
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    output uwire id_2,
    output tri0  id_3,
    input  wor   id_4
    , id_7,
    input  tri1  id_5
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_0,
      id_2,
      id_5,
      id_0,
      id_4,
      id_4,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.type_2 = 0;
  wire id_8;
endmodule
