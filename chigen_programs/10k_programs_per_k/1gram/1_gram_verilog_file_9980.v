// Seed: 2624092352
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output tri id_2,
    output supply1 id_3,
    input uwire id_4,
    output tri1 id_5,
    input supply1 id_6,
    input tri1 id_7
);
  wire id_9;
  id_10(
      id_6
  );
  wire id_11, id_12, id_13;
endmodule
macromodule module_1 (
    output uwire id_0,
    input wand id_1,
    input tri0 id_2,
    output supply1 id_3,
    output wand id_4,
    output wand id_5,
    input supply0 id_6,
    input tri1 id_7
);
  assign (weak1, pull0) id_0 = id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6
  );
  assign modCall_1.type_14 = 0;
  always_comb $display((1) == 1, 1, 1, id_7, 1);
  wire id_9;
endmodule
