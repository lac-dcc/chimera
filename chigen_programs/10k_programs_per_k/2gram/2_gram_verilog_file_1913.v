// Seed: 3905944000
module module_0 (
    output wand id_0,
    output tri1 id_1,
    input wand id_2,
    input wire id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri id_6,
    output wor id_7,
    input tri1 id_8,
    output wor id_9,
    output tri1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input tri0 id_13,
    input wand id_14,
    input wire id_15,
    input tri0 id_16,
    input wor id_17,
    input uwire id_18,
    input tri1 id_19,
    output wand id_20,
    input wire id_21,
    input tri1 id_22,
    output wire id_23,
    output tri1 id_24,
    output supply0 id_25,
    input tri0 id_26,
    output supply0 id_27,
    input uwire id_28,
    output wire id_29,
    input tri1 id_30,
    input wand id_31,
    output tri id_32
    , id_37,
    output wand id_33,
    input supply0 id_34,
    input uwire id_35
);
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    output wand id_2,
    output tri0 id_3,
    input wand id_4,
    output wand id_5,
    input tri0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri id_10,
    output wire id_11,
    input uwire id_12,
    input wand id_13,
    output tri0 id_14,
    input tri0 id_15
    , id_24,
    output tri id_16,
    input wire id_17,
    input uwire id_18,
    input wor id_19,
    output uwire id_20,
    output logic id_21,
    input tri0 id_22
);
  assign id_14 = 1 + id_15;
  assign id_2  = id_22 > 1;
  assign id_21 = 1;
  wire id_25;
  always begin : LABEL_0
    if (1) id_21 <= 1'b0;
    else id_21 = 1;
    disable id_26;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_9,
      id_8,
      id_18,
      id_22,
      id_16,
      id_17,
      id_2,
      id_14,
      id_18,
      id_8,
      id_6,
      id_22,
      id_7,
      id_19,
      id_22,
      id_6,
      id_4,
      id_14,
      id_12,
      id_18,
      id_14,
      id_5,
      id_14,
      id_18,
      id_20,
      id_22,
      id_14,
      id_17,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6
  );
  initial deassign id_25;
endmodule
