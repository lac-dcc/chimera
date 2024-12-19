// Seed: 1531558443
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    output tri   id_2,
    output wor   id_3,
    input  tri1  id_4
);
  wire id_6;
  wire id_7;
  wire id_9;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    output tri id_4,
    input tri1 id_5,
    output supply1 id_6,
    input wire id_7
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_6,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3
);
  integer id_5 = 1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
