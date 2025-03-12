// Seed: 1764098654
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
    id_21
);
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_22;
endmodule
module module_1 #(
    parameter id_11 = 32'd93,
    parameter id_13 = 32'd74,
    parameter id_22 = 32'd26,
    parameter id_25 = 32'd93,
    parameter id_3  = 32'd86
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    _id_22,
    id_23,
    id_24
);
  input wire id_24;
  inout wire id_23;
  inout wire _id_22;
  input wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire _id_13;
  module_0 modCall_1 (
      id_23,
      id_14,
      id_23,
      id_16,
      id_14,
      id_23,
      id_16,
      id_9,
      id_23,
      id_9,
      id_19,
      id_14,
      id_19,
      id_15,
      id_19,
      id_16,
      id_23,
      id_23,
      id_19,
      id_14,
      id_19
  );
  input wire id_12;
  input wire _id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  output wire id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  logic _id_25;
  ;
  parameter id_26 = 1;
  logic [id_13 : 1] id_27 = 1'd0;
  assign id_6[id_11+id_3] = id_27 == -1;
  wire [id_22 : id_25] id_28;
  wire id_29;
  assign id_28 = id_19;
endmodule
