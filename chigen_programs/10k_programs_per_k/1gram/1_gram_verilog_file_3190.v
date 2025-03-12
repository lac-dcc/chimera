// Seed: 3396367136
module module_0 (
    input supply0 id_0,
    output wor id_1,
    input wor id_2,
    input wand id_3,
    input wor id_4,
    input tri1 id_5,
    input tri1 id_6[-1 : 1],
    input wand id_7
);
  assign id_1 = id_5;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    output wand id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    output wor id_6,
    input uwire id_7
);
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_0,
      id_5,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
