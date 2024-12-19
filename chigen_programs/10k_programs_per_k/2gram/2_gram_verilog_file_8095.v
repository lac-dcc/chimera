// Seed: 2289853081
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
    id_20
);
  input wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_21(
      .id_0(),
      .id_1(id_20),
      .id_2(1),
      .id_3(id_20),
      .id_4(id_8),
      .id_5(1),
      .id_6(id_4),
      .id_7(id_15.id_6()),
      .id_8(1),
      .id_9(id_3),
      .id_10(id_12)
  );
  wire id_22;
  wire id_23 = id_15, id_24, id_25, id_26;
  always @(negedge id_16 | 1);
  assign id_12 = 1'd0;
  wire id_27;
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
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_18,
      id_2,
      id_2,
      id_3,
      id_18,
      id_11,
      id_10,
      id_18,
      id_5,
      id_5,
      id_10,
      id_13,
      id_11,
      id_10,
      id_3,
      id_18,
      id_8,
      id_4
  );
  always id_1[1] = id_6;
  xor primCall (id_13, id_18, id_9, id_16, id_6, id_3, id_5, id_10, id_11);
endmodule
