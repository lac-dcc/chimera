// Seed: 372715085
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
    id_13
);
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input logic [7:0] id_2;
  output wire id_1;
  final $clog2(28);
  ;
endmodule
module module_1 #(
    parameter id_14 = 32'd19,
    parameter id_6  = 32'd84
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  input wire _id_14;
  output logic [7:0] id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_15,
      id_9,
      id_8,
      id_8,
      id_5,
      id_15,
      id_3,
      id_16,
      id_15,
      id_16,
      id_16
  );
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire _id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  output supply0 id_3;
  output wire id_2;
  input wire id_1;
  logic id_17 = -1;
  wire  id_18;
  logic [7:0] id_19, id_20, id_21, id_22, id_23;
  assign id_13[1 : id_14] = id_14;
  wire id_24 = id_22;
  always
    for (id_3 = id_17; id_23; id_17 = id_21[id_6]) begin : LABEL_0
      id_5[~-1] <= 1;
    end
  parameter id_25 = 1;
  assign id_2 = id_23;
endmodule
