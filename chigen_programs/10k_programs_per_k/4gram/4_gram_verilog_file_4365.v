// Seed: 3902561021
module module_0 (
    output wor id_0,
    input tri0 id_1
    , id_10,
    input tri1 id_2,
    output wor id_3,
    input supply1 id_4,
    output tri0 id_5,
    input uwire id_6,
    output wire id_7,
    output tri id_8
);
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input uwire id_2,
    input wor id_3,
    output supply1 id_4
);
  wor id_6, id_7, id_8, id_9, id_10, id_11;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_4
  );
  assign modCall_1.type_11 = 0;
  assign id_11 = 1;
  and primCall (id_4, id_8, id_6, id_7, id_11);
endmodule
