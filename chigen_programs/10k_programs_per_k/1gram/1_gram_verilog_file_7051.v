// Seed: 2022386056
module module_0 (
    input  tri1  id_0,
    output wor   id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  tri1  id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output wor   id_7,
    input  uwire id_8,
    input  tri1  id_9
);
  id_11(
      !id_9, id_6
  );
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1
    , id_13,
    output tri id_2,
    input wor id_3,
    input wand id_4,
    output supply0 id_5,
    input uwire id_6,
    input supply1 id_7,
    output supply0 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input tri1 id_11
);
  id_14(
      id_8, id_6
  );
  module_0 modCall_1 (
      id_3,
      id_8,
      id_6,
      id_9,
      id_9,
      id_9,
      id_6,
      id_5,
      id_4,
      id_3
  );
endmodule
