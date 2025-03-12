// Seed: 4047820748
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
    id_10
);
  input wire id_10;
  inout logic [7:0] id_9;
  output wire id_8;
  output logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_9 = id_3;
  logic [-1 : 1 'd0] id_11;
  logic id_12;
  assign id_7[-1] = -1;
  assign id_9[1]  = -1'b0;
endmodule
module module_1 #(
    parameter id_14 = 32'd33,
    parameter id_17 = 32'd57,
    parameter id_7  = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14
);
  inout wire _id_14;
  inout logic [7:0] id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  inout wire _id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  logic [id_7 : -1] id_15;
  ;
  assign id_8[id_14 :-1'b0] = id_15;
  localparam id_16 = 1;
  module_0 modCall_1 (
      id_16,
      id_11,
      id_10,
      id_6,
      id_4,
      id_12,
      id_13,
      id_15,
      id_13,
      id_16
  );
  wire _id_17;
  parameter id_18 = 1 | id_16 + id_16;
  wire id_19;
  wire id_20 = id_2[-1];
  assign id_13[id_17] = -1;
  logic [1 : 1] id_21;
  assign id_19 = 1;
endmodule
