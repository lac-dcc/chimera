// Seed: 2810166161
macromodule module_0 (
    input  tri0  id_0,
    output uwire id_1,
    output uwire id_2,
    output wor   id_3,
    input  tri1  id_4,
    input  uwire id_5,
    input  uwire id_6
);
  wire id_8, id_9;
  always_latch
  `define pp_10 0
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    output supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    input wor id_6,
    output wire id_7,
    input tri0 id_8,
    output tri0 id_9,
    input tri0 id_10
);
  module_0(
      id_0, id_7, id_7, id_9, id_8, id_1, id_10
  );
  assign id_3 = id_8;
  not (id_2, id_1);
endmodule
