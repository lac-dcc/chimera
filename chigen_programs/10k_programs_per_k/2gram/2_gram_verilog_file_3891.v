// Seed: 365116240
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wand id_3,
    output uwire id_4
);
  assign id_0 = id_1;
  assign id_0 = 1;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    output wand id_5
);
  id_7(
      .id_0(id_0), .id_1(1), .id_2(1), .id_3(id_4 & 1), .id_4(1), .id_5(id_1 - id_4), .id_6(1)
  );
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5
  );
  assign modCall_1.type_6 = 0;
endmodule
