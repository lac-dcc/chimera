// Seed: 1182448763
module module_0 (
    output tri id_0,
    output supply0 module_0,
    output tri0 id_2,
    output wire id_3,
    input tri id_4,
    output wire id_5,
    output tri id_6,
    output tri1 id_7,
    input supply1 id_8,
    output wor id_9,
    output wand id_10,
    output uwire id_11,
    output uwire id_12,
    input tri id_13,
    output supply0 id_14,
    input tri0 id_15,
    output tri1 id_16,
    input tri0 id_17,
    input tri0 id_18,
    input uwire id_19,
    input uwire id_20,
    input tri0 id_21
);
  wire id_23, id_24, id_25, id_26;
  assign id_14 = 1'h0;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd7
) (
    input tri0 id_0,
    output wor id_1,
    input wire id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri1 _id_6,
    input uwire id_7,
    output wand id_8,
    output supply0 id_9,
    output tri0 id_10,
    output wor id_11,
    input tri id_12,
    input tri1 id_13,
    input tri1 id_14,
    output wire id_15
);
  wire  [-1 : !  id_6] id_17;
  logic [  -1 : 1 'b0] id_18;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_10,
      id_1,
      id_3,
      id_9,
      id_8,
      id_1,
      id_2,
      id_15,
      id_9,
      id_9,
      id_10,
      id_0,
      id_1,
      id_12,
      id_10,
      id_7,
      id_4,
      id_3,
      id_12,
      id_7
  );
  assign id_10 = -1 & id_0;
endmodule
