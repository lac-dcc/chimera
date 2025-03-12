// Seed: 3031114085
module module_0 (
    input  wor  id_0,
    output tri0 id_1,
    output wand id_2
);
  assign id_1 = id_0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input wire id_7,
    output tri1 id_8,
    input wand id_9,
    output supply1 id_10,
    input tri1 id_11,
    output wor id_12,
    input supply1 id_13,
    output logic id_14,
    input supply0 id_15,
    output tri0 id_16
);
  initial begin : LABEL_0
    fork
      id_14 <= id_15;
      #1;
      id_18;
    join : SymbolIdentifier
  end
  xnor primCall (id_3, id_13, id_2, id_6, id_4, id_1, id_11, id_9, id_7, id_15, id_0);
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3
  );
endmodule
