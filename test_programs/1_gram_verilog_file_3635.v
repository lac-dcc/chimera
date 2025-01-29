// Seed: 3021012572
module module_0 (
    input  tri   id_0,
    input  tri   id_1,
    input  wire  id_2,
    input  uwire id_3,
    output wor   id_4
);
  nor primCall (id_4, id_2, id_1);
  module_2 modCall_1 (id_4);
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7
);
  localparam id_9 = ~^1;
  assign id_0 = -1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.type_7 = 0;
  assign id_4 = -1 && id_1;
endmodule
module module_2 (
    output wand id_0
);
  wire id_2;
  assign module_0.id_2 = 0;
endmodule
