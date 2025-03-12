// Seed: 1610575305
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output tri0 id_2,
    output supply0 id_3,
    input wor id_4,
    output tri0 id_5,
    input tri id_6,
    input uwire id_7,
    output supply1 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri id_11,
    output supply0 id_12,
    input uwire id_13,
    input supply0 id_14
    , id_18,
    output wor id_15,
    output wand id_16
);
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wand id_9,
    output tri id_10,
    input uwire id_11,
    input supply1 id_12,
    input uwire id_13,
    output wand id_14,
    output logic id_15,
    output tri1 id_16,
    output supply0 id_17
);
  always_latch begin : LABEL_0
    if (1) id_15 <= -1;
    else begin : LABEL_1
      $unsigned(74);
      ;
    end
  end
  module_0 modCall_1 (
      id_14,
      id_11,
      id_17,
      id_2,
      id_13,
      id_16,
      id_4,
      id_7,
      id_2,
      id_5,
      id_5,
      id_16,
      id_14,
      id_12,
      id_4,
      id_2,
      id_16
  );
  assign modCall_1.id_13 = 0;
endmodule
