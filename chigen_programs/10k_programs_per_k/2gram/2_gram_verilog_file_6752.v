// Seed: 2539036135
module module_0 #(
    parameter id_10 = 32'd38
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
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  output wire id_15;
  inout logic [7:0] id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire _id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_5 = 32'd62,
    parameter id_8 = 32'd25
) (
    input  uwire id_0,
    output tri1  id_1,
    input  tri1  _id_2,
    output wor   id_3
);
  logic [-1 : 1] _id_5;
  logic [7:0][1 'b0 : { 'b0 ,  id_2  +  id_2  }] id_6;
  assign id_6 = id_5;
  assign id_1 = id_6;
  wire [1 : -1] id_7;
  assign id_6[id_5] = id_2;
  wire _id_8;
  assign id_3 = -1'h0 != id_0 ? 1 && id_8 : 1'b0;
  logic id_9;
  assign id_8 = id_0;
  logic [id_8 : id_8] id_10;
  ;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15, id_16;
  module_0 modCall_1 (
      id_15,
      id_6,
      id_12,
      id_9,
      id_9,
      id_9,
      id_13,
      id_13,
      id_16,
      id_8,
      id_10,
      id_15,
      id_16,
      id_6,
      id_11,
      id_16
  );
  parameter ["" : id_2] id_17 = (-1);
endmodule
