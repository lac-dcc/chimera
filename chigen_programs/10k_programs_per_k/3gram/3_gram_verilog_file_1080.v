// Seed: 3100693766
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output reg id_2;
  output wire id_1;
  wire id_4;
  ;
  always @(1 or -1) id_2 <= 1;
  logic id_5;
  ;
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_1  = 32'd3,
    parameter id_11 = 32'd51,
    parameter id_4  = 32'd54,
    parameter id_6  = 32'd99
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout logic [7:0] id_10;
  output reg id_9;
  input wire id_8;
  input wire id_7;
  input wire _id_6;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_3
  );
  input wire id_5;
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  output wire _id_1;
  wire _id_11;
  assign id_11 = id_5;
  always @(posedge id_7 or id_10[id_11-1] or posedge -1) id_9 = 1;
  wire [id_4 : -1] id_12;
  wire [id_6 : 1 'b0] id_13;
  logic [-1 'd0 : id_1] id_14;
endmodule
