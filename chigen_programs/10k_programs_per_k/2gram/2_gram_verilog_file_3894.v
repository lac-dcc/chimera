// Seed: 2404647232
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input wor id_5,
    input supply1 id_6,
    input supply1 id_7
);
  module_2 modCall_1 (
      id_7,
      id_0
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    output tri0  id_2
);
  tri id_4 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 (
    input  wand id_0,
    output tri  id_1
);
  wire id_3;
  module_3 modCall_1 (id_0);
  assign modCall_1.id_2 = 0;
endmodule
module module_3 (
    input supply1 id_0
);
  tri id_2;
  assign id_2 = 1;
endmodule
