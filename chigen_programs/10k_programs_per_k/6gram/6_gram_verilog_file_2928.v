// Seed: 3519616944
module module_0 (
    output supply1 id_0,
    output uwire id_1,
    output tri0 id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    output supply1 id_7,
    input supply0 id_8,
    output wire id_9,
    input tri1 id_10,
    input wand id_11,
    input uwire id_12,
    output wor id_13
);
  tri0 id_15 = 1 ^ id_8;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wor  id_0,
    input  tri0 id_1,
    output tri0 id_2
);
  assign id_0 = 1'h0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
