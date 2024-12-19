// Seed: 512601371
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input wire id_4,
    input uwire id_5,
    input supply0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri1 id_9,
    input wor id_10,
    input supply0 id_11,
    output tri0 id_12,
    output supply0 id_13,
    output wor id_14
);
  assign id_13 = 1'b0;
  assign id_12 = 1 ? 1 : 1;
  wire id_16;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
endmodule
module module_1 #(
    parameter id_19 = 32'd35,
    parameter id_20 = 32'd86
) (
    input supply0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output wand id_4,
    input tri id_5,
    input wor id_6,
    input logic id_7,
    input wor id_8,
    input wire id_9,
    output wand id_10,
    input tri id_11,
    input uwire id_12,
    output uwire id_13,
    input supply1 id_14,
    input wor id_15,
    output tri1 id_16
);
  generate
    for (id_18 = 1; 1; id_10 = id_14) begin : LABEL_0
      defparam id_19.id_20 = 1;
    end
  endgenerate
  assign id_13 = 1'b0;
  always @(*) force id_1 = id_7;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_6,
      id_0,
      id_6,
      id_6,
      id_6,
      id_9,
      id_15,
      id_9,
      id_6,
      id_5,
      id_10,
      id_10,
      id_16
  );
  assign modCall_1.id_3 = 0;
endmodule
