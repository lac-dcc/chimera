// Seed: 3710805367
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri id_3,
    output uwire id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    input tri0 id_8,
    input supply0 id_9,
    output wand id_10,
    output wire id_11,
    input supply0 id_12,
    output uwire id_13,
    output wire id_14
);
  id_16(
      .id_0(1'd0),
      .id_1(id_13),
      .id_2(1),
      .id_3(1),
      .id_4(1 || id_0 < 1 ? id_3 : 1),
      .id_5({id_5}),
      .id_6(""),
      .id_7(1'b0),
      .id_8(1),
      .id_9(id_10),
      .id_10(1),
      .id_11(id_3 << (1 ? 1'b0 : 1'b0)),
      .id_12(1'b0),
      .id_13(1),
      .id_14(1'b0),
      .id_15(id_8 & 1)
  ); id_17(
      .id_0(1),
      .id_1(1),
      .id_2((1)),
      .id_3(1 - 1),
      .id_4(""),
      .id_5(),
      .id_6(),
      .id_7(id_4 == 1'b0),
      .id_8(id_13),
      .id_9(id_3 == 1),
      .id_10(id_14),
      .id_11(1),
      .id_12(1),
      .id_13(id_9),
      .id_14(1),
      .id_15(id_1),
      .id_16(id_4),
      .id_17(1'b0),
      .id_18(id_11 + id_11),
      .id_19(id_0)
  );
endmodule : SymbolIdentifier
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wire id_3
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_0,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.type_3 = 0;
  supply1 id_5 = 1, id_6;
endmodule
