// Seed: 3434246598
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
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
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_8;
  logic [7:0] id_9;
  wire id_10;
  id_11(
      .id_0(-1), .id_1($realtime)
  );
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_7,
      id_7,
      id_10,
      id_2,
      id_6,
      id_10,
      id_2,
      id_10
  );
  wire id_12;
  id_13(
      .id_0(id_9[$realtime]),
      .id_1(id_4),
      .id_2(id_8),
      .id_3(id_12),
      .id_4(1),
      .id_5(id_8[|$realtime])
  );
endmodule
