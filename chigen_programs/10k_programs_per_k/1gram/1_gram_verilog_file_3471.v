// Seed: 1733094672
module module_0 #(
    parameter id_11 = 32'd24
) (
    input tri id_0,
    input supply1 id_1,
    output uwire id_2,
    output tri1 id_3,
    output wor id_4,
    output wire id_5,
    output tri0 id_6,
    input uwire id_7,
    output wor id_8,
    output uwire id_9,
    input wire id_10,
    input tri _id_11,
    output wand id_12
);
  wire id_14;
  logic id_15;
  wire ["" : -1] id_16;
  logic id_17;
  logic [7:0] id_18, id_19[1 'b0 : ""], id_20;
  logic id_21;
  always @(posedge (id_19) or posedge id_18) $signed(60);
  ;
  assign id_2 = id_18[id_11] - {-1 * |id_16 + -1'b0, id_20, id_20};
endmodule
program module_1 #(
    parameter id_15 = 32'd27,
    parameter id_19 = 32'd50,
    parameter id_19 = 32'd36,
    parameter id_22 = 32'd60,
    parameter id_24 = 32'd18,
    parameter id_5  = 32'd5
) (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    inout supply0 id_3,
    input uwire id_4,
    input wire _id_5,
    output wand id_6,
    input tri0 id_7,
    output tri id_8,
    output wire id_9,
    input uwire id_10,
    input wor id_11,
    input wand id_12,
    input tri0 id_13,
    input supply1 id_14,
    input tri1 _id_15,
    output tri0 id_16,
    input tri1 id_17
);
  parameter id_19 = 1;
  bit [-1 : {  id_5  ,  -1 'b0 ,  id_19  }] id_20, id_21, _id_22;
  wire [id_22 : 1  -  id_15] id_23, _id_24;
  parameter id_25 = -1;
  wire id_26;
  ;
  assign id_21 = -1;
  logic id_27 = id_24;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_9,
      id_6,
      id_3,
      id_6,
      id_3,
      id_11,
      id_6,
      id_9,
      id_14,
      id_19,
      id_3
  );
  assign modCall_1.id_5 = 0;
  assign id_27 = ~1;
  logic [7:0][id_24][-1] id_28;
  initial id_20 <= -1 - 1 + id_17;
  assign id_9 = id_19 <-> id_4;
  logic id_29;
  ;
  logic id_30;
  defparam id_19 = id_19;
endprogram
