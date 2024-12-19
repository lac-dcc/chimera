// Seed: 1398381346
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    output supply0 id_4,
    input wand id_5
);
  assign id_4 = 1'd0 - 'b0;
  wor id_7 = 1;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1,
    output wire  id_2,
    output wand  id_3,
    input  tri0  id_4,
    output uwire id_5,
    input  tri   id_6,
    output wor   id_7,
    output wor   id_8,
    output tri0  id_9
);
  assign id_1 = id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6
  );
  always @(*) id_1 = id_6;
  assign id_7 = id_6;
endmodule
