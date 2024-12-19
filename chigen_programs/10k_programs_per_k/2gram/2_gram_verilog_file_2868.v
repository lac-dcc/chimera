// Seed: 4062398879
macromodule module_0 (
    output uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    input  wor   id_3,
    output uwire id_4
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3,
    output wand id_4,
    output tri id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2
  );
endmodule
module module_2 (
    input  wire id_0,
    output wand id_1
);
  integer id_3;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_3 (
    input supply0 id_0,
    input tri1 id_1,
    output supply0 id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri1 id_5,
    input wor id_6,
    input uwire id_7,
    output tri id_8,
    output tri1 id_9,
    input tri id_10,
    output uwire id_11,
    input supply0 id_12,
    input supply0 id_13
);
  assign id_11 = 1;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_4,
      id_9
  );
  assign modCall_1.type_0 = 0;
  wire id_16;
endmodule
