// Seed: 2393774885
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4,
    input wor id_5,
    input wand id_6,
    output tri0 id_7,
    input supply1 id_8,
    output wand id_9,
    output tri1 id_10,
    output uwire id_11,
    output tri0 id_12,
    input tri1 id_13,
    input wor id_14,
    output tri id_15,
    output tri1 id_16,
    input tri0 id_17
);
  tri id_19;
  assign id_19 = 1;
  wire id_20;
  wire id_21;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output wand id_1,
    input tri id_2
    , id_8,
    input supply1 id_3,
    input tri1 id_4,
    input wire id_5,
    inout tri1 id_6
);
  always_ff @* id_0 = id_8 ^ 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_4,
      id_5,
      id_6,
      id_3,
      id_0,
      id_0,
      id_0,
      id_6,
      id_3,
      id_2,
      id_6,
      id_0,
      id_3
  );
  wor id_9 = 1'b0 != id_3;
endmodule
