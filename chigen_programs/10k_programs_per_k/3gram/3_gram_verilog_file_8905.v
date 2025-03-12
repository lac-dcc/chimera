// Seed: 3436738785
module module_0 #(
    parameter id_22 = 32'd5
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
    id_26
);
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  input wire id_23;
  input wire _id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  assign module_1.id_5 = 0;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  assign id_26 = id_3[-1?-1 :-1 : id_22];
endmodule
module module_1 #(
    parameter id_12 = 32'd10,
    parameter id_13 = 32'd15,
    parameter id_15 = 32'd23,
    parameter id_19 = 32'd35,
    parameter id_4  = 32'd0,
    parameter id_5  = 32'd82
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    _id_13,
    id_14,
    _id_15,
    id_16,
    id_17
);
  input wire id_17;
  output wire id_16;
  inout wire _id_15;
  output wire id_14;
  output wire _id_13;
  input wire _id_12;
  input logic [7:0] id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire _id_5;
  input wire _id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [  id_15 : id_12] id_18 = id_3;
  wire  [id_5 : -1  -  1] _id_19;
  assign id_15#(.id_1(-1)) = id_11[1];
  module_0 modCall_1 (
      id_8,
      id_2,
      id_11,
      id_7,
      id_3,
      id_9,
      id_6,
      id_16,
      id_2,
      id_18,
      id_3,
      id_18,
      id_2,
      id_16,
      id_14,
      id_2,
      id_6,
      id_18,
      id_16,
      id_18,
      id_1,
      id_15,
      id_6,
      id_7,
      id_2,
      id_2
  );
  logic id_20;
  struct packed {
    logic [~  id_4 : -1]   id_21;
    logic [-1 'b0 : id_13] id_22;
  } id_23[id_19  +  id_5 : id_12];
endmodule
