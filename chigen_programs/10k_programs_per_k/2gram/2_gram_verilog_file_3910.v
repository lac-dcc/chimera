// Seed: 3912686794
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
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [1 : 1] id_27;
  wire id_28;
  parameter id_29 = 1;
  wire id_30;
endmodule
module module_1 #(
    parameter id_1 = 32'd89,
    parameter id_3 = 32'd59
) (
    _id_1,
    id_2,
    _id_3,
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
  output wire id_18;
  inout wire id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_17,
      id_12,
      id_16,
      id_12,
      id_9,
      id_2,
      id_8,
      id_9,
      id_16,
      id_17,
      id_17,
      id_10,
      id_9,
      id_12,
      id_18,
      id_16,
      id_10,
      id_16,
      id_10,
      id_7,
      id_10,
      id_16,
      id_8,
      id_7,
      id_12,
      id_15
  );
  output wire id_15;
  output wire id_14;
  output logic [7:0] id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  input wire _id_1;
  wire id_19 = id_1;
  always begin : LABEL_0
    `define pp_20 0
  end
  assign id_13[id_3 : id_1] = id_17;
endmodule
