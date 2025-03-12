// Seed: 179734079
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input tri id_3,
    input wand id_4,
    output uwire id_5,
    input wire id_6,
    input wor id_7,
    output uwire id_8
    , id_21,
    input uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    output logic id_12,
    output tri id_13,
    input tri id_14,
    input supply1 id_15,
    input wire id_16
    , id_22,
    input supply0 id_17,
    input supply1 id_18
    , id_23,
    output wand id_19
);
  parameter id_24 = -1;
  always id_12 <= id_23;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    output logic id_2,
    output wand id_3,
    input supply0 id_4
);
  always @(1) id_2 <= 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_4,
      id_4,
      id_0,
      id_3,
      id_0,
      id_4,
      id_3,
      id_4,
      id_4,
      id_1,
      id_2,
      id_3,
      id_0,
      id_4,
      id_1,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_17 = 0;
endmodule
