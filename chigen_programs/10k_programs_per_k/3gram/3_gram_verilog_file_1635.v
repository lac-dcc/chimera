// Seed: 2276473531
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output tri0 id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri1 id_6
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    output tri0 id_1,
    input  tri1 id_2,
    input  wand id_3,
    input  tri  id_4,
    input  tri0 id_5,
    input  tri  id_6,
    input  wor  id_7,
    inout  wor  id_8
);
  assign {id_3 != id_3 ^ 1, id_7 & 1} = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5,
      id_3,
      id_6
  );
endmodule
