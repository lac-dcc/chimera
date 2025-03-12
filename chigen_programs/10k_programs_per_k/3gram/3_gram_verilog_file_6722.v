// Seed: 4238199075
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  logic id_3;
endmodule
module module_0 #(
    parameter id_1 = 32'd57,
    parameter id_2 = 32'd29,
    parameter id_3 = 32'd3,
    parameter id_5 = 32'd16
) (
    _id_1,
    _id_2,
    _id_3,
    id_4
);
  output wire id_4;
  input wire _id_3;
  inout wire _id_2;
  input wire _id_1;
  wire _id_5 = 1;
  localparam id_6 = 1;
  assign id_4 = id_6;
  wire [id_1 : id_2] id_7;
  wire id_8, id_9;
  logic module_1;
  assign id_8 = id_7;
  bit id_10;
  logic [-1 : id_2] id_11;
  ;
  module_0 modCall_1 (
      id_7,
      id_8
  );
  parameter id_12 = id_6[id_5+id_5];
  parameter id_13 = 1;
  logic id_14, id_15;
  xnor primCall (id_4, id_7, id_10, id_6, id_9);
  wire [id_3 : -1 'h0] id_16;
  wire id_17;
  always_comb @(id_7, negedge 1) id_10 = id_9;
endmodule
