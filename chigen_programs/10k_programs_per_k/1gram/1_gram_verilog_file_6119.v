// Seed: 1280775638
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wor id_4,
    output tri id_5,
    input wire id_6,
    input uwire void id_7
);
  wire id_9;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  wand  id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_0,
      id_2,
      id_4
  );
  wire id_6;
  wire id_7;
  wire id_8;
endmodule
module module_2;
  tri0 id_1;
  assign id_1 = 1;
endmodule
module module_3;
  wire id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
