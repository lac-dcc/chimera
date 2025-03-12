// Seed: 813542393
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input uwire id_2,
    output tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output logic id_8,
    input wire id_9,
    input tri1 id_10,
    output wand id_11,
    output uwire id_12,
    output wor id_13,
    output tri0 id_14
);
  always begin : LABEL_0
    id_8 = -1 === 1 * id_7;
    id_0 += !id_5;
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd12
) (
    output wand id_0,
    input wor id_1,
    input uwire _id_2,
    input tri id_3,
    output wand id_4,
    input wor id_5,
    output uwire id_6,
    output wire id_7,
    input uwire id_8,
    output tri1 id_9,
    input wand id_10,
    input supply1 id_11,
    input uwire id_12,
    input supply1 id_13,
    input wire id_14,
    input supply0 id_15,
    output wire id_16,
    output logic id_17,
    input tri0 id_18,
    output wand id_19,
    output wand id_20,
    input tri id_21,
    input wand id_22,
    output wand id_23,
    output wire id_24,
    input wor id_25,
    input supply1 id_26,
    input tri0 id_27,
    output tri0 id_28,
    input uwire id_29,
    output wire id_30,
    output wand id_31,
    input supply1 id_32,
    output wor id_33
);
  always @(negedge 1) begin : LABEL_0
    id_17 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_23,
      id_22,
      id_28,
      id_13,
      id_10,
      id_19,
      id_14,
      id_17,
      id_11,
      id_5,
      id_9,
      id_28,
      id_0,
      id_16
  );
  assign id_28 = 1;
  localparam id_35 = 1;
  wire [id_2 : -1] id_36;
endmodule
