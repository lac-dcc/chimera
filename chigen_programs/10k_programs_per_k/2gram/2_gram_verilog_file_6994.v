// Seed: 595529932
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(.id_7(1'h0)),
    id_8
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_22 = 32'd59,
    parameter id_29 = 32'd73
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
    id_18,
    id_19,
    id_20,
    id_21,
    _id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    _id_29,
    id_30
);
  output logic [7:0] id_30;
  output wire _id_29;
  output wire id_28;
  output wire id_27;
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  nor primCall (
      id_30,
      id_14,
      id_19,
      id_15,
      id_18,
      id_3,
      id_25,
      id_12,
      id_24,
      id_16,
      id_4,
      id_13,
      id_17,
      id_21,
      id_5,
      id_9,
      id_2
  );
  output wire id_23;
  output wire _id_22;
  inout wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  input logic [7:0] id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_24,
      id_27,
      id_17,
      id_10,
      id_12,
      id_14,
      id_14
  );
  inout wire id_2;
  output wire id_1;
  wire id_31;
  assign id_27 = id_15[-1&-1'b0 : 1];
  logic [1 : -1  &  id_22  -  id_29] id_32;
  assign id_30[~-1] = id_21;
endmodule
