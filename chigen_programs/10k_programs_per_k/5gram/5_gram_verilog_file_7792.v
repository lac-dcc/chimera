// Seed: 799624882
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    output wor id_2,
    output wand id_3,
    output wor id_4,
    output supply0 id_5,
    output uwire id_6,
    input supply0 id_7,
    input wire id_8,
    output uwire id_9
    , id_35,
    input supply0 id_10,
    input wire id_11,
    output wand id_12,
    input supply0 id_13,
    output tri0 id_14,
    output uwire id_15,
    input tri id_16,
    output supply1 id_17,
    output tri id_18,
    input supply1 id_19,
    output tri id_20,
    input supply1 id_21,
    input uwire id_22,
    input wand id_23,
    output tri0 id_24,
    input tri0 id_25,
    output supply0 id_26,
    input wor id_27,
    output tri0 id_28,
    input tri id_29,
    output supply1 id_30,
    input tri0 id_31,
    input wor id_32,
    output tri1 id_33
);
  assign id_20 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri1 id_4,
    output wor id_5,
    output logic id_6,
    output wire id_7,
    output tri0 id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wor id_11
);
  assign id_3 = id_9 ? id_11 : 1'h0 == (id_10);
  assign id_7 = id_10 - id_9;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_5,
      id_1,
      id_5,
      id_5,
      id_9,
      id_11,
      id_8,
      id_0,
      id_10,
      id_5,
      id_0,
      id_3,
      id_5,
      id_11,
      id_8,
      id_8,
      id_10,
      id_1,
      id_0,
      id_2,
      id_10,
      id_7,
      id_10,
      id_1,
      id_9,
      id_3,
      id_0,
      id_8,
      id_9,
      id_0,
      id_8
  );
  assign modCall_1.type_40 = 0;
  wire id_13;
  always @(posedge -1'b0 or negedge id_4) begin : LABEL_0
    if (1) id_6 <= -1;
  end
endmodule
