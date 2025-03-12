// Seed: 428155229
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output wand id_2,
    output wor id_3,
    input uwire id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input wor id_8,
    output uwire id_9
);
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output tri id_2,
    output uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output tri1 id_6,
    input supply0 id_7,
    input wand id_8
);
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_3,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
