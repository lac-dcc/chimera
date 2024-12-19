// Seed: 2971127052
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri0 id_2,
    input tri id_3,
    output wire id_4,
    output wor id_5,
    input wire id_6
);
  module_2 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.type_5 = 0;
  assign id_5 = id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri  id_2
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1
  );
  assign id_2 = id_1 - id_1.id_1;
endmodule
module module_2 (
    input wand id_0,
    input wand id_1
);
  wire id_3, id_4;
endmodule
