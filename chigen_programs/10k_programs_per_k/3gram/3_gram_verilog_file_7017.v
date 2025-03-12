// Seed: 3399628904
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3[1] = id_11;
  logic id_12;
  assign id_11 = id_9;
  logic id_13;
  always @(negedge id_1 or negedge -1'b0) deassign id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd86,
    parameter id_4  = 32'd69,
    parameter id_6  = 32'd32
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6
);
  output wire _id_6;
  inout wire id_5;
  output wire _id_4;
  inout wire id_3;
  output reg id_2;
  input wire id_1;
  logic [-1 : -1] id_7 = id_5;
  integer id_8, id_9;
  logic _id_10 = id_9 & 1;
  assign id_7[id_10] = -1;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_7,
      id_3,
      id_8,
      id_5,
      id_8,
      id_8,
      id_3,
      id_8,
      id_5
  );
  initial id_2 = id_10;
  nor primCall (id_5, id_1, id_3, id_9, id_7, id_8);
  uwire id_11 = 1'b0;
  logic [id_4 : id_6] id_12;
endmodule
