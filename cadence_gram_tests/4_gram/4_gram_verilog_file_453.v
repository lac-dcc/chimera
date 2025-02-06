// Seed: 2702603295
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
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1 ? id_8 : (-1) | $realtime;
  specify
    $width(negedge id_15, $realtime, id_4, id_16);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  logic [7:0] id_6;
  supply1 id_7;
  wire id_8, id_9, id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11,
      id_8,
      id_9,
      id_3
  );
  assign id_2 = id_9;
  wire id_13;
  wire id_14;
  id_15(
      .id_0($realtime),
      .id_1(),
      .id_2($realtime),
      .id_3($realtime),
      .id_4($realtime),
      .id_5(-1),
      .id_6(),
      .id_7(1),
      .id_8(1),
      .id_9($realtime)
  ); id_16(
      .id_0(1),
      .id_1(id_6[$realtime]),
      .id_2(-1),
      .id_3(-1),
      .id_4(-1),
      .id_5($realtime),
      .id_6(-1 - -1'b0)
  );
  assign id_15 = id_4;
  wire id_17;
  assign id_7 = -1;
  wire id_18;
  wire id_19;
endmodule
