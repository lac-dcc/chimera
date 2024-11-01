// Seed: 1003339644
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri id_2,
    input uwire id_3,
    output wand id_4,
    input tri1 id_5,
    output tri0 id_6,
    input supply1 id_7
);
  assign id_4 = 1;
endmodule
module module_1 (
    output tri  id_0,
    input  wand id_1,
    output tri0 id_2,
    output wire id_3,
    output wor  id_4,
    output wor  id_5,
    output tri1 id_6
);
  assign id_4 = id_1;
  assign id_3 = id_1 - 1;
  module_0(
      id_3, id_1, id_1, id_1, id_5, id_1, id_5, id_1
  );
endmodule
