// Seed: 2385916015
macromodule module_0 (
    output wand id_0,
    output wor id_1,
    output tri0 id_2,
    input uwire id_3,
    input supply1 id_4,
    output supply0 id_5
);
  assign id_0 = 1;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input tri id_2,
    input tri0 id_3,
    output wor id_4,
    input supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    output wire id_8
);
  assign id_8 = 1'b0;
  id_10(
      .id_0(1'b0 - id_3 * id_7), .id_1(1), .id_2()
  );
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_1,
      id_5,
      id_7
  );
endmodule
