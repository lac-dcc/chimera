// Seed: 540827783
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
    .id_16(id_12),
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  parameter id_17 = 1;
endmodule
module module_1 #(
    parameter id_21 = 32'd43,
    parameter id_5  = 32'd98
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
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
    _id_21,
    id_22
);
  output tri1 id_22;
  input wire _id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire _id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [-1 : id_21] id_23;
  assign id_9  = id_12;
  assign id_22 = 1;
  always assume (id_2);
  module_0 modCall_1 (
      id_2,
      id_16,
      id_7,
      id_8,
      id_23,
      id_23,
      id_15,
      id_19,
      id_15,
      id_17,
      id_3,
      id_13,
      id_14,
      id_3,
      id_1
  );
  assign id_5 = id_20;
  wire id_24;
  always
  fork : SymbolIdentifier
  join : SymbolIdentifier
  wire id_25;
  assign id_9[-1 : id_5] = id_17;
endmodule
