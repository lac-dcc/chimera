// Seed: 1221141390
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
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [1 : -1] id_12, id_13, id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_5 = 32'd61,
    parameter id_6 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6
);
  input wire _id_6;
  inout wire _id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  wire [id_5  &  id_6 : -1 'b0] id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_2,
      id_3,
      id_7,
      id_4,
      id_7,
      id_7
  );
  generate
    assign id_1[1<id_5] = -1;
  endgenerate
endmodule
