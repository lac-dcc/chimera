// Seed: 3674787116
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input tri id_5,
    output tri id_6,
    input supply0 id_7,
    output wor id_8
);
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input supply1 id_3,
    output wand id_4,
    input uwire id_5,
    output uwire id_6,
    input tri0 id_7,
    input wire id_8,
    input tri1 id_9
);
  assign id_1 = id_5 ? 1 : 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_9,
      id_5,
      id_0,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
