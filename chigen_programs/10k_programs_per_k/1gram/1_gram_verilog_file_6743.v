// Seed: 1168770206
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output tri id_2[1 : -1 'b0],
    input uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output wor id_7,
    input supply1 id_8,
    input supply0 id_9,
    input tri0 id_10
    , id_12
);
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output tri id_2,
    input supply0 id_3,
    output logic id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7
    , id_13,
    input supply0 id_8,
    input wand id_9,
    input supply1 id_10,
    input tri1 id_11
);
  always id_4 = id_1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_2,
      id_5,
      id_11,
      id_9,
      id_7,
      id_2,
      id_10,
      id_8,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
