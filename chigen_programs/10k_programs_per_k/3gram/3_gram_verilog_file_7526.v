// Seed: 710261837
module module_0 (
    input tri1 id_0,
    input wire id_1,
    output supply1 id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input wire id_6,
    input tri1 id_7,
    output wand id_8,
    output tri0 id_9,
    input tri0 id_10
    , id_20,
    input supply0 id_11,
    input tri1 id_12,
    input tri0 id_13,
    input tri id_14,
    output tri0 id_15,
    input wand id_16,
    input uwire id_17,
    input uwire id_18
);
  wire id_21;
  tri0 id_22;
  assign id_22 = 1;
  wire   id_23;
  wire   id_24 = id_23;
  wire   id_25;
  string id_26 = "";
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input tri id_2,
    output logic id_3,
    input tri0 id_4
);
  wire id_6;
  always_comb @(1) id_3 <= id_1 & id_4 - id_4;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_0,
      id_0,
      id_2,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_11 = 0;
  wor id_7 = 1'b0;
  supply0 id_8;
  assign #id_9 id_6 = !id_8;
  id_10(
      .id_0(id_1 == 1),
      .id_1(id_7),
      .id_2(id_4),
      .id_3(id_6),
      .id_4((1)),
      .id_5(1),
      .id_6(id_3),
      .id_7(id_9),
      .id_8(1),
      .id_9(id_8),
      .id_10(id_4),
      .id_11(1),
      .id_12(1),
      .id_13(1),
      .id_14(id_7),
      .id_15(1),
      .id_16(~1 && id_4 && id_3),
      .id_17(1),
      .id_18(id_3),
      .id_19(1 - id_0),
      .id_20(1),
      .id_21(id_4),
      .id_22(id_1),
      .id_23(1)
  );
endmodule : SymbolIdentifier
