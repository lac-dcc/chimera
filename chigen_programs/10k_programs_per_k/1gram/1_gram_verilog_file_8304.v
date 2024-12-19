// Seed: 1321056018
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wor id_4,
    output wor id_5,
    output tri1 id_6,
    input wand id_7,
    input tri id_8,
    output tri1 id_9
);
  module_2 modCall_1 (id_1);
  assign modCall_1.id_0 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    output uwire id_2
);
  not primCall (id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_4, id_5, id_6;
endmodule
module module_2 (
    output supply1 id_0
);
endmodule
