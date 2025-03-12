// Seed: 3785764602
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
    id_15,
    id_16
);
  inout wor id_16;
  inout logic [7:0] id_15;
  assign module_1.id_2 = 0;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_16 = id_15[-1+1] !=? 1'b0;
endmodule
module module_1 #(
    parameter id_0 = 32'd76,
    parameter id_1 = 32'd78,
    parameter id_2 = 32'd88,
    parameter id_4 = 32'd84
) (
    output tri0  _id_0,
    input  wor   _id_1,
    input  uwire _id_2
);
  localparam id_4 = 1;
  logic [-1  ==  -1 : -1 'h0] id_5[id_0 : 1] = id_5;
  wire [id_2 : id_1] id_6;
  logic [id_0 : ""] id_7, id_8, id_9;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_6,
      id_7,
      id_6,
      id_7,
      id_8,
      id_8,
      id_6,
      id_9,
      id_9,
      id_7,
      id_6,
      id_7,
      id_5,
      id_8
  );
  assign id_7 = id_2;
  generate
    for (id_10 = 1 == id_8; |id_5[id_4] == 1; id_10 = {-1, 1}) begin : LABEL_0
      assign id_10 = id_4;
      logic [-1 : 1] id_11;
    end
  endgenerate
endmodule
