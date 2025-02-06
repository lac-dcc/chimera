// Seed: 1276814958
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
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_16;
  assign module_1.id_6 = 0;
  wire id_17;
  wire id_18;
  wire id_19;
  wire id_20, id_21;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3;
  logic [7:0] id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_1
  );
  id_5(
      .id_0(1),
      .id_1(-1'b0),
      .id_2(1),
      .id_3(id_3),
      .id_4(-1),
      .id_5($realtime),
      .id_6($realtime),
      .id_7($realtime),
      .id_8(id_1),
      .id_9(1),
      .id_10(id_4[$realtime]),
      .id_11()
  ); specify
    $width(negedge id_6, $realtime, -1'b0 == id_3, id_7);
  endspecify
endmodule
