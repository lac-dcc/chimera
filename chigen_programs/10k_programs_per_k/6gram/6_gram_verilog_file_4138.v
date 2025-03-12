// Seed: 3778165771
module module_0 #(
    parameter id_8 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  wire _id_8 = id_3#(.id_4(-1'b0)) [id_8];
  tri ["" : -1 'b0] id_9 = id_6;
  assign id_9 = 1'b0 == id_4;
endmodule
module module_1 #(
    parameter id_7 = 32'd42
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  inout wire _id_7;
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_9,
      id_6,
      id_4,
      id_5,
      id_5
  );
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire [1 'b0 : -1] id_12;
  wire id_13;
  assign id_9[id_7] = id_4;
  wire [id_7 : 1 'b0] id_14;
  logic [-1 : 1] id_15 = id_3;
endmodule
