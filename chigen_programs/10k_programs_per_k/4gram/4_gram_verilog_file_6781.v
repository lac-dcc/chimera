// Seed: 22396442
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_14 = 32'd90,
    parameter id_17 = 32'd3,
    parameter id_7  = 32'd33
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
    id_13,
    _id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire _id_17;
  output wire id_16;
  input wire id_15;
  input wire _id_14;
  input wire id_13;
  inout logic [7:0] id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire _id_7;
  input wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_20,
      id_11,
      id_10
  );
  input logic [7:0] id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_23;
  ;
  logic [-1 : id_14] id_24;
  ;
  generate
    wire id_25;
    ;
  endgenerate
  wire id_26 = id_4[id_7];
  assign id_12[(id_17)] = id_22 ? id_19 : id_25;
endmodule
