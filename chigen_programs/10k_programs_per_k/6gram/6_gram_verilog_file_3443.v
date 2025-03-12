// Seed: 295345968
module module_0 (
    output wand id_0,
    output uwire id_1,
    output wand id_2,
    input supply0 id_3,
    input wire id_4,
    input tri1 id_5,
    output wand id_6,
    input supply1 id_7,
    output tri0 id_8,
    input tri id_9,
    output tri0 id_10
);
  assign id_10 = id_7;
  assign id_10 = id_3;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input wand id_2,
    output wire id_3
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
