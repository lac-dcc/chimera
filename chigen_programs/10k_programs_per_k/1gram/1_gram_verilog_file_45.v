// Seed: 4091412737
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wand id_5,
    output supply0 id_6,
    input tri0 id_7
);
  wire [-1 'h0 : 1] id_9, id_10;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd35
) (
    output wor id_0,
    input wor id_1,
    input wire id_2,
    output tri0 _id_3,
    input tri id_4,
    output wand id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri0 id_9,
    output supply1 id_10,
    input wand id_11
);
  logic id_13[(  id_3  ) : 1];
  ;
  xnor primCall (id_10, id_4, id_6, id_1, id_11);
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_8,
      id_0,
      id_11,
      id_5,
      id_7
  );
endmodule
