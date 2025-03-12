// Seed: 86447225
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  logic id_3 = id_1;
  wire  id_4 = id_2;
  logic id_5;
  always
  fork : SymbolIdentifier
    id_5 <= -1;
    @(-1'b0 & 1'b0);
  join
endmodule
module module_1 #(
    parameter id_16 = 32'd80,
    parameter id_20 = 32'd31,
    parameter id_7  = 32'd93
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
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
    id_18,
    id_19,
    _id_20
);
  inout wire _id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire _id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output logic [7:0] id_10;
  inout wire id_9;
  inout wire id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wand id_3;
  inout wire id_2;
  input wire id_1;
  wire [1 : 1] id_21;
  wire ['b0 : id_7] id_22;
  wire id_23;
  wire id_24;
  logic [7:0][1 : id_16] id_25;
  module_0 modCall_1 (
      id_22,
      id_5
  );
  assign modCall_1.id_5 = 0;
  assign id_3 = 1 === id_25[""];
  wire id_26;
  assign id_10 = id_13;
  assign id_10[id_20 : 1] = -1'b0;
endmodule
