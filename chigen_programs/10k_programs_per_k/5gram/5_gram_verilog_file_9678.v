// Seed: 2552914639
module module_0 (
    output tri0 id_0,
    output wire id_1
);
  wire id_3;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output wire id_2,
    output supply1 id_3
    , id_36,
    input wor id_4,
    input wor id_5,
    output supply1 id_6,
    input wor id_7,
    output tri id_8,
    input tri0 id_9,
    input uwire id_10,
    input wor id_11,
    input uwire id_12,
    output wire id_13,
    input tri id_14,
    input wand id_15
    , id_37,
    input supply1 id_16
    , id_38,
    input tri0 id_17,
    output wor id_18,
    output tri id_19,
    input supply1 id_20,
    output uwire id_21,
    input wor id_22,
    input tri1 id_23,
    input wand id_24,
    output logic id_25,
    input uwire id_26,
    input tri1 id_27,
    output supply1 id_28,
    input wand id_29,
    output wor id_30,
    input supply0 id_31,
    input wand id_32,
    output wor id_33,
    output tri id_34
    , id_39
);
  always @(negedge 1'h0)
    if (id_32) begin : LABEL_0
      id_36[1] = id_4;
      id_2 = id_1;
      id_25 <= 1;
      @(posedge id_12 ~^ 1);
    end
  module_0 modCall_1 (
      id_6,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
