// Seed: 1599202982
module module_0 (
    input tri id_0
    , id_10,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    output supply1 id_4,
    input supply1 id_5
    , id_11, id_12,
    input supply0 id_6,
    input wor id_7,
    input wire id_8
);
  assign id_10 = -1;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    input uwire id_7,
    input wand id_8
);
  wire id_10 = id_8;
  nor primCall (id_0, id_8, id_4, id_6, id_3);
  assign id_2 = -1'b0;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_8,
      id_5,
      id_7,
      id_6,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
