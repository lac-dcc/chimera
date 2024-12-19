// Seed: 1092398380
module module_0 (
    output wand id_0,
    input tri0 id_1,
    output uwire id_2,
    output wire id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri0 id_8,
    input wor id_9,
    output wand id_10,
    input tri0 id_11,
    output wire id_12,
    input wor id_13,
    inout wor id_14,
    input supply0 id_15,
    output wor id_16
);
  assign id_12 = id_6;
  assign id_16 = 1;
  supply0 id_18 = (1);
  assign id_7 = id_13;
endmodule
module module_1 (
    output wor id_0,
    output logic id_1,
    input supply0 id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    output supply1 id_6,
    input tri id_7,
    output wand id_8,
    input supply1 id_9,
    inout uwire id_10,
    output wor id_11,
    input wire id_12,
    input uwire id_13,
    output supply0 id_14,
    input wire id_15
);
  wire id_17;
  always
  fork : SymbolIdentifier
  join
  module_0 modCall_1 (
      id_6,
      id_10,
      id_6,
      id_5,
      id_11,
      id_4,
      id_13,
      id_11,
      id_8,
      id_7,
      id_5,
      id_9,
      id_10,
      id_12,
      id_10,
      id_12,
      id_10
  );
  assign modCall_1.SymbolIdentifier.type_5 = 0;
  supply1 id_18 = 1;
  wire id_19;
  assign id_14 = id_10;
  always @* begin : LABEL_0
    id_1 <= 1;
  end
endmodule
