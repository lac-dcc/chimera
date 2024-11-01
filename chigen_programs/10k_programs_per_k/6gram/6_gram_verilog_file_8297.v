// Seed: 744423771
module module_0 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  tri   id_5,
    input  tri0  id_6,
    output tri   id_7,
    input  uwire id_8,
    output tri   id_9
);
  generate
    wire module_0;
    for (id_11 = id_3 + {id_6, id_6} - 1'b0; 1'b0; id_7 = 1'd0) begin
      supply1 id_12 = 1;
    end
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    output uwire id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    output wor id_6,
    output wire id_7,
    input supply1 id_8,
    input tri0 id_9,
    input wand id_10,
    input tri0 id_11,
    input wand id_12,
    input wire id_13
    , id_15
);
  wire id_16;
  xor (id_2, id_9, id_4, id_1, id_0, id_5, id_10, id_13);
  module_0(
      id_9, id_10, id_10, id_5, id_1, id_3, id_11, id_6, id_0, id_2
  );
endmodule
