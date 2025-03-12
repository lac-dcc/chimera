// Seed: 2338055599
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output tri1 id_7,
    output wor id_8,
    output supply0 id_9,
    output uwire id_10,
    output wor id_11,
    output uwire id_12,
    input tri0 id_13,
    output wand id_14,
    input wor id_15,
    input supply1 id_16,
    output tri0 id_17,
    output tri1 id_18,
    output wor id_19,
    input supply1 id_20
    , id_37,
    output wor id_21,
    input tri1 id_22,
    input tri1 id_23,
    input tri id_24,
    output wor id_25,
    output tri id_26,
    input supply1 id_27,
    input wor id_28,
    input uwire id_29,
    output supply1 id_30
    , id_38, id_39,
    input wor id_31
    , id_40,
    input tri1 id_32,
    input uwire id_33,
    input tri id_34
    , id_41,
    output supply1 id_35
);
  logic [-1 : -1] id_42 = id_32;
  assign module_1.id_19 = 0;
endmodule
module module_0 #(
    parameter id_17 = 32'd90
) (
    output uwire id_0,
    output supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    input wire id_4,
    input uwire id_5,
    input supply1 id_6,
    output tri0 id_7,
    output wor id_8,
    input supply1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input supply0 id_12,
    output uwire id_13,
    input tri id_14,
    output tri1 module_1,
    output wand id_16,
    input wand _id_17,
    input uwire id_18,
    output logic id_19,
    output tri0 id_20
);
  assign id_15 = id_4;
  assign id_15 = id_6;
  logic id_22 = id_22;
  always @(-1'd0) begin : LABEL_0
    if (-1 & 1) begin : LABEL_1
      id_19 = id_2;
      id_22 <= 1'd0;
    end
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_14,
      id_5,
      id_2,
      id_18,
      id_14,
      id_0,
      id_0,
      id_16,
      id_16,
      id_15,
      id_13,
      id_4,
      id_0,
      id_18,
      id_11,
      id_7,
      id_1,
      id_8,
      id_11,
      id_3,
      id_5,
      id_4,
      id_4,
      id_3,
      id_8,
      id_6,
      id_4,
      id_11,
      id_1,
      id_2,
      id_2,
      id_11,
      id_4,
      id_7
  );
  initial begin : LABEL_2
    id_19 <= -1'h0;
  end
  logic [1 : id_17] id_23;
endmodule
