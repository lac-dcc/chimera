// Seed: 2602530466
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_14;
  wire  id_15;
  logic \id_16 ;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd35
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_10,
      id_10,
      id_10,
      id_6,
      id_10,
      id_10,
      id_8,
      id_10,
      id_10,
      id_10,
      id_10
  );
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_11;
  generate
    assign id_11[~id_4] = -1;
  endgenerate
endmodule
