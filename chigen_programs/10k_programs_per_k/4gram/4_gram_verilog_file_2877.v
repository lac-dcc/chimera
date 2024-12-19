// Seed: 3811164743
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    input  wand  id_2,
    output wor   id_3
    , id_5
);
  supply1 id_6 = 1;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output wor id_2,
    input wor id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7
);
  id_9(
      .id_0(id_3), .id_1(id_1), .id_2(1), .id_3(1), .id_4(1), .id_5(1), .id_6(1)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
  id_10(
      .id_0(id_2), .id_1(1 ^ id_3), .id_2('d0), .id_3(id_0), .id_4(1), .id_5(id_3 == 1)
  );
endmodule
