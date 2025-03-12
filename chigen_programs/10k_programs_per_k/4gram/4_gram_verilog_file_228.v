// Seed: 2530702112
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_8 = 1;
endmodule
module module_1 #(
    parameter id_16 = 32'd29,
    parameter id_2  = 32'd2
) (
    id_1,
    _id_2,
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
    _id_16,
    id_17,
    id_18
);
  output wire id_18;
  input wire id_17;
  inout wire _id_16;
  inout wire id_15;
  inout logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  output logic [7:0] id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  inout wire id_1;
  wire id_19;
  wire id_20;
  assign id_11[id_16==-1] = id_16;
  wire id_21;
  parameter id_22 = 1;
  module_0 modCall_1 (
      id_22,
      id_12,
      id_22,
      id_1,
      id_6,
      id_22,
      id_20
  );
  logic id_23;
  or primCall (
      id_6,
      id_14,
      id_20,
      id_3,
      id_19,
      id_21,
      id_7,
      id_22,
      id_17,
      id_9,
      id_4,
      id_1,
      id_15,
      id_10,
      id_5
  );
  assign id_11[""]   = 1'b0;
  assign id_14[id_2] = 1;
  logic id_24;
endmodule
