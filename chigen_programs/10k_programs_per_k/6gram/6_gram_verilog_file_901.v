// Seed: 2162301215
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input wand id_3,
    output tri0 id_4,
    output supply1 id_5,
    output supply1 id_6,
    output uwire id_7,
    output wand id_8,
    input tri1 id_9,
    output wire id_10
);
  wire id_12;
  assign module_1.id_7 = 0;
  assign id_4 = !id_3 <= id_2;
  logic [-1 'h0 : -1] id_13;
  ;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input supply0 id_2,
    input uwire id_3,
    input wor id_4,
    input wire id_5,
    output wire id_6,
    output supply1 id_7,
    output wor id_8,
    output wand id_9,
    input tri1 id_10,
    input tri1 id_11,
    input wand id_12,
    output supply0 id_13
    , id_16,
    output wire id_14
);
  assign id_14 = 1;
  and primCall (id_14, id_2, id_0, id_5, id_1, id_10, id_11, id_4);
  module_0 modCall_1 (
      id_5,
      id_9,
      id_2,
      id_5,
      id_13,
      id_7,
      id_8,
      id_9,
      id_14,
      id_11,
      id_14
  );
endmodule
