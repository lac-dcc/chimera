// Seed: 3072554382
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
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  id_18(
      .id_0($realtime), .id_1(id_5), .id_2(id_12), .id_3($realtime), .id_4(1)
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
    id_24
);
  input wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1) id_19 = id_5;
  assign id_1[-1] = 1;
  wire id_25;
  id_26(
      .id_0(id_21[-1]), .id_1(-1), .id_2(id_10)
  );
  wire id_27;
  module_0 modCall_1 (
      id_19,
      id_12,
      id_6,
      id_12,
      id_27,
      id_18,
      id_17,
      id_25,
      id_16,
      id_7,
      id_18,
      id_10,
      id_18,
      id_25,
      id_13,
      id_25,
      id_6
  );
  assign id_16 = $realtime ? $realtime : id_7;
  wire id_28;
  wire id_29;
  specify
    (id_30 + => id_31) = ($realtime : !id_11[$realtime] : 1, $realtime : $realtime : $realtime);
  endspecify
endmodule
