// Seed: 3682899739
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  assign id_6 = $realtime;
  id_9(
      .id_0($realtime == id_7), .id_1()
  );
  wire id_10;
  assign id_4 = -1'b0;
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_13(
      .id_0($realtime),
      .id_1(id_6),
      .id_2(-1),
      .id_3(id_1),
      .id_4($realtime),
      .id_5(id_12[$realtime]),
      .id_6(-1),
      .id_7(id_7),
      .id_8(-1),
      .id_9()
  );
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9,
      id_8,
      id_9,
      id_6
  );
endmodule
