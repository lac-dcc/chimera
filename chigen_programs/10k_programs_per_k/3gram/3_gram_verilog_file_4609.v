// Seed: 1068294898
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    output supply1 id_2
    , id_19,
    output tri id_3,
    output supply0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output tri1 id_7,
    output uwire id_8,
    input tri1 id_9,
    output supply1 id_10,
    input tri1 id_11,
    output wor id_12,
    input tri id_13,
    input tri1 id_14,
    input supply0 id_15,
    input wand id_16,
    input uwire id_17
);
  logic id_20 = -1;
  wire  id_21;
  ;
  localparam id_22 = 1;
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    output supply1 id_2,
    output supply1 id_3,
    output tri0 id_4
);
  parameter id_6 = -1'h0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_1,
      id_4,
      id_2,
      id_1,
      id_4,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_15 = 0;
endmodule
