// Seed: 1583284319
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
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
    id_20
);
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_20;
  xnor primCall (
      id_16, id_14, id_10, id_2, id_6, id_9, id_19, id_12, id_15, id_3, id_20, id_8, id_21, id_7
  );
  wire id_21 = 1;
  assign id_10 = 1'b0;
  assign id_14 = id_9;
  module_0 modCall_1 (
      id_21,
      id_10
  );
  wire id_22;
  id_23(
      .id_0(id_12),
      .id_1(0),
      .id_2(id_20),
      .id_3(1),
      .id_4(1'h0 < id_12++),
      .id_5(id_17[1] == 1'd0),
      .id_6(1),
      .id_7({1{1 == id_16[1]}}),
      .id_8(id_19[1]),
      .id_9(id_17),
      .id_10(id_2),
      .id_11(1 - 1'b0),
      .id_12(),
      .id_13(),
      .id_14(1),
      .id_15(id_19(id_17)),
      .id_16(id_9[1]),
      .id_17(),
      .id_18(1'b0),
      .id_19(1'b0),
      .id_20(1),
      .id_21((1 + id_7) - id_12)
  );
endmodule
