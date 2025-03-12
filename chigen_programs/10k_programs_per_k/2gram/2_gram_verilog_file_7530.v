// Seed: 4208921997
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri0 id_4
    , id_25,
    output wand id_5,
    input uwire id_6,
    input wire id_7,
    input wor id_8,
    output wor id_9,
    input supply0 id_10
    , id_26,
    input wor id_11,
    input wor id_12,
    input supply0 id_13,
    output wor id_14,
    input tri1 id_15,
    output supply1 id_16,
    input wire id_17,
    input tri id_18,
    input wor id_19,
    input tri1 id_20,
    input supply0 id_21,
    input tri0 id_22,
    output tri0 id_23
);
  always_ff begin : LABEL_0
    if (1) begin : LABEL_1
      $clog2(33);
      ;
    end
  end
endmodule
module module_1 (
    input tri1 id_0,
    inout wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    output tri id_4,
    input wand id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8,
    output tri1 id_9,
    input wire id_10,
    output supply0 id_11,
    output wand id_12,
    output uwire id_13,
    input wand id_14,
    input tri0 id_15,
    output tri id_16
);
  assign id_13 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_1,
      id_4,
      id_8,
      id_1,
      id_2,
      id_16,
      id_7,
      id_14,
      id_10,
      id_0,
      id_1,
      id_2,
      id_13,
      id_7,
      id_5,
      id_0,
      id_14,
      id_7,
      id_3,
      id_12
  );
  assign modCall_1.id_3 = 0;
endmodule
