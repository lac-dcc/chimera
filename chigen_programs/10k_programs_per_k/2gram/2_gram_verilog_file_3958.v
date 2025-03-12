// Seed: 3176652143
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
    id_24
);
  inout wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_25 = id_12;
  assign id_5 = id_8;
  logic [-1 : 1] id_26;
  localparam id_27 = 1;
  logic id_28;
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd64
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout uwire id_13;
  input wire id_12;
  output wire id_11;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_15,
      id_5,
      id_10,
      id_1,
      id_1,
      id_4,
      id_2,
      id_13,
      id_9,
      id_16,
      id_2,
      id_13,
      id_1,
      id_15,
      id_1,
      id_2,
      id_15,
      id_4,
      id_9,
      id_16,
      id_11,
      id_13
  );
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input logic [7:0] id_7;
  output wire _id_6;
  output wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_17 = 1;
  assign id_5 = id_7;
  logic [-1 'b0 : -1] id_18 = id_2;
  wand id_19 = id_18[1] - 1;
  wire id_20;
  assign id_4  = id_2;
  assign id_8  = {id_13 - id_19 >> id_13, 1};
  assign id_13 = 1 <-> id_7[1 :-1];
  logic id_21;
endmodule
