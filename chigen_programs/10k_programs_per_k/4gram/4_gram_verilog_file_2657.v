// Seed: 3417015752
module module_0 (
    output wor id_0,
    output tri id_1,
    input uwire id_2,
    output supply1 id_3,
    output wire id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wand id_7,
    output supply1 id_8
);
  wire id_10;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wor id_2,
    output supply0 id_3,
    output tri id_4
);
  assign id_3 = (1'b0 & id_0 ? id_1 : id_0) ? id_1 : 1;
  module_0(
      id_3, id_3, id_0, id_3, id_3, id_1, id_0, id_4, id_3
  );
endmodule
