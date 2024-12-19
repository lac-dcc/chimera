// Seed: 4233197139
macromodule module_0 (
    input supply0 id_0,
    output wor id_1,
    input tri id_2,
    input wand id_3,
    output tri id_4
);
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    output tri id_3,
    input tri1 id_4,
    input supply0 id_5,
    output tri1 id_6
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    output wire  id_1,
    output tri0  id_2
);
  wire id_4, id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
