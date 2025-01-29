// Seed: 296248
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    input wor id_8,
    input wor id_9,
    input supply1 id_10
);
  assign id_12 = -1;
  wire id_13, id_14;
  tri0 id_15;
  assign id_12 = -1;
  id_16(
      (id_15), id_2 >> id_12
  );
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input tri1 id_2,
    input wor id_3,
    input tri0 id_4,
    output supply1 id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.type_6 = 0;
endmodule
