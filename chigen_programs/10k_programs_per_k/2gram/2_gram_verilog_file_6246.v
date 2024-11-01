// Seed: 644570876
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output wor id_3,
    output tri0 id_4,
    input wire id_5,
    output supply0 id_6,
    input tri id_7,
    output wand id_8,
    input tri0 id_9,
    output tri1 id_10,
    input wor id_11,
    input tri0 id_12
);
  wire id_14;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input wand id_2,
    input tri1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input uwire id_9,
    input wire id_10
);
  id_12(
      .id_0(id_0), .id_1(id_3), .id_2(id_3), .id_3(id_9 || 1), .id_4(1), .id_5(1), .id_6(id_2)
  );
  xnor (id_8, id_7, id_0, id_10, id_4);
  module_0(
      id_10, id_4, id_9, id_8, id_8, id_5, id_8, id_7, id_8, id_0, id_8, id_1, id_5
  );
endmodule
