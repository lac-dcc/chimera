// Seed: 2013781344
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output tri id_2,
    output supply1 id_3,
    output tri id_4,
    input uwire id_5,
    output tri1 id_6,
    output wor id_7,
    output supply0 id_8,
    output supply1 id_9,
    input tri0 id_10,
    input wand id_11,
    input tri id_12
);
  assign id_2 = id_12;
  wire id_14;
endmodule
macromodule module_1 (
    output tri  id_0,
    output tri1 id_1,
    input  tri1 id_2,
    output wor  id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
