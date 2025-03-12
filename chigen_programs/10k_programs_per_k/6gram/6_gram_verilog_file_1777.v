// Seed: 4088638690
module module_0;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1,
    output wor id_2,
    output tri id_3,
    output logic id_4,
    output supply1 id_5,
    input uwire id_6,
    output supply1 id_7,
    output wire id_8,
    output tri0 id_9,
    input tri1 id_10,
    output wor id_11,
    input uwire id_12,
    input supply1 id_13,
    output wor id_14,
    input tri id_15,
    output tri0 id_16,
    input wor id_17,
    output tri1 id_18,
    input wand id_19,
    input uwire id_20,
    input tri1 id_21,
    output supply1 id_22,
    input wand id_23,
    input wor id_24,
    input supply0 id_25,
    input wand id_26,
    input wor id_27
);
  assign id_5 = (id_19 ? (-1) & -1 & id_15 : id_26);
  or primCall (
      id_0,
      id_1,
      id_10,
      id_12,
      id_13,
      id_15,
      id_17,
      id_19,
      id_20,
      id_21,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_6
  );
  module_0 modCall_1 ();
  always @(negedge id_23) begin : LABEL_0
    id_4 = id_26 * 1;
  end
endmodule
