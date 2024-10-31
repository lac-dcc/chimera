// Seed: 2674593321
module module_0 (
    input tri id_0,
    output uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri id_4,
    output tri id_5
);
  assign id_4 = id_3;
  assign id_5 = 1'h0 * id_0;
  assign id_5 = 1 & id_3 & id_0;
endmodule
module module_1 (
    input supply0 id_0,
    output uwire id_1,
    output wand id_2,
    output tri id_3,
    output tri id_4,
    input wor id_5
);
  assign id_2 = {1'b0{1 - id_0}};
  module_0(
      id_5, id_4, id_2, id_5, id_2, id_3
  );
endmodule
