// Seed: 3638576287
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12, id_13, id_14, id_15, id_16, id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_15 = id_4;
  module_0 modCall_1 (
      id_16,
      id_2,
      id_1,
      id_2,
      id_2,
      id_14,
      id_6,
      id_11,
      id_12,
      id_11,
      id_2
  );
  wand id_19;
  assign id_13 = $display(id_16.id_11, id_16, 1, 1) | id_10 | id_11;
  always_latch begin : LABEL_0
    id_18 <= id_4;
    id_15 <= 1;
  end
  uwire id_20;
  tri0  id_21;
  wire  id_22;
  assign id_14 = id_20;
  id_23(
      .id_0({id_19, 1}), .id_1(1)
  );
  wire id_24;
  id_25(
      .id_0(id_24),
      .id_1(1),
      .id_2(id_5),
      .id_3(~1),
      .id_4(id_20 - 1),
      .id_5(1),
      .id_6(1 | 1 | id_19),
      .id_7(1),
      .id_8(id_16),
      .id_9(id_9),
      .id_10(1'h0 | 1),
      .id_11(1),
      .id_12(id_1),
      .id_13(id_14),
      .id_14(id_19)
  );
  wire id_26;
  assign id_19 = id_21;
  wire id_27, id_28;
endmodule
