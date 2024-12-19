// Seed: 315392116
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3,
    input supply0 id_4,
    input uwire id_5,
    input wire id_6,
    output wor id_7,
    input wand id_8,
    input tri id_9,
    input supply1 id_10,
    input tri0 id_11,
    input tri1 id_12,
    input wand id_13,
    output uwire id_14,
    output wand id_15
    , id_19,
    input uwire id_16,
    output tri id_17
);
  wire id_20;
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    input wand id_2,
    input wor id_3,
    input tri id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply1 id_7,
    output logic id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_1,
      id_1,
      id_4,
      id_7,
      id_6,
      id_1,
      id_7,
      id_2,
      id_7,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_7,
      id_5
  );
  assign modCall_1.id_15 = 0;
  wire id_11;
  always @(*) id_8 = #1 1;
endmodule
