// Seed: 1921748093
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input tri id_7
);
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input wand id_3,
    output wor id_4,
    output wor id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri0 id_8
);
  assign id_0 = -1;
  assign id_5 = id_0++;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_8,
      id_3,
      id_5,
      id_6,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
