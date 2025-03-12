// Seed: 3956999312
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
    id_18
);
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  output wor id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd88,
    parameter id_6  = 32'd93
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
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
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_2,
      id_4,
      id_3,
      id_3,
      id_15,
      id_14,
      id_19,
      id_3,
      id_3,
      id_19,
      id_12,
      id_1,
      id_11,
      id_14,
      id_19,
      id_19
  );
  input wire id_12;
  output wire id_11;
  inout wire _id_10;
  input logic [7:0] id_9;
  inout reg id_8;
  input wire id_7;
  input wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_10 = id_9[id_6==id_10 : 1];
  wire id_20;
  reg  id_21;
  generate
    for (id_22 = -1; id_7; id_21 = 1) begin : LABEL_0
      always @(negedge -1) id_8 = id_2;
    end
  endgenerate
endmodule
