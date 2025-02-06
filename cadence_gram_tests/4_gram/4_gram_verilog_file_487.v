// Seed: 3332185348
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
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = id_7;
  assign id_9 = id_3;
  assign id_1 = -1;
  wire id_15;
  wire id_16;
  id_17(
      id_13, id_12, id_4, -1'b0
  ); id_18(
      .id_0(id_12), .id_1($realtime)
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
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  id_9(
      .id_0(-1),
      .id_1(id_7),
      .id_2(-1),
      .id_3(-1 == id_10),
      .id_4(id_6 !== 1),
      .id_5(-1'b0),
      .id_6(id_2),
      .id_7($realtime),
      .id_8(id_10),
      .id_9(id_4),
      .id_10(-1),
      .id_11(id_6),
      .id_12(id_5),
      .id_13(-1'b0),
      .id_14(id_8),
      .id_15($realtime),
      .id_16(),
      .id_17(id_3[$realtime])
  );
  uwire id_11 = $realtime;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_11,
      id_5,
      id_6,
      id_7,
      id_11,
      id_11,
      id_11,
      id_11,
      id_5,
      id_6,
      id_11
  );
endmodule
