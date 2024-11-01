// Seed: 3648619844
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire id_9;
  uwire id_10;
  wire  id_11;
  always @(posedge id_9 !== 1 or posedge id_2) id_3 = id_8;
  integer id_12 (
      .id_0(1),
      .id_1(1),
      .id_2(id_1),
      .id_3(1),
      .id_4(1'b0)
  );
  wire id_13;
  assign id_6 = id_8;
  integer id_14 = 1;
  if (id_14) always @(posedge id_10);
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
    id_18,
    id_19
);
  input wire id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = id_15;
  nand (id_9, id_15, id_12, id_11, id_17, id_4, id_19, id_3, id_10, id_18, id_2, id_1, id_5, id_13);
  module_0(
      id_1, id_11, id_10, id_5, id_10, id_3, id_4, id_15
  );
  wire id_20;
  id_21(
      .id_0(),
      .id_1(),
      .id_2(id_8),
      .id_3(1),
      .id_4(id_9),
      .id_5(id_9),
      .id_6(1),
      .id_7(id_7),
      .id_8(id_18),
      .id_9(id_18[1'h0 : 1'b0]),
      .id_10(1'b0),
      .id_11(~1),
      .id_12(id_20),
      .id_13(id_6),
      .id_14(id_7),
      .id_15(1),
      .id_16(id_10),
      .id_17(id_18[1]),
      .id_18(1),
      .id_19(1),
      .id_20(1),
      .id_21(id_5 - id_14),
      .id_22(id_13),
      .id_23(1'b0),
      .id_24(id_16 - 1'b0),
      .id_25(1),
      .id_26(id_15),
      .id_27(id_6),
      .id_28(1)
  );
endmodule
