// Seed: 90788250
module module_0 (
    input  wand  id_0,
    input  uwire id_1,
    input  tri0  id_2,
    output tri1  id_3,
    output wor   id_4,
    output wire  id_5
);
  assign id_5 = ~id_0;
  module_2(
      id_2, id_0, id_3, id_1, id_5
  );
endmodule
module module_1 (
    output tri1 id_0,
    output tri  id_1,
    input  tri1 id_2,
    output tri  id_3,
    output tri0 id_4
);
  uwire   id_6 = (1);
  supply1 id_7 = 1;
  or (id_0, id_2, id_6, id_7);
  module_0(
      id_2, id_2, id_2, id_0, id_3, id_0
  );
endmodule
module module_2 (
    input supply1 id_0,
    input tri id_1,
    output wor id_2,
    input tri1 id_3,
    output wire id_4
);
  tri1 id_6 = id_1 & id_1;
endmodule
