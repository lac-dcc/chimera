// Seed: 1724551922
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    input supply1 id_4
);
  always_ff @(-1) begin : LABEL_0
    if (1) assume (id_0);
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd26,
    parameter id_7 = 32'd40
) (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    input  uwire _id_6,
    input  wand  _id_7,
    input  wire  id_8
);
  wire [id_6 : id_7] id_10;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_4,
      id_1,
      id_2
  );
  logic [1 : -1] id_11;
  xnor primCall (id_5, id_2, id_3, id_1, id_8, id_10, id_4);
endmodule
