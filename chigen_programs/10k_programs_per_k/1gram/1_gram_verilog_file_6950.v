// Seed: 3947528726
macromodule module_0 (
    input wire id_0,
    input supply1 id_1,
    output wire id_2,
    input supply1 id_3,
    output tri id_4,
    output tri id_5,
    input supply0 id_6
    , id_31,
    input tri1 void id_7,
    input tri id_8,
    input wand id_9,
    output supply0 id_10,
    input tri1 id_11,
    output wand id_12,
    output wor id_13,
    input wire id_14,
    output wire id_15,
    input tri0 id_16,
    input uwire id_17,
    input uwire id_18,
    input uwire id_19,
    input wor id_20
    , id_32,
    input wor id_21,
    input uwire id_22,
    input uwire id_23,
    output tri id_24,
    output wand id_25,
    input wire id_26,
    output wor id_27,
    input supply0 id_28,
    input supply1 id_29
);
  for (id_33 = id_32; (1 - id_6); id_25 = 1) wire id_34;
  wire id_35;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input wire id_2,
    input tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    output wire id_6
);
  assign id_6 = 1;
  id_8(
      .id_0(""),
      .id_1((id_5)),
      .id_2(1),
      .id_3(id_4 == id_3),
      .id_4(id_3.id_3 < 1'b0),
      .id_5(1'd0),
      .id_6("" + (1'b0)),
      .id_7(id_4 == id_5),
      .id_8(id_0)
  );
  wire id_9 = id_9;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_2,
      id_5,
      id_5,
      id_4,
      id_6,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_5,
      id_5,
      id_0,
      id_5,
      id_2,
      id_4
  );
  assign modCall_1.type_2 = 0;
  id_11(
      ~1'd0
  );
  assign id_5 = 1;
  wire id_12;
  assign id_5 = 1 - id_4 & 1;
endmodule : SymbolIdentifier
