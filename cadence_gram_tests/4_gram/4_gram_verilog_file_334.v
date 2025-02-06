// Seed: 2853288837
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
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
  assign id_9  = (-1 == $realtime);
  assign id_12 = id_7;
  id_14(
      .id_0(-1), .id_1(1), .id_2($realtime), .id_3(id_4), .id_4(id_9), .id_5(id_8)
  );
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
    id_13
);
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge -1) id_6 <= id_1;
  wire id_14;
  id_15(
      .id_0(id_10), .id_1(-1'b0), .id_2($realtime)
  );
  module_0 modCall_1 (
      id_5,
      id_12,
      id_4,
      id_4,
      id_9,
      id_4,
      id_7,
      id_4,
      id_10,
      id_13,
      id_14
  );
  wire id_16;
  wire id_17;
  assign id_2 = id_8;
endmodule
