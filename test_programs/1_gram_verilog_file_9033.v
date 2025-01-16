// Seed: 2000805867
module module_0 (
    input wire id_0,
    input uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wand id_6,
    input tri0 id_7,
    input wand id_8,
    output tri0 id_9,
    input wor id_10,
    output tri1 id_11,
    input uwire id_12
);
endmodule
module module_1 (
    input  wand id_0,
    input  tri1 id_1,
    output tri1 id_2,
    output tri1 id_3
);
  assign id_3 = id_0 & id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
