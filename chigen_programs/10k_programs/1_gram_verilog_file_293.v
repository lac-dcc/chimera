// Seed: 2883206159
macromodule module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    output tri1 id_4,
    input supply0 id_5
);
  assign id_4 = id_2;
  wire id_7, id_8;
  module_2(
      id_2, id_4, id_4, id_1, id_4, id_4
  );
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input supply1 id_2
);
  assign id_1 = id_0;
  wire id_4;
  module_0(
      id_2, id_1, id_0, id_2, id_1, id_0
  );
endmodule
macromodule module_2 (
    input wor id_0,
    output wor id_1,
    output tri0 id_2,
    output supply0 id_3,
    output tri id_4,
    output tri0 id_5
);
  assign id_4 = 1 && id_0;
  assign id_2 = id_0;
endmodule
