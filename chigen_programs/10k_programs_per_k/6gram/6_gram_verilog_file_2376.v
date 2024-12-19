// Seed: 2734748479
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input uwire id_2
    , id_14,
    output wire id_3,
    output wire id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    input supply0 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri0 id_11,
    output supply1 id_12
);
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wand id_3,
    inout uwire id_4,
    input tri id_5,
    output tri0 id_6,
    input uwire id_7,
    output wor id_8,
    output logic id_9,
    input wor id_10,
    input wand id_11,
    output wire id_12
);
  initial id_9 = #1 |id_5;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_4,
      id_8,
      id_4,
      id_7,
      id_10,
      id_10,
      id_5,
      id_1,
      id_0,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
