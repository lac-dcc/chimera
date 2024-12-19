// Seed: 3286953894
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply0 id_9,
    input supply1 id_10
);
  wire id_12;
  tri0 id_13 = {id_10{id_2}};
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5,
    output tri id_6,
    output logic id_7,
    input supply1 id_8
);
  initial id_7 <= 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_3,
      id_5,
      id_6,
      id_3,
      id_0,
      id_8
  );
  assign modCall_1.type_17 = 0;
endmodule
