// Seed: 2500358790
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
    id_16
);
  input wire id_16;
  output supply1 id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_17;
  assign id_15 = id_16;
  assign id_15 = id_11 ? -1 & -1 : 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd85,
    parameter id_7  = 32'd36
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
    id_12
);
  input wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  output reg id_5;
  output wire id_4;
  inout reg id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_12,
      id_9,
      id_4,
      id_9,
      id_6,
      id_10,
      id_11,
      id_9,
      id_11,
      id_11,
      id_2,
      id_9,
      id_9,
      id_9,
      id_4,
      id_9
  );
  input wire id_1;
  always @(posedge 1 === 1 or id_1 == 1) begin : LABEL_0
    if (1) if (1 == 1) id_3 = -1;
    id_5 = id_12;
  end
  wire [-1 : -1] _id_13;
  logic id_14[id_7  -  id_13 : -1];
  ;
  logic id_15;
endmodule
