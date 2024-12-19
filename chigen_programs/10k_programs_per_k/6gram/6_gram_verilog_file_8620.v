// Seed: 4147581770
module module_0 (
    output tri0 id_0,
    input  tri0 id_1
);
  assign id_0 = id_1;
  module_2 modCall_1 (
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  uwire id_1,
    output wor   id_2,
    output tri   id_3
);
  wor id_5;
  assign id_5 = ~id_5;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.type_3 = 0;
  wire id_6;
endmodule
module module_2 (
    output wor  id_0,
    input  tri0 id_1,
    output tri  id_2
);
endmodule
module module_3 (
    input  wand id_0,
    input  tri  id_1,
    output tri  id_2
);
  wire id_4;
  module_2 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
