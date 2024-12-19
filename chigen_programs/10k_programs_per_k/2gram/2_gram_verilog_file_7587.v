// Seed: 1669411141
module module_0 (
    output tri0 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3
    , id_9,
    input tri id_4,
    input wand id_5,
    input tri1 id_6,
    output wor id_7
);
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    output tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    output wire id_5,
    input wand id_6
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_6,
      id_1
  );
endmodule
module module_2 (
    output tri1 id_0,
    input  wand id_1
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
