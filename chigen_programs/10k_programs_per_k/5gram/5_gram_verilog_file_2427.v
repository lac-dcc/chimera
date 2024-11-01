// Seed: 613025448
module module_0 (
    input supply0 id_0,
    output wand id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input uwire id_6,
    input wand id_7
);
  uwire   id_9 = 1;
  supply0 id_10;
  assign id_10 = 1 ? module_0 : 1 & id_0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri0 id_2,
    input wor id_3,
    input wire id_4,
    output tri0 id_5,
    output supply0 id_6,
    input tri id_7
);
  assign id_6 = 1;
  module_0(
      id_2, id_5, id_5, id_0, id_3, id_6, id_7, id_2
  );
endmodule
