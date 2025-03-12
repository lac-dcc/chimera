// Seed: 4083967561
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input wor id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    output tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri1 id_11
);
  assign id_5 = -1;
  assign id_1 = (id_10);
  assign id_9 = id_7;
  assign module_1.id_5 = 0;
  wand id_13 = -1;
  genvar id_14;
  assign id_5 = id_7;
endmodule
module module_1 (
    input wand id_0,
    output uwire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wand id_4,
    output wor id_5,
    input tri1 id_6,
    output supply1 id_7
);
  wire id_9;
  and primCall (id_5, id_9, id_4, id_2, id_6);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_0,
      id_4,
      id_3,
      id_5,
      id_6,
      id_0,
      id_7,
      id_4,
      id_0
  );
endmodule
