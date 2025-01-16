// Seed: 2576362491
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input supply0 id_10,
    output wire id_11,
    input tri1 id_12
);
  wire id_14;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input wor id_3,
    input tri0 id_4
);
  and primCall (id_0, id_1, id_3, id_6);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4,
      id_3,
      id_0,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
