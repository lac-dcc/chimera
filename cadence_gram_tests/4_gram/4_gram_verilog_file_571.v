// Seed: 2837821493
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
    id_31
);
  inout wire id_31;
  input wire id_30;
  input wire id_29;
  input wire id_28;
  input wire id_27;
  output wire id_26;
  input wire id_25;
  input wire id_24;
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_32 = 1;
  wire id_33;
  wire id_34;
  id_35(
      .id_0(id_30), .id_1(id_33), .id_2($realtime), .id_3()
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_4[$realtime];
  wire id_7, id_8, id_9, id_10;
  id_11(
      .id_0(id_2), .id_1($realtime)
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
      id_9,
      id_8,
      id_3,
      id_8,
      id_9,
      id_9,
      id_8,
      id_9,
      id_7,
      id_7,
      id_8,
      id_10,
      id_8,
      id_9,
      id_9,
      id_3,
      id_6,
      id_10,
      id_5,
      id_9,
      id_3,
      id_5,
      id_9
  );
  wire id_12;
  wire id_13;
  assign id_1 = -1;
endmodule
