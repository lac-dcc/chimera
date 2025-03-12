// Seed: 3860687182
module module_0 (
    output tri1 id_0,
    output wor  id_1,
    output tri  id_2,
    input  tri  id_3,
    input  wand id_4
);
  assign id_1 = id_4;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri id_3,
    input supply0 id_4,
    output tri0 id_5,
    input wor id_6,
    output supply0 id_7
);
  wire [-1 : 1] id_9;
  or primCall (id_5, id_4, id_9, id_6, id_2, id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_0 = 0;
  rnmos (-1, -1, id_6);
  assign id_5 = 1;
endmodule
