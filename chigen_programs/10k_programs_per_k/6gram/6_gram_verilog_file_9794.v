// Seed: 1939976452
module module_0 (
    output supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    input tri module_0,
    input tri0 id_7,
    output tri0 id_8,
    input supply0 id_9,
    input tri1 id_10,
    output wire id_11,
    input wire id_12,
    output wand id_13,
    input uwire id_14,
    output wor id_15,
    input supply0 id_16,
    input tri id_17,
    input tri1 id_18,
    output wor id_19
);
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output tri0 id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wand id_8,
    output wor id_9,
    input wire id_10,
    input wor id_11,
    output tri id_12,
    output tri0 id_13,
    input wire id_14,
    input wand id_15,
    input wand id_16,
    output wor id_17,
    output logic id_18,
    output supply1 id_19,
    input tri0 id_20,
    input uwire id_21,
    output supply0 id_22,
    input uwire id_23,
    inout supply1 id_24,
    output supply1 id_25,
    output supply1 id_26,
    output tri1 id_27,
    input tri id_28,
    input uwire id_29,
    input supply1 id_30,
    input supply1 id_31,
    output supply1 id_32,
    output wor id_33
);
  bit id_35, id_36;
  nor primCall (
      id_22,
      id_24,
      id_31,
      id_11,
      id_35,
      id_36,
      id_14,
      id_29,
      id_4,
      id_0,
      id_16,
      id_3,
      id_30,
      id_1,
      id_7,
      id_10
  );
  assign id_5 = -1'h0;
  always @(id_20 or -1) begin : LABEL_0
    id_36 <= -1;
    id_18 = #1 1;
  end
  module_0 modCall_1 (
      id_22,
      id_29,
      id_16,
      id_31,
      id_20,
      id_3,
      id_4,
      id_16,
      id_25,
      id_21,
      id_16,
      id_12,
      id_3,
      id_5,
      id_21,
      id_26,
      id_10,
      id_6,
      id_3,
      id_22
  );
endmodule
