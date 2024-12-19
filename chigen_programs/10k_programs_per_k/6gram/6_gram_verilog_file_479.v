// Seed: 3793244495
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    output uwire id_8
);
  wire id_10;
endmodule
module module_1 (
    output tri1 id_0,
    output wand id_1,
    output tri0 id_2,
    input  wand id_3,
    input  tri0 id_4,
    output wand id_5,
    output tri  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_6
  );
endmodule
module module_2 ();
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
  assign module_3.SymbolIdentifier.SymbolIdentifier.id_0 = 0;
endmodule
module module_3 (
    input  logic id_0,
    output logic id_1,
    output logic id_2
);
  always @(1 == 1 or negedge id_0) begin : LABEL_0
    id_1 <= 1;
    id_2 = 1 ? id_0 : 1;
  end
  assign id_2 = 1'b0;
  module_2 modCall_1 ();
  initial begin : LABEL_0
    repeat (id_0) id_2 = id_0;
    id_2 = #id_4 id_4;
    id_4 = id_0;
  end
endmodule
