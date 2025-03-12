// Seed: 1805808094
module module_0 #(
    parameter id_15 = 32'd20,
    parameter id_17 = 32'd84,
    parameter id_6  = 32'd8,
    parameter id_9  = 32'd34
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire _id_17;
  output wire id_16;
  input wire _id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire _id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire _id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [id_17  <<  -1 'b0 : id_6] id_21;
  wire  [ -1 'd0 <<  1 'd0 : id_9] id_22;
  wire [1 : id_15] id_23, id_24, id_25, id_26, id_27, id_28;
endmodule
module module_1 #(
    parameter id_1  = 32'd28,
    parameter id_12 = 32'd54,
    parameter id_8  = 32'd28
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout wire id_13;
  input wire _id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire _id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_2 = id_13;
  wire [id_1  &  id_12  -  id_8 : 1] id_15;
  assign id_8 = id_15;
  module_0 modCall_1 (
      id_14,
      id_5,
      id_6,
      id_15,
      id_2,
      id_8,
      id_13,
      id_15,
      id_8,
      id_2,
      id_5,
      id_10,
      id_6,
      id_2,
      id_8,
      id_15,
      id_8,
      id_9,
      id_7,
      id_2
  );
  logic [-1 : -1] id_16 = (id_5#(.id_6(1))) ^ -1, id_17, id_18;
  logic [id_1 : -1] id_19;
  ;
endmodule
