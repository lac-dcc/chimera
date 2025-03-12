// Seed: 4013016330
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  assign module_1.id_1 = 0;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_15;
  ;
  assign id_13 = id_4[-1 :-1];
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_3  = 32'd87
) (
    input  uwire id_0,
    output uwire id_1,
    output wire  id_2,
    input  uwire _id_3
);
  logic [7:0][-1 : id_3] id_5;
  logic id_6, id_7;
  assign id_2 = id_5;
  bit id_8;
  logic [-1 : $realtime] id_9;
  final begin : LABEL_0
    id_8 <= id_5#(.id_3(1));
  end
  logic [7:0] id_10;
  assign id_5[{1, -1-1'b0}] = 1'b0;
  logic _id_11;
  ;
  assign id_10[!id_11] = 1 ? id_11 : id_8;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_6,
      id_10,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_7,
      id_9,
      id_6,
      id_6,
      id_7
  );
  logic [1 : -1] id_12 = id_8;
endmodule
