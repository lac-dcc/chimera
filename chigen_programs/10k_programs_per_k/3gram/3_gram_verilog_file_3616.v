// Seed: 1857029956
module module_0 (
    output uwire id_0,
    output wire id_1,
    output tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    input wire id_6,
    output wand id_7,
    input wand id_8,
    output supply1 id_9,
    input wor id_10,
    input wire id_11,
    output supply1 id_12,
    input supply1 id_13,
    output wand id_14
);
  wire id_16;
  always @(id_4) begin : LABEL_0
    #1;
  end
  assign id_1 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    input wand id_4,
    input tri id_5,
    input wand id_6,
    output wand id_7,
    output wor id_8,
    output supply0 id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    output wor id_14
);
  reg id_16, id_17, id_18;
  always @(posedge 1) id_17 <= 1;
  assign id_9 = id_3;
  module_0 modCall_1 (
      id_7,
      id_9,
      id_14,
      id_2,
      id_2,
      id_7,
      id_4,
      id_7,
      id_11,
      id_7,
      id_5,
      id_4,
      id_14,
      id_12,
      id_8
  );
  assign modCall_1.type_11 = 0;
  wire id_19;
  wire id_20;
endmodule
