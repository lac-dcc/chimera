// Seed: 178449306
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
    id_26,
    id_27,
    id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33,
    id_34
);
  inout wire id_34;
  inout wire id_33;
  inout wire id_32;
  output wire id_31;
  inout wire id_30;
  inout wire id_29;
  input wire id_28;
  output wire id_27;
  output wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  timeunit 1ps;
endmodule
module module_1 #(
    parameter id_9 = 32'd72
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    .id_8(id_7)
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output reg id_1;
  always @(posedge 1 or posedge 1);
  initial begin : LABEL_0
    disable _id_9;
    #1
    case (id_8[id_9!=-1])
      1: id_1 <= 1;
      default: id_1 = {-1, id_9, id_8, id_6, id_2};
    endcase
  end
  parameter id_10 = 1;
  wire id_11;
  wire id_12 = id_5;
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_7,
      id_4,
      id_10,
      id_12,
      id_2,
      id_6,
      id_12,
      id_7,
      id_13,
      id_10,
      id_4,
      id_6,
      id_11,
      id_4,
      id_4,
      id_7,
      id_7,
      id_11,
      id_13,
      id_6,
      id_13,
      id_11,
      id_6,
      id_4,
      id_12,
      id_6,
      id_2,
      id_6,
      id_7,
      id_6,
      id_7,
      id_7
  );
endmodule
