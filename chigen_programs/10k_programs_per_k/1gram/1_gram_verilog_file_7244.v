// Seed: 441506724
module module_0 #(
    parameter id_1 = 32'd62,
    parameter id_4 = 32'd83
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input logic [7:0] id_5;
  inout wire _id_4;
  output uwire id_3;
  input logic [7:0] id_2;
  inout wire _id_1;
  wire [1 : -1] id_6, id_7[1 'd0 : -1 'b0];
  logic [7:0][id_4 : 1  ?  1 : -1] id_8;
  wire id_9;
  parameter integer id_10 = -1'h0;
  assign id_3 = 1;
  genvar id_11;
  assign id_8[id_1] = id_11;
  assign module_1.id_1 = 0;
  wire id_12, id_13, id_14, id_15;
  final $clog2(39);
  ;
endmodule
module module_1 #(
    parameter id_5 = 32'd83
) (
    id_1,
    id_2[1 : 1],
    id_3,
    id_4,
    _id_5[-1 : ~id_5],
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout logic [7:0] _id_5;
  inout wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  inout reg id_1;
  assign id_5 = id_3;
  final id_1 <= #1 1'h0;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_6,
      id_5,
      id_2
  );
endmodule
