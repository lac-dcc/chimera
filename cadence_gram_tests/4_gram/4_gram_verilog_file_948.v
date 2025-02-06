// Seed: 2577281785
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
    id_29
);
  input wire id_29;
  input wire id_28;
  input wire id_27;
  inout wire id_26;
  inout wire id_25;
  output wire id_24;
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_20;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_7;
  logic [7:0] id_8;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_7,
      id_5,
      id_7,
      id_7,
      id_4,
      id_4,
      id_1,
      id_6,
      id_7,
      id_7,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_7,
      id_5,
      id_4,
      id_1,
      id_5,
      id_1,
      id_3,
      id_7,
      id_3,
      id_1
  );
  assign id_2[$realtime&&$realtime] = id_8;
  nand primCall (id_1, id_2, id_3, id_7, id_8);
  wor id_9 = 1;
  id_10(
      $realtime, id_7, id_8[-1], -1, $realtime
  );
endmodule
