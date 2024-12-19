// Seed: 3144671611
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    output wire id_3
);
  wire id_5;
  reg  id_6;
  wire id_7;
  wire id_8;
  reg id_9, id_10, id_11, id_12, id_13, id_14, id_15 = id_6, id_16, id_17, id_18;
  always id_9 <= 1;
  id_19(
      .id_0(1 - 1),
      .id_1(id_7),
      .id_2("" && 1 && 1'h0),
      .id_3(1),
      .id_4(id_17),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(1),
      .id_9(),
      .id_10(),
      .id_11(""),
      .id_12(1 ^ 1 ^ id_14),
      .id_13(1'b0),
      .id_14(1),
      .id_15(1),
      .id_16($display),
      .id_17(1'b0),
      .id_18(id_0),
      .id_19(1),
      .id_20(1),
      .id_21(1),
      .id_22(1),
      .id_23(1 - id_5),
      .id_24(id_7),
      .id_25(id_1),
      .id_26(id_12),
      .id_27(1)
  );
  wor id_20 = id_5;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    output logic id_3,
    input wire id_4,
    input wor id_5,
    input supply1 id_6,
    output wand id_7,
    output logic id_8,
    output logic id_9,
    input wor id_10,
    input tri id_11,
    input tri0 id_12,
    output tri id_13,
    input wand id_14,
    input tri id_15,
    input tri0 id_16
);
  always begin : LABEL_0
    id_3 <= id_2 & id_15;
    id_9 <= (1'h0 && id_15);
    $display(1, id_6 & 1);
    id_8 <= (1);
  end
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_13
  );
endmodule
