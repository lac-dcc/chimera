// Seed: 2599132043
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
    id_13[1'b0 : 1?-1 :-1],
    id_14
);
  inout wire id_14;
  inout logic [7:0] id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_15 = (1);
  assign id_9 = id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd66,
    parameter id_2 = 32'd63,
    parameter id_4 = 32'd60
) (
    _id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire _id_4;
  output wire id_3;
  output wire _id_2;
  input wire _id_1;
  logic [-1 : id_2  ==  id_4] id_7, id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_5
  );
  assign id_8[id_1 : 1'b0] = id_7;
endmodule
