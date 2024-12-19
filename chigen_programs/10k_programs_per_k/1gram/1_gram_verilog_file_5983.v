// Seed: 1880921942
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input tri id_2,
    output tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output wand id_7,
    input wand id_8,
    output supply1 id_9
);
  initial id_7 = 1;
  wand id_11, id_12, id_13, id_14, id_15, id_16 = id_5, id_17;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    input tri0 void id_3,
    input wand id_4,
    input supply0 id_5,
    input uwire id_6,
    input supply1 id_7
);
  assign #1 id_1 = id_6;
  nor primCall (id_1, id_2, id_7, id_4);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_5,
      id_1,
      id_6,
      id_4,
      id_5,
      id_1,
      id_3,
      id_1
  );
  wire id_9, id_10;
endmodule
