// Seed: 4033168117
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    output wor id_2,
    output supply0 id_3,
    input supply1 id_4,
    output wire id_5,
    input supply1 id_6,
    output supply0 id_7,
    output wand id_8
);
  assign id_3 = 1'b0;
  always_comb @(posedge id_4) begin : LABEL_0
    cover (id_0);
  end
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    input tri0 id_2,
    output supply1 id_3,
    output uwire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    input tri id_8,
    output tri0 id_9,
    output tri0 id_10,
    input wand id_11,
    output tri1 id_12,
    input tri0 id_13,
    output wor id_14,
    input uwire id_15,
    input wand id_16,
    output tri1 id_17,
    input tri0 id_18,
    input tri0 id_19,
    input wire id_20,
    input tri0 id_21,
    input wire id_22,
    input wor id_23,
    input wire id_24
);
  wire id_26;
  wire id_27;
  or primCall (
      id_10,
      id_15,
      id_20,
      id_5,
      id_16,
      id_18,
      id_19,
      id_13,
      id_24,
      id_26,
      id_2,
      id_7,
      id_0,
      id_27,
      id_11,
      id_6,
      id_8,
      id_23,
      id_22,
      id_21
  );
  module_0 modCall_1 (
      id_20,
      id_11,
      id_10,
      id_14,
      id_2,
      id_4,
      id_16,
      id_14,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule
