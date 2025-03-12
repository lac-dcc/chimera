// Seed: 1698898009
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply0 id_6,
    input wire id_7,
    input wor id_8,
    input wand id_9,
    output tri id_10,
    input tri0 id_11
    , id_17,
    input wire id_12,
    input supply0 id_13,
    input uwire id_14,
    output wand id_15
);
  wire id_18;
  ;
  class id_19;
  endclass : SymbolIdentifier
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input tri0 id_2,
    input supply0 id_3
);
  bit id_5, id_6;
  always @(posedge 1 !== id_3) begin : LABEL_0
    id_6 <= 1'd0;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
