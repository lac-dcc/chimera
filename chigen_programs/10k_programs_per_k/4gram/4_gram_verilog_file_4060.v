// Seed: 3443467604
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  genvar id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4
  );
  wire id_5;
endmodule
module module_2 (
    input tri1 id_0,
    output wand id_1,
    output wand id_2,
    output uwire id_3,
    input wire id_4,
    output wire id_5,
    output wor id_6,
    input tri1 id_7,
    input supply1 id_8
);
  wire id_10;
  assign module_3.type_0 = 0;
endmodule
module module_3 (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    output uwire id_3,
    output wire id_4
);
  assign id_2 = 1;
  xor primCall (id_3, id_1, id_0);
  module_2 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_3,
      id_2,
      id_0,
      id_1
  );
endmodule
