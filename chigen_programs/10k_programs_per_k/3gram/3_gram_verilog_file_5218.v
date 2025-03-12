// Seed: 1812728452
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    output wand id_3,
    input tri1 id_4,
    output uwire id_5,
    input tri0 id_6,
    input tri1 id_7
);
  wire id_9;
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input tri1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6,
    input tri1 id_7,
    input tri1 id_8
);
  assign id_1 = id_2;
  xnor primCall (id_1, id_6, id_8, id_2, id_4, id_7);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3,
      id_6,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule
