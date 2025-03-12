// Seed: 127122511
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
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd70,
    parameter id_11 = 32'd71,
    parameter id_3  = 32'd66
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    _id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output reg id_13;
  input wire id_12;
  inout wire _id_11;
  input wire _id_10;
  input wire id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_12,
      id_9,
      id_4,
      id_14,
      id_6
  );
  input logic [7:0] id_1;
  always @(negedge -1) begin : LABEL_0
    id_13 <= id_8[(id_11) : 1*id_10];
    id_13 <= id_1[id_3];
  end
endmodule
