// Seed: 2857487862
program module_0;
  wire id_47;
  assign module_2.type_8 = 0;
  assign module_1.type_12 = 0;
  assign id_47 = id_37;
endprogram : SymbolIdentifier
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wor   id_4,
    output wand  id_5,
    input  uwire id_6,
    input  wire  id_7,
    output tri0  id_8
);
  id_10(
      .id_0(id_3), .id_1(1'b0), .id_2()
  );
  module_0 modCall_1 ();
endmodule
module module_2 (
    output uwire id_0,
    input logic id_1,
    output logic id_2,
    input wor id_3,
    input supply0 id_4,
    input uwire id_5
);
  initial begin : LABEL_0
    id_2 <= id_1;
  end
  id_7(
      .id_0(id_3),
      .id_1(id_0),
      .id_2(id_4),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .sum(id_0),
      .id_6(id_3 == 1'd0),
      .id_7(id_3),
      .id_8(id_3)
  );
  module_0 modCall_1 ();
endmodule
