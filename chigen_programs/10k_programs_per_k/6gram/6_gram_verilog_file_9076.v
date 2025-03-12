// Seed: 664762558
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input wire id_2,
    input uwire id_3,
    input wor id_4,
    output tri0 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply0 id_8,
    input tri0 id_9,
    input supply1 id_10,
    output uwire id_11,
    input tri1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    output supply0 id_15,
    output supply1 id_16,
    input tri0 id_17,
    output tri0 id_18,
    input tri0 id_19,
    output wor id_20,
    output tri id_21
);
  always @(id_9) begin : LABEL_0
    if ((1)) assume (1'b0) $signed(30);
    ;
  end
  assign id_20 = id_9;
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri0 id_5,
    output wire id_6,
    input wire id_7,
    input wand id_8,
    output wor id_9,
    input wor id_10,
    input uwire id_11,
    input supply1 id_12,
    input tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    input uwire id_16,
    input tri id_17,
    output wire id_18,
    input wire id_19,
    input tri0 id_20
);
  assign id_18 = id_16;
  module_0 modCall_1 (
      id_20,
      id_15,
      id_7,
      id_8,
      id_3,
      id_18,
      id_14,
      id_12,
      id_14,
      id_16,
      id_12,
      id_9,
      id_13,
      id_4,
      id_0,
      id_9,
      id_9,
      id_7,
      id_6,
      id_8,
      id_18,
      id_6
  );
  assign id_9 = id_0;
endmodule
