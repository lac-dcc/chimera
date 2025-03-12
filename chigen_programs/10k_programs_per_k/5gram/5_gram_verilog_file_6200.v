// Seed: 3092472540
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
    id_31
);
  output wire id_31;
  inout wire id_30;
  output wire id_29;
  inout wire id_28;
  inout wire id_27;
  inout wire id_26;
  inout wire id_25;
  input wire id_24;
  output wire id_23;
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output tri id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_15 = ~id_9[-1'b0] | 1;
  assign id_31 = id_27++;
  wire id_32;
  assign id_23 = 1;
endmodule
module module_1 #(
    parameter id_17 = 32'd58,
    parameter id_21 = 32'd32
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
    _id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire _id_17;
  input wire id_16;
  input wire id_15;
  output reg id_14;
  inout wire id_13;
  module_0 modCall_1 (
      id_19,
      id_3,
      id_13,
      id_5,
      id_10,
      id_3,
      id_19,
      id_12,
      id_4,
      id_3,
      id_2,
      id_19,
      id_2,
      id_6,
      id_12,
      id_10,
      id_18,
      id_13,
      id_12,
      id_8,
      id_3,
      id_3,
      id_5,
      id_13,
      id_8,
      id_3,
      id_5,
      id_12,
      id_2,
      id_8,
      id_18
  );
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(id_9 or -1 or id_4[1] or posedge "" or posedge {-1{id_13}} > 1'b0)
    if (1) begin : LABEL_0
      id_14 = -1;
    end else disable _id_21;
  logic id_22;
  wire id_23;
  logic id_24 = id_12;
  wire id_25[id_17 : id_21];
  assign id_24 = id_9;
  wire  id_26;
  wire  id_27;
  wire  id_28;
  logic id_29;
  ;
endmodule
