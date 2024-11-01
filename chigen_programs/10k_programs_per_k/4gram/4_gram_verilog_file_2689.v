// Seed: 116310735
module module_0 (
    input tri1 id_0,
    output wire id_1,
    output supply1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output wor id_5,
    input tri id_6,
    output tri0 id_7,
    output wor id_8,
    input wor id_9,
    input supply1 id_10,
    input tri0 id_11
);
  assign id_1 = 1'd0;
endmodule
module module_1 (
    output tri0  id_0,
    output uwire id_1,
    output wand  id_2,
    input  tri   id_3,
    input  tri0  id_4,
    input  wire  id_5
);
  always @(posedge 1'b0) id_2 = 1 - id_4;
  module_0(
      id_3, id_0, id_2, id_1, id_5, id_2, id_4, id_0, id_2, id_5, id_5, id_3
  );
endmodule
