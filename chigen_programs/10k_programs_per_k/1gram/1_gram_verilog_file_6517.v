// Seed: 2519584951
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd99,
    parameter id_5 = 32'd17,
    parameter id_7 = 32'd54,
    parameter id_8 = 32'd73,
    parameter id_9 = 32'd15
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    _id_8,
    _id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire _id_9;
  input wire _id_8;
  inout wire _id_7;
  output wire id_6;
  input wire _id_5;
  output wire id_4;
  output wire id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_11 = 1;
  int id_12[id_5 : id_9];
  ;
  assign id_11 = id_1;
  wire [id_7 : id_9] id_13, id_14[id_8  +  id_2 : 1];
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_1,
      id_14
  );
  assign id_1 = id_12;
endmodule
