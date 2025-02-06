// Seed: 874757044
module module_0 (
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
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  id_8(
      .id_0(id_1), .id_1($realtime), .id_2((id_2)), .id_3($realtime), .id_4()
  ); specify
    (id_9 - => id_10) = (id_7  : $realtime : id_5, -1  : id_3 | 1  : $realtime);
  endspecify
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  tri0 id_17 = $realtime;
  wire id_18;
  id_19(
      .id_0($realtime), .id_1($realtime), .id_2(-1), .id_3(), .id_4(id_3)
  );
  wire id_20;
  module_0 modCall_1 (
      id_20,
      id_12,
      id_20,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_9 = 0;
  wire id_21;
endmodule
