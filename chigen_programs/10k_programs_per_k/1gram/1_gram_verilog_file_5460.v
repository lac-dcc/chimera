// Seed: 776218382
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply0 id_2,
    output tri id_3,
    output supply0 id_4,
    input tri1 id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input wor id_12,
    input tri0 id_13,
    input supply1 id_14,
    input supply1 id_15
);
  wire id_17;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd66,
    parameter id_9 = 32'd11
) (
    output wor id_0,
    input tri id_1,
    output supply1 id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input tri0 _id_6,
    input tri id_7,
    input supply0 id_8,
    output uwire _id_9
    , id_24,
    input tri id_10[-1 : id_9],
    input tri1 id_11,
    input uwire id_12,
    output logic id_13
    , id_25,
    input tri0 id_14,
    input wand id_15,
    input tri0 id_16,
    input wire id_17,
    output uwire id_18,
    output tri0 id_19,
    output wand id_20,
    output logic id_21,
    input uwire id_22
);
  generate
    always_comb id_21 = 1;
    always id_13 <= 1'b0;
    logic [7:0][id_6][-1 : 1] id_26;
    ;
    assign id_24 = -1 == 1;
    assign id_0  = id_7 - id_15;
    logic id_27;
    ;
  endgenerate
  module_0 modCall_1 (
      id_17,
      id_8,
      id_18,
      id_19,
      id_2,
      id_12,
      id_2,
      id_17,
      id_16,
      id_19,
      id_4,
      id_3,
      id_17,
      id_5,
      id_22,
      id_12
  );
  xor primCall (
      id_21,
      id_12,
      id_15,
      id_17,
      id_10,
      id_8,
      id_4,
      id_25,
      id_27,
      id_14,
      id_16,
      id_11,
      id_24,
      id_3,
      id_7,
      id_5,
      id_26,
      id_1,
      id_22
  );
endmodule
