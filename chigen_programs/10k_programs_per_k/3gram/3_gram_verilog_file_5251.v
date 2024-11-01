// Seed: 3186694588
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3,
    input supply0 id_4,
    input wand id_5,
    output wand id_6,
    input wor id_7,
    output tri id_8,
    input supply0 id_9,
    output wire id_10,
    input tri id_11
    , id_16,
    input tri id_12,
    input wor id_13,
    input supply1 id_14
);
  assign id_2 = 1 ? id_0#(.id_1(1)) : 'd0;
  tri0 id_17 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    output wand id_1,
    input  wire id_2,
    input  tri0 id_3
);
  assign id_1 = !id_2;
  module_0(
      id_2, id_2, id_1, id_1, id_2, id_3, id_1, id_3, id_1, id_0, id_1, id_0, id_3, id_3, id_0
  );
endmodule
