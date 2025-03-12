// Seed: 2684093188
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input wand id_2,
    input tri id_3,
    input tri0 id_4,
    output tri id_5,
    input wire id_6,
    output tri id_7,
    output wor id_8,
    input tri id_9,
    input tri0 id_10,
    input tri module_0,
    output wor id_12,
    input wand id_13,
    input supply1 id_14,
    input supply1 id_15,
    input wire id_16,
    input wor id_17,
    output tri1 id_18,
    output wire id_19,
    input tri0 id_20,
    input supply0 id_21,
    output wire id_22,
    output wor id_23
    , id_28,
    output wor id_24,
    input supply0 id_25,
    input supply0 id_26
);
  wire [-1 'h0 : -1] id_29;
  assign module_1.id_16 = 0;
endmodule
module module_0 #(
    parameter id_7 = 32'd26
) (
    output tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6,
    input tri _id_7,
    input supply1 id_8,
    input wire id_9,
    output wire id_10,
    input tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    output tri id_14,
    output wand id_15,
    output uwire id_16,
    output uwire id_17,
    output tri id_18,
    input wand module_1,
    input wire id_20,
    output wor id_21
);
  wire ["" : id_7  ==  -1] id_23;
  always_comb @(negedge id_8 == 1) begin : LABEL_0
    cover (id_6);
  end
  wire id_24;
  wire id_25;
  logic id_26, id_27;
  module_0 modCall_1 (
      id_2,
      id_21,
      id_12,
      id_2,
      id_20,
      id_18,
      id_20,
      id_17,
      id_16,
      id_9,
      id_5,
      id_4,
      id_17,
      id_6,
      id_2,
      id_2,
      id_8,
      id_4,
      id_17,
      id_18,
      id_11,
      id_4,
      id_14,
      id_18,
      id_16,
      id_8,
      id_12
  );
endmodule
