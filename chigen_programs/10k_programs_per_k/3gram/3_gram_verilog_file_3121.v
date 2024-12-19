// Seed: 1397371208
module module_0 (
    output supply0 id_0
    , id_16, id_17,
    input tri id_1
    , id_18,
    input tri0 id_2,
    input wire id_3
    , id_19,
    output wor id_4,
    output wand id_5,
    output uwire id_6,
    input wand id_7,
    input uwire id_8,
    input wor id_9,
    input tri0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    output uwire id_13,
    output supply1 id_14
);
  wire id_20;
  assign module_1.type_28 = 0;
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    input uwire id_2,
    input tri0 id_3,
    output wand id_4,
    input wand id_5,
    output logic id_6,
    output supply1 id_7,
    input tri0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri1 id_11,
    inout supply0 id_12,
    input wand id_13,
    input uwire id_14,
    input supply0 id_15,
    output supply1 id_16,
    output supply1 id_17
);
  always id_6 = #1 1 - 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_10,
      id_2,
      id_4,
      id_16,
      id_4,
      id_10,
      id_11,
      id_10,
      id_5,
      id_15,
      id_15,
      id_12,
      id_4
  );
endmodule
