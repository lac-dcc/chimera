// Seed: 1544719274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = id_2;
  initial begin : LABEL_0
    `define pp_5 0
  end
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
    id_21
);
  output wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wor id_22, id_23;
  module_0 modCall_1 (
      id_21,
      id_23,
      id_2,
      id_3
  );
  always begin : LABEL_0
    id_14 = 1'b0 == id_16;
  end
  wand id_24, id_25 = 1;
  assign id_25 = id_22;
  wire id_26, id_27;
  id_28(
      .id_0(id_24),
      .id_1(id_7),
      .id_2(1),
      .id_3({id_12{{!1{1}} - id_6[1]}}),
      .id_4(id_23),
      .id_5(),
      .id_6(id_24),
      .id_7(id_13),
      .id_8(id_27),
      .id_9(id_7 && id_14 & (id_16))
  );
  assign id_12 = id_14;
  assign id_21 = id_25;
endmodule
