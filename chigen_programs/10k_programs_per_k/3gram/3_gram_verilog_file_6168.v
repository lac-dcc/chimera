// Seed: 3939891103
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    input uwire id_5,
    input tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    output tri1 id_9,
    output wor id_10,
    input tri1 id_11
);
  final $unsigned(11);
  ;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    output uwire id_2,
    output supply1 id_3,
    output wor id_4,
    input uwire id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_5,
      id_2,
      id_0,
      id_5,
      id_5,
      id_2,
      id_1,
      id_4,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
