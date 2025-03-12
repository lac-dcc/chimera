// Seed: 2998442248
module module_0 (
    input  tri  id_0,
    output tri  id_1,
    output tri0 id_2,
    output tri1 id_3,
    input  tri0 id_4
);
  always begin : LABEL_0
    $unsigned(27);
    ;
  end
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output uwire id_3,
    output uwire id_4,
    output wor id_5,
    output wor id_6,
    input uwire id_7,
    input tri id_8,
    input supply1 id_9,
    output wire id_10,
    output wire id_11,
    output tri1 id_12,
    output supply1 id_13,
    input tri1 id_14,
    input tri id_15,
    input wand id_16,
    input supply0 id_17,
    input uwire id_18,
    input tri id_19,
    input wand id_20
);
  wire id_22;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_4,
      id_9
  );
  assign id_2 = id_20;
  nand primCall (id_0, id_17, id_20, id_19, id_16, id_22, id_7, id_1, id_18, id_15, id_8);
endmodule
