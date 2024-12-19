// Seed: 1593762728
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_12 = 1;
  supply0 id_18 = 1;
  wand id_19, id_20 = 1;
  wire id_21;
  wire id_22;
  tri0 id_23 = 1'b0;
  wire id_24;
  wor id_25;
  wire id_26;
  wire id_27;
  assign id_23 = id_1;
  tri0 id_28;
  id_29(
      .id_0(id_20),
      .id_1(id_14),
      .id_2(id_2),
      .id_3(id_25),
      .id_4(""),
      .id_5(1 == 1'b0),
      .id_6(id_7 + 1)
  );
  uwire id_30;
  generate
    id_31(
        .id_0(1),
        .id_1(),
        .id_2(id_27),
        .id_3(id_6),
        .id_4(id_28 + 1),
        .id_5(1),
        .id_6(id_19),
        .id_7(~id_25),
        .id_8(1),
        .id_9(1),
        .id_10(id_22),
        .id_11(1 - id_30),
        .id_12(id_29)
    );
  endgenerate
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
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_10;
  always disable id_11;
  assign id_2 = 1;
  id_12(
      .id_0(id_4), .id_1((1)), .id_2(id_8), .id_3(""), .id_4(1 - id_6), .id_5(1)
  );
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5,
      id_7,
      id_10,
      id_1,
      id_1,
      id_10,
      id_5,
      id_7,
      id_11,
      id_1,
      id_5
  );
  id_13(
      .id_0(1'd0),
      .id_1(1),
      .id_2("" | 1 | 1),
      .id_3(id_9),
      .id_4(1),
      .id_5(1),
      .id_6(1 - id_7),
      .id_7(1),
      .id_8(),
      .id_9(1),
      .id_10(id_4),
      .id_11(0),
      .id_12(1'b0),
      .id_13(id_10),
      .id_14(id_2),
      .id_15(id_7)
  );
  xnor primCall (id_5, id_12, id_11, id_10, id_9, id_2, id_8, id_7);
endmodule
