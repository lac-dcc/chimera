// Seed: 2591849445
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wire id_4,
    input uwire id_5,
    output wand id_6,
    input wor id_7,
    output uwire id_8,
    output supply1 id_9
    , id_33,
    output wire id_10,
    output supply0 id_11,
    input supply0 id_12,
    output wire id_13,
    output tri1 id_14,
    input supply0 id_15,
    output wire id_16,
    output wor id_17,
    input uwire id_18,
    input tri id_19,
    output wand id_20,
    input wor id_21,
    input wire id_22,
    input tri0 id_23,
    input wand id_24,
    input wand id_25,
    input tri id_26,
    output wand id_27,
    output wand id_28,
    input wire id_29,
    input wor id_30,
    input supply1 id_31
);
  integer id_34 = 1, id_35;
  wire id_36;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  tri   id_2,
    input  tri   id_3,
    output wire  id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_1,
      id_2
  );
  assign id_4 = id_1;
  initial begin : LABEL_0
    if (1 && 1 && 1) begin : LABEL_0
      id_0 <= 1;
    end
  end
endmodule
