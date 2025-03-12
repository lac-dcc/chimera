// Seed: 2385708779
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
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  output tri id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_15 = 1;
endmodule
module module_0 #(
    parameter id_16 = 32'd12,
    parameter id_4  = 32'd26,
    parameter id_9  = 32'd86
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    module_1,
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output logic [7:0] id_11;
  output wire id_10;
  inout wire _id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire _id_4;
  input wire id_3;
  input wire id_2;
  input logic [7:0] id_1;
  wire [1 : id_9] _id_16 = (id_16);
  assign id_11[{id_16{1}}>=1] = id_1[-1 : id_4!=id_9];
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_10,
      id_6,
      id_3,
      id_3,
      id_6,
      id_6,
      id_6,
      id_6,
      id_10,
      id_6,
      id_6,
      id_10,
      id_6,
      id_5
  );
  assign id_16 = id_4;
endmodule
