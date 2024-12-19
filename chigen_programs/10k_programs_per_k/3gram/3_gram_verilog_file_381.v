// Seed: 3204776353
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input tri0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    output supply0 id_6,
    output wor id_7,
    input uwire id_8
);
  assign id_4 = 1 < id_8;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input tri id_3,
    output wor id_4,
    input supply1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input wand id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_4,
      id_3,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.type_3 = 0;
  id_10(
      .id_0(1), .id_1(id_1), .id_2(1), .id_3((1)), .id_4(id_3), .id_5(1)
  );
endmodule
