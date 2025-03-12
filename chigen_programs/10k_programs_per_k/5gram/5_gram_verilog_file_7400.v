// Seed: 697338713
module module_0 (
    output wor id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri id_4,
    input tri0 id_5,
    input uwire id_6,
    output supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input tri1 id_10,
    input supply0 id_11,
    input tri id_12,
    output tri1 id_13,
    input tri id_14
);
  assign module_1.id_0 = 0;
  wire id_16;
  ;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    output wand id_2,
    input wand id_3,
    output uwire id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    output tri0 id_9,
    output tri id_10,
    output supply1 id_11,
    input supply1 id_12,
    output tri0 id_13,
    output wand id_14
);
  assign id_14 = id_6;
  nand primCall (id_8, id_7, id_6, id_0, id_3, id_12, id_5);
  module_0 modCall_1 (
      id_8,
      id_6,
      id_12,
      id_6,
      id_9,
      id_0,
      id_7,
      id_4,
      id_3,
      id_12,
      id_0,
      id_7,
      id_7,
      id_8,
      id_7
  );
  assign id_2 = id_5;
endmodule
