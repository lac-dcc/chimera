// Seed: 178502598
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wor id_5,
    input wor id_6,
    input supply0 id_7,
    input tri id_8,
    output supply0 id_9,
    input supply0 id_10
);
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input supply1 id_2,
    input wor id_3,
    output wand id_4,
    output supply1 id_5,
    input wor id_6,
    output supply1 id_7
);
  assign id_4 = id_6;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
