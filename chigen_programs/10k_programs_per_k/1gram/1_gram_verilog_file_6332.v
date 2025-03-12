// Seed: 111960708
module module_0 #(
    parameter id_4 = 32'd56,
    parameter id_5 = 32'd79,
    parameter id_9 = 32'd18
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic _id_4 = -1;
  logic _id_5;
  ;
  logic [7:0] id_6, id_7, id_8;
  wire [id_4 : id_5] _id_9;
  always begin : LABEL_0
    @(*) if (1) id_7[id_9] = -1;
  end
  assign id_3 = id_4;
endmodule
module module_1 #(
    parameter id_11 = 32'd99,
    parameter id_2  = 32'd32
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
    _id_11,
    id_12,
    id_13[id_11 :-1'b0],
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output reg id_17;
  output wire id_16;
  output wire id_15;
  module_0 modCall_1 (
      id_22,
      id_22,
      id_15
  );
  assign modCall_1._id_4 = 0;
  output wire id_14;
  input logic [7:0] id_13;
  input wire id_12;
  output wire _id_11;
  output reg id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire _id_2;
  input wire id_1;
  assign id_7 = id_20;
  wire [1 : id_2] id_23, id_24;
  for (id_25 = id_3; id_9; id_17 = id_6)
  id_26 :
  assert property (@(-1 or id_1 == id_9) id_25) id_10 <= id_12;
endmodule
