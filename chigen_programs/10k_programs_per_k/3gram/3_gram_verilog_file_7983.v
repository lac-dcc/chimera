// Seed: 4144613180
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input tri id_2,
    input uwire id_3,
    output wire id_4,
    input uwire id_5,
    input wor id_6
);
  wire id_8 = id_6;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input wor id_7,
    output tri1 id_8,
    input wor id_9
);
  wire id_11;
  xor primCall (id_8, id_6, id_4, id_2, id_1, id_5, id_3, id_9, id_7);
  assign id_8 = 1;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_1,
      id_9,
      id_8,
      id_1,
      id_6
  );
endmodule
