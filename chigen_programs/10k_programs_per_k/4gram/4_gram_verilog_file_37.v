// Seed: 1372113397
module module_0 (
    input tri id_0,
    input supply0 id_1,
    output tri0 id_2
    , id_10,
    input wand id_3,
    output wand id_4,
    input tri1 id_5,
    output tri0 id_6,
    output tri id_7,
    output supply1 id_8
);
  assign id_10 = -1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wand id_5,
    output uwire id_6
);
  wire id_8;
  or primCall (id_6, id_8, id_0, id_4, id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_8 = 0;
endmodule
