// Seed: 2893448714
module module_0 (
    output tri id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri1 id_5
);
  wire id_7;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    output wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1
  );
  wire id_6;
  assign id_3 = id_0;
endmodule
module module_2 (
    input uwire id_0,
    input wire id_1,
    output supply1 id_2,
    input logic id_3,
    output uwire id_4,
    output tri id_5,
    input logic id_6,
    input tri id_7,
    output supply1 id_8,
    output supply0 id_9,
    input supply0 id_10,
    input wor id_11,
    input wire id_12,
    output supply1 id_13,
    output wor id_14,
    input tri0 id_15,
    input uwire id_16
);
  assign id_5 = id_15;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_10,
      id_16,
      id_1,
      id_5
  );
  assign modCall_1.type_2 = 0;
  always
  fork : SymbolIdentifier
    {id_6, 1} <= id_3;
    integer id_11;
    begin : LABEL_0
      release id_5;
    end
  join
endmodule
