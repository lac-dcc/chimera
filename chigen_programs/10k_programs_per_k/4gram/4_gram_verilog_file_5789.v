// Seed: 1249701068
module module_0 (
    output uwire id_0,
    output tri1  id_1,
    output wire  id_2,
    input  tri0  id_3,
    input  tri1  id_4
);
  always @(id_3 + id_4) id_2 = id_3;
  module_2(
      id_3, id_3, id_2, id_0, id_3, id_1
  );
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    output tri0  id_2
);
  module_0(
      id_2, id_2, id_0, id_1, id_1
  );
endmodule
module module_2 (
    input  wor   id_0,
    input  wand  id_1,
    output uwire id_2,
    output tri   id_3,
    input  wand  id_4,
    output wor   id_5
);
  assign id_3 = id_4;
  wire  id_7;
  uwire id_8 = {id_0, 1};
endmodule
