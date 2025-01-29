// Seed: 1766566776
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input tri0 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri id_5,
    output supply1 id_6,
    input tri id_7,
    input wire id_8,
    input tri1 id_9,
    input tri0 id_10,
    input tri0 id_11
);
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    output tri1 id_4,
    input tri id_5
);
  wire id_7;
  wire id_8, id_9;
  nand primCall (id_4, id_3, id_1, id_7);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_0,
      id_5,
      id_3,
      id_2,
      id_1,
      id_3,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
