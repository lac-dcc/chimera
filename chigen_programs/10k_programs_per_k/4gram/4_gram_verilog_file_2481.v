// Seed: 2015175286
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input uwire id_2,
    output tri0 id_3,
    output supply0 id_4,
    output tri1 id_5,
    input wire id_6,
    output tri id_7,
    output supply1 id_8,
    input tri1 id_9
    , id_15,
    output supply0 id_10,
    input tri0 id_11,
    output uwire id_12,
    input wor id_13
);
  logic [-1 : 1 'b0] id_16;
  assign id_16 = -1'd0 & id_2 & -1 && -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    output tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wand id_5,
    output wire id_6,
    input tri id_7,
    output wire id_8,
    input wire id_9,
    input tri1 id_10,
    output wor id_11
);
  assign id_11 = -1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_9,
      id_8,
      id_6,
      id_11,
      id_5,
      id_8,
      id_11,
      id_0,
      id_2,
      id_1,
      id_2,
      id_7
  );
  wire [1 : 1] id_13;
  or primCall (id_11, id_5, id_4, id_10, id_9);
endmodule
