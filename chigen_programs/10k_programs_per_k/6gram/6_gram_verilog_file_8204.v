// Seed: 1216473693
module module_0 (
    input wand id_0,
    output uwire id_1,
    output supply0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    input tri id_7,
    output supply0 id_8,
    input tri id_9,
    output tri id_10,
    output wor id_11,
    input uwire id_12
);
endmodule
module module_1 (
    input  wand id_0,
    input  tri  id_1,
    input  wand id_2,
    input  tri1 id_3,
    output wand id_4
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
