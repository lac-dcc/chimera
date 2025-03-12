// Seed: 2362654695
module module_0 #(
    parameter id_4 = 32'd56
) (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  if (~-1) integer _id_4;
  wire id_5, id_6, id_7;
  assign id_7 = id_6;
  assign module_1.id_12 = 0;
  wire [-1 'b0 : id_4] id_8, id_9, id_10, id_11, id_12;
endmodule
module module_1 #(
    parameter id_10 = 32'd86,
    parameter id_12 = 32'd0,
    parameter id_2  = 32'd46,
    parameter id_27 = 32'd26
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18[1 : id_2],
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
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
    id_36,
    id_37
);
  inout wire id_37;
  output reg id_36;
  input wire id_35;
  inout wire id_34;
  inout wire id_33;
  input wire id_32;
  output wire id_31;
  output wire id_30;
  inout wire id_29;
  input wire id_28;
  output wire _id_27;
  input wire id_26;
  output wire id_25;
  output wire id_24;
  module_0 modCall_1 (
      id_20,
      id_33,
      id_7
  );
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  inout tri0 id_20;
  input wire id_19;
  inout logic [7:0] id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout reg id_13;
  input wire _id_12;
  input wire id_11;
  inout wire _id_10;
  input logic [7:0] id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire _id_2;
  output wire id_1;
  assign id_20 = 1'b0;
  wire [-1 : 1 'd0] id_38;
  logic id_39 = 1;
  always id_40;
  logic id_41;
  ;
  reg id_42;
  logic [7:0] id_43, id_44, id_45;
  initial id_42 <= 1;
  struct packed {
    logic id_46[id_27 : id_10]   = -1;
    logic id_47[-1 'b0 : id_12];
  } id_48;
  ;
  always
    if (1) begin : LABEL_0
      if (-1) id_36 = id_32;
    end : SymbolIdentifier
    else @(posedge id_26 - id_23 + id_48.id_46) id_13 <= id_41;
endmodule
