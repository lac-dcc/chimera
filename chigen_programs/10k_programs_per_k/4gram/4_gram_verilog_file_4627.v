// Seed: 1032592349
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input wor id_4,
    input tri0 id_5,
    output wand id_6,
    input wand id_7
);
  assign id_6 = id_7 ? 1 : 1;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = id_1;
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    output tri1 id_2
);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    output wor  id_0,
    output tri1 id_1,
    input  tri0 id_2
);
endmodule
