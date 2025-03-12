// Seed: 2776480943
module module_0 #(
    parameter id_13 = 32'd25
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire [-1 : -1] _id_13;
  wire id_14;
  ;
  wire ["" : id_13] id_15;
endmodule
module module_1 #(
    parameter id_0 = 32'd0,
    parameter id_1 = 32'd71
) (
    input  wor  _id_0,
    input  wand _id_1,
    output tri  id_2,
    input  wor  id_3
);
  logic [id_1 : 1] id_5;
  bit [id_0 : id_0] id_6;
  wire id_7;
  wire id_8;
  always_latch @(id_1 or id_7) begin : LABEL_0
    if (~({-1, 1} == 1) !=? 1) begin : LABEL_1
      if (1) id_6 <= id_6;
    end
  end
  timeprecision 1ps;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_5,
      id_8,
      id_5,
      id_5,
      id_7,
      id_7,
      id_5,
      id_8,
      id_8,
      id_5
  );
endmodule
