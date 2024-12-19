// Seed: 1179161859
module module_0 (
    input wire id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wor id_4,
    output tri0 id_5,
    input tri1 id_6,
    input tri0 id_7
);
  wire id_9;
  wire id_10;
  wire id_11 = id_10;
  wire id_12;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    output wor   id_2,
    input  uwire id_3
);
  uwire id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_3,
      id_5,
      id_2,
      id_0,
      id_5
  );
  assign modCall_1.type_3 = 0;
  assign #1 id_2 = 1;
  wire id_6;
  assign id_2 = id_3;
endmodule
