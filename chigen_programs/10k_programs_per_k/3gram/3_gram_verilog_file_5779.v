// Seed: 4193090261
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output logic [7:0] id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7[1 : ""] = id_5;
endmodule
module module_1 #(
    parameter id_10 = 32'd86,
    parameter id_13 = 32'd53,
    parameter id_16 = 32'd26,
    parameter id_20 = 32'd48,
    parameter id_9  = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    _id_16,
    id_17,
    id_18
);
  inout logic [7:0] id_18;
  output wire id_17;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_8,
      id_2
  );
  inout wire _id_16;
  output wire id_15;
  input wire id_14;
  input wire _id_13;
  input logic [7:0] id_12;
  inout wire id_11;
  inout wire _id_10;
  inout wire _id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  input logic [7:0] id_1;
  assign id_18[id_16] = id_9 - ~id_12[1];
  assign id_5 = id_11;
  wire id_19 = ~id_3;
  assign id_2[-1'b0] = id_2 & 1;
  wire _id_20[id_9 : id_10];
  wire id_21;
  logic [7:0] id_22, id_23;
  always @(posedge id_21 - 1) id_22[id_20] = id_1[id_13 : ~1'b0];
  wire id_24;
endmodule
