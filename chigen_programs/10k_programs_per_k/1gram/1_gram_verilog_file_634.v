// Seed: 983453563
module module_0 #(
    parameter id_11 = 32'd89,
    parameter id_2  = 32'd27,
    parameter id_6  = 32'd66
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7[id_6 : 1],
    id_8,
    id_9,
    id_10,
    _id_11[id_11.id_2 :-1]
);
  inout logic [7:0] _id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output logic [7:0] id_7;
  input wire _id_6;
  assign module_1.id_6 = 0;
  input wire id_5;
  inout wor id_4;
  input wire id_3;
  output wire _id_2;
  inout wire id_1;
  assign id_4 = -1 == 1 & 1;
  logic id_12;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_3 = 32'd19,
    parameter id_6 = 32'd60
) (
    id_1,
    _id_2,
    _id_3#(
        .id_4(1),
        .min (1)
    ) [~-1 : id_2]
);
  inout logic [7:0] _id_3;
  inout wire _id_2;
  output wire id_1;
  logic id_5 = -1;
  wire  _id_6;
  assign id_2 = id_3;
  logic [7:0]["" : (  1  |  id_3  )] id_7;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_2,
      id_7,
      id_1,
      id_5,
      id_1,
      id_2
  );
  assign id_2 = id_7[1 : id_6];
  assign id_6 = id_3;
  logic id_8, id_9;
endmodule
