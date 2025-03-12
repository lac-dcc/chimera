// Seed: 2371885991
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wand id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = -1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd66,
    parameter id_22 = 32'd59,
    parameter id_24 = 32'd29,
    parameter id_9  = 32'd27
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    _id_22
);
  inout wire _id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire _id_9;
  xor primCall (id_11, id_1, id_13, id_4, id_5, id_17, id_15, id_16, id_20, id_12);
  output wire id_8;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_5,
      id_4,
      id_11
  );
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always_ff force id_1 = id_10;
  always @(~id_17 or id_15);
  logic [7:0] id_23, _id_24, id_25, id_26, id_27, id_28, id_29, id_30, id_31;
  wire [1 : 1] id_32;
  parameter [id_9 : 1  !==  1 'b0 -  id_10] id_33 = 1;
  assign id_28[1 : (id_22+id_24)-1] = id_25;
  wire [-1 'd0 : 'b0] id_34;
endmodule
