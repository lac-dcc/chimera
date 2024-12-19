// Seed: 1512938870
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
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_19;
  assign id_4 = id_1 ^ 1'b0;
  always id_10 <= "" & 1;
  wand id_20, id_21;
  wire id_22, id_23;
  wire id_24;
  assign id_20 = 1;
  always id_11 <= #1 1;
  assign id_17 = 1;
  assign id_20 = 1;
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
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always id_1 <= id_3;
  always_latch id_6 = 1;
  id_7(
      .id_0(id_6), .id_1(id_2 - id_2), .id_2(id_5)
  );
  wand id_8 = 1, id_9 = 1;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_6,
      id_8,
      id_9,
      id_4,
      id_1,
      id_1,
      id_9,
      id_8,
      id_2,
      id_4,
      id_8,
      id_8,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
