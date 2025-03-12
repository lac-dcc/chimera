// Seed: 4268448127
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout logic [7:0] id_13;
  output tri id_12;
  input wire id_11;
  input logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_13[1] = 1'b0 + id_10[-1];
  assign id_12 = 1;
  id_16 :
  assert property (@(posedge -1) 1 ==? -1)
  else $unsigned(0);
  ;
endmodule
module module_1 #(
    parameter id_10 = 32'd81
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
    _id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout logic [7:0] id_12;
  inout wire id_11;
  input wire _id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_11,
      id_5,
      id_4,
      id_9,
      id_13,
      id_12,
      id_1,
      id_11,
      id_12,
      id_7,
      id_13
  );
  wire id_14;
  wire id_15;
endmodule
