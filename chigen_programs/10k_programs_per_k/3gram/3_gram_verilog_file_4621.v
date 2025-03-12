// Seed: 2961330488
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd95,
    parameter id_2  = 32'd29,
    parameter id_9  = 32'd37
) (
    id_1,
    _id_2,
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
    id_19
);
  output wire id_19;
  output reg id_18;
  output wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_12,
      id_1
  );
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire _id_10;
  input wire _id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire _id_2;
  inout wire id_1;
  wire [id_2 : 1 'h0] id_20 = id_16;
  wand id_21 = id_21 - id_20;
  always @(negedge id_16) id_18 <= #id_1 1;
  tri1 [id_10  &&  1 : id_9] id_22 = 1;
endmodule
