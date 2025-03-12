// Seed: 1398159675
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    input supply1 id_4,
    output uwire id_5
    , id_10,
    input supply1 id_6,
    input wire id_7,
    output uwire id_8
);
  wire id_11;
  assign id_11 = id_2;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input tri1 id_1,
    output wand id_2,
    output wor id_3,
    input supply0 id_4,
    input supply0 id_5,
    output supply0 id_6,
    input wor id_7,
    output tri0 id_8,
    input wand id_9,
    output wand id_10,
    output wire id_11,
    output wor id_12
);
  xnor primCall (id_10, id_4, id_9, id_1, id_7, id_5);
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_1,
      id_12,
      id_7,
      id_9,
      id_10
  );
  wire id_14;
endmodule
