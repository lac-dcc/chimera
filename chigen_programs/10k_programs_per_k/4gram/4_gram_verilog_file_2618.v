// Seed: 2173388800
module module_0 (
    output tri id_0,
    input supply1 id_1,
    output uwire id_2,
    input supply1 id_3,
    output tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output supply0 id_7,
    input wand id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply0 id_11
);
  assign id_2 = -1 ? id_10 : !id_6;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    output supply1 id_7,
    input tri id_8
);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_1,
      id_8,
      id_3,
      id_5,
      id_6,
      id_1,
      id_0,
      id_2,
      id_8,
      id_0
  );
endmodule
