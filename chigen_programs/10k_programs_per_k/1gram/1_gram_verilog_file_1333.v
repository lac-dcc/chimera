// Seed: 3106754484
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wor id_7, id_8;
  wire id_9;
  wire id_10 = id_9;
  assign id_8 = !id_2 && id_1;
  wire id_11, id_12, id_13;
  wire id_14;
  wire id_15, id_16, id_17;
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
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always_ff id_5 <= id_1;
  timeunit 1ps; id_16(
      .id_0(id_5),
      .id_1(id_4),
      .id_2(1),
      .id_3(id_9),
      .id_4(id_12),
      .id_5(~id_1),
      .id_6(1'h0),
      .id_7(id_7),
      .id_8(id_11 & id_6),
      .id_9(1),
      .id_10(id_13),
      .id_11((id_4)),
      .id_12(id_8),
      .id_13(1),
      .id_14(1),
      .id_15(1),
      .id_16(id_1),
      .id_17(id_8 - id_7 | 1 & id_6),
      .id_18(id_5)
  );
  nand primCall (id_5, id_15, id_9, id_17, id_7, id_6, id_2, id_16, id_8, id_1);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_3,
      id_17,
      id_9,
      id_4
  );
  reg id_18;
  always id_18 <= id_8;
endmodule
