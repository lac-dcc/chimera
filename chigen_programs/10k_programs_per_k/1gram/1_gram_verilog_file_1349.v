// Seed: 1392298623
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
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
  assign id_10 = id_5;
endmodule
module module_1 #(
    parameter id_1  = 32'd76,
    parameter id_10 = 32'd77,
    parameter id_11 = 32'd29,
    parameter id_2  = 32'd80,
    parameter id_5  = 32'd55,
    parameter id_8  = 32'd99
) (
    _id_1,
    _id_2,
    id_3,
    id_4[id_2 : id_1],
    _id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    _id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  inout supply0 id_13;
  inout wire id_12;
  output wire _id_11;
  inout wire _id_10;
  input wire id_9;
  output wire _id_8;
  input wire id_7;
  output wire id_6;
  inout wire _id_5;
  output logic [7:0] id_4;
  output supply1 id_3;
  input wire _id_2;
  output wire _id_1;
  logic id_15[id_10  ?  1  -  id_11 : id_5 : -1  ==  id_8];
  assign id_13 = 1;
  assign id_3  = id_7;
  parameter id_16 = 1;
  module_0 modCall_1 (
      id_13,
      id_14,
      id_13,
      id_13,
      id_13,
      id_12,
      id_13,
      id_13,
      id_13,
      id_13
  );
  assign id_3 = -1;
endmodule
