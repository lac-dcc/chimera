// Seed: 3968474457
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5
    , id_9,
    input wand id_6,
    input supply1 id_7
);
  id_10(
      .id_0(), .id_1(1), .id_2(id_1), .id_3(1), .id_4(id_4), .id_5(id_5), .id_6(id_3), .id_7(1)
  );
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output tri   id_2
);
  assign id_2 = 1 == id_1;
  assign id_0 = id_1 == id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
