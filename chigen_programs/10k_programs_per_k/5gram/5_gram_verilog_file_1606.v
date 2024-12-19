// Seed: 971520060
module module_0 (
    output uwire id_0,
    input wand id_1,
    output wor id_2,
    input wire id_3,
    input uwire id_4,
    output tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    output uwire id_8
);
  assign id_0 = id_7;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input tri id_2,
    output supply1 id_3,
    output tri0 id_4,
    input supply0 id_5,
    output tri id_6,
    input wor id_7,
    input wor id_8,
    input supply1 id_9,
    output wire id_10,
    output wand id_11,
    input wor id_12,
    input wor id_13
    , id_35,
    input tri1 id_14,
    output wire id_15,
    input uwire id_16,
    output wire id_17,
    output wor id_18,
    output wand id_19,
    output supply1 id_20,
    output tri0 id_21,
    input tri0 id_22,
    output wire id_23,
    input uwire id_24,
    output wire id_25,
    output logic id_26,
    output supply1 id_27
    , id_36,
    input tri id_28,
    input tri1 id_29
    , id_37,
    input wire id_30,
    input wor id_31,
    input supply0 id_32,
    input supply0 id_33
);
  assign id_23 = (1 == id_16) - id_32;
  always_ff @(id_33 or posedge id_32 or id_5 == id_12 | 1) begin : LABEL_0
    id_26 <= id_21++;
  end
  module_0 modCall_1 (
      id_19,
      id_5,
      id_18,
      id_28,
      id_14,
      id_4,
      id_24,
      id_28,
      id_21
  );
endmodule
