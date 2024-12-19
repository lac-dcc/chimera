// Seed: 4289188075
macromodule module_0 (
    input supply0 id_0,
    input tri1 void id_1,
    output wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    output wire id_5,
    output wor id_6,
    input tri0 id_7
);
  always @(posedge 1)
    if (id_7) id_6 = 1;
    else id_5 = 1;
  assign module_1.type_5 = 0;
  assign id_2 = 1;
  tri1 id_9, id_10, id_11, id_12;
  wire id_13;
  assign id_2 = id_3 * id_12;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input wand id_7,
    input uwire id_8,
    input uwire id_9,
    input tri id_10,
    output supply1 id_11,
    input tri id_12,
    output tri1 id_13
);
  assign id_11 = 1'b0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_11,
      id_9,
      id_5,
      id_11,
      id_13,
      id_5
  );
  wire id_15;
endmodule
