// Seed: 3949935204
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  wire id_12;
  wire [1 : 1] id_13;
  wire id_14;
  assign id_14 = id_8;
endmodule
module module_1 #(
    parameter id_14 = 32'd87
) (
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
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  nor primCall (
      id_9,
      id_18,
      id_17,
      id_3,
      id_13,
      id_12,
      id_4,
      id_21,
      id_7,
      id_5,
      id_11,
      id_20,
      id_6,
      id_2,
      id_16,
      id_8,
      id_15
  );
  input wire id_20;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_12,
      id_12,
      id_9
  );
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input logic [7:0] id_16;
  inout wire id_15;
  inout wire _id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_13 = id_16[~-1'b0-id_14];
endmodule
