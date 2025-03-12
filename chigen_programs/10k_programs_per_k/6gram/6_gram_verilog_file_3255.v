// Seed: 2404416420
module module_0 (
    input wor id_0,
    output supply0 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri id_4,
    output supply0 id_5
);
  reg id_7, id_8;
  assign module_2.id_1 = 0;
  assign module_1.id_0 = 0;
  initial begin : LABEL_0
    id_7 <= id_8;
  end
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    output tri0  id_2
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_0
  );
endmodule
module module_2 (
    input tri1 id_0,
    input supply1 id_1,
    output wire id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2
  );
endmodule
