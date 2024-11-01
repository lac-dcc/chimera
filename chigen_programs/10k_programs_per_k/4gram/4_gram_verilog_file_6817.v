// Seed: 578720
module module_0 (
    input  wand  id_0,
    output tri0  id_1,
    output wand  id_2,
    input  tri1  id_3,
    input  tri0  id_4,
    output wand  id_5,
    output tri1  id_6,
    input  uwire id_7,
    input  wire  id_8,
    output uwire id_9,
    output wand  id_10,
    input  wand  id_11,
    output tri1  id_12,
    output tri   id_13,
    output tri0  id_14,
    output tri1  id_15
);
  generate
    always @(posedge id_4, posedge 1'b0) id_13 += id_3;
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    output supply0 id_1,
    output tri id_2,
    input tri1 id_3,
    output supply1 id_4,
    output wire id_5,
    input supply1 id_6
);
  assign id_4 = 1;
  module_0(
      id_3, id_5, id_5, id_0, id_3, id_2, id_1, id_0, id_0, id_5, id_2, id_0, id_4, id_2, id_1, id_1
  );
  assign id_2 = 1 ? 1 : id_6;
endmodule
