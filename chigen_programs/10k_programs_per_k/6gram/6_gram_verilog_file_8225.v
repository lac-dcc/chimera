// Seed: 4065289273
module module_0 (
    input uwire id_0,
    output uwire id_1,
    input tri1 id_2,
    input uwire id_3,
    input wor id_4,
    input supply0 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output supply0 id_9
);
  assign id_1 = id_8 ? 1 : id_7 ? id_6 == (1 * id_8) : id_4;
endmodule
module module_1 (
    input  wand id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    output tri0 id_3
);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.type_0 = 0;
  assign id_3 = 1 - id_1;
endmodule
