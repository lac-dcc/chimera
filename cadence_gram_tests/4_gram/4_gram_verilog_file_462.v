// Seed: 2446308542
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
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  id_17(
      .id_0($realtime), .id_1(!id_5), .id_2(id_13)
  );
  wand id_18 = $realtime;
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
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_7;
  wire id_8;
  assign id_1[-1] = -1;
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_8,
      id_9,
      id_5,
      id_4,
      id_7,
      id_7,
      id_4,
      id_7,
      id_9,
      id_9,
      id_6,
      id_7,
      id_2
  );
  id_10(
      .id_0(id_3), .id_1(id_2), .id_2(id_1)
  );
  wire id_11;
  assign id_6 = -1;
endmodule
