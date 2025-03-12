// Seed: 4233749768
macromodule module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input tri0 id_3,
    output wor id_4,
    input tri1 id_5,
    input supply1 id_6,
    output uwire id_7,
    input uwire id_8,
    output wire id_9,
    input tri id_10,
    output tri id_11,
    output wand id_12,
    output wire id_13,
    input tri1 id_14,
    input tri0 id_15,
    output wire id_16,
    output tri id_17,
    input tri id_18,
    input wor id_19,
    input wor id_20,
    input wand id_21,
    input supply1 id_22,
    input wor id_23,
    input supply1 id_24,
    input tri0 id_25,
    input wor id_26
);
  wire id_28;
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wire id_2,
    input tri id_3,
    input tri id_4,
    input tri0 id_5,
    output tri1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output supply1 id_9,
    output supply0 id_10,
    input wor id_11,
    output wire id_12,
    output supply0 id_13,
    output logic id_14
    , id_33,
    input tri0 id_15,
    input supply1 id_16,
    output supply0 id_17,
    output supply1 id_18,
    output tri0 id_19,
    input wire id_20,
    input wire id_21,
    output wor id_22,
    input wand id_23,
    input supply0 id_24,
    input wand id_25,
    input tri id_26,
    input tri1 id_27,
    input supply1 id_28,
    output tri1 id_29,
    input wire id_30,
    input wire id_31
    , id_34
);
  assign id_9  = id_25;
  assign id_14 = id_33;
  always @(posedge id_7 or posedge id_28) id_14 = id_7;
  wire id_35;
  module_0 modCall_1 (
      id_4,
      id_27,
      id_2,
      id_4,
      id_18,
      id_24,
      id_1,
      id_17,
      id_4,
      id_9,
      id_26,
      id_29,
      id_22,
      id_29,
      id_31,
      id_15,
      id_13,
      id_9,
      id_4,
      id_25,
      id_3,
      id_31,
      id_21,
      id_27,
      id_15,
      id_1,
      id_7
  );
  assign id_13 = id_7;
endmodule
