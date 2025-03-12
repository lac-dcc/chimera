// Seed: 2184064908
module module_0 (
    id_1[1 :-1],
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
    id_19
);
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  assign module_1.id_13 = 0;
  output wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd83,
    parameter id_15 = 32'd72,
    parameter id_3  = 32'd98,
    parameter id_4  = 32'd30,
    parameter id_6  = 32'd63,
    parameter id_7  = 32'd47,
    parameter id_8  = 32'd50,
    parameter id_9  = 32'd30
) (
    id_1[id_8 :-1],
    id_2[1 : 1],
    _id_3[-1 : id_7],
    _id_4,
    id_5,
    _id_6[-1 : id_9],
    _id_7[-1 : id_15],
    _id_8,
    _id_9,
    id_10,
    id_11,
    id_12[id_6 : id_13],
    _id_13[~-1'h0==1 : 1],
    id_14[id_4 : id_3],
    _id_15
);
  inout wire _id_15;
  input logic [7:0] id_14;
  inout logic [7:0] _id_13;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_5,
      id_10,
      id_5,
      id_11,
      id_10,
      id_10,
      id_11,
      id_10,
      id_10,
      id_11,
      id_5,
      id_5,
      id_10,
      id_5,
      id_10,
      id_5,
      id_10
  );
  inout logic [7:0] id_12;
  output wire id_11;
  nor primCall (id_11, id_12, id_10, id_14, id_5, id_1);
  inout wire id_10;
  input wire _id_9;
  output wire _id_8;
  output logic [7:0] _id_7;
  inout logic [7:0] _id_6;
  inout wire id_5;
  input wire _id_4;
  inout logic [7:0] _id_3;
  output logic [7:0] id_2;
  inout logic [7:0] id_1;
endmodule
