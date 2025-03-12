// Seed: 2330689023
module module_0 (
    output wand id_0,
    input wand id_1,
    output tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output wand id_5,
    input uwire id_6,
    input wand id_7,
    input tri0 id_8,
    output tri id_9,
    input supply0 id_10,
    input wor id_11,
    output wor id_12
);
endmodule
module module_1 (
    output supply0 id_0,
    output wor id_1,
    input supply0 id_2,
    output supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input wand id_6,
    output supply0 id_7,
    input wand id_8,
    input tri id_9,
    output supply1 id_10
);
  logic id_12;
  nor primCall (id_1, id_2, id_12, id_6, id_9, id_8, id_4);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_5,
      id_6,
      id_7,
      id_5,
      id_9,
      id_6,
      id_0,
      id_9,
      id_6,
      id_1
  );
endmodule
