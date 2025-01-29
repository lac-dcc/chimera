// Seed: 310452651
program module_0 (
    input tri1 id_0,
    output supply1 id_1,
    output wire id_2,
    output tri1 id_3,
    input uwire id_4,
    input wand id_5,
    input tri1 id_6,
    input tri id_7,
    input wor id_8,
    input tri1 id_9
);
  wand id_11, id_12;
  assign id_3  = id_12;
  assign id_11 = id_5 * {id_0, id_5, 1'b0};
  wire id_13;
  assign id_2 = -1;
  assign id_11 = id_13;
  assign module_1.id_0 = 0;
endmodule
program module_1 (
    output wand id_0,
    input  tri  id_1,
    input  tri  id_2
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
