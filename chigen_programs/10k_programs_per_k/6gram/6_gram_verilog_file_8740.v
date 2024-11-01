// Seed: 3175693270
module module_0 (
    input  tri0  id_0,
    output tri0  id_1,
    input  tri1  id_2,
    output tri0  id_3,
    input  wand  id_4,
    input  wor   id_5,
    input  uwire id_6,
    input  tri0  id_7,
    input  wor   id_8,
    output tri   id_9,
    input  tri0  id_10,
    output tri   id_11
);
  wire id_13;
  generate
    for (id_14 = 1'b0; 1 & id_14; id_11 = (1)) begin : id_15
      assign id_15 = id_6 - 1;
    end
  endgenerate
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  wire  id_5,
    output tri0  id_6,
    output uwire id_7
);
  wire id_9;
  module_0(
      id_3, id_6, id_1, id_7, id_5, id_3, id_5, id_1, id_3, id_6, id_4, id_7
  );
  wire id_10;
endmodule
