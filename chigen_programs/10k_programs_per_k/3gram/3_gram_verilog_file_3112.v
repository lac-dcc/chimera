// Seed: 955815046
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
  assign module_1.id_10 = 0;
  assign id_4 = 1'h0;
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
    id_17
);
  input wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(id_14) id_4 <= id_10 & 1'd0;
  assign id_5 = 1'h0;
  id_18(
      .id_0(id_13),
      .id_1(id_13),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1),
      .id_5(id_14),
      .id_6(id_6[1]),
      .id_7(id_2 + 1),
      .id_8(id_8),
      .id_9(id_2),
      .id_10(id_15),
      .id_11(1),
      .id_12(1),
      .id_13(id_11)
  );
  module_0 modCall_1 (
      id_7,
      id_10,
      id_1,
      id_3,
      id_2,
      id_10,
      id_3,
      id_7,
      id_10,
      id_10
  );
  assign id_10 = id_13;
  assign id_5  = 1'b0;
  wire id_19;
  wire id_20;
  final $display;
  wire id_21;
  wire id_22;
endmodule
