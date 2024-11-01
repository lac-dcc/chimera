// Seed: 4272347908
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wand id_6,
    output wire id_7,
    input uwire id_8,
    input tri0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    input wor id_12,
    input tri id_13,
    output tri0 id_14,
    input tri id_15,
    input wand id_16,
    output tri id_17,
    input tri0 id_18,
    output tri1 id_19,
    input wor id_20,
    input tri id_21,
    output tri0 id_22,
    output tri id_23,
    input wire id_24,
    output tri id_25,
    input wire id_26,
    input tri0 id_27
);
  id_29(
      .id_0(id_14 - 1),
      .id_1(id_26),
      .id_2(id_17),
      .id_3(1),
      .id_4(),
      .id_5(id_22),
      .id_6(),
      .id_7(1),
      .id_8(1),
      .id_9(id_3),
      .id_10(1'b0),
      .id_11(1),
      .id_12(""),
      .id_13(1 + 1'd0),
      .id_14(1),
      .id_15(1),
      .id_16(id_10 - 1),
      .id_17((1)),
      .id_18(1),
      .id_19(1'b0),
      .id_20(id_12),
      .id_21(1),
      .id_22(id_13),
      .id_23(id_21 || (id_8 - 1))
  );
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input logic id_2,
    input uwire id_3,
    output wire id_4,
    output wand id_5,
    input tri0 id_6,
    output supply1 id_7
);
  always_ff begin
    if (id_6) begin
      id_1 <= id_2;
    end
  end
  module_0(
      id_6,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6,
      id_6,
      id_5,
      id_3,
      id_3,
      id_4,
      id_0,
      id_6,
      id_3,
      id_4,
      id_6,
      id_0,
      id_7,
      id_3,
      id_7,
      id_0,
      id_3,
      id_4,
      id_4,
      id_0,
      id_7,
      id_3,
      id_3
  );
endmodule
