// Seed: 1733237844
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output wor id_3,
    output tri id_4,
    output wire id_5,
    input uwire id_6,
    output tri0 id_7,
    input wand id_8,
    input tri1 id_9
);
  logic id_11;
  assign module_1.id_1 = 0;
  assign id_3 = id_8;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output wor id_2,
    output tri id_3,
    output tri0 id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    input wire id_8,
    input wor id_9,
    input supply1 id_10,
    output wand id_11,
    output wire id_12,
    input uwire id_13,
    output tri0 id_14
);
  assign id_4 = -1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_9,
      id_4,
      id_4,
      id_4,
      id_7,
      id_4,
      id_1,
      id_5
  );
  id_16 :
  assert property (@(posedge -1'b0) id_16)
  else $signed(84);
  ;
endmodule
