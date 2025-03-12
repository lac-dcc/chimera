// Seed: 653001147
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wand  id_4,
    input  tri1  id_5,
    input  tri0  id_6,
    input  wire  id_7,
    output tri0  id_8,
    output tri0  id_9,
    output tri0  id_10,
    input  wor   id_11,
    output tri   id_12,
    output tri0  id_13,
    output tri   id_14
);
  assign id_0 = 1;
  assign module_1.id_8 = 0;
  supply1 id_16 = 1, id_17;
  always @(posedge id_11) release id_17[1 : 1'b0];
endmodule
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri0 id_2,
    output uwire id_3,
    input wand id_4,
    output wand sample,
    input tri id_6,
    input wand id_7,
    output supply0 id_8,
    input tri1 id_9,
    input wire id_10,
    input wor id_11,
    output wire id_12,
    output tri0 id_13,
    input wire id_14,
    input tri0 id_15,
    output tri1 id_16,
    output tri0 module_1,
    output wire id_18,
    output wor id_19
);
  assign id_16 = -1 ? id_6 : {id_2 - 1, (id_6)} ? 1 : -1 << id_1;
  module_0 modCall_1 (
      id_3,
      id_11,
      id_6,
      id_2,
      id_19,
      id_2,
      id_6,
      id_10,
      id_19,
      id_18,
      id_19,
      id_15,
      id_16,
      id_12,
      id_3
  );
endmodule
