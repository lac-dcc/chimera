// Seed: 4158482167
program module_0 (
    output wand id_0,
    output wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wire id_4,
    input wor id_5,
    output wire id_6,
    output supply0 id_7,
    input tri0 id_8,
    output uwire id_9,
    output wand id_10,
    output wand id_11,
    input tri id_12,
    input tri0 id_13,
    input wire id_14[-1 : 1 'b0]
);
  wire id_16, id_17;
  assign id_6 = 1'b0;
  assign module_1.id_4 = 0;
  logic id_18;
  ;
endprogram
module module_1 #(
    parameter id_11 = 32'd29,
    parameter id_2  = 32'd43,
    parameter id_7  = 32'd35,
    parameter id_8  = 32'd77
) (
    input supply1 id_0,
    input uwire id_1,
    output wand _id_2,
    input tri id_3,
    input supply1 id_4,
    output wand id_5,
    input tri1 id_6,
    input uwire _id_7[id_11 : id_2],
    input tri0 _id_8,
    input tri1 id_9[id_8 : id_7  &  1 'd0],
    input wor id_10,
    input tri _id_11
);
  tri1 id_13, id_14, id_15, id_16[-1 : 1 'b0];
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_3,
      id_4,
      id_3,
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0,
      id_10
  );
  assign id_16 = id_13;
  assign id_15 = 1;
  assign id_16 = id_4;
endmodule
