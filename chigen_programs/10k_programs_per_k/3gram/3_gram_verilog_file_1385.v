// Seed: 828170687
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
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_3[""] = -1;
  endgenerate
endmodule
module module_1 #(
    parameter id_16 = 32'd11,
    parameter id_5  = 32'd68
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(*);
  logic [7:0] id_10, id_11, id_12, id_13, id_14;
  or primCall (id_8, id_4, id_14, id_7, id_9, id_3, id_1, id_11, id_10, id_12, id_2, id_13);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_10,
      id_7,
      id_8,
      id_9,
      id_7,
      id_9,
      id_3,
      id_9,
      id_8,
      id_1,
      id_1,
      id_8
  );
  logic id_15;
  wor   _id_16 = -1'b0;
  logic id_17 = id_10[{1{id_16}}*1'd0 : 1];
endmodule
