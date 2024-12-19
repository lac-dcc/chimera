// Seed: 2619214117
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wire id_5
);
  assign module_2.type_2 = 0;
  assign module_1.id_1   = 0;
endmodule
module module_1 (
    inout wor id_0,
    output tri1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    input tri id_7,
    input supply1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_7,
      id_8,
      id_8,
      id_0
  );
endmodule
module module_2 (
    input tri0 id_0,
    input supply1 id_1,
    output wand id_2,
    output tri1 id_3,
    output wor id_4,
    output wor id_5,
    output wire id_6,
    output tri0 id_7,
    input tri1 id_8
    , id_14,
    output tri id_9,
    input uwire id_10,
    output wand id_11,
    output uwire id_12
);
  wand id_15 = id_10;
  nor primCall (id_4, id_0, id_1, id_14, id_8, id_15, id_10);
  module_0 modCall_1 (
      id_8,
      id_15,
      id_15,
      id_1,
      id_1,
      id_0
  );
endmodule
