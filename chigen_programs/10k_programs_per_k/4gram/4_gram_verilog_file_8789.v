// Seed: 3320269338
module module_0 ();
  parameter id_1 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd96,
    parameter id_19 = 32'd81
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
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output logic [7:0] id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input logic [7:0] id_12;
  input wire _id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_9 = id_12[1];
  logic id_17;
  logic [-1 : -1 'b0] id_18;
  ;
  module_0 modCall_1 ();
  _id_19 :
  assert property (@(negedge id_11) id_8)
  else $unsigned(80);
  ;
  assign id_16[id_19] = id_12#(.id_19(1)) ? id_1 : id_3;
  logic [-1  *  id_11 : 1] id_20 = id_15;
endmodule
