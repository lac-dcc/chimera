// Seed: 2284384703
module module_0 #(
    parameter id_18 = 32'd2,
    parameter id_27 = 32'd68
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
    id_14,
    id_15,
    id_16,
    id_17,
    _id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    module_0,
    id_25,
    id_26,
    _id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34,
    id_35,
    id_36
);
  input wire id_36;
  inout wire id_35;
  input wire id_34;
  input wire id_33;
  input wire id_32;
  output wire id_31;
  output wire id_30;
  inout wire id_29;
  inout wire id_28;
  inout wire _id_27;
  input wire id_26;
  input wire id_25;
  input wire id_24;
  input wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  input wire _id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_11[id_18 : id_27] = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd16,
    parameter id_14 = 32'd75,
    parameter id_4  = 32'd82,
    parameter id_7  = 32'd44
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire _id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  inout wire _id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  parameter id_10 = 1 ? -1 : 1;
  assign id_5[id_4] = {-1, 1};
  logic id_11;
  ;
  logic [id_7 : 1] id_12;
  ;
  parameter id_13 = 1 & id_10;
  module_0 modCall_1 (
      id_12,
      id_13,
      id_12,
      id_9,
      id_6,
      id_12,
      id_11,
      id_8,
      id_13,
      id_11,
      id_3,
      id_8,
      id_9,
      id_13,
      id_8,
      id_9,
      id_11,
      id_10,
      id_2,
      id_13,
      id_11,
      id_9,
      id_9,
      id_13,
      id_11,
      id_12,
      id_10,
      id_9,
      id_12,
      id_11,
      id_13,
      id_9,
      id_13,
      id_12,
      id_13,
      id_12
  );
  wire _id_14;
  localparam id_15 = id_13;
  parameter id_16 = id_15 != id_15;
  assign id_5 = id_3;
  logic [id_10 : id_4  -  -1] id_17 = id_3[id_14];
  wire id_18;
  assign id_11 = "" ? id_5 : !id_13;
endmodule
