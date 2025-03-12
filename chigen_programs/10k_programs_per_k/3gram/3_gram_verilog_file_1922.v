// Seed: 415473234
module module_0 (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply1 id_4,
    inout wand id_5,
    input tri id_6,
    output tri1 id_7,
    input supply0 id_8
    , id_10
);
  wire [(  -1  ) : -1 'b0] id_11;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input tri1 id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri0 id_8,
    output wand id_9,
    input tri0 id_10,
    inout uwire id_11,
    input tri id_12,
    input wor id_13,
    input supply1 id_14,
    input tri0 id_15,
    output logic id_16,
    output tri id_17,
    input wire id_18
);
  parameter id_20 = 1 & 1;
  module_0 modCall_1 (
      id_17,
      id_1,
      id_6,
      id_13,
      id_4,
      id_11,
      id_6,
      id_9,
      id_15
  );
  assign modCall_1.id_2 = 0;
  always_ff id_16 <= id_11;
  assign id_11 = id_5;
  assign id_17 = -1;
endmodule
