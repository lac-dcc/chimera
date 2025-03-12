// Seed: 1728331229
module module_0 (
    input uwire id_0,
    output tri id_1,
    output wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    input supply0 id_6,
    output tri0 id_7,
    input wand id_8,
    output wire id_9
);
  wire id_11;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6,
    output supply0 id_7,
    output supply1 id_8,
    input supply0 id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 id_12
);
  assign id_7 = {id_5, -1, -1, 1, id_3, 1, id_9, id_11};
  xnor primCall (id_8, id_5, id_9, id_3, id_11, id_1, id_2, id_10, id_4, id_12);
  module_0 modCall_1 (
      id_11,
      id_7,
      id_8,
      id_5,
      id_11,
      id_8,
      id_9,
      id_6,
      id_10,
      id_8
  );
endmodule
