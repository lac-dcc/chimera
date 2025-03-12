// Seed: 2066291901
module module_0;
  generate
    wor id_1;
  endgenerate
  assign id_1 = -1'd0;
endmodule
module module_1 #(
    parameter id_5 = 32'd26,
    parameter id_6 = 32'd66,
    parameter id_7 = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5[-1 : id_6],
    _id_6,
    _id_7
);
  inout wire _id_7;
  output wire _id_6;
  input logic [7:0] _id_5;
  output wire id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  logic [7:0][id_5 : -1 'b0] id_8, id_9;
  logic id_10;
  ;
  assign id_1[id_5] = -1;
  parameter id_11 = 1;
  always_latch wait (id_10);
  time  id_12 = id_10;
  logic id_13;
  assign id_8[id_7-1] = 1;
  wire id_14;
endmodule
