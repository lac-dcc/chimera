// Seed: 1171524541
module module_0 (
    output wand id_0,
    output uwire id_1,
    output uwire id_2,
    output wor id_3,
    input uwire id_4,
    output tri id_5,
    input wire id_6,
    output wor id_7,
    output wire id_8,
    input wor id_9,
    inout wire id_10,
    input wire id_11,
    input wand id_12,
    input supply0 id_13,
    input wire id_14,
    output wor id_15,
    input supply0 id_16,
    input tri1 id_17,
    output tri0 id_18,
    output wor id_19,
    input wire id_20,
    output supply1 id_21
);
endmodule
module module_1 (
    input wand id_0,
    output wor id_1,
    input wand id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri1 id_5,
    input wand id_6,
    input wor id_7,
    input tri0 id_8,
    output logic id_9,
    input wire id_10,
    input wor id_11,
    input tri id_12,
    input tri id_13,
    output wor id_14,
    input supply0 id_15,
    output supply1 id_16,
    input supply0 id_17 id_26,
    input wire id_18,
    output wire id_19,
    input tri0 id_20,
    output wor id_21,
    input tri1 id_22,
    input wire id_23,
    input supply0 id_24
);
  assign id_14 = id_8;
  parameter id_27 = 1;
  wire id_28;
  assign id_26 = -1;
  always begin : LABEL_0
    id_9 = #1  ({id_0{1}}) + -1 == -1;
  end
  module_0 modCall_1 (
      id_14,
      id_26,
      id_16,
      id_1,
      id_6,
      id_21,
      id_3,
      id_1,
      id_5,
      id_26,
      id_26,
      id_23,
      id_3,
      id_11,
      id_2,
      id_14,
      id_7,
      id_4,
      id_5,
      id_5,
      id_0,
      id_1
  );
endmodule
