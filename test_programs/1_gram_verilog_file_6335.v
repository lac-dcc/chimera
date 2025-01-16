// Seed: 3074804145
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input wand id_0,
    id_23,
    input tri1 id_1,
    input wand id_2,
    input wand id_3,
    output wire id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    input supply0 id_8,
    output tri0 id_9,
    input tri1 id_10,
    input supply0 id_11,
    input wor id_12,
    input wire id_13,
    input supply0 id_14,
    input tri1 id_15,
    output wand id_16,
    input tri1 id_17,
    output wor id_18,
    input uwire id_19,
    input wor id_20,
    output wor id_21
);
  wire id_24;
  if (id_11) begin : LABEL_0
    wire id_25;
  end else wire id_26;
  supply0 id_27;
  xnor primCall (
      id_16,
      id_26,
      id_8,
      id_12,
      id_3,
      id_24,
      id_10,
      id_14,
      id_0,
      id_15,
      id_23,
      id_13,
      id_27,
      id_28,
      id_1,
      id_25,
      id_11,
      id_20,
      id_6,
      id_5,
      id_19,
      id_17,
      id_7,
      id_2
  );
  supply1 id_28;
  assign id_16 = id_13 + id_27;
  assign id_9  = 1 ? 1 : 1 / id_28;
  module_0 modCall_1 (
      id_23,
      id_26,
      id_26
  );
  wire id_29;
  wire id_30;
  assign id_28 = id_10;
  integer id_31;
endmodule
