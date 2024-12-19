// Seed: 3382800171
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
    id_17,
    id_18
);
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always_latch id_12 = id_14;
  wire id_19;
  always begin : LABEL_0
    id_15 <= id_14;
  end
  wire id_20;
  id_21(
      .id_0(1 / 1),
      .id_1(1),
      .id_2(id_13),
      .id_3(1),
      .id_4(1),
      .id_5(id_19.id_13),
      .id_6(id_8),
      .id_7({(id_1 ? 1 : 1), 1 * id_8})
  );
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
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31
);
  output wire id_31;
  output wire id_30;
  input wire id_29;
  output wire id_28;
  inout wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
  wire id_32;
  module_0 modCall_1 (
      id_4,
      id_32,
      id_11,
      id_3,
      id_9,
      id_5,
      id_15,
      id_16,
      id_3,
      id_13,
      id_11,
      id_21,
      id_26,
      id_21,
      id_21,
      id_18,
      id_4,
      id_27
  );
  assign id_16 = 1;
  initial
    if (id_24)
      if (1) begin : LABEL_0
        id_33(1'd0, id_31);
      end else #1;
  tri0 id_34, id_35;
  initial id_27 = id_34 !=? 1'h0 && 1;
  final id_21 <= 1;
  always $display(1, id_24, 1);
  wire id_36;
  wire id_37, id_38, id_39, id_40;
  genvar id_41, id_42;
endmodule
