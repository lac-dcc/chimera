// Seed: 3527152936
module module_0 (
    id_1,
    id_2,
    id_3,
    module_0,
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
    id_23,
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  input wire id_20;
  output wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_12 = 1;
  logic id_27;
  ;
  wire id_28;
  ;
  wire  id_29 = !1;
  logic id_30;
endmodule
module module_1 #(
    parameter id_2 = 32'd35,
    parameter id_3 = 32'd77,
    parameter id_5 = 32'd0,
    parameter id_8 = 32'd38
) (
    output wand id_0
    , id_7,
    output logic id_1,
    input tri1 _id_2,
    input supply1 _id_3,
    input tri1 id_4,
    input uwire _id_5
);
  wire [id_5 : id_3] _id_8;
  supply1 id_9;
  assign id_9 = id_7[id_8 : id_2] - 1'b0;
  assign id_1 = id_7;
  always @(posedge id_9 or negedge -1) begin : LABEL_0
    id_1 <= id_4;
  end
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_9,
      id_10,
      id_9,
      id_10,
      id_10,
      id_9,
      id_9,
      id_10,
      id_9,
      id_9,
      id_10,
      id_10,
      id_10,
      id_9,
      id_10,
      id_9,
      id_10,
      id_10,
      id_10,
      id_10,
      id_9,
      id_9,
      id_9,
      id_9,
      id_10
  );
endmodule
