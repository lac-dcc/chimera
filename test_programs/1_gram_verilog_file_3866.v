// Seed: 4280952869
module module_0 (
    output wor id_0,
    inout tri1 id_1,
    input supply0 id_2,
    output wire id_3,
    output wire id_4,
    input uwire id_5,
    output supply1 id_6
);
  tri1 id_8, id_9 = 1;
  module_2 modCall_1 (id_8);
  assign modCall_1.id_2 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    inout  wand id_1,
    output wor  id_2,
    input  wire id_3
);
  assign id_2 = id_1;
  assign id_1 = id_3 | id_0;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  assign id_2 = 1;
endmodule
