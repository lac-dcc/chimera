// Seed: 443624555
module module_0 (
    output wire id_0,
    input uwire id_1,
    output wor id_2,
    input uwire id_3,
    input tri id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    output uwire id_8,
    input wor id_9,
    input supply0 id_10
);
  assign id_2 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output uwire id_2,
    output tri0 id_3,
    input wire id_4,
    input tri0 id_5,
    output uwire id_6,
    output tri id_7,
    input supply0 id_8
);
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_8,
      id_5,
      id_5,
      id_6,
      id_1,
      id_3,
      id_0,
      id_8
  );
  assign modCall_1.id_9 = 0;
  assign id_7 = id_5 & 1;
endmodule
