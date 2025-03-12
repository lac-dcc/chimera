// Seed: 1295154557
module module_0 (
    input  tri1 id_0,
    output wor  id_1,
    input  tri  id_2,
    input  tri  id_3,
    input  wand id_4
);
  pullup (id_0, id_3);
  module_2 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_3,
      id_1
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input uwire id_2,
    output supply0 id_3,
    input wor id_4
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    output tri id_3,
    input supply1 id_4,
    output wand id_5
);
  assign id_5 = ~id_2 == -1;
  assign module_0.id_1 = 0;
endmodule
