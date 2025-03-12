// Seed: 806915218
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial $clog2(39);
  ;
  logic id_9;
  ;
  parameter id_10 = 1;
  wire id_11;
  genvar id_12;
endmodule
module module_1 #(
    parameter id_1 = 32'd3
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire _id_1;
  logic [id_1 : -1] id_8 = id_3;
  wire id_9;
  assign id_9 = id_1;
  parameter id_10 = 1'b0;
  module_0 modCall_1 (
      id_10,
      id_9,
      id_5,
      id_9,
      id_4,
      id_9,
      id_7,
      id_10
  );
endmodule
