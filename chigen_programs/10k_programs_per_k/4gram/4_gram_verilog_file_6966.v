// Seed: 3722834161
module module_0 #(
    parameter id_32 = 32'd10
) (
    input tri id_0,
    input wand id_1,
    input tri id_2,
    output uwire id_3,
    output supply0 id_4,
    input tri1 id_5,
    input wor id_6,
    output supply1 id_7,
    output supply1 id_8,
    output wire id_9,
    output tri1 id_10,
    output tri0 id_11,
    input wand id_12,
    output supply0 id_13,
    output tri0 id_14,
    input supply0 id_15,
    input uwire id_16,
    input tri1 id_17,
    input tri0 id_18,
    input supply0 id_19,
    output tri id_20
    , _id_32,
    input wand id_21,
    input tri1 id_22,
    output wor id_23,
    input wor id_24,
    output supply1 id_25,
    input tri id_26,
    output tri1 id_27,
    input supply1 id_28,
    input wire id_29,
    input tri1 id_30
);
  always_comb @(posedge 1'b0 or negedge id_0);
  assign (strong1, supply0) id_9 = -1'b0;
  localparam id_33 = 1;
  logic [1  <<  1 'b0 : id_32] id_34;
  wire id_35;
  wire id_36;
endmodule
module module_1 #(
    parameter id_1 = 32'd40,
    parameter id_4 = 32'd29,
    parameter id_6 = 32'd31
) (
    output tri0 id_0,
    input tri0 _id_1,
    output wor id_2,
    input wire id_3,
    input supply0 _id_4,
    output tri1 id_5,
    input tri1 _id_6
);
  logic [-1 'h0 : id_4] id_8, id_9;
  assign id_9 = -1'h0;
  localparam id_10 = 1 == 1;
  logic id_11;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_5,
      id_2,
      id_2,
      id_0,
      id_5,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_2,
      id_3,
      id_5,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_9 = 0;
  assign id_8 = id_9;
  parameter id_12 = |id_10;
  assign id_0 = id_1 - id_10#(.id_3(1));
  supply0 id_13;
  assign id_13 = id_11 && -1'b0;
  parameter id_14 = -1;
  assign id_11[id_6+:id_1] = id_3;
  final $signed(74);
  ;
  parameter id_15 = id_10 & -1;
  wire [-1 : 1] id_16, id_17;
  wire id_18;
endmodule
