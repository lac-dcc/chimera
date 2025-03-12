// Seed: 199005978
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11, id_12;
endmodule
module module_1 #(
    parameter id_10 = 32'd30,
    parameter id_12 = 32'd33,
    parameter id_4  = 32'd94,
    parameter id_9  = 32'd60
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10[id_12||1!=-1 : id_10],
    id_11[id_4 : id_9],
    _id_12,
    id_13#(.id_14((1))),
    id_15
);
  output wire id_14;
  output wire id_13;
  inout wire _id_12;
  output logic [7:0] id_11;
  input logic [7:0] _id_10;
  inout wire _id_9;
  module_0 modCall_1 (
      id_14,
      id_15,
      id_3,
      id_8,
      id_8,
      id_5,
      id_5,
      id_7,
      id_15,
      id_13
  );
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire _id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16, id_17;
  localparam id_18 = 1;
endmodule
