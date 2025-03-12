// Seed: 2990251613
module module_0 #(
    parameter id_7 = 32'd87
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire _id_7;
  inout logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_6[id_7] = id_13;
  logic id_14;
  wire  id_15;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd29,
    parameter id_10 = 32'd2,
    parameter id_2  = 32'd22,
    parameter id_6  = 32'd58,
    parameter id_7  = 32'd69
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  output wire _id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  input wire _id_1;
  logic [1 : id_2] _id_7, id_8;
  assign id_6 = id_3;
  assign id_8 = -1;
  logic [id_1 : 1  +  1] id_9 = 1, _id_10;
  assign id_3[id_10] = id_7;
  assign id_10 = id_5[1];
  module_0 modCall_1 (
      id_9,
      id_8,
      id_9,
      id_4,
      id_8,
      id_5,
      id_10,
      id_8,
      id_8,
      id_8,
      id_9,
      id_4,
      id_9
  );
  assign id_4 = id_3 ? id_8 : id_3;
  wire  [id_7 : id_7] id_11;
  logic [  -1 : id_6] id_12;
endmodule
