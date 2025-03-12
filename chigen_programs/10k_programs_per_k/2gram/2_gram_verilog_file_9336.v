// Seed: 1185009334
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
    id_16
);
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_4;
endmodule
module module_1 #(
    parameter id_18 = 32'd13,
    parameter id_19 = 32'd44,
    parameter id_23 = 32'd30,
    parameter id_4  = 32'd21,
    parameter id_9  = 32'd47
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    _id_18,
    _id_19,
    id_20,
    id_21
);
  inout wire id_21;
  inout wire id_20;
  input wire _id_19;
  input wire _id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output logic [7:0] id_12;
  output logic [7:0] id_11;
  output wire id_10;
  input wire _id_9;
  inout logic [7:0] id_8;
  inout wire id_7;
  output supply0 id_6;
  module_0 modCall_1 (
      id_21,
      id_17,
      id_20,
      id_17,
      id_10,
      id_21,
      id_7,
      id_13,
      id_17,
      id_17,
      id_17,
      id_7,
      id_20,
      id_13,
      id_7,
      id_13
  );
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  always id_12[id_19&&-1] = -1;
  assign id_2[-1'b0] = id_9 == id_5;
  wire id_22 = id_8[id_18];
  assign id_6 = 1;
  wire [-1  -  id_9  .  id_4 : -1] _id_23;
  assign id_11[id_23] = -1;
  logic id_24 = -1;
endmodule
