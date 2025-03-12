// Seed: 1894239914
module module_0 (
    input wire id_0,
    input wire id_1,
    output tri0 id_2,
    output wor id_3,
    input wand id_4,
    input supply0 id_5
);
  localparam id_7 = 1;
  assign id_3 = id_0;
endmodule
module module_1 #(
    parameter id_6 = 32'd17
) (
    output uwire id_0,
    input tri id_1,
    input wor id_2,
    input tri id_3,
    output wire id_4,
    output wire id_5,
    input supply0 _id_6
);
  logic [{  -1  ,  1  } : id_6] id_8;
  xnor primCall (id_0, id_3, id_2, id_1, id_8);
  assign id_8 = id_1;
  always_ff
  fork
  join : SymbolIdentifier
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.SymbolIdentifier.id_0 = 0;
endmodule
