// Seed: 2941507618
module module_0 (
    input  wand  id_0,
    input  tri1  id_1,
    output wire  id_2,
    output uwire id_3,
    input  wor   id_4,
    output tri0  id_5,
    input  tri1  id_6,
    output wand  id_7
);
  assign id_5 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input tri id_2,
    input supply1 id_3,
    output wor id_4,
    output wor id_5,
    inout supply1 id_6,
    input wire id_7,
    output supply1 id_8,
    input uwire id_9,
    output wor id_10,
    output tri1 id_11,
    output wand id_12,
    input uwire id_13
);
  assign id_10 = id_1 ? id_9 : id_13;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_6,
      id_12,
      id_9,
      id_8,
      id_6,
      id_5
  );
endmodule
