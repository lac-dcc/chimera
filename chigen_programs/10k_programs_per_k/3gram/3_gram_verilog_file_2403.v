// Seed: 2535163162
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 #(
    parameter id_10 = 32'd92,
    parameter id_12 = 32'd86,
    parameter id_17 = 32'd25,
    parameter id_20 = 32'd52
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
    _id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    _id_20,
    id_21,
    id_22,
    id_23
);
  inout wire id_23;
  output wire id_22;
  input wire id_21;
  output wire _id_20;
  input wire id_19;
  input wire id_18;
  input wire _id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  module_0 modCall_1 (
      id_1,
      id_16
  );
  output wire _id_12;
  input wire id_11;
  input wire _id_10;
  output wire id_9;
  input wire id_8;
  output reg id_7;
  output wand id_6;
  output reg id_5;
  input logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  struct packed {
    logic [id_20 : -1] id_24;
    logic id_25;
  } [1 : id_10  ==  id_12] id_26;
  always
    if (1) begin : LABEL_0
      id_7 <= id_4[1];
    end else id_5 = (id_16 | 1'd0);
  assign id_7 = id_14 - id_23;
  parameter id_27 = -1;
  wire [id_17 : (  id_10  )] id_28 = id_26.id_25;
  assign id_6  = id_26.id_25 ^ 1;
  assign id_26 = $unsigned(78);
  ;
endmodule
