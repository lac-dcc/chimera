// Seed: 4133445010
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
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_8(
      .id_0(id_5),
      .id_1(id_4[$realtime]),
      .id_2($realtime),
      .id_3(-1'b0),
      .id_4(),
      .id_5(($realtime)),
      .id_6(id_6)
  );
  assign id_2 = $realtime;
  assign id_7 = $realtime;
  wire id_9;
  wand id_10;
  wire id_11;
  id_12(
      id_10, $realtime
  );
  module_0 modCall_1 (
      id_11,
      id_11,
      id_9,
      id_5,
      id_6,
      id_7,
      id_9,
      id_9,
      id_10,
      id_1,
      id_1,
      id_10,
      id_10,
      id_1
  );
  id_13(
      .id_0($realtime)
  );
endmodule
