// Seed: 86145219
module module_0 (
    input tri id_0,
    input wor id_1,
    input tri1 id_2,
    input wire id_3,
    input uwire id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    output wand id_11
);
  tri1 id_13;
  assign id_13 = 1;
  wire id_14;
  wire id_15;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output wor id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri0 id_5,
    output supply0 id_6,
    output tri id_7,
    input supply0 id_8,
    input wor id_9
);
  always @(!id_1 != 1'h0 - 1'b0 or id_9) id_2 = id_5;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_5,
      id_9,
      id_5,
      id_6,
      id_1,
      id_1,
      id_2,
      id_7,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
endmodule
