// Seed: 1494880001
module module_0 (
    input  tri0  id_0,
    output wand  id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output wor   id_5,
    output tri0  id_6,
    input  wand  id_7,
    output tri   id_8,
    input  uwire id_9,
    input  tri1  id_10
);
  wire id_12 = id_12;
  assign module_1.type_19 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input supply1 id_2,
    output tri1 id_3,
    output supply1 id_4,
    output tri1 id_5,
    output tri id_6,
    output wand id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10,
    input uwire id_11,
    input uwire id_12,
    input uwire id_13,
    input wor id_14,
    output wor id_15,
    output uwire id_16
);
  assign id_7 = ~-1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_13,
      id_12,
      id_13,
      id_5,
      id_15,
      id_12,
      id_16,
      id_13,
      id_9
  );
  generate
    assign id_4 = -1'b0;
  endgenerate
  xnor primCall (id_16, id_14, id_11, id_0, id_10, id_2, id_13, id_8, id_12);
endmodule
