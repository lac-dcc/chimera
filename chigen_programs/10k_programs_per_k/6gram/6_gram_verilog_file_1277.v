// Seed: 2553034247
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wand id_2,
    input supply1 id_3,
    input tri id_4,
    output tri id_5,
    input supply0 id_6,
    output wand id_7,
    input supply0 id_8,
    input supply0 id_9,
    input wire id_10,
    input wor id_11,
    input tri0 id_12,
    output wand id_13,
    output tri0 id_14
    , id_29,
    input wand id_15,
    input supply0 id_16,
    output supply0 id_17,
    output supply1 id_18,
    input tri1 id_19,
    output uwire id_20,
    input uwire id_21,
    output tri0 id_22,
    input supply1 id_23,
    output wire id_24,
    input supply1 id_25,
    input tri id_26,
    output uwire id_27
);
  logic id_30;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    output supply0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output logic id_5,
    input wire id_6,
    input wand id_7,
    output tri id_8,
    input supply1 id_9,
    output supply0 id_10
    , id_17,
    input supply1 id_11,
    output supply0 id_12,
    input tri1 id_13,
    input wire id_14,
    output tri1 id_15
);
  always @* begin : LABEL_0
    id_0 <= 1;
    id_5 <= id_14;
    id_17 = -1;
  end
  assign id_17 = id_14;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_13,
      id_1,
      id_1,
      id_2,
      id_13,
      id_12,
      id_1,
      id_7,
      id_9,
      id_9,
      id_4,
      id_12,
      id_8,
      id_13,
      id_7,
      id_2,
      id_15,
      id_4,
      id_12,
      id_7,
      id_3,
      id_6,
      id_2,
      id_1,
      id_11,
      id_15
  );
  assign modCall_1.id_16 = 0;
  assign id_15 = 1;
endmodule
