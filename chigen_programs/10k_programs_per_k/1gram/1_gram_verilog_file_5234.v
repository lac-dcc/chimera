// Seed: 3272594259
module module_0;
  wand id_1;
  assign id_1 = {1, -1'b0 == 1'h0, id_1, -1'h0};
  parameter id_2 = 1;
  wire id_3;
  wire [1 : 1] id_4;
  genvar id_5;
  initial repeat (id_3) id_5 <= #1 id_2;
  wire id_6;
  assign id_5 = id_2;
endmodule
module module_1 #(
    parameter id_3 = 32'd62
) (
    id_1,
    id_2,
    _id_3[~id_3 : !1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout logic [7:0] _id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  bit id_9 = (id_3);
  initial @(posedge 1, 1'b0) id_9 = id_1[-1] ==? -1'b0;
  always id_9 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_5 = 0;
  wire  id_10;
  logic id_11 = id_5;
endmodule
