// Seed: 2490168105
module module_0 (
    input uwire id_0,
    output wor id_1,
    input uwire id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7,
    input wire id_8,
    input wor id_9,
    input supply0 id_10,
    input tri0 id_11,
    output supply0 id_12
);
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output supply0 id_2,
    output wor id_3
);
  assign id_3 = id_0;
  not primCall (id_3, id_0);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule
