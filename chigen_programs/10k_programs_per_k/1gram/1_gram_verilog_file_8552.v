// Seed: 1128032207
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    output wor id_3
);
  wire id_5, id_6, id_7;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_1
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input  wire  id_0,
    input  uwire id_1,
    output tri0  id_2,
    output wor   id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_2
  );
  assign modCall_1.type_2 = 0;
  wire id_5;
  or primCall (id_2, id_1, id_0);
endmodule
module module_2 (
    output tri1  id_0,
    input  wire  id_1,
    output tri0  id_2,
    input  uwire id_3
);
  wire id_5;
  always id_2 = id_1;
endmodule
