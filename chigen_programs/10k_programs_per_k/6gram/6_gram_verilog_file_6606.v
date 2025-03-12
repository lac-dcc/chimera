// Seed: 3012891176
module module_0 #(
    parameter id_4 = 32'd40
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire [1 : -1] _id_4;
  logic id_5;
  wire [-1 : id_4] id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_11 = 32'd87,
    parameter id_12 = 32'd95,
    parameter id_13 = 32'd96,
    parameter id_4  = 32'd50,
    parameter id_9  = 32'd54
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    _id_11,
    _id_12,
    _id_13
);
  input wire _id_13;
  output wire _id_12;
  input wire _id_11;
  input wire id_10;
  inout wire _id_9;
  inout wire id_8;
  inout wire id_7;
  inout supply1 id_6;
  inout reg id_5;
  input wire _id_4;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0][&  id_11 : !  id_4] id_14 = id_14[id_9^id_13];
  assign id_5 = (id_4 && 1 == -1) * id_13 - id_6;
  assign id_6 = -1;
  initial id_5 = 1;
  logic [-1 : id_12] id_15;
  ;
endmodule
