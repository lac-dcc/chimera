// Seed: 1300337137
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
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_13 = 32'd92,
    parameter id_14 = 32'd15,
    parameter id_4  = 32'd27,
    parameter id_7  = 32'd4
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13
);
  input wire _id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire _id_7;
  inout wire id_6;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_9,
      id_1,
      id_5,
      id_6,
      id_11,
      id_11,
      id_6,
      id_8,
      id_1,
      id_12,
      id_10,
      id_11,
      id_12
  );
  output wire id_5;
  output wire _id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_11 = id_8;
  wire  _id_14;
  wire  id_15;
  logic id_16;
  ;
  wire [-1 : id_13] id_17;
  wire id_18[id_4  /  1 : id_7];
  ;
  assign id_15 = id_1;
  always_latch @(negedge id_12 or posedge -1) begin : LABEL_0
    $unsigned(32);
    ;
  end
  assign id_16[id_14-1] = -1;
endmodule
