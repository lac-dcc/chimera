// Seed: 3616644899
module module_0 (
    output tri0 id_0
);
  always_comb $display(1);
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    output wor id_2,
    input supply0 id_3
);
  wire id_5, id_6;
  module_0 modCall_1 (id_2);
endmodule
macromodule module_2 (
    input wor id_0,
    output supply0 id_1,
    output uwire id_2,
    input supply0 id_3
);
  wire id_5;
  module_0 modCall_1 (id_2);
  assign modCall_1.type_0 = 0;
endmodule
module module_3 (
    input wire id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    output tri1 id_4
);
  assign id_2 = id_3 === 1 ^ id_3;
  wire id_6 = id_0;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
endmodule
