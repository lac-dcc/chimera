// Seed: 4190494696
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    input tri0 id_3,
    output wor id_4,
    input wand id_5,
    input supply1 id_6,
    input tri0 id_7,
    input tri id_8,
    output wor id_9
);
  localparam id_11 = 1;
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    output wor   id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output wor   id_5,
    output wand  id_6,
    input  wand  id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0,
      id_5,
      id_3,
      id_7,
      id_0,
      id_3,
      id_2
  );
  assign modCall_1.id_9 = 0;
endmodule
