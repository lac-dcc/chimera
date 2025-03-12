// Seed: 2685732612
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wire id_2,
    input uwire id_3,
    input tri id_4,
    output wand id_5,
    output wor id_6,
    input wire id_7,
    input uwire id_8
    , id_22,
    input tri1 id_9,
    output wand id_10,
    input supply1 id_11
    , id_23,
    output uwire id_12,
    input supply1 id_13,
    input wor id_14,
    output wire id_15
    , id_24,
    input supply0 id_16,
    input tri0 id_17,
    input wand id_18
    , id_25,
    input wand id_19,
    output tri id_20
);
  always @(1 or 1) if (1 && -1) $clog2(59);
  ;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output logic id_2,
    output uwire id_3
);
  generate
    for (id_5 = 1; id_5; id_2 = 1) begin : LABEL_0
      assign id_2 = id_1;
    end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_0,
      id_3,
      id_1,
      id_3,
      id_0,
      id_0,
      id_3,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
