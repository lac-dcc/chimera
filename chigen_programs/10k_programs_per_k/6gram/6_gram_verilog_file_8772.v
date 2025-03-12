// Seed: 1351971259
module module_0 #(
    parameter id_3 = 32'd35,
    parameter id_7 = 32'd93,
    parameter id_8 = 32'd18,
    parameter id_9 = 32'd28
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8
);
  input wire _id_8;
  input wire _id_7;
  output wire id_6;
  output wire id_5;
  assign module_1.id_13 = 0;
  output wire id_4;
  output wire _id_3;
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = -1;
  wire  [id_7 : 1] _id_9;
  logic [id_3 : 1] id_10 [id_9 : id_8] = id_10;
  assign id_10 = id_1;
endmodule
module module_1 #(
    parameter id_1  = 32'd64,
    parameter id_13 = 32'd35,
    parameter id_2  = 32'd38,
    parameter id_3  = 32'd23,
    parameter id_6  = 32'd31,
    parameter id_8  = 32'd52
) (
    _id_1,
    _id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  input wire _id_2;
  input wire _id_1;
  wire [id_3 : id_2] _id_6;
  parameter id_7 = 1;
  parameter id_8 = id_7;
  wire id_9;
  struct packed {logic [id_1 : id_6] id_10;} id_11, id_12;
  wire _id_13 = 1'b0;
  wire [1 'd0 : id_8] id_14;
  assign id_11.id_10[id_13] = 1;
  wire id_15;
  module_0 modCall_1 (
      id_12,
      id_11.id_10,
      id_8,
      id_9,
      id_7,
      id_11,
      id_8,
      id_8
  );
  supply0 [1 : (  id_1  )] id_16;
  assign id_16 = id_15 ? -1 : id_11.id_10;
  logic [-1 : -1] id_17;
endmodule
