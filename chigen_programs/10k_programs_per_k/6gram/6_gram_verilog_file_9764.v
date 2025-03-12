// Seed: 2726246515
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire  id_7;
  logic id_8 = id_8;
  logic id_9;
  logic id_10;
  logic id_11 = id_8;
  wire  id_12;
  parameter id_13 = 1;
  wire id_14;
  wire id_15;
  ;
endmodule
module module_1 #(
    parameter id_18 = 32'd35,
    parameter id_3  = 32'd29,
    parameter id_9  = 32'd2
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output reg id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_12,
      id_4,
      id_7,
      id_4,
      id_12,
      id_13
  );
  output wire _id_9;
  input wire id_8;
  inout wire id_7;
  output reg id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1 or posedge id_1) begin : LABEL_0
    id_11 = id_8 == -1;
    id_6  = #id_16 1;
  end
  logic id_17;
  parameter id_18 = 1;
  logic id_19[id_9 : id_3  !=  id_18];
endmodule
