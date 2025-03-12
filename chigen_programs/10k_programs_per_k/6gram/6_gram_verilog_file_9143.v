// Seed: 4200934188
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_10 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd48
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
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire _id_1;
  logic [1 : id_1] id_8;
  wire id_9;
  logic id_10;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_10,
      id_2,
      id_2,
      id_9,
      id_9,
      id_9,
      id_7,
      id_2,
      id_10
  );
  assign modCall_1.id_10 = 0;
endmodule
