// Seed: 1456775601
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output wor id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wand id_7,
    input wire id_8,
    output uwire id_9,
    output uwire id_10,
    input supply0 id_11,
    input wire id_12,
    output tri0 id_13,
    input wand id_14,
    output wand id_15,
    input tri0 id_16,
    input tri0 id_17,
    output wire id_18
);
  assign id_15 = 1;
  wire id_20;
  generate
    wire id_21, id_22, id_23;
    begin : LABEL_0
      supply0 id_24 = 1'b0 == 1;
    end
  endgenerate
  wire id_25;
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    output tri0 id_2,
    output wire id_3,
    output wor  id_4
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_13 = 0;
endmodule
