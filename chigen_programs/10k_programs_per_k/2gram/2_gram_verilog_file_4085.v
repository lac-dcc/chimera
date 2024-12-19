// Seed: 1067422752
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
    id_31,
    id_32
);
  input wire id_32;
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  inout wire id_28;
  input wire id_27;
  input wire id_26;
  inout wire id_25;
  inout wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_33 = id_19;
  wire id_34;
  id_35 :
  assert property (@(posedge id_32 or id_28 == 1) id_18)
  else;
  supply0 id_36 = 1'h0;
  id_37(
      .id_0(1),
      .id_1(id_20),
      .id_2(id_13),
      .id_3(id_23),
      .id_4(1),
      .id_5(id_24),
      .id_6(id_5),
      .id_7(id_31),
      .id_8(1),
      .id_9(1)
  );
  assign #id_38 id_21 = id_27;
  assign id_19 = id_34;
  assign id_30 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(1), .id_1(1), .id_2(1'b0 + 1'b0), .id_3(1'd0), .id_4(id_9)
  );
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_6,
      id_3,
      id_4,
      id_9,
      id_3,
      id_7,
      id_4,
      id_3,
      id_1,
      id_9,
      id_9,
      id_3,
      id_4,
      id_10,
      id_5,
      id_9,
      id_3,
      id_1,
      id_3,
      id_1
  );
  assign id_6 = id_3;
  wire id_12;
  rtran (1'b0, id_2, 1, 1, 1, 1, 1 & id_6, 1);
endmodule
