// Seed: 753327514
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input wor id_7,
    input wor id_8,
    output wor id_9,
    output supply1 id_10
);
  assign id_9 = 1;
  supply1 id_12 = id_4, id_13, id_14, id_15, id_16, id_17;
endmodule
module module_1 (
    output tri0 id_0,
    output tri id_1,
    input supply0 id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_1 = 0;
  wire id_4;
endmodule
