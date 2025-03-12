// Seed: 2890135641
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
    id_12
);
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input logic [7:0] id_2;
  input wire id_1;
  assign module_1.id_7 = 0;
  assign id_10 = {id_3, id_2[1==1]};
endmodule
module module_1 #(
    parameter id_1 = 32'd27,
    parameter id_3 = 32'd60,
    parameter id_7 = 32'd20
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  input wire _id_1;
  logic [7:0] id_8, id_9, id_10;
  logic [1 : id_7  ==  id_3] id_11 = 1;
  module_0 modCall_1 (
      id_11,
      id_10,
      id_6,
      id_11,
      id_5,
      id_5,
      id_6,
      id_6,
      id_5,
      id_6,
      id_5,
      id_6
  );
  assign id_4[id_1] = id_8[-1];
endmodule
