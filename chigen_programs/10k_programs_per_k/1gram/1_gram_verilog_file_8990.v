// Seed: 948103390
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    output tri id_3,
    input tri0 id_4,
    output tri0 id_5,
    output uwire id_6,
    input tri0 id_7
);
endmodule
module module_1 (
    input  tri1 id_0,
    output wor  id_1,
    output wand id_2[-1 'b0 : ""],
    input  tri1 id_3
);
  assign id_1 = -1'b0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = -1;
  assign id_1 = -1;
endmodule
