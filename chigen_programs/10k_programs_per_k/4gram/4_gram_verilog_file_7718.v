// Seed: 722865322
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input wand id_2,
    input wand id_3,
    input tri id_4,
    input tri id_5,
    output supply0 id_6,
    input wor id_7,
    output wand id_8,
    input wand id_9,
    input wand id_10,
    input wire id_11,
    output wire id_12,
    input tri id_13,
    output tri id_14
);
  wire id_16, id_17;
  wire id_18;
endmodule : SymbolIdentifier
module module_1 (
    output wor id_0,
    input wire id_1,
    output supply0 id_2,
    input tri1 id_3,
    output wire id_4,
    input supply0 id_5,
    output supply0 id_6,
    output wire id_7,
    input tri id_8,
    input supply1 id_9,
    output wand id_10
);
  reg id_12;
  reg id_13;
  reg id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21;
  assign id_15 = 1;
  always @(posedge id_16 or posedge 1) begin : LABEL_0
    #1 id_10 = 1;
    id_12 = id_13;
    id_12 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_8,
      id_8,
      id_3,
      id_3,
      id_6,
      id_8,
      id_0,
      id_1,
      id_9,
      id_9,
      id_4,
      id_9,
      id_0
  );
  assign modCall_1.id_0 = 0;
  assign id_16 = id_12;
endmodule
