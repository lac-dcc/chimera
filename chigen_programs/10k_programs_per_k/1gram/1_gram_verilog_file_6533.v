// Seed: 2982184596
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input wor id_2,
    input tri id_3,
    output tri id_4,
    output supply0 id_5,
    input wand id_6,
    input tri1 id_7
    , id_24,
    output wire id_8,
    input supply1 id_9,
    input uwire id_10,
    output uwire id_11,
    input tri0 id_12,
    input wor id_13,
    input wand id_14,
    input tri1 id_15,
    input tri id_16,
    input wire id_17,
    input supply0 id_18,
    input wire id_19,
    input supply1 id_20,
    input supply1 id_21,
    output tri1 id_22
);
  wire id_25;
  assign id_8 = id_19;
endmodule
module module_1 #(
    parameter id_12 = 32'd88
) (
    output wire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    output wor id_5,
    input tri0 id_6,
    output wand id_7[id_12 : 1 'b0],
    output wire id_8,
    output logic id_9,
    output wand id_10,
    output tri id_11,
    input tri0 _id_12,
    output wor id_13
);
  always begin : LABEL_0
    id_9 = -1 && 1;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_3,
      id_11,
      id_13,
      id_4,
      id_6,
      id_10,
      id_3,
      id_1,
      id_0,
      id_6,
      id_2,
      id_4,
      id_4,
      id_1,
      id_6,
      id_6,
      id_2,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.id_19 = 0;
  logic id_15;
endmodule
