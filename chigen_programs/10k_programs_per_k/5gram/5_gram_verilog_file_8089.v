// Seed: 1721257179
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output wand id_2,
    input wire id_3,
    output wor id_4,
    input supply0 id_5,
    output supply0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input supply0 id_10,
    output tri0 id_11,
    input wire id_12,
    input wire id_13,
    input wire id_14,
    input wire id_15,
    output tri0 id_16,
    output wor id_17,
    input wor id_18
);
  always @(*) begin : LABEL_0
    deassign id_4;
  end
  wire id_20;
  wire id_21, id_22, id_23;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    output wor id_2,
    input tri1 id_3,
    input wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input wand id_7,
    output tri1 id_8,
    input wand id_9,
    output wire id_10,
    output tri1 id_11,
    input wire id_12,
    input tri1 id_13,
    output supply0 id_14,
    input tri0 id_15
);
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_2,
      id_5,
      id_11,
      id_5,
      id_8,
      id_12,
      id_1,
      id_7,
      id_9,
      id_14,
      id_3,
      id_12,
      id_1,
      id_12,
      id_2,
      id_2,
      id_5
  );
  supply0 id_18 = id_13 ? 1 : id_4;
endmodule
