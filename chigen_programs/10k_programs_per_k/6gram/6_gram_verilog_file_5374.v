// Seed: 3122413529
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wor id_13
);
  wire id_15;
  assign module_1.id_0 = 0;
  assign id_13 = id_2;
endmodule
module module_1 (
    input  uwire id_0,
    inout  uwire id_1,
    input  wor   id_2,
    input  tri   id_3,
    output wand  id_4
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1
  );
endmodule
