// Seed: 4064956785
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    input wor id_6,
    output uwire id_7,
    input wor id_8,
    input tri1 id_9,
    input supply0 id_10,
    output supply0 id_11,
    input wor id_12
);
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input supply1 id_2
);
  final id_1 <= 1;
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
