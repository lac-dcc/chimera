// Seed: 1025350049
module module_0 (
    input wor id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    output wor id_4,
    input tri0 id_5,
    input supply0 id_6,
    input supply1 id_7,
    input wire id_8,
    output wor id_9,
    output wand id_10,
    input wand id_11,
    input uwire id_12,
    input tri0 id_13,
    input tri1 id_14
);
  wand id_16 = 1 ^ id_0 == id_11#(.id_16(1 - id_5));
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  wand  id_2
    , id_5,
    output uwire id_3
);
  always @(id_5 or posedge id_2) id_0 <= id_1 + 1 - 1'b0;
  nand primCall (id_3, id_1, id_2, id_5);
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_5,
      id_3,
      id_1,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.type_4 = 0;
endmodule
