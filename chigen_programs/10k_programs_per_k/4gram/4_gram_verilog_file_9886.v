// Seed: 1608965519
program module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  assign id_1 = id_2;
endprogram
module module_1 #(
    parameter id_22 = 32'd63
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  inout logic [7:0] id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout reg id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_20,
      id_10
  );
  assign id_3#(.id_11(-1)) [1&&-1] = -1'd0;
  localparam id_21 = 1'b0;
  wire _id_22;
  localparam id_23 = id_21;
  always @(1, posedge id_14) id_12 <= #1 1;
  assign id_12 = id_21;
  parameter integer id_24 = id_23;
  id_25 :
  assert property (@(posedge id_22) id_23)
  else $clog2(4);
  ;
endmodule
