// Seed: 2539419817
module module_0 (
    output wor id_0,
    input uwire id_1,
    input wand id_2,
    input wand id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri0 id_6
);
  wire id_8;
  assign module_1.type_6 = 0;
  assign id_0 = id_1;
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    input  wor   id_0,
    input  wand  id_1,
    input  uwire id_2,
    input  tri   id_3,
    output wand  id_4
);
  assign id_4 = id_0;
  assign id_4 = id_1;
  assign id_4 = 1'd0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_0
  );
endmodule
