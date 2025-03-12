// Seed: 2788512262
macromodule module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    output tri id_3,
    output uwire id_4,
    input supply0 id_5,
    output supply1 id_6,
    output tri id_7
);
  logic [7:0] id_9;
  assign id_9[1] = -1;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output uwire id_2,
    input supply0 id_3,
    input supply0 id_4,
    output wand id_5
);
  assign id_5 = 1 ? -1'b0 : id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_3,
      id_5,
      id_0,
      id_3,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
