// Seed: 1466907148
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  generate
    wire id_5;
  endgenerate
endmodule
module module_1 #(
    parameter id_3 = 32'd87,
    parameter id_4 = 32'd8
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire _id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2
  );
  output logic [7:0] id_1;
  assign id_1[1] = id_4;
  wire id_8;
  ;
  buf primCall (id_1, id_2);
  logic [id_4 : id_3] id_9;
  ;
  wire id_10, id_11;
  parameter id_12 = 1;
  always disable id_13;
endmodule
