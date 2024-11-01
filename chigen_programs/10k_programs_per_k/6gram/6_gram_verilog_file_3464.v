// Seed: 2404630586
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output tri0 id_2,
    input wire id_3,
    input tri id_4,
    input tri1 id_5,
    input tri id_6,
    input supply1 id_7,
    input tri1 id_8
);
  always force id_1 = 1;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    output wand id_2,
    input wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply0 id_6
);
  id_8(
      .id_0(id_3), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5(id_1)
  );
  xor (id_6, id_8, id_0, id_4, id_5, id_1);
  module_0(
      id_1, id_6, id_6, id_0, id_3, id_4, id_5, id_5, id_3
  );
endmodule
