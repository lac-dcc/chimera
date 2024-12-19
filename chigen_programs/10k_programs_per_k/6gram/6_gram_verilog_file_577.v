// Seed: 918419207
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri1 id_2
    , id_8,
    output tri id_3,
    input tri id_4
    , id_9,
    input supply0 id_5,
    output wor id_6
);
  wire id_10;
  assign module_1.id_12 = 0;
  wire id_11;
endmodule
module module_1 (
    input wire id_0,
    output tri0 id_1,
    input uwire id_2,
    output uwire id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri1 id_6,
    input supply0 id_7,
    output supply0 id_8,
    input tri1 id_9,
    input tri id_10,
    input supply0 id_11,
    output tri id_12,
    input wor id_13,
    input wire id_14,
    input tri id_15,
    output tri1 id_16
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_13,
      id_16,
      id_15,
      id_5,
      id_8
  );
  always @(1 or id_4 or negedge 1 - id_0) begin : LABEL_0
    fork : SymbolIdentifier
      id_18(1);
    join
  end
endmodule
