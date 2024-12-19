// Seed: 3179680297
module module_0 (
    output tri0 id_0
    , id_23,
    output wor id_1,
    input wire id_2
    , id_24,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    input supply0 id_6,
    output tri0 id_7,
    output supply1 id_8,
    input wor id_9,
    input supply1 id_10,
    output wand id_11,
    input wor id_12,
    output wor id_13,
    input wire id_14,
    input uwire id_15,
    input supply1 id_16,
    input tri1 id_17,
    input wand id_18,
    output uwire id_19,
    output tri0 id_20,
    output wor id_21
);
  assign module_1.type_2 = 0;
  assign id_8 = id_17;
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    input wire id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output uwire id_6,
    input tri id_7,
    input wor id_8,
    input tri id_9,
    input wire id_10
);
  always @(posedge !id_8) begin : LABEL_0
    deassign id_0.id_1;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_7,
      id_1,
      id_10,
      id_6,
      id_0,
      id_10,
      id_10,
      id_0,
      id_9,
      id_0,
      id_4,
      id_9,
      id_10,
      id_7,
      id_4,
      id_6,
      id_0,
      id_0
  );
endmodule
