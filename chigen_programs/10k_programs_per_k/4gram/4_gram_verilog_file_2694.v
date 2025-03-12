// Seed: 20769799
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd94,
    parameter id_7 = 32'd24
) (
    id_1,
    _id_2,
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  input logic [7:0] id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_16,
      id_11,
      id_11,
      id_4,
      id_4,
      id_18,
      id_4,
      id_3,
      id_15,
      id_16,
      id_13,
      id_8,
      id_5,
      id_11,
      id_10,
      id_15,
      id_13,
      id_14,
      id_14
  );
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout logic [7:0] id_12;
  inout wire id_11;
  input wire id_10;
  inout reg id_9;
  output tri id_8;
  inout wire _id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  always_latch @(id_12[1+:id_7] or posedge 1) id_9 = id_17[id_2] - id_16;
  assign id_1[-1-:1] = id_16;
  assign id_8 = 1 ? id_18 : -1 ? id_3 : 1;
endmodule
