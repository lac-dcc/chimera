// Seed: 1508476906
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
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  id_15(
      $realtime, id_9 | 1, -1'b0
  );
  wire id_16;
  wire id_17, id_18;
  id_19(
      .id_0($realtime), .id_1(!id_1), .id_2(id_2), .id_3(1), .id_4()
  );
  assign id_18 = id_4;
  wire id_20;
  wand id_21 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_3,
      id_2,
      id_4,
      id_4
  );
  assign id_2 = id_1[-1] ? -1 : $realtime;
  wire id_6;
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
