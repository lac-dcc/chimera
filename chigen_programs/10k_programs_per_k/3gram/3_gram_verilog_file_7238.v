// Seed: 3283995500
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd12
) (
    _id_1,
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
    id_12
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input logic [7:0] id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  output supply1 id_3;
  input wire id_2;
  input wire _id_1;
  parameter id_13 = -1;
  module_0 modCall_1 (
      id_5,
      id_13,
      id_9,
      id_13,
      id_11,
      id_13
  );
  logic id_14;
  ;
  assign id_3 = id_9 - {1, -1, id_6, (1), id_10, id_6[1'h0 :-1]};
  genvar id_15;
  parameter id_16 = 1'h0;
  wire [id_1 : (  -1  )] id_17;
  always @(negedge id_12);
endmodule
