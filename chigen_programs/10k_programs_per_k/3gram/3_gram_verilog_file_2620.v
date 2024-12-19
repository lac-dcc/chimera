// Seed: 1676591657
macromodule module_0 (
    output tri1 id_0,
    input wire id_1,
    output wire id_2,
    output tri1 id_3,
    output tri id_4,
    input wand id_5,
    output supply0 id_6,
    input wand id_7,
    output supply1 id_8,
    input supply1 id_9,
    output tri id_10,
    input tri id_11,
    input supply0 id_12,
    output uwire id_13,
    output uwire id_14,
    input uwire id_15,
    output wor id_16,
    input wor id_17
);
  assign id_8 = id_11;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wor id_5,
    input tri0 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input uwire id_9,
    input wand id_10,
    input wor id_11,
    output tri0 id_12,
    input wand id_13,
    output supply0 id_14,
    input wire id_15,
    input uwire id_16,
    output uwire id_17,
    input tri0 id_18,
    input wand id_19,
    input tri id_20,
    input tri0 id_21,
    output logic id_22,
    input wire id_23,
    output supply0 id_24,
    input uwire id_25,
    output wand id_26,
    output supply0 id_27,
    input tri1 id_28,
    input tri id_29,
    input wor id_30,
    input tri1 id_31,
    output supply1 id_32,
    output tri1 id_33
);
  always @(posedge 1) begin : LABEL_0
    #1 id_22 <= 1;
    id_24 = 1;
  end
  module_0 modCall_1 (
      id_32,
      id_19,
      id_26,
      id_14,
      id_14,
      id_3,
      id_32,
      id_23,
      id_24,
      id_7,
      id_27,
      id_30,
      id_20,
      id_24,
      id_24,
      id_5,
      id_32,
      id_0
  );
endmodule
