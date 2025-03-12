// Seed: 3166722185
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input uwire id_2,
    input uwire id_3,
    output supply0 id_4,
    input wire id_5,
    output wand id_6,
    output tri1 id_7
);
  assign id_7 = {-1{((id_5)) ? 1 - 1 : -1}} * id_1;
  assign id_6 = id_5;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_6 = 32'd80,
    parameter id_7 = 32'd38
) (
    input  wire  id_0,
    input  wire  id_1
    , id_10,
    output wand  id_2,
    output wor   id_3,
    input  tri0  id_4,
    input  wor   id_5,
    output wire  _id_6[id_7 : 1  ==  id_6],
    input  tri0  _id_7,
    output uwire id_8
);
  wire id_11, id_12, id_13;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_8,
      id_1,
      id_3,
      id_3
  );
  wire id_14, id_15;
  wire id_16;
  ;
  always_ff
    if (-1) id_10 = 1;
    else @(id_1) $unsigned(41);
  ;
  assign id_14 = id_10;
endmodule
