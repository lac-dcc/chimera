// Seed: 2042688158
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output wor id_3,
    input tri id_4,
    output tri1 id_5,
    input supply0 id_6,
    output uwire id_7
);
  supply1 id_9 = 1, id_10;
  tri1 id_11;
  tri1 id_12;
  wire id_13;
  tri id_14;
  wire id_15;
  assign id_7 = id_14;
  wire id_16;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri1 id_4,
    output wor id_5
);
  wand id_7 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_1,
      id_3,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_14 = 0;
endmodule
