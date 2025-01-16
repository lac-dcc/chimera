// Seed: 3526705615
module module_0 (
    output supply1 id_0,
    output wand id_1,
    output supply1 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply0 id_9
);
  wire id_11;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    output uwire id_5,
    input uwire id_6,
    output tri0 id_7,
    input supply1 id_8
);
  supply0 id_10 = -1;
  wire id_11;
  nand primCall (id_7, id_4, id_8, id_2, id_11, id_1, id_13, id_10, id_6, id_3, id_12);
  assign id_5 = 1;
  supply1 id_12;
  assign id_7 = id_12 == 1;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_7,
      id_4,
      id_1,
      id_8,
      id_6,
      id_8,
      id_5,
      id_4
  );
  assign modCall_1.id_6 = 0;
  assign id_0 = 1 | id_8;
endmodule
