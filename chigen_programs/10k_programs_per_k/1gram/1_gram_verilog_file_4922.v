// Seed: 3163824341
module module_0 (
    input supply0 id_0,
    output tri id_1,
    output wor id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wand id_8
);
  assign id_2 = -1;
  wire id_10, id_11, id_12, id_13;
  parameter id_14 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    output tri id_4,
    input supply0 id_5,
    output wor id_6,
    output supply0 id_7,
    input tri0 id_8,
    input supply0 id_9,
    input wand id_10,
    input tri0 id_11
);
  logic id_13;
  ;
  id_14 :
  assert property (@* 1) id_14 = (~-1 ? -1'b0 : id_3);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_6,
      id_11,
      id_5,
      id_11
  );
  assign modCall_1.id_4 = 0;
  logic id_15;
  xor primCall (id_4, id_11, id_9, id_10, id_13, id_3, id_1, id_0, id_8, id_5, id_2, id_14);
endmodule
