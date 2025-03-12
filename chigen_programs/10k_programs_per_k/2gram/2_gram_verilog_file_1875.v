// Seed: 855892987
module module_0 (
    output uwire id_0,
    input wand id_1,
    input wand id_2,
    output tri0 id_3,
    input supply1 id_4,
    output wand id_5,
    input wand id_6,
    output supply0 id_7,
    output tri id_8,
    input tri0 id_9,
    output wire id_10
);
endmodule
macromodule module_1 (
    input  tri0  id_0,
    output uwire id_1
    , id_8,
    input  wand  id_2,
    input  tri0  id_3,
    output wire  id_4,
    output uwire id_5,
    output tri0  id_6
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_4,
      id_0,
      id_6,
      id_6,
      id_3,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
