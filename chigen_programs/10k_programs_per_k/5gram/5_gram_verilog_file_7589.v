// Seed: 1799556367
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic module_0;
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd99,
    parameter id_23 = 32'd43,
    parameter id_3  = 32'd39
) (
    id_1,
    id_2,
    _id_3,
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
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    _id_23
);
  inout wire _id_23;
  input wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire _id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  module_0 modCall_1 (
      id_21,
      id_16,
      id_21,
      id_14,
      id_2
  );
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  xnor primCall (id_2, id_11, id_22, id_8, id_14, id_5, id_16, id_18, id_9, id_13, id_7, id_21);
  inout logic [7:0] id_5;
  input wire id_4;
  inout wire _id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_24;
  parameter [-1  ==?  id_15 : 1] id_25 = 'd0 == 1;
  assign id_24[id_23] = -1'b0 == id_5[id_3];
endmodule
