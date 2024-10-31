// Seed: 1012816884
macromodule module_0 (
    input  uwire id_0,
    output tri0  id_1,
    output wand  id_2,
    output wand  id_3,
    input  tri   id_4
);
  for (id_6 = 1'b0; id_4; id_3 = id_6) begin
    assign id_6 = 1;
  end
  xnor (id_1, id_6, id_4, id_0);
  module_2(
      id_2, id_0, id_0, id_6
  );
  assign id_1 = id_4 & 1;
endmodule
module module_1 (
    input  wire id_0,
    input  tri0 id_1,
    output wire id_2,
    input  wor  id_3
);
  assign id_2 = id_0;
  xor (id_2, id_3, id_1, id_0);
  module_0(
      id_3, id_2, id_2, id_2, id_3
  );
endmodule
module module_2 (
    output tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  wor   id_3
);
  wire id_5;
endmodule
