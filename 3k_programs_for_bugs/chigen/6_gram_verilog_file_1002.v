// Seed: 3912257236
module module_0 (
    input uwire id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    input wire id_7,
    input supply0 id_8,
    input tri1 id_9,
    input uwire id_10,
    output tri1 id_11,
    input tri0 id_12,
    output supply0 id_13,
    output tri id_14
);
  assign id_11 = 1 - id_12 ? id_4 : 1;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    output uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output uwire id_5,
    output wor id_6,
    output wor id_7
);
  assign id_7 = 1;
  module_0(
      id_1, id_0, id_4, id_0, id_3, id_4, id_1, id_3, id_3, id_3, id_0, id_7, id_3, id_7, id_2
  );
endmodule
