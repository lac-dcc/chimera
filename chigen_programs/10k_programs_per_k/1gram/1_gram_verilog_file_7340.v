// Seed: 1882870344
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output tri0 id_2,
    output tri1 id_3,
    output supply0 id_4,
    output tri id_5,
    input wand id_6,
    input uwire id_7
);
  wire id_9, id_10, id_11;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input supply1 id_4,
    output tri id_5,
    input tri0 id_6,
    output wor id_7,
    input tri0 id_8,
    output wand id_9,
    input wire id_10
);
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1,
      id_9,
      id_7,
      id_1,
      id_10,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
