// Seed: 4106158863
module module_0 (
    output wand id_0,
    input tri1 id_1,
    output tri1 id_2,
    output supply1 id_3,
    output wor id_4,
    output uwire id_5,
    output wire id_6,
    output wand id_7,
    input wand id_8,
    output tri0 id_9,
    input wand id_10,
    input tri1 id_11
);
  assign id_4 = -1 ^ id_1 ^ id_10 ^ id_10 ? -1'b0 : id_10;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1,
    input  supply1 id_2
);
  assign id_0 = id_2;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
