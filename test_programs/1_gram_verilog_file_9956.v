// Seed: 1391438602
module module_0 (
    input wire id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wand id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    id_14,
    input tri0 id_8,
    output wor id_9,
    input tri1 id_10,
    output uwire id_11,
    input uwire id_12
);
  wire id_15;
  assign #(-1'b0) id_4 = id_6 >= {id_6{-1}};
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    output tri id_2,
    output supply0 id_3,
    output wor id_4,
    input wand id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wand id_8,
    input tri0 id_9
);
  always id_1 <= 1;
  always id_1 = -1;
  or primCall (id_3, id_6, id_9, id_0, id_7, id_5, id_8);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_9,
      id_4,
      id_6,
      id_7,
      id_5,
      id_8,
      id_3,
      id_8,
      id_3,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
