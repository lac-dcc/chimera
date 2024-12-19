// Seed: 3946015938
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    output wand id_3,
    input tri id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri0 id_7,
    input uwire id_8,
    input wand id_9,
    output supply0 id_10,
    input tri1 id_11
);
  tri id_13 = id_13;
  assign id_13 = id_7;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wor   id_2,
    output tri0  id_3
);
  assign id_0 = id_2;
  not primCall (id_0, id_2);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
