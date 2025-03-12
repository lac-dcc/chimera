// Seed: 1705625231
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
    id_15
);
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_16;
endmodule
macromodule module_1 #(
    parameter id_13 = 32'd98,
    parameter id_5  = 32'd25,
    parameter id_6  = 32'd81
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  inout reg id_9;
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_7,
      id_1,
      id_2,
      id_2,
      id_7,
      id_7,
      id_2,
      id_7,
      id_3,
      id_4,
      id_2,
      id_7,
      id_2
  );
  output wire _id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_11 = id_6;
  wire [1 : 1] id_12;
  logic [id_5 : id_5] _id_13;
  ;
  always @(negedge -1'h0) id_9 <= 1;
  assign id_2 = id_7;
  wire id_14;
  always assign id_9 = 1'b0;
  parameter id_15 = 1;
  generate
    logic id_16 = id_3 - id_3;
  endgenerate
  logic ["" : 1] id_17;
  ;
  logic [id_6  +  id_13 : 1] id_18;
  ;
endmodule
