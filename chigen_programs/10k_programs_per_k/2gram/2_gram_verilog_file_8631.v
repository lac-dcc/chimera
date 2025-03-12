// Seed: 1658618235
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output tri1 id_2,
    output wire id_3,
    input wand id_4,
    output supply1 id_5
);
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input uwire id_2,
    output tri id_3,
    input tri id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3
  );
endmodule
macromodule module_2 (
    output wand id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    output uwire id_4,
    input uwire id_5,
    output wand id_6,
    output wand id_7,
    output uwire id_8
);
  assign id_6 = -1 == 1'b0;
  not primCall (id_8, id_2);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5,
      id_8
  );
endmodule
