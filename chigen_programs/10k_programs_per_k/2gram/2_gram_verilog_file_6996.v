// Seed: 2076865274
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input wand id_2,
    input tri id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri1 id_6
);
  assign id_1 = -1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    output wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output wand id_8,
    input wor id_9
);
  module_0 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_9,
      id_9,
      id_8,
      id_4
  );
  assign id_5 = !1;
endmodule
