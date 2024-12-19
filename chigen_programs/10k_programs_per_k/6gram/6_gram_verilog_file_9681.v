// Seed: 4078706308
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_7(
      .id_0(1'b0 == id_3),
      .id_1(id_6),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(id_4 != 1),
      .id_6(id_2),
      .id_7(1),
      .id_8({id_5 - id_1, 1'b0}),
      .id_9(1),
      .id_10(1),
      .id_11(id_6),
      .id_12(1),
      .id_13(id_3),
      .id_14(id_5 + ~{id_5{1 / 1}}),
      .id_15(1),
      .id_16(1),
      .id_17(1),
      .id_18(id_3)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial
  fork : SymbolIdentifier
  join_none : SymbolIdentifier
  module_0 modCall_1 (
      id_1,
      id_6,
      id_6,
      id_3,
      id_6,
      id_1
  );
  assign modCall_1.SymbolIdentifier.SymbolIdentifier.id_3 = 0;
endmodule
