// Seed: 1288146650
module module_0 #(
    parameter id_18 = 32'd28
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  input logic [7:0] id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  parameter id_16 = -1;
  bit  id_17;
  wire _id_18;
  ;
  always @(negedge id_5) id_17 = id_8[id_18];
endmodule
module module_1 #(
    parameter id_1 = 32'd88
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout reg id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_5,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2
  );
  inout logic [7:0] id_3;
  inout wire id_2;
  inout wire _id_1;
  always @(1'b0 or posedge -1 - id_3[id_1 : ""]) id_4 = 1;
  assign id_3 = id_3;
endmodule
