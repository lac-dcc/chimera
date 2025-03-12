// Seed: 1144232664
module module_0 #(
    parameter id_1 = 32'd86
);
  wire _id_1;
  wire id_2;
  ;
  wire [1 : id_1] id_3;
  wire id_4;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd36,
    parameter id_3 = 32'd8
) (
    _id_1,
    id_2,
    _id_3,
    id_4[id_1-id_3 : id_3]
);
  output logic [7:0] id_4;
  input wire _id_3;
  input wire id_2;
  module_0 modCall_1 ();
  output wire _id_1;
endmodule
module module_2 #(
    parameter id_2 = 32'd89,
    parameter id_4 = 32'd40
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
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
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  inout wire id_21;
  input logic [7:0] id_20;
  inout logic [7:0] id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  module_0 modCall_1 ();
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire _id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_19[1] = id_20[id_2#(1) : (1+id_4)];
endmodule
