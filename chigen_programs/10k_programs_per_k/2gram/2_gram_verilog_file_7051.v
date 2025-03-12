// Seed: 334767063
module module_0 ();
  logic id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd8
) (
    id_1,
    _id_2,
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
  inout wire id_12;
  output tri0 id_11;
  inout wire id_10;
  input logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout reg id_3;
  input wire _id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  tri id_13;
  assign id_13 = 1;
  wire id_14;
  assign id_11 = 1;
  logic id_15;
  always begin : LABEL_0
    id_3 <= id_15;
  end
  id_16 :
  assert property (@(-1 or posedge id_9[1'h0||-1||id_2]) -1)
  else;
endmodule
