// Seed: 1238917935
module module_0 (
    input wor id_0,
    output wor id_1
    , id_17,
    input wire id_2,
    output tri0 id_3,
    input tri id_4,
    input wand id_5,
    input wand id_6,
    input uwire id_7,
    input tri1 id_8,
    input tri0 id_9,
    output supply1 id_10,
    output wand id_11,
    output tri1 id_12,
    input tri id_13,
    output uwire id_14,
    output wand id_15
);
  wire id_18;
  assign id_15 = 1;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    output logic id_2,
    input tri1 id_3,
    input wire id_4,
    input supply1 id_5,
    input logic id_6,
    input uwire id_7
);
  initial forever id_1 = id_0;
  reg id_9;
  always @(posedge id_9) begin : LABEL_0
    if (1'b0)
      fork
        id_2 <= id_6;
        id_9 <= 1;
      join : SymbolIdentifier
  end
  tri0 id_10 = 1;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_1,
      id_4,
      id_5,
      id_0,
      id_4,
      id_7,
      id_5,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.LABEL_0.id_11 = 0;
  supply1 id_11 = 1'b0;
  assign id_2 = 1;
endmodule
