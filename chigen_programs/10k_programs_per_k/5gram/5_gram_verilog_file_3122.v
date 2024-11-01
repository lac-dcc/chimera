// Seed: 2996910983
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input wor id_4,
    input tri id_5,
    output uwire id_6,
    output tri0 id_7,
    input wor id_8,
    input wire id_9,
    input supply0 id_10,
    output wor id_11,
    input tri0 module_0,
    input tri1 id_13,
    input tri0 id_14,
    output wire id_15,
    input supply0 id_16,
    input tri1 id_17,
    output wand id_18,
    input tri0 id_19,
    output wand id_20,
    input wire id_21,
    input wor id_22,
    input tri0 id_23,
    input supply1 id_24,
    output tri1 id_25
);
  assign id_25 = 1;
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri id_3,
    input tri1 id_4,
    output wire id_5,
    input wire id_6,
    input tri0 id_7,
    output tri0 id_8,
    output supply1 id_9,
    output wand id_10,
    input wor id_11,
    output wire id_12,
    input wor id_13,
    input tri id_14,
    output supply0 id_15,
    input tri0 id_16,
    input wor id_17,
    output supply0 id_18,
    input supply0 id_19,
    input supply0 id_20,
    input wor id_21,
    output tri1 id_22,
    output tri1 id_23
);
  wire id_25;
  assign id_15 = 1;
  wand id_26 = id_2;
  module_0(
      id_2,
      id_2,
      id_5,
      id_9,
      id_3,
      id_2,
      id_22,
      id_8,
      id_26,
      id_0,
      id_14,
      id_5,
      id_26,
      id_16,
      id_11,
      id_22,
      id_19,
      id_11,
      id_26,
      id_3,
      id_15,
      id_4,
      id_11,
      id_4,
      id_6,
      id_18
  );
  generate
    for (id_27 = id_11 & id_27; 1'b0 < id_7; id_1++) begin : id_28
      tri0 id_29 = 1 - id_28;
    end
  endgenerate
endmodule
