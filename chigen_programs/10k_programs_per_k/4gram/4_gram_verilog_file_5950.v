// Seed: 1929741603
module module_0 (
    id_1
);
  output wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd99
) (
    id_1,
    id_2,
    _id_3,
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
    id_14
);
  inout wor id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  module_0 modCall_1 (id_12);
  inout wire id_7;
  output wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  input wire _id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  assign id_14 = -1;
  parameter id_16 = 1;
  id_17 :
  assert property (@(posedge id_1) id_14)
  else $unsigned(76);
  ;
  assign id_17 = -1;
  always @* begin : LABEL_0
    cover (id_5[id_3]);
  end
  timeunit 1ps;
endmodule
