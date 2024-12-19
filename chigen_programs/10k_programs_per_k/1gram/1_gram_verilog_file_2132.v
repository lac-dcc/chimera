// Seed: 3682780859
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    output tri0 id_3,
    output tri0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    input tri id_8,
    output uwire id_9,
    output uwire id_10,
    input wire id_11,
    input supply1 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply0 id_15,
    output wor id_16,
    input wire id_17,
    output tri0 id_18,
    output wire id_19
);
  wire id_21;
  assign id_10 = id_2 & id_7;
  assign module_1.id_1 = 0;
  always_ff if (id_8 ? (1) !== id_11 : id_13);
  wire id_22;
endmodule
module module_1 (
    input  wire  id_0,
    output tri0  id_1,
    input  wand  id_2,
    output wor   id_3,
    output wand  id_4,
    input  tri   id_5,
    input  uwire id_6,
    input  wor   id_7
);
  wire id_9, id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_1,
      id_4,
      id_1,
      id_1,
      id_5,
      id_7,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_3,
      id_2,
      id_3,
      id_1
  );
endmodule
