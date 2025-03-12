// Seed: 3596360142
module module_0 #(
    parameter id_11 = 32'd31,
    parameter id_8  = 32'd62
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    _id_11
);
  input wire _id_11;
  inout wire id_10;
  output wire id_9;
  inout wire _id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [id_8 : id_11] id_12;
endmodule
module module_1 #(
    parameter id_12 = 32'd10,
    parameter id_13 = 32'd28,
    parameter id_2  = 32'd39,
    parameter id_4  = 32'd98
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    _id_13,
    id_14
);
  output logic [7:0] id_14;
  inout wire _id_13;
  input wire _id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_14[id_12] = -1;
  logic [id_4  !=?  id_2 : id_2] id_15, id_16;
  always @(*);
  nand primCall (id_11, id_15, id_5, id_16, id_8, id_10, id_6, id_17, id_3, id_9, id_4);
  assign id_4 = id_8;
  wire [1  ==  id_13 : id_4] id_17;
  module_0 modCall_1 (
      id_8,
      id_15,
      id_15,
      id_9,
      id_9,
      id_9,
      id_16,
      id_4,
      id_9,
      id_17,
      id_4
  );
endmodule
