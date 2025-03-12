// Seed: 986104748
module module_0 (
    input wor id_0,
    output tri1 id_1
    , id_20,
    output tri id_2,
    input tri0 id_3,
    input tri id_4,
    output wire id_5,
    input tri id_6,
    output tri0 id_7,
    input tri id_8,
    input wand id_9,
    input tri id_10,
    output tri0 id_11,
    output tri id_12,
    output wor id_13,
    input wand id_14,
    input supply1 id_15,
    output supply1 id_16,
    input wire id_17,
    input tri0 id_18
);
  wire id_21;
  assign id_5  = -1;
  assign id_13 = id_15 == -1;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output supply0 id_2,
    input wand id_3,
    input wire id_4,
    output supply0 id_5,
    input uwire id_6,
    input wire id_7,
    output tri id_8,
    input supply1 id_9,
    input tri0 id_10
    , id_23,
    input tri1 id_11,
    output wand id_12,
    output logic id_13,
    output uwire id_14,
    output wand id_15,
    input uwire id_16,
    output wor id_17,
    input uwire id_18,
    input supply1 id_19,
    output wand id_20
    , id_24,
    output wor id_21
);
  always @(id_7.id_0) begin : LABEL_0
    id_13 <= 1;
  end
  xnor primCall (
      id_5, id_11, id_0, id_7, id_6, id_4, id_19, id_1, id_16, id_3, id_24, id_23, id_9, id_10
  );
  module_0 modCall_1 (
      id_7,
      id_2,
      id_2,
      id_6,
      id_16,
      id_8,
      id_18,
      id_20,
      id_1,
      id_9,
      id_18,
      id_12,
      id_21,
      id_8,
      id_1,
      id_18,
      id_14,
      id_4,
      id_18
  );
  assign modCall_1.id_0 = 0;
endmodule
