// Seed: 191147478
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output uwire id_2,
    output wor id_3,
    output supply1 id_4,
    output tri0 id_5,
    output wand id_6,
    output uwire id_7,
    input uwire id_8,
    output wor id_9,
    output tri id_10,
    input wor id_11
);
  assign id_2 = id_8;
  assign module_1.id_4 = 0;
  assign id_5 = -1;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input uwire id_6,
    output tri1 id_7
);
  assign id_7 = 1 ? id_2 : id_6;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_5,
      id_5,
      id_4,
      id_4,
      id_5,
      id_5,
      id_3,
      id_5,
      id_4,
      id_0
  );
endmodule
