// Seed: 2864123495
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_3 = 0;
  parameter id_12 = -1'b0;
  wire id_13;
  wire id_14, id_15;
endmodule
module module_1 #(
    parameter id_4 = 32'd22
) (
    input  uwire id_0,
    output logic id_1,
    output tri   id_2,
    output wor   id_3,
    input  wand  _id_4
);
  always id_1 <= #1 1;
  wire id_6;
  logic id_7, id_8, id_9 = -1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_7,
      id_8,
      id_6,
      id_7,
      id_8,
      id_8,
      id_7,
      id_6
  );
  logic id_10[-1 : id_4];
  assign id_3 = 1 ? id_9 : id_9 ? -1'b0 : id_0;
  wire id_11;
  ;
endmodule
