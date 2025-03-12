// Seed: 1777948943
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    access,
    id_9,
    module_0,
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
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = id_5;
  wire id_20;
endmodule
module module_1 #(
    parameter id_12 = 32'd49,
    parameter id_16 = 32'd90,
    parameter id_2  = 32'd51,
    parameter id_3  = 32'd35
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13
);
  input wire id_13;
  output wire _id_12;
  inout wire id_11;
  output logic [7:0] id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output tri id_5;
  output wire id_4;
  output wire _id_3;
  inout wire _id_2;
  input wire id_1;
  logic [id_12 : id_12] id_14;
  ;
  wire id_15;
  wire _id_16;
  module_0 modCall_1 (
      id_14,
      id_11,
      id_9,
      id_5,
      id_6,
      id_13,
      id_15,
      id_9,
      id_6,
      id_7,
      id_9,
      id_11,
      id_15,
      id_1,
      id_11,
      id_5,
      id_5,
      id_6,
      id_11
  );
  wire id_17;
  assign id_10[id_2==?id_16] = 1 - 1;
  assign id_5 = id_14[1] ? 1 : id_11;
  logic [id_3 : 1] id_18;
endmodule
