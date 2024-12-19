// Seed: 1467015204
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri1 id_5,
    input wor id_6,
    output wor id_7
);
  assign id_5 = 1 ? id_6 : 1;
  wire id_9;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wand id_2,
    output uwire id_3,
    input tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wire id_8,
    input supply0 id_9,
    output uwire id_10,
    input wire id_11,
    output wor id_12,
    input uwire id_13
);
  assign id_7 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_3,
      id_2,
      id_6,
      id_12
  );
  assign modCall_1.id_1 = 0;
endmodule
