// Seed: 3964220753
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    input tri0 id_4,
    input wor id_5,
    input uwire id_6,
    output supply0 id_7
);
  assign id_7 = id_6;
  wor id_9 = id_0;
  assign id_7 = -1;
endmodule
module module_1 (
    output wand id_0,
    output wor  id_1,
    output tri  id_2,
    input  tri0 id_3,
    output tri  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wand  id_3,
    input  tri0  id_4,
    input  wire  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_0,
      id_5,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
  wire id_8;
endmodule
