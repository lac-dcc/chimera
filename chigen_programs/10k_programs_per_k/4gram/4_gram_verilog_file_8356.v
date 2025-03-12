// Seed: 1284097600
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input wand id_4,
    output wire id_5
);
  wire id_7 = id_0;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd23,
    parameter id_11 = 32'd42
) (
    input wand id_0,
    input supply1 _id_1,
    input uwire id_2,
    input supply1 id_3,
    output wor id_4,
    output tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input supply1 id_9,
    input wor id_10,
    input wand _id_11,
    output logic id_12,
    input wire id_13,
    input wand id_14,
    output tri1 id_15,
    output supply1 id_16,
    input wire id_17,
    input wand id_18,
    input wor id_19
);
  always_comb @(posedge id_0) begin : LABEL_0
    id_12 = -1;
  end
  module_0 modCall_1 (
      id_17,
      id_18,
      id_19,
      id_2,
      id_2,
      id_15
  );
  assign id_12 = id_6;
  logic [id_1 : id_11] id_21;
endmodule
