// Seed: 2837874703
module module_0;
  assign module_2.id_2 = 0;
  id_1(
      id_1
  );
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    output wire id_2,
    input supply0 id_3,
    output wire id_4
    , id_15,
    output tri0 id_5,
    input wand id_6,
    input wand id_7,
    input wand id_8,
    input tri0 id_9,
    output wor id_10,
    input wand id_11,
    output uwire id_12,
    input supply1 id_13
);
  module_0 modCall_1 ();
endmodule
module module_2 (
    output logic id_0
);
  logic [-1 : 1 'd0] id_2;
  assign id_2 = -1'b0 & -1;
  always @(*) begin : LABEL_0
    if (1) id_2 = 1;
    else id_0 <= 1'b0;
  end
  logic \id_3 ;
  ;
  module_0 modCall_1 ();
  wire [-1 : 1] id_4;
  wire id_5;
  final begin : LABEL_1
    $unsigned(87);
    ;
    \id_3 = id_5;
    while (1 == id_5)
    fork
      id_0 <= \id_3 ;
    join : SymbolIdentifier
    id_2 <= id_2 & 1;
  end
endmodule
