// Seed: 2445549085
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_6 [1 : ""];
  wire  id_7;
  always force id_4 = 1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_12 = 32'd98,
    parameter id_17 = 32'd84,
    parameter id_19 = 32'd95,
    parameter id_7  = 32'd76
) (
    output tri id_0,
    input wire id_1,
    input wand id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wor id_5,
    input wand id_6,
    input supply1 _id_7,
    output tri0 id_8,
    input uwire id_9,
    output wand id_10,
    input supply0 id_11,
    input tri _id_12,
    input wor id_13,
    input supply1 id_14,
    input supply1 id_15,
    input supply0 id_16,
    input tri0 _id_17,
    input supply0 id_18,
    output wand _id_19,
    output tri0 id_20
);
  logic [7:0][-1 : id_12] id_22;
  logic [id_7 : id_19] id_23[1 'h0 : 1 'b0] = id_22[id_17];
  module_0 modCall_1 (
      id_23,
      id_23,
      id_23,
      id_23,
      id_23
  );
  assign id_4 = 1'b0 || 1;
  nand primCall (
      id_0, id_23, id_3, id_2, id_6, id_11, id_16, id_14, id_15, id_13, id_9, id_22, id_18
  );
endmodule
