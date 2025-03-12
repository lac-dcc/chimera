// Seed: 3510898412
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
    id_22,
    id_23
);
  inout wire id_23;
  output wire id_22;
  output wire id_21;
  input wire id_20;
  inout tri1 id_19;
  input wire id_18;
  output wire id_17;
  output uwire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output uwire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_19 = 1;
  wire id_24;
  assign id_12 = 1 / id_7;
  assign id_16 = 1;
  wire id_25;
  ;
  assign id_21 = id_13 / id_25;
  assign id_25 = -1;
  assign id_11 = (id_18);
endmodule
module module_1 #(
    parameter id_1 = 32'd35,
    parameter id_7 = 32'd29
) (
    _id_1,
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
    id_13
);
  output wire id_13;
  output wire id_12;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_9,
      id_9,
      id_9,
      id_13,
      id_9,
      id_9,
      id_2,
      id_3,
      id_12,
      id_8,
      id_9,
      id_13,
      id_3,
      id_9,
      id_12,
      id_2,
      id_9,
      id_2,
      id_12,
      id_9,
      id_9
  );
  output reg id_11;
  input logic [7:0] id_10;
  inout wire id_9;
  output wire id_8;
  inout wire _id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  input logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  inout wire _id_1;
  assign id_5[-1] = id_4;
  wire id_14;
  ;
  always_comb @(posedge id_10[id_7+:1]) begin : LABEL_0
    #1 if (1 <= 1) id_11 = id_10 >> id_10;
  end
  assign id_5 = id_4[id_1];
endmodule
