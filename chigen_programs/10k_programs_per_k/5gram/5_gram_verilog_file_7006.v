// Seed: 1670389258
module module_0 (
    input tri1 id_0,
    input tri id_1,
    output wand id_2,
    input tri id_3,
    output supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    input supply1 id_9,
    input wand id_10,
    output wire id_11,
    input wand id_12,
    input tri id_13
);
endmodule
module module_1 (
    output tri1  id_0,
    input  wand  id_1,
    output tri1  id_2,
    output wor   id_3,
    output logic id_4,
    output wor   id_5,
    input  tri   id_6,
    input  logic id_7
);
  assign id_4 = id_7;
  or primCall (id_3, id_7, id_6, id_1);
  always_ff @(posedge id_1) id_4 <= 1 & id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_1,
      id_3,
      id_3,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
