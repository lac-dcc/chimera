// Seed: 3720319860
module module_0 (
    input wand id_0,
    input wand id_1,
    input wor id_2,
    input tri1 id_3,
    input wor id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wire id_7[-1 : 1],
    input supply0 id_8,
    output tri0 id_9,
    output uwire id_10,
    output wor id_11,
    output uwire id_12,
    input wor id_13,
    input supply1 id_14[-1 'd0 : -1]
);
  wire id_16;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd73,
    parameter id_8 = 32'd47
) (
    input  tri   id_0,
    input  wor   id_1 [1 'h0 : id_2],
    input  uwire _id_2,
    input  uwire id_3,
    output wor   id_4
);
  wire  id_6;
  logic id_7;
  ;
  wire _id_8[1 : 1], id_9[1 : id_8], id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_4,
      id_0,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
