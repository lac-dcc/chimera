// Seed: 423536484
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output wand id_2,
    output tri0 id_3,
    output wand id_4,
    output tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    output supply0 id_8,
    input wor id_9,
    input wor id_10
);
  assign id_3 = 1'b0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wand  id_3,
    output tri1  id_4,
    input  tri   id_5,
    input  wor   id_6
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3
  );
endmodule
