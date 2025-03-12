// Seed: 1502051351
module module_0 #(
    parameter id_8 = 32'd54
) (
    id_1,
    id_2,
    id_3[-1 :-1],
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  localparam id_7 = 1;
  parameter id_8 = id_7;
  wire [-1 : id_8] id_9, id_10, id_11;
endmodule
program module_1 #(
    parameter id_2 = 32'd88,
    parameter id_6 = 32'd38,
    parameter id_7 = 32'd66
) (
    id_1,
    _id_2,
    id_3[id_2 :-1],
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10[id_7 : 1],
    id_11,
    id_12[1 :-1]
);
  input logic [7:0] id_12;
  output wire id_11;
  input logic [7:0] id_10;
  output wire id_9;
  output tri0 id_8;
  input wire _id_7;
  input wire _id_6;
  output logic [7:0] id_5;
  input wire id_4;
  input logic [7:0] id_3;
  output wire _id_2;
  inout logic [7:0] id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_10,
      id_9,
      id_4,
      id_9
  );
  wand [1 : 1] id_13 = -1;
  assign id_5 = id_12;
  reg id_14 = id_10, id_15 = -1 == id_4 > -1'b0, id_16 = id_15;
  always id_16 = id_3;
  assign id_8 = -1;
  initial $clog2(64);
  ;
endprogram
