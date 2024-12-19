// Seed: 3321797908
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    output supply1 id_4,
    input uwire id_5,
    input uwire id_6,
    input uwire id_7,
    output wor id_8,
    input wor id_9,
    input tri1 id_10
);
  assign id_0 = 1;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri1 id_1,
    output wand id_2,
    output tri  id_3,
    input  wire id_4,
    input  wor  id_5,
    output tri  id_6
);
  assign id_3 = id_1 && id_0 == id_4;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_0
  );
  assign modCall_1.id_6 = 0;
endmodule
