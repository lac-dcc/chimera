// Seed: 256245414
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input supply0 id_2,
    output tri1 id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri1 id_10,
    output supply0 id_11,
    output wor id_12
);
  assign id_12 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input uwire id_2,
    input tri id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
