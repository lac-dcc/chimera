// Seed: 2890012118
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wand id_2,
    input wire id_3
    , id_12,
    input uwire id_4,
    output wire id_5,
    input wor id_6,
    input wire id_7,
    input tri1 id_8,
    output wor id_9,
    input wor id_10
);
endmodule
module module_1 (
    inout uwire id_0,
    output tri id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri0 id_6,
    input tri id_7,
    input tri id_8,
    input wand id_9
);
  wire id_11;
  xnor primCall (id_0, id_9, id_11, id_12, id_3, id_7, id_5, id_4, id_8, id_6);
  parameter id_12 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5,
      id_6,
      id_2,
      id_5,
      id_7,
      id_6,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
