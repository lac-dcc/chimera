// Seed: 1126216198
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    output supply0 id_5,
    output tri id_6,
    output wand id_7,
    output supply0 id_8
);
  tri0 id_10 = 1'b0;
  id_11(
      .id_0(id_10), .id_1(id_1 - 1'b0), .id_2(1)
  );
endmodule
module module_1 (
    output wor id_0,
    output tri id_1,
    input supply0 id_2,
    output wand id_3,
    output supply0 id_4
);
  assign id_4 = id_2 & 1;
  module_0(
      id_3, id_2, id_2, id_2, id_3, id_1, id_0, id_4, id_3
  );
  wire id_6;
  tri1 id_7 = 1'b0;
  not (id_3, id_2);
endmodule
