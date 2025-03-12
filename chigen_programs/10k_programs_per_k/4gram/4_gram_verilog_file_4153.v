// Seed: 2149404900
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
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_23 = -1'h0;
  assign id_5[-1] = id_21;
endmodule
module module_1 #(
    parameter id_10 = 32'd30
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
    _id_10
);
  inout wire _id_10;
  output wire id_9;
  inout wire id_8;
  output logic [7:0] id_7;
  input wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_5,
      id_4,
      id_8,
      id_2,
      id_4,
      id_8,
      id_2,
      id_8,
      id_8,
      id_2,
      id_4,
      id_2,
      id_8,
      id_9,
      id_2,
      id_4,
      id_8,
      id_2
  );
  output wire id_1;
  assign id_7[id_10 :-1] = -1;
  assign id_5 = id_8;
  wire id_11;
endmodule
