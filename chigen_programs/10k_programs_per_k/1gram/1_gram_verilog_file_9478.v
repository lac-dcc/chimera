// Seed: 1091156183
module module_0 #(
    parameter id_22 = 32'd82,
    parameter id_23 = 32'd17
) (
    input wor id_0,
    input supply0 id_1,
    output tri1 id_2,
    input uwire id_3,
    output wand id_4
);
  assign {id_3} = id_0 ? id_3 : 1;
  tri0 id_6 = id_3, id_7;
  wire id_8;
  wor  id_9;
  assign id_6 = (1);
  tri0 id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  assign id_10 = 1'b0;
  integer id_21 = 1;
  defparam id_22 = id_14 | id_9, id_23 = 1;
  assign module_1.type_10 = 0;
  assign id_21 = id_6;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input wand id_3,
    input supply0 id_4,
    output supply0 id_5,
    output supply1 id_6,
    input supply0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_5
  );
endmodule : SymbolIdentifier
