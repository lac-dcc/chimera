// Seed: 2020162249
module module_0;
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  inout wire id_24;
  output wire id_23;
  inout wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_25;
  wire id_26;
  nand primCall (
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_2,
      id_20,
      id_21,
      id_22,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_4,
      id_6,
      id_7
  );
  wire id_27 = 1, id_28, id_29, id_30;
  assign id_6 = 1;
  assign #(id_11) id_25 = 1 - id_25;
  wire id_31;
  id_32(
      .id_0(id_29),
      .id_1(""),
      .id_2(1),
      .id_3(id_15),
      .id_4(1),
      .id_5(id_27),
      .id_6(id_21),
      .id_7(id_27),
      .id_8({1, id_2})
  ); id_33(
      .id_0(!id_12),
      .id_1(id_14),
      .id_2(1),
      .id_3(id_5++),
      .id_4(1),
      .id_5(1'b0),
      .id_6(id_17),
      .id_7(1),
      .id_8(1'b0),
      .id_9(""),
      .id_10(id_27 - ~id_25),
      .id_11(1),
      .id_12(~id_16),
      .id_13(1),
      .id_14(id_10),
      .id_15(""),
      .id_16(id_31),
      .id_17(1),
      .id_18(id_17)
  );
  module_0 modCall_1 ();
endmodule
