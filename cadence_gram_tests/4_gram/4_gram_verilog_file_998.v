// Seed: 636604070
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_15;
  id_16(
      $realtime,
      (id_8 | {$realtime, -1'b0} | $realtime | id_5 | $realtime | -1 | id_13 | $realtime | id_13)
  );
  assign id_14 = id_9[-1];
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
    id_16
);
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_17;
  id_18(
      .id_0(-1), .id_1((-1) && 1 == -1)
  );
  module_0 modCall_1 (
      id_16,
      id_17,
      id_4,
      id_4,
      id_2,
      id_17,
      id_7,
      id_7,
      id_8,
      id_17,
      id_2,
      id_16,
      id_16,
      id_13
  );
  assign id_4 = 1;
  id_19(
      .id_0(id_4),
      .id_1(-1),
      .id_2(id_8[$realtime]),
      .id_3(),
      .id_4(-1'b0),
      .id_5(-1),
      .id_6(id_13),
      .id_7(),
      .id_8($realtime),
      .id_9(-1),
      .id_10(id_16),
      .id_11(),
      .id_12(-1),
      .id_13(($realtime == id_15[-1])),
      .id_14()
  );
endmodule
