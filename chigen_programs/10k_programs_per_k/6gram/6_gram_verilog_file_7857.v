// Seed: 1951192232
module module_0 (
    input  tri0 id_0,
    input  tri1 id_1,
    output wire id_2
);
  wire id_4 = ~id_1;
  wire id_5;
  wire id_6;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input wand id_2,
    input wor id_3,
    input tri id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    output wand id_9,
    output wire id_10,
    output wand id_11
);
  always @* begin : LABEL_0
    force id_11[1] = 1;
  end
  or primCall (id_9, id_4, id_2, id_3, id_5, id_0, id_7, id_1);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_9
  );
endmodule
