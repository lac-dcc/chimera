// Seed: 3135291209
module module_0 (
    output wor  id_0,
    input  wand id_1
);
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wand id_3,
    output wire id_4
);
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.type_1 = 0;
  assign id_4 = 1 & id_2;
  final begin : LABEL_0
    cover (id_0);
  end
endmodule
module module_2 (
    input supply0 id_0,
    input wire id_1,
    input uwire id_2,
    output uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wor id_7,
    input wire id_8,
    input wand id_9,
    output wand id_10,
    output uwire id_11,
    output tri0 id_12,
    input wor id_13
);
  wire id_15;
  or primCall (id_11, id_2, id_15, id_9, id_0, id_1, id_8, id_5, id_7, id_13);
  module_0 modCall_1 (
      id_6,
      id_2
  );
endmodule
