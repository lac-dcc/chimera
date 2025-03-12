// Seed: 1018721333
module module_0 (
    output tri1 id_0,
    output wand id_1,
    output supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    output uwire id_5,
    input supply0 id_6
);
  assign module_1.id_8 = 0;
  logic id_8;
  ;
endmodule
module module_1 (
    input supply1 id_0,
    inout uwire id_1,
    input wor id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    input wor id_7,
    output tri1 id_8,
    output wor id_9,
    input wand id_10,
    input supply1 id_11,
    output wor id_12,
    output supply1 id_13,
    input tri0 id_14,
    output wor id_15
);
  if (1) begin : LABEL_0
    wire id_17;
    ;
  end
  nand primCall (id_8, id_14, id_5, id_10, id_2, id_4, id_0, id_1, id_7, id_6, id_3);
  module_0 modCall_1 (
      id_15,
      id_9,
      id_8,
      id_1,
      id_1,
      id_1,
      id_11
  );
endmodule
