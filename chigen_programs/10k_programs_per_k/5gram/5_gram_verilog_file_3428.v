// Seed: 1510180294
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
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd82
) (
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
    _id_13,
    id_14,
    id_15
);
  output uwire id_15;
  output wire id_14;
  input wire _id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input logic [7:0] id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  inout reg id_1;
  wire id_16;
  assign id_4[~id_13] = id_6;
  assign id_15 = id_4 / id_5[1'b0];
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_6,
      id_10,
      id_12,
      id_7,
      id_8,
      id_10,
      id_6,
      id_10,
      id_11
  );
  initial id_1 <= -1;
endmodule
