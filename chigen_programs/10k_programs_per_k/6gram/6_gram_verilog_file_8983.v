// Seed: 1815617443
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wand id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    input supply0 id_9,
    input wire id_10,
    output wor id_11,
    input supply0 id_12,
    output supply1 id_13,
    input tri id_14
);
  generate
    for (id_16 = id_1; 1; id_13 = id_5) begin : LABEL_0
      assign id_11 = id_1;
    end
  endgenerate
  assign module_1.type_3 = 0;
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    inout logic id_3,
    input tri0 id_4,
    input supply0 id_5,
    input wor id_6,
    input logic id_7,
    input supply1 id_8,
    input tri id_9,
    inout supply1 id_10,
    input tri id_11,
    output supply0 id_12,
    input uwire id_13,
    output supply0 id_14,
    input wor id_15,
    output wand id_16,
    output logic id_17
);
  always @(negedge 1'b0) begin : LABEL_0
    id_17 <= 1;
    id_3 = id_7;
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_2,
      id_2,
      id_13,
      id_4,
      id_10,
      id_11,
      id_10,
      id_5,
      id_16,
      id_15,
      id_12,
      id_10
  );
endmodule
