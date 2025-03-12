// Seed: 1633573814
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    input uwire id_4,
    input wire id_5,
    input wor id_6,
    input supply1 id_7,
    output wand id_8,
    output wire id_9,
    output tri0 id_10,
    input wand id_11,
    input tri1 id_12,
    output tri0 id_13,
    output wand id_14
);
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4
);
  assign id_0 = id_3 || 1'b0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_3,
      id_3,
      id_1,
      id_2,
      id_4,
      id_0,
      id_0,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0
  );
endmodule
