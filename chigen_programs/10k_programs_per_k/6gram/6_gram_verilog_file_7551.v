// Seed: 2470625643
module module_0 (
    input wand id_0,
    input wire id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input tri1 id_6,
    input tri1 id_7,
    input supply0 id_8
);
  assign id_10 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input supply0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input uwire id_6
);
  and primCall (id_3, id_6, id_8, id_0, id_4, id_2, id_5, id_1);
  assign id_3 = 1;
  id_8(
      .id_0(id_2 * id_5 !== 1), .id_1(~{id_4, 1}), .id_2(id_1)
  );
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
