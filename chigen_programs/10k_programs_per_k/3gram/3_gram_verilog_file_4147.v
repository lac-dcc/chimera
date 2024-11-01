// Seed: 1676753252
module module_0 (
    output wor  id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    output wor  id_3,
    input  tri  id_4,
    input  wire id_5,
    input  wor  id_6,
    input  wor  id_7
);
  wand id_9 = 1'b0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    output tri id_2,
    output wire id_3,
    input tri1 id_4,
    output tri0 id_5
);
  assign id_3 = id_1;
  not (id_5, id_1);
  module_0(
      id_2, id_4, id_1, id_3, id_1, id_1, id_4, id_4
  );
endmodule
module module_2 (
    input  tri0 id_0,
    input  wire id_1,
    input  tri  id_2,
    output tri0 id_3
);
  assign id_3#({1, -1 * id_1 ? 1'b0 : 1}) = ~1;
  module_0(
      id_3, id_2, id_0, id_3, id_2, id_1, id_2, id_1
  );
endmodule
