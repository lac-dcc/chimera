// Seed: 79020381
module module_0 (
    output wor   id_0,
    output wor   id_1,
    input  uwire id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output wor   id_6
);
endmodule
module module_1 (
    input  wor  id_0,
    input  wand id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  tri1 id_4
);
  assign id_3 = 1;
  tri0 id_6;
  wire id_7;
  assign id_7 = (!id_0);
  tri id_9;
  assign id_9 = 1;
  assign id_6 = 1'b0;
  id_10(
      .id_0(id_4), .id_1(1), .id_2(1'b0 + 1)
  ); module_0(
      id_3, id_3, id_1, id_0, id_4, id_2, id_3
  );
  assign id_6 = id_8;
endmodule
