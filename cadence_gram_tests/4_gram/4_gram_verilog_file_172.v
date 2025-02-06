// Seed: 359103208
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
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_19(
      .id_0(id_6)
  );
  assign id_9 = -1;
  wire id_20;
  wire id_21;
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  wire id_13;
  id_14(
      .id_0(id_9), .id_1(1), .id_2(id_8), .id_3(id_4), .id_4(1), .id_5(), .id_6(-1), .id_7()
  );
  module_0 modCall_1 (
      id_8,
      id_11,
      id_13,
      id_7,
      id_5,
      id_8,
      id_12,
      id_8,
      id_12,
      id_3,
      id_11,
      id_3,
      id_12,
      id_3,
      id_12,
      id_4,
      id_12,
      id_3
  );
  assign id_8 = -1 && $realtime;
  wire \id_15 ;
  id_16(
      .id_0($realtime),
      .id_1((id_11)),
      .id_2(-1),
      .id_3(1),
      .id_4(),
      .id_5(),
      .sum(id_13),
      .id_6(id_1),
      .id_7(!id_10),
      .id_8(id_10),
      .id_9(id_12),
      .id_10(1)
  ); specify
  endspecify
endmodule
