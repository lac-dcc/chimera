// Seed: 3426040475
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4,
    input wand id_5,
    input uwire id_6,
    output wand id_7,
    output wand id_8,
    input tri1 id_9,
    output wor id_10,
    input wor id_11,
    input wire id_12,
    output tri0 id_13,
    input tri id_14,
    input wand id_15,
    input wand id_16,
    output uwire id_17
    , id_28,
    input tri1 id_18,
    input tri0 id_19,
    output supply1 id_20,
    input tri id_21,
    input uwire id_22,
    input tri0 id_23,
    input supply0 id_24,
    input wand id_25,
    output wire id_26
    , id_29
);
  assign id_0 = id_28;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    output wor id_5,
    input wire id_6
    , id_12,
    input tri1 id_7,
    input uwire id_8,
    input supply1 id_9,
    output supply0 id_10
);
  always @(~id_0) begin : LABEL_0
    id_1 = id_8;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_6,
      id_7,
      id_4,
      id_2,
      id_1,
      id_0,
      id_2,
      id_6,
      id_3,
      id_1,
      id_3,
      id_0,
      id_6,
      id_5,
      id_8,
      id_3,
      id_2,
      id_0,
      id_4,
      id_8,
      id_7,
      id_9,
      id_1
  );
endmodule
