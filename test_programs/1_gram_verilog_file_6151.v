// Seed: 750878279
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply0 id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    input supply0 id_10,
    output wand id_11
);
  id_13(
      id_5, 1, 1, id_5, 1
  );
endmodule
module module_1 (
    output tri  id_0,
    output wire id_1,
    input  wire id_2,
    input  tri1 id_3
);
  tri0 id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_2,
      id_3,
      id_5,
      id_3,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
