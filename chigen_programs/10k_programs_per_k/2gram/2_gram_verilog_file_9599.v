// Seed: 113761858
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
endmodule
macromodule module_1 #(
    parameter id_1  = 32'd28,
    parameter id_10 = 32'd88,
    parameter id_3  = 32'd69,
    parameter id_7  = 32'd17
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire _id_10;
  input wire id_9;
  inout wire id_8;
  inout wire _id_7;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_4,
      id_8,
      id_5,
      id_5
  );
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire _id_3;
  input wire id_2;
  inout wire _id_1;
  logic [1 : id_7  +  id_10] id_14;
  wire id_15;
  assign id_12 = id_1;
  xor primCall (id_5, id_9, id_4, id_6, id_11, id_13, id_8);
  wire [id_3 : id_1] id_16, id_17, id_18, id_19, id_20, id_21;
endmodule
