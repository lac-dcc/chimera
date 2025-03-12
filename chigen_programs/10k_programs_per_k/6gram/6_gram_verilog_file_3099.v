// Seed: 2637794901
module module_0 #(
    parameter id_20 = 32'd79
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20,
    id_21
);
  inout wire id_21;
  inout wire _id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  output uwire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire  id_22;
  logic id_23;
  ;
  wire [id_20 : id_20] id_24;
  assign id_16 = -1;
endmodule
module module_1 #(
    parameter id_7 = 32'd97,
    parameter id_8 = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire _id_8;
  inout wire _id_7;
  inout wire id_6;
  output wire id_5;
  output reg id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_10 = id_3;
  logic [7:0] id_11;
  always @(id_7 or posedge id_11[{1, id_8} :-1], 1'd0) force id_7 = id_3 - 'h0;
  bit id_12, id_13, id_14, id_15, id_16, id_17;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_3,
      id_3,
      id_6,
      id_3,
      id_6,
      id_3,
      id_5,
      id_3,
      id_3,
      id_10,
      id_3,
      id_3,
      id_3,
      id_7,
      id_6
  );
  assign modCall_1.id_16 = 0;
  always begin : LABEL_0
    if (1) begin : LABEL_1
      id_4  <= -1 !=? id_2[id_7];
      id_13 <= 1'b0;
      @(posedge id_12);
      wait (-1 - 1);
    end
  end
endmodule
