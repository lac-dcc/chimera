// Seed: 3441454666
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output uwire id_2,
    input wand id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6,
    output wor id_7,
    input tri id_8,
    output uwire id_9,
    input supply0 id_10
);
  id_12(
      .id_0(id_10),
      .id_1(1),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1),
      .id_5(1 == id_2),
      .id_6(1),
      .id_7(id_9 - !id_8),
      .id_8(id_3)
  );
endmodule
module module_1 (
    input  wire id_0,
    input  tri0 id_1,
    input  tri  id_2,
    output wor  id_3,
    input  wor  id_4,
    output tri1 id_5,
    input  tri0 id_6
);
  module_0(
      id_0, id_5, id_5, id_2, id_6, id_0, id_1, id_5, id_2, id_5, id_0
  );
  assign id_5 = id_4 != id_4;
endmodule
