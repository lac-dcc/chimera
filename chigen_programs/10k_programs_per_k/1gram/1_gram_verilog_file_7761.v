// Seed: 3826705388
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output uwire id_2,
    output tri id_3,
    input supply0 id_4,
    output wor void id_5,
    input tri1 id_6,
    output tri1 id_7,
    input wand id_8,
    output tri1 id_9,
    output wand id_10,
    input wire id_11
);
  wire id_13, id_14;
  assign module_1.id_0 = 0;
  logic [7:0][-1] id_15;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 void id_2
);
  assign id_2 = id_0;
  buf primCall (id_2, id_1);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_2,
      id_0
  );
endmodule
