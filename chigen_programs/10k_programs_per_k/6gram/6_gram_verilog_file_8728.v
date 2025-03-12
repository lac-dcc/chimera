// Seed: 2166223036
module module_0 #(
    parameter id_11 = 32'd93,
    parameter id_13 = 32'd24
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
    _id_11,
    id_12,
    _id_13
);
  inout wire _id_13;
  input wire id_12;
  inout wire _id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire [id_13 : -1  +  id_11] id_14;
  wire [-1 'h0 : id_13] id_15;
endmodule
module module_1 #(
    parameter id_11 = 32'd85,
    parameter id_4  = 32'd22,
    parameter id_5  = 32'd99,
    parameter id_6  = 32'd40
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  output tri0 id_2;
  inout wire id_1;
  localparam id_5 = 1 ? -1 : 1 ? 1 : 1 ? 1 : 1, id_6 = 1, id_7 = 1;
  wire [id_4  -  id_5 : -1] id_8;
  logic [7:0][1 : id_6  ==  (  id_5  )] id_9;
  tri0 id_10;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_1,
      id_3,
      id_10,
      id_8,
      id_10,
      id_3,
      id_1,
      id_5,
      id_1,
      id_6
  );
  logic _id_11;
  assign id_10 = -1;
  assign id_2  = id_9 ? id_9[id_11] : -1 == id_6;
endmodule
