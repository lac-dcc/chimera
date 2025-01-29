// Seed: 687597679
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input wand id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    input supply1 id_7
);
endprogram
module module_1 (
    output uwire id_0,
    input  wire  id_1,
    output wor   id_2,
    output uwire id_3,
    input  wor   id_4,
    output wor   id_5,
    input  tri   id_6
);
  id_8(
      .id_0(id_5), .id_1(""), .id_2(id_0)
  );
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_1,
      id_6,
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_5 = 0;
  assign id_5 = id_6;
  wire id_9, id_10;
endmodule
