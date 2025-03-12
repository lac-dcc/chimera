// Seed: 1396169201
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output wor id_2
);
  always force id_2 = -1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri0 id_4,
    output supply0 id_5
);
  assign id_2 = id_1 ? id_3 : 1 ? -1 : 1 & -1 == id_4 & 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input  uwire id_0,
    output uwire id_1,
    output tri0  id_2
);
  logic id_4;
  ;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_2 = id_4;
  wire id_5;
  assign id_2 = 1'h0;
endmodule
