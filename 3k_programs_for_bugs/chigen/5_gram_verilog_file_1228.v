// Seed: 1052261454
module module_0 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    output uwire id_8,
    input uwire id_9
);
  assign id_8 = 1 == id_3;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output tri0 id_2,
    input tri id_3,
    output uwire id_4,
    output uwire id_5,
    input wire id_6,
    output supply1 id_7,
    input tri id_8,
    output tri0 id_9,
    output supply1 id_10,
    input supply0 id_11
);
  supply1 id_13;
  module_0(
      id_11, id_11, id_5, id_3, id_11, id_13, id_8, id_13, id_10, id_8
  );
  assign id_9 = id_13;
  nand (id_5, id_3, id_6, id_11, id_1, id_0, id_13);
endmodule
