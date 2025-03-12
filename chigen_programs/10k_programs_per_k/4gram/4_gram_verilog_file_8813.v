// Seed: 4134130460
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri id_2,
    input uwire id_3,
    input supply1 id_4,
    input wand id_5,
    input supply1 id_6,
    input tri id_7
);
  parameter id_9 = 1;
  wire [-1 'd0 : 1] id_10;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input tri0 id_2,
    output wor id_3,
    output tri0 id_4,
    output wand id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wor id_8,
    output tri0 id_9,
    input supply0 id_10
);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_8
  );
  assign modCall_1.id_4 = 0;
endmodule
