// Seed: 908029841
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input supply1 id_3,
    output wor id_4,
    input uwire id_5,
    input supply0 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wire id_9
);
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    output wire id_2,
    input wand id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input tri1 id_7,
    output tri0 id_8,
    input wor id_9,
    input tri1 id_10
);
  assign id_5 = id_7 - 1'b0;
  and primCall (id_8, id_0, id_4, id_3, id_9, id_7);
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_9,
      id_8,
      id_6,
      id_10,
      id_6,
      id_3,
      id_10
  );
  assign modCall_1.id_0 = 0;
endmodule
