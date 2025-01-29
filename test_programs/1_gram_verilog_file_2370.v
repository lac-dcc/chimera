// Seed: 3444721144
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wor id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wire id_8,
    input tri0 id_9
);
  assign id_6 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input uwire id_3,
    input tri1 id_4,
    output wire id_5,
    input tri id_6,
    input tri1 id_7,
    output tri0 id_8,
    input supply1 id_9
);
  wire id_11;
  xor primCall (id_8, id_0, id_2, id_4, id_1, id_3, id_9, id_7);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_5,
      id_9,
      id_7,
      id_1,
      id_8,
      id_6,
      id_3,
      id_6
  );
  assign modCall_1.type_3 = 0;
endmodule
