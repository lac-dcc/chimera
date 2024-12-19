// Seed: 2093682785
module module_0 (
    output tri1 id_0,
    output tri id_1,
    output wire id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    output wire id_8
);
  tri1 id_10 = {1, 1, 1, id_6, id_10, 1};
  generate
    wire id_11, id_12, id_13;
  endgenerate
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wand id_2,
    output wor id_3,
    output tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    inout supply1 id_8,
    output wand id_9,
    output wire id_10
);
  assign id_4 = id_8;
  xnor primCall (id_3, id_0, id_1, id_8, id_6, id_7, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8,
      id_3
  );
endmodule
