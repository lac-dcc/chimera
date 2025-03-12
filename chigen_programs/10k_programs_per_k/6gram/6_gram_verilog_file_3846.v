// Seed: 2224185694
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input wor id_4,
    output wor id_5
);
  assign id_5 = id_0;
endmodule
module module_1 #(
    parameter id_7 = 32'd29
) (
    input tri id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri0 _id_7,
    input tri id_8,
    output uwire id_9,
    output supply1 id_10
);
  nand primCall (id_9, id_8, id_0, id_6, id_3);
  logic [id_7 : 1] id_12;
  ;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_6,
      id_9
  );
  assign modCall_1.id_0 = 0;
endmodule
