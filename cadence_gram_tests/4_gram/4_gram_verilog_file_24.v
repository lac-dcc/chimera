// Seed: 1326835009
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
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_17;
  assign id_12 = -1'b0 ? $realtime : id_4;
  assign id_5  = id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_9(
      .id_0($realtime), .id_1(1), .id_2($realtime), .id_3(1'b0), .id_4(id_1 | id_5[$realtime])
  );
  genvar id_10;
  xor primCall (id_4, id_3, id_7, id_6, id_8, id_1, id_5, id_9, id_10);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_10,
      id_10,
      id_6,
      id_6,
      id_7,
      id_10,
      id_10,
      id_10,
      id_10,
      id_1,
      id_6,
      id_10,
      id_6,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
