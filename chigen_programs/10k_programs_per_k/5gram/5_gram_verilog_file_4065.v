// Seed: 2054697282
module module_1 (
    input tri id_0,
    output tri module_0,
    output uwire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output tri0 id_6,
    output supply1 id_7
);
endmodule
module module_1 (
    output tri   id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output uwire id_3,
    output wand  id_4
);
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4,
      id_1,
      id_2,
      id_1,
      id_0,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output tri  id_0,
    output tri0 id_1,
    output wand id_2,
    input  wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.type_2 = 0;
  wor id_6 = 1;
endmodule
