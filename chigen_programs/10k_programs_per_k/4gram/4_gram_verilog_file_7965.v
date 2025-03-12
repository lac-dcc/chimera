// Seed: 3820230985
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
    id_34,
    id_35,
    id_36,
    id_37,
    id_38
);
  inout wire id_38;
  output wire id_37;
  output wire id_36;
  output wire id_35;
  output wire id_34;
  inout wire id_33;
  input wire id_32;
  inout wire id_31;
  inout wire id_30;
  inout wire id_29;
  output wire id_28;
  inout wire id_27;
  inout wire id_26;
  input wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_39 = 1;
  wire id_40;
  id_41 :
  assert property (@(posedge id_32) -1'b0)
  else $clog2(39);
  ;
  parameter id_42 = 1;
  localparam id_43 = id_39;
  logic id_44;
  ;
endmodule
module module_1 #(
    parameter id_1  = 32'd21,
    parameter id_17 = 32'd37,
    parameter id_19 = 32'd40
) (
    _id_1,
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
    _id_17,
    id_18,
    _id_19,
    id_20,
    id_21
);
  input logic [7:0] id_21;
  module_0 modCall_1 (
      id_18,
      id_2,
      id_6,
      id_4,
      id_15,
      id_15,
      id_6,
      id_12,
      id_13,
      id_12,
      id_5,
      id_18,
      id_18,
      id_7,
      id_12,
      id_13,
      id_11,
      id_11,
      id_13,
      id_18,
      id_6,
      id_8,
      id_13,
      id_11,
      id_13,
      id_7,
      id_18,
      id_12,
      id_18,
      id_7,
      id_5,
      id_7,
      id_18,
      id_13,
      id_6,
      id_5,
      id_18,
      id_18
  );
  inout reg id_20;
  input wire _id_19;
  inout wire id_18;
  input wire _id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input logic [7:0] id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire _id_1;
  always @(id_21[id_19#(1)] or posedge id_1) id_20 = -1;
  assign id_3[-1'b0&id_17] = id_9[id_1] - 1;
  assign id_10 = {id_21, -1};
  wire id_22;
endmodule
