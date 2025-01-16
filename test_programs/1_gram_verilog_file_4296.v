// Seed: 4113146145
macromodule module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output wor id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri id_7,
    input wor id_8,
    input tri0 id_9,
    output tri0 id_10,
    output tri0 id_11,
    output wand id_12,
    output tri1 id_13,
    output tri0 id_14,
    input tri id_15,
    input wor id_16,
    output wire id_17
);
  wire id_19, id_20;
  localparam id_21 = id_21 - id_8;
  assign module_1.id_13 = 0;
  wire id_22;
  logic [7:0][-1  - 'b0] id_23 (1'h0);
  assign id_12 = (1);
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    output wand id_3,
    output wor id_4,
    input supply0 id_5,
    input tri id_6,
    input wire id_7,
    input wand id_8,
    input supply0 id_9,
    output tri id_10,
    input wor id_11,
    input supply1 void id_12,
    input supply1 id_13,
    input wand id_14,
    input supply0 id_15,
    input supply0 id_16
);
  wire id_18;
  assign id_3 = id_5 * id_15;
  wire id_19;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_6,
      id_4,
      id_1,
      id_6,
      id_7,
      id_10,
      id_2,
      id_2,
      id_4,
      id_4,
      id_10,
      id_10,
      id_4,
      id_9,
      id_16,
      id_10
  );
endmodule
