// Seed: 1316412580
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    output tri0 id_4,
    input wor id_5,
    output supply0 id_6,
    input wand id_7,
    output tri1 id_8,
    input wor id_9
);
  integer id_11;
  logic [7:0] id_12;
  assign id_11 = id_9;
  assign module_1.id_11 = 0;
  assign id_8 = id_11;
  assign id_12[-1] = -1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    output logic id_2,
    output tri   id_3,
    input  wand  id_4,
    output tri   id_5,
    input  tri0  id_6,
    output tri   id_7,
    input  wor   id_8,
    output tri   id_9,
    input  tri0  id_10,
    input  tri   id_11,
    output wire  id_12
);
  always id_2 = id_4;
  xor primCall (id_5, id_6, id_11, id_1, id_10, id_0, id_4);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_4,
      id_9,
      id_8,
      id_7,
      id_10,
      id_3,
      id_8
  );
endmodule
