// Seed: 2765913008
module module_0 (
    input uwire id_0,
    output wand id_1,
    output supply0 id_2,
    input uwire id_3,
    output supply0 id_4
);
  assign id_4 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input uwire id_6,
    output tri1 id_7
);
  assign id_0 = 1 & 1;
  xnor primCall (id_0, id_4, id_1, id_2, id_5);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_0 = id_3#(.id_6(1));
  initial $clog2(15);
  ;
endmodule
