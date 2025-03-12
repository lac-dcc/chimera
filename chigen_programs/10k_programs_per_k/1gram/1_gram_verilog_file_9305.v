// Seed: 78604760
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
    id_13[1 :-1+-1'b0],
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  output wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout logic [7:0] id_13;
  inout wire id_12;
  inout wire id_11;
  inout uwire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_14 = 32'd39,
    parameter id_17 = 32'd54,
    parameter id_23 = 32'd86,
    parameter id_6  = 32'd69,
    parameter id_8  = 32'd82
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16[1 : ""],
    _id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire _id_17;
  input logic [7:0] id_16;
  inout wire id_15;
  inout wire _id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire _id_8;
  output wire id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_18,
      id_11,
      id_11,
      id_11,
      id_10,
      id_2,
      id_12,
      id_13,
      id_13,
      id_12,
      id_13,
      id_2,
      id_3,
      id_12,
      id_9,
      id_12,
      id_1,
      id_2,
      id_15,
      id_5,
      id_2,
      id_15,
      id_7
  );
  input wire id_1;
  wire [1 'h0 : id_14] id_21;
  wire id_22[1 'd0 : 1];
  wire _id_23;
  initial @(posedge id_14 or negedge id_16, -1'b0) $signed(5);
  ;
  assign id_3[id_8 : id_17+id_23?id_6===-1 : 1][1'd0] = 1'h0 ? id_11 : 1'b0;
endmodule
