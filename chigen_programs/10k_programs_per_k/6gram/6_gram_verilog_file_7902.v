// Seed: 2134125028
module module_0 (
    input  tri1  id_0,
    output tri0  id_1,
    output wand  id_2,
    input  uwire id_3,
    input  wand  id_4,
    output uwire id_5
);
  supply1 id_7 = -1'b0;
  assign id_7 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input wand id_6,
    output wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_0,
      id_5,
      id_7
  );
endmodule
module module_2 (
    output tri0 id_0,
    input  tri0 id_1,
    input  wor  id_2,
    input  wand id_3,
    input  wand id_4,
    input  wire id_5,
    output wor  id_6
);
  assign id_0 = id_4;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_6,
      id_1,
      id_3,
      id_6
  );
  always force id_0 = id_4;
endmodule
