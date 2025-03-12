// Seed: 4123945935
module module_0 #(
    parameter id_6 = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire ["" : id_6] id_7;
  wire id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd56,
    parameter id_2 = 32'd73,
    parameter id_8 = 32'd62
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  inout wire _id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire _id_2;
  inout wire _id_1;
  logic [(  id_1  ) : -1] id_12;
  logic id_13 = 1'h0;
  assign id_10#(.id_8(1)) [id_1+:id_1] = 1 - id_2;
  parameter [-1 : id_1] id_14 = 1;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_9,
      id_11,
      id_14,
      id_8
  );
  wire id_15;
  wire id_16;
  and primCall (id_5, id_13, id_14, id_9, id_12, id_8, id_3, id_11, id_10);
  timeprecision 1ps;
  logic [id_2 : 1  -  id_8] id_17 = id_13;
endmodule
