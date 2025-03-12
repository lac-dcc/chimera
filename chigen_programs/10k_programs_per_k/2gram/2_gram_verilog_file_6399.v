// Seed: 357887558
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
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_15;
endmodule
module module_1 #(
    parameter id_13 = 32'd65,
    parameter id_7  = 32'd62
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout logic [7:0] id_20;
  input wire id_19;
  output wire id_18;
  module_0 modCall_1 (
      id_14,
      id_12,
      id_19,
      id_2,
      id_2,
      id_15,
      id_15,
      id_14,
      id_12,
      id_12,
      id_12,
      id_17,
      id_18,
      id_14
  );
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire _id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire _id_7;
  or primCall (
      id_14, id_6, id_11, id_9, id_20, id_16, id_5, id_12, id_1, id_3, id_19, id_8, id_4, id_17
  );
  input wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_13 = id_11;
  assign id_20[1 :-1] = -1;
  logic [-1 : 1] id_21 = -1, id_22;
endmodule
