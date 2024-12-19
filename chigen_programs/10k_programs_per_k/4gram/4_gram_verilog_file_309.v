// Seed: 2446375110
module module_0 (
    input wand id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    input wor id_4
    , id_28,
    input supply0 id_5,
    output supply1 id_6,
    input wand id_7,
    input uwire id_8
    , id_29,
    input wor id_9,
    input wor id_10
    , id_30,
    output uwire id_11,
    input uwire id_12,
    input uwire id_13,
    input supply0 id_14,
    input tri id_15,
    input tri id_16,
    input supply1 id_17,
    input supply0 id_18,
    output supply1 id_19,
    input tri id_20,
    output wor id_21
    , id_31,
    input tri1 id_22,
    input tri id_23,
    input wand id_24,
    input supply1 id_25,
    input wand id_26
);
  assign id_30 = id_17 ? id_18 : 1'b0;
endmodule
module module_1 #(
    parameter id_10 = 32'd8,
    parameter id_9  = 32'd76
) (
    input tri0 id_0,
    output wor id_1,
    output uwire id_2,
    input tri1 id_3,
    output supply1 id_4,
    output uwire id_5
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_0,
      id_0,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_17 = 0;
  assign id_1 = id_3;
  logic [7:0] id_7 = id_7[1'b0];
  id_8(
      .id_0(1'h0),
      .id_1(1),
      .id_2(1),
      .id_3(id_2),
      .id_4(id_5),
      .id_5(id_4),
      .id_6(1),
      .id_7(id_7),
      .id_8(1),
      .id_9(id_4),
      .id_10(1 === 1),
      .id_11(id_5 - id_0),
      .id_12(id_2),
      .id_13((id_1))
  );
  assign id_1 = 1'b0;
  defparam id_9.id_10 = id_9;
endmodule
