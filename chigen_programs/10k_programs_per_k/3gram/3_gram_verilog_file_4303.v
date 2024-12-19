// Seed: 3022394839
macromodule module_0 (
    output tri0 id_0,
    input uwire id_1,
    input tri1 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri0 id_6,
    input wand id_7,
    output supply0 id_8,
    input wire id_9
    , id_27,
    input wand id_10,
    input supply0 id_11,
    input supply1 id_12,
    input uwire id_13,
    input wand id_14,
    input wor id_15,
    input tri0 id_16,
    input wand id_17,
    output tri id_18,
    input tri0 id_19,
    output wire id_20,
    output supply0 id_21,
    input uwire id_22,
    input wand id_23,
    input supply0 id_24,
    input tri1 id_25
);
  assign module_1.id_1 = 0;
  assign id_20 = ~id_2;
endmodule
module module_1 #(
    parameter id_36 = 32'd58,
    parameter id_37 = 32'd25
) (
    input supply1 id_0,
    input tri id_1,
    input wand id_2,
    input wand id_3,
    input wor id_4,
    input uwire id_5,
    output wor id_6,
    input tri id_7,
    input tri0 id_8,
    output tri id_9,
    input wire id_10,
    output tri0 id_11,
    output logic id_12,
    output supply1 id_13,
    output tri id_14,
    output tri id_15,
    input uwire id_16,
    input supply1 id_17
    , id_28,
    input tri id_18
    , id_29,
    input wire id_19,
    output uwire id_20,
    output tri0 id_21,
    input supply1 id_22,
    input wire id_23,
    input wire id_24,
    input wor id_25,
    input tri0 id_26
);
  always @(negedge 1) begin : LABEL_0
    id_12 <= 1 & 1;
  end
  module_0 modCall_1 (
      id_14,
      id_5,
      id_26,
      id_5,
      id_18,
      id_2,
      id_3,
      id_17,
      id_13,
      id_3,
      id_5,
      id_8,
      id_5,
      id_5,
      id_5,
      id_4,
      id_10,
      id_4,
      id_20,
      id_19,
      id_14,
      id_21,
      id_23,
      id_24,
      id_0,
      id_23
  );
  tri id_30 = id_1;
  wire id_31, id_32;
  wire id_33;
  for (genvar id_34 = id_34; 1'd0; id_21 = 1) begin : LABEL_0
    for (id_35 = id_35; 1; id_12 = id_35) begin : LABEL_0
      defparam id_36.id_37 = 1;
    end
  end
  wire id_38;
  wand id_39 = id_16;
  wire id_40;
  wire id_41;
endmodule
