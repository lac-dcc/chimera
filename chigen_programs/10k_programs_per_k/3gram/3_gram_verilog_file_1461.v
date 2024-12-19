// Seed: 928814747
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wor id_5
);
  if (1) begin : LABEL_0
    assign id_2 = 1'd0 & 1;
    wire id_7;
  end
  assign module_1.type_32 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input wor id_2,
    output logic id_3,
    input tri id_4
    , id_19,
    input supply1 id_5,
    output supply0 id_6,
    input uwire id_7,
    output tri id_8,
    input wire id_9,
    input wire id_10,
    input tri1 id_11,
    input wor id_12,
    input uwire id_13,
    output uwire id_14,
    input tri id_15
    , id_20,
    input wand id_16,
    output wire id_17
);
  logic [7:0] id_21;
  wor id_22;
  id_23(
      .id_0(id_21),
      .id_1(1),
      .id_2(id_12),
      .id_3(id_4),
      .id_4(id_22),
      .id_5(1),
      .id_6(),
      .id_7(id_7),
      .id_8(1),
      .id_9(id_22 ==? 1),
      .id_10(1),
      .id_11(1),
      .id_12(""),
      .id_13(id_1 & 1),
      .id_14(id_2),
      .id_15(1),
      .id_16(1 - 1),
      .id_17(1)
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_10,
      id_11,
      id_0
  );
  assign id_8 = id_21[1];
  always_comb id_3 = #id_24 id_20;
endmodule
