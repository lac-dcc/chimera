// Seed: 3506651406
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input wand id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    output wor id_6,
    input tri0 id_7
);
  assign id_6 = id_1 ? 1 : !id_3;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output wand id_1,
    output tri1 id_2,
    output wand id_3,
    input  tri  id_4
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_2,
      id_4
  );
endmodule
module module_2 (
    input  tri0 id_0,
    output tri0 id_1,
    input  wand id_2,
    input  wand id_3,
    output wand id_4
);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.type_11 = 0;
  id_6(
      id_3
  );
  wire id_7;
endmodule
