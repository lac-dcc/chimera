// Seed: 2360439341
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input wor id_3,
    output wire id_4,
    output wand id_5,
    input wand id_6,
    output supply0 id_7,
    input supply1 id_8,
    output tri id_9,
    input wor id_10
    , id_14,
    input tri1 id_11,
    input tri id_12
);
  wand id_15 = 1;
  supply1 id_16 = 1;
  assign id_9 = 1'b0;
  assign module_1.id_3 = 0;
  assign id_15 = 1 - id_14;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wor id_7
    , id_14,
    input tri1 id_8,
    input tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    input wire id_12
);
  xor primCall (
      id_7, id_3, id_8, id_6, id_15, id_12, id_14, id_5, id_11, id_0, id_1, id_4, id_2, id_9
  );
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_7,
      id_4,
      id_10,
      id_7,
      id_0,
      id_7,
      id_1,
      id_10,
      id_9,
      id_2,
      id_3
  );
  wire id_16;
endmodule
