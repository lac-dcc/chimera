// Seed: 4201930317
module module_0 #(
    parameter id_2 = 32'd59
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  localparam id_4 = -1;
  assign module_1.id_7 = 0;
  real [-1 : id_2] id_5, id_6;
  logic id_7 = id_4 || id_3;
  logic id_8;
endmodule
module module_1 #(
    parameter id_10 = 32'd4,
    parameter id_2  = 32'd13,
    parameter id_6  = 32'd61,
    parameter id_7  = 32'd54
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    _id_10
);
  inout wire _id_10;
  inout wire id_9;
  input wire id_8;
  output wire _id_7;
  input wire _id_6;
  input wire id_5;
  input logic [7:0] id_4;
  inout reg id_3;
  inout wire _id_2;
  output wire id_1;
  always id_3 <= id_4[id_10 : id_6];
  assign id_2 = (id_8);
  module_0 modCall_1 (
      id_9,
      id_2,
      id_9
  );
  logic [id_2 : id_7] id_11;
endmodule
