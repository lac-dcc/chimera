// Seed: 3606966804
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
    id_17
);
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire  id_18;
  wire  id_19;
  wire  id_20;
  logic id_21;
endmodule
module module_1 #(
    parameter id_13 = 32'd28,
    parameter id_18 = 32'd29
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
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire _id_13;
  module_0 modCall_1 (
      id_17,
      id_5,
      id_12,
      id_15,
      id_15,
      id_2,
      id_12,
      id_4,
      id_12,
      id_17,
      id_17,
      id_10,
      id_15,
      id_11,
      id_2,
      id_12,
      id_12
  );
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  xor primCall (id_1, id_3, id_4, id_12, id_10, id_11, id_17, id_15, id_16);
  output wire id_8;
  output tri0 id_7;
  output logic [7:0] id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    assume (id_15);
  end
  logic [1 'b0 : ~  -1] _id_18 = -1;
  wire id_19;
  logic id_20;
  assign id_7 = 1;
  final $clog2(55);
  ;
  assign id_15   = id_12;
  assign id_6[1] = -1 - -1;
  parameter id_21 = 1;
  wire [-1 : id_18] id_22["" : id_13];
endmodule
