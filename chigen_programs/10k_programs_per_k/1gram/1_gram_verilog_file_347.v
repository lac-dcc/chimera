// Seed: 1141594875
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wor id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wor id_5
);
  assign {-1, id_3, id_4, id_0, id_3, -1, -1, id_0} = id_4;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input tri id_3,
    input uwire id_4,
    output logic id_5,
    input wor id_6
);
  always if (1) id_5 <= id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_6,
      id_2,
      id_3,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
