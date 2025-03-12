// Seed: 268509333
module module_0 (
    input wand id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wire id_6,
    input wire id_7,
    output wor id_8,
    input supply1 id_9
);
  assign id_8 = 1;
endmodule
module module_1 (
    output tri id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_4,
      id_1,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
