// Seed: 3807989923
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output wand id_2,
    input tri id_3,
    output wor id_4,
    input supply1 id_5,
    input tri id_6,
    input supply1 id_7
);
  assign id_1 = 1;
  wire id_9;
  wire id_10;
  tri0 id_11 = id_3;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wand id_4
);
  tri0 id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_1,
      id_4,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign id_4 = 1 !== id_6;
endmodule
