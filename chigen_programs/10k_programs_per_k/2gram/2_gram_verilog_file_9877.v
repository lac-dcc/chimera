// Seed: 1797406281
module module_0 (
    input wor id_0,
    input wor id_1,
    input tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    input supply1 id_5
    , id_10,
    input wor id_6,
    input tri1 id_7,
    input supply1 id_8
);
  assign id_4  = id_10;
  assign id_10 = 1;
  assign id_4  = id_10;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri1 id_5,
    input wand id_6,
    input supply0 id_7,
    output wand id_8
);
  id_10(
      .id_0(1), .id_1(id_7)
  );
  module_0 modCall_1 (
      id_6,
      id_0,
      id_1,
      id_1,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
