// Seed: 2555426946
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd90,
    parameter id_3 = 32'd5,
    parameter id_4 = 32'd39,
    parameter id_9 = 32'd54
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire _id_9;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_6,
      id_1,
      id_12,
      id_5,
      id_6
  );
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire _id_4;
  inout wire _id_3;
  input wire _id_2;
  input wire id_1;
  logic [1 'd0 : id_3] id_13;
  ;
  assign id_13 = id_4;
  assign id_5  = id_13;
  logic [-1 : id_4] id_14;
  wire id_15;
  id_16 :
  assert property (@(-1) 1)
  else;
  assign id_8 = id_3;
  always @(1 or posedge id_11) begin : LABEL_0
    id_13 = id_16;
  end
  assign id_13 = (id_2) & id_11;
  assign id_14 = ~1'd0;
  logic [id_2  +  1 : id_9] id_17;
endmodule
