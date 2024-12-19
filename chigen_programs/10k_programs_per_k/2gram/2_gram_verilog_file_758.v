// Seed: 2478729196
module module_0 (
    output supply1 id_0,
    output wor id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri id_7,
    input tri1 id_8,
    output tri id_9,
    input wor id_10
);
  wire  id_12;
  uwire id_13;
  tri1  id_14 = id_8;
  assign module_1.id_0 = 0;
  assign id_13 = id_10;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri1 id_4
);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_3,
      id_3,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_4,
      id_1
  );
endmodule
