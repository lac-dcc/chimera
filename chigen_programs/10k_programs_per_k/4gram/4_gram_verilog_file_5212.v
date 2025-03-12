// Seed: 1686282259
module module_0;
  logic id_1 = 1'b0;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input wire id_2,
    input tri1 id_3,
    input uwire id_4,
    output supply0 id_5,
    input uwire id_6,
    input wand id_7,
    input uwire id_8
);
  wire id_10;
  module_0 modCall_1 ();
  always id_1 <= 1;
endmodule
module module_2 #(
    parameter id_10 = 32'd23,
    parameter id_2  = 32'd29,
    parameter id_26 = 32'd96,
    parameter id_6  = 32'd44
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout reg id_17;
  input wire id_16;
  input wire id_15;
  inout reg id_14;
  inout wire id_13;
  output reg id_12;
  nand primCall (id_1, id_11, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_3, id_4);
  input wire id_11;
  input wire _id_10;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output logic [7:0] id_9;
  output wire id_8;
  output wire id_7;
  input wire _id_6;
  output wire id_5;
  inout wand id_4;
  input wire id_3;
  input wire _id_2;
  output wire id_1;
  assign #id_21 id_12 = id_4;
  final begin : LABEL_0
    id_17 <= -1;
    id_9[1 :-1] <= -1 ** 1 - -1'b0;
  end
  wire id_22;
  initial begin : LABEL_1
    id_14 = id_11;
    assert (id_16);
  end
  logic [7:0] id_23, id_24;
  wire id_25;
  assign id_4 = 1;
  logic _id_26, id_27, id_28;
  wire [id_2  !==  1 'b0 : id_10] id_29;
  always_comb @(posedge id_27 or posedge -1'b0 - id_27[-1+:1]) begin : LABEL_2
    id_12 <= id_28[id_6 :-1'b0] ? -1 : -1;
  end
  logic id_30;
  pmos (id_23[-1 : id_26], id_20, id_15 - -1);
  assign id_14 = 1;
endmodule
