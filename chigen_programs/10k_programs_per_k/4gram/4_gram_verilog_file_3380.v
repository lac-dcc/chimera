// Seed: 1979490450
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout reg id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  parameter id_13 = -1;
  always @(posedge id_7) id_7 = 1;
  assign id_8 = id_11;
endmodule
module module_1 #(
    parameter id_8 = 32'd35
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
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
  input wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  or primCall (id_16, id_2, id_5, id_10, id_17, id_4, id_1, id_11, id_3, id_6);
  input wire _id_8;
  output wire id_7;
  inout reg id_6;
  input logic [7:0] id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  for (id_18 = -1; id_2; id_6 = id_5[id_8]) begin : LABEL_0
    wire id_19;
    assign id_4[1] = id_5;
  end
  module_0 modCall_1 (
      id_1,
      id_17,
      id_2,
      id_17,
      id_10,
      id_3,
      id_6,
      id_13,
      id_17,
      id_16,
      id_17,
      id_18
  );
endmodule
