// Seed: 2679811450
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    output supply1 id_6,
    input tri0 id_7,
    input tri id_8,
    input wor id_9,
    input supply0 id_10
);
  tri  id_12 = id_7;
  wire id_13;
  assign id_6 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_4,
      id_3,
      id_4,
      id_2
  );
  assign modCall_1.type_4 = 0;
  assign id_1 = id_4;
endmodule
