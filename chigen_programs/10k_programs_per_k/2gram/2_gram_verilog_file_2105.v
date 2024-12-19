// Seed: 1077018528
module module_0 (
    output wand  id_0,
    output tri0  id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  uwire id_4,
    input  wor   id_5,
    output tri   id_6,
    input  wor   id_7
);
  assign id_1 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wire id_4,
    input wand id_5
);
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_5
  );
  assign modCall_1.type_13 = 0;
  assign id_1 = id_5 ^ 'b0 == id_3;
endmodule
