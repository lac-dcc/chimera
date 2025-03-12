// Seed: 1732510337
module module_0 (
    input wor id_0,
    output tri id_1,
    input tri0 id_2,
    input supply1 id_3
    , id_6,
    input uwire id_4
    , id_7
);
  wire id_8;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input tri id_2,
    output tri id_3,
    input wor id_4,
    input uwire id_5,
    input wor id_6,
    input uwire id_7,
    input wand id_8,
    output wand id_9,
    input supply1 id_10
);
  logic [7:0][1] id_12;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_5,
      id_6
  );
  assign modCall_1.id_0 = 0;
  logic id_13 = id_7;
  assign id_13[1] = id_10;
  assign id_1 = id_10;
  nor primCall (id_1, id_0, id_2, id_12, id_5, id_7, id_10, id_4, id_8);
endmodule
