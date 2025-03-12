// Seed: 2433074164
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  initial assume (1);
endmodule
module module_1 #(
    parameter id_4 = 32'd51,
    parameter id_7 = 32'd49
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire _id_7;
  output wire id_6;
  input logic [7:0] id_5;
  input wire _id_4;
  output logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  logic id_10 = id_5[{id_4, 1}==id_7];
  module_0 modCall_1 (
      id_9,
      id_10
  );
  assign id_3[1==?1 :-1] = id_8 == id_5;
  logic id_11;
  logic [-1 : -1] id_12;
  ;
  tri1 id_13 = -1;
endmodule
