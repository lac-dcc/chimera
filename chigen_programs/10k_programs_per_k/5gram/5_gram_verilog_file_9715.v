// Seed: 2598756216
module module_0 (
    input wand id_0,
    output uwire id_1,
    output tri id_2,
    output tri id_3,
    input wand id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wor id_7,
    output supply0 id_8
);
  assign id_2 = id_7++ ? id_4#(.id_4(1)) : id_0;
  logic id_10;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output supply0 id_2,
    input supply0 id_3
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
