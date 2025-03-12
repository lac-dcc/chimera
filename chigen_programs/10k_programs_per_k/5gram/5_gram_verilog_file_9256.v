// Seed: 2412455390
module module_0;
  logic id_1;
  ;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wor id_4,
    input supply1 id_5
    , id_11,
    input supply0 id_6
    , id_12,
    output supply0 id_7,
    output wire id_8,
    input tri0 id_9
);
  assign id_11 = 1 && 1;
  nand primCall (id_3, id_4, id_5, id_6, id_9);
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_12 = 32'd88,
    parameter id_17 = 32'd19,
    parameter id_6  = 32'd10,
    parameter id_7  = 32'd32
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17,
    id_18,
    id_19
);
  input wire id_19;
  inout wire id_18;
  input wire _id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire _id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire _id_7;
  inout wire _id_6;
  output logic [7:0] id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  wire id_20;
  logic [-1 : 1  &&  (  id_12  )] id_21;
  ;
  wire id_22;
  wire [id_7 : 1] id_23;
  parameter id_24 = 1;
  wire [1 : 1] id_25;
  always @(negedge id_19) begin : LABEL_0
    deassign id_25;
  end
  module_0 modCall_1 ();
  assign id_5[1] = 1;
  logic [id_17 : -1  ==  id_6] id_26;
  wire [1 'b0 : id_17] \id_27 ;
  wire id_28 = id_24;
  wire id_29;
  wire id_30;
  assign id_3[1'b0] = id_21 ? 1 : -1;
  assign id_20 = -1 == -1;
endmodule
