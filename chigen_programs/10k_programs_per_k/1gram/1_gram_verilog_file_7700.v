// Seed: 833688301
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output tri1 id_2
    , id_15,
    output tri id_3,
    output supply1 id_4,
    output wire id_5,
    output tri1 id_6,
    input uwire id_7,
    output supply1 id_8,
    output wire id_9,
    input wand id_10,
    input tri id_11,
    output wire id_12,
    input wor id_13
);
  assign id_6 = id_15;
endmodule
module module_1 (
    output tri0 id_0,
    input wire id_1,
    output tri id_2,
    input supply0 id_3,
    output logic id_4,
    output wire id_5,
    input wor id_6,
    input wor id_7,
    output wire id_8,
    input tri id_9,
    input logic id_10,
    input tri0 id_11,
    output tri id_12,
    output wor id_13,
    output tri1 id_14,
    output tri0 id_15,
    input tri id_16,
    input wand id_17,
    input supply0 id_18,
    inout supply0 id_19,
    input supply1 id_20
);
  always
  fork
    id_4 <= id_10;
  join
  module_0 modCall_1 (
      id_0,
      id_1,
      id_14,
      id_8,
      id_19,
      id_8,
      id_14,
      id_18,
      id_14,
      id_2,
      id_16,
      id_20,
      id_13,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
