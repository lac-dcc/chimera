// Seed: 1011211935
macromodule module_0 (
    input tri0 id_0,
    output wand id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri0 id_4,
    output wand id_5,
    input uwire id_6,
    input wand id_7,
    output wor id_8,
    output uwire id_9,
    input wor id_10,
    input tri id_11
);
  wire id_13;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    inout uwire id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input wire id_4,
    input wire id_5,
    output uwire id_6,
    input supply0 id_7,
    input wire id_8,
    input tri0 id_9,
    output tri0 id_10,
    input supply0 id_11#(.id_19({{1{1}}, (-1'b0)})),
    input uwire id_12,
    input wand id_13,
    output uwire id_14,
    output tri id_15,
    output wand id_16,
    output wor id_17
);
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_12,
      id_17,
      id_1,
      id_6,
      id_4,
      id_9,
      id_2,
      id_2,
      id_9,
      id_13
  );
endmodule
