// Seed: 3786566261
module module_0 (
    output wand id_0,
    input tri1 id_1,
    output tri0 id_2,
    output wand id_3,
    input uwire id_4,
    output tri id_5,
    input tri1 id_6,
    input wand id_7,
    output uwire id_8,
    output supply1 id_9,
    input tri id_10,
    output uwire id_11,
    input tri0 id_12
);
  wire id_14, id_15;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    output supply1 id_4,
    output wand id_5
);
  wire id_7;
  assign id_5 = 1 & id_0;
  wire id_8;
  module_0(
      id_1, id_0, id_5, id_1, id_3, id_4, id_0, id_2, id_4, id_5, id_0, id_5, id_3
  ); id_9(
      .id_0(id_8), .id_1(1), .id_2(1'b0)
  );
endmodule
