// Seed: 2552581141
module module_0 (
    output tri id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    input supply1 id_4,
    output uwire id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input tri0 id_11
);
  supply1 id_13;
  wire id_14;
  supply0 id_15 = 1;
  supply1 id_16 = id_13 == id_15;
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri1  id_2
);
  tri  id_4;
  tri0 id_5 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.type_25 = 0;
endmodule
