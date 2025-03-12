// Seed: 1827782973
module module_0 #(
    parameter id_18 = 32'd27,
    parameter id_23 = 32'd36,
    parameter id_5  = 32'd5
) (
    id_1,
    id_2,
    module_0,
    id_4,
    _id_5,
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
    _id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  input wire id_25;
  input wire id_24;
  output wire _id_23;
  input wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire _id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire _id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [-1 : (  id_23  )] id_27;
  ;
  wire id_28;
  wire [1 : 1 'b0 ==  1] id_29;
  wand id_30 = 1;
  logic [id_5 : id_18] id_31;
  wire id_32;
endmodule
module module_1 #(
    parameter id_16 = 32'd23,
    parameter id_4  = 32'd3,
    parameter id_8  = 32'd0
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  input wire id_14;
  input logic [7:0] id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire _id_8;
  inout wire id_7;
  output tri0 id_6;
  inout logic [7:0] id_5;
  input wire _id_4;
  output tri0 id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_14 == -1) release id_9;
  wire [-1 : 1] _id_16;
  always disable id_17;
  assign #id_18 id_3 = id_11 !== id_10;
  module_0 modCall_1 (
      id_7,
      id_12,
      id_2,
      id_2,
      id_18,
      id_2,
      id_6,
      id_2,
      id_10,
      id_9,
      id_9,
      id_6,
      id_11,
      id_7,
      id_7,
      id_10,
      id_2,
      id_18,
      id_2,
      id_11,
      id_11,
      id_10,
      id_18,
      id_11,
      id_7,
      id_9
  );
  wire id_19;
  assign id_6 = 1 ? 1'b0 <= id_14 - 1 : id_5 ? -1 : id_13[id_4 : ""];
  logic id_20 = 1'h0;
  wire [id_8 : 1 'h0] id_21;
  assign id_3 = id_14;
  assign id_5[id_16] = 1;
endmodule
