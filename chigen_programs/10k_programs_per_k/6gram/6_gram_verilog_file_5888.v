// Seed: 1704630218
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    output tri id_4,
    output wand id_5,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    input supply0 id_9,
    input tri1 id_10,
    input supply0 id_11,
    output uwire id_12,
    output supply0 id_13
);
  assign id_3 = id_11;
endmodule
module module_1 (
    output tri1  id_0,
    input  wor   id_1,
    input  tri   id_2,
    input  uwire id_3,
    output tri   id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
