// Seed: 1588598903
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4
    , id_26,
    input wor id_5,
    output uwire id_6,
    output uwire id_7,
    output wand id_8,
    output supply0 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri0 id_13,
    output tri id_14,
    input supply0 id_15,
    input tri0 id_16,
    input uwire id_17,
    output tri id_18,
    output supply1 id_19,
    input tri id_20,
    output tri1 id_21,
    input tri id_22,
    input wire id_23,
    output tri1 id_24
);
  always_comb @((id_5) or posedge 1) begin : LABEL_0$display
    ;
  end
  assign id_24 = 1;
  wire id_27;
  wire id_28;
  wire id_29;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri id_6,
    input tri0 id_7,
    input uwire id_8#(.id_21(1))
    , id_22,
    output tri1 id_9,
    input supply0 id_10,
    output wire id_11,
    input wand id_12,
    output supply0 id_13,
    input supply1 id_14,
    input uwire id_15,
    input wand id_16,
    output wire id_17,
    input supply0 id_18,
    output uwire id_19
);
  always @(1 or posedge id_18);
  xor primCall (
      id_9,
      id_5,
      id_8,
      id_2,
      id_15,
      id_14,
      id_3,
      id_1,
      id_18,
      id_12,
      id_10,
      id_6,
      id_7,
      id_22,
      id_21
  );
  module_0 modCall_1 (
      id_2,
      id_10,
      id_2,
      id_4,
      id_14,
      id_5,
      id_0,
      id_11,
      id_17,
      id_13,
      id_4,
      id_8,
      id_2,
      id_5,
      id_0,
      id_15,
      id_10,
      id_10,
      id_11,
      id_9,
      id_4,
      id_0,
      id_15,
      id_18,
      id_9
  );
  assign modCall_1.id_11 = 0;
endmodule
