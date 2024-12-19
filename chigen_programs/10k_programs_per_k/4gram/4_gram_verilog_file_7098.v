// Seed: 1490608181
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output tri id_2,
    input tri1 id_3,
    output wand id_4,
    input tri0 id_5,
    output tri0 id_6,
    output supply0 id_7,
    input wand id_8,
    input wire id_9,
    input uwire id_10,
    output wor id_11,
    input uwire id_12,
    input tri0 id_13,
    output tri id_14,
    input wor id_15
);
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    output tri1 id_2,
    output wand id_3,
    input uwire id_4,
    input tri0 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_4,
      id_3,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_4,
      id_2,
      id_4,
      id_4,
      id_1,
      id_5
  );
  wire id_8;
  nmos #(1, 1) (1, 1, id_3);
endmodule
