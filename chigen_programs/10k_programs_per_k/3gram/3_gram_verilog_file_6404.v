// Seed: 790324095
macromodule module_0 (
    output wor id_0,
    input wor id_1,
    input uwire id_2
    , id_18,
    output uwire id_3,
    input uwire id_4,
    output tri id_5,
    input wand id_6,
    input wire id_7,
    input uwire id_8,
    input uwire id_9,
    output supply0 id_10,
    input tri id_11,
    input tri id_12,
    output supply1 id_13,
    output wire id_14,
    input wire id_15,
    input tri1 id_16
);
  wire id_19;
  assign id_5 = 1;
endmodule
module module_1 (
    input supply1 id_0
    , id_8,
    output wor id_1,
    input wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input uwire id_5,
    output tri id_6
);
  id_9(
      .id_0(1'b0),
      .id_1(1'b0),
      .id_2(id_6),
      .id_3(~1),
      .id_4(id_8),
      .id_5(id_8),
      .id_6(1'b0),
      .id_7(id_5),
      .id_8(1 == 1),
      .id_9(id_1),
      .id_10(),
      .id_11((id_0)),
      .id_12(id_8),
      .id_13(1),
      .id_14(id_0++)
  );
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_1,
      id_5,
      id_1,
      id_5,
      id_0,
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_1,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_14 = 0;
endmodule
