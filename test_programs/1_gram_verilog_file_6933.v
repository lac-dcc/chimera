// Seed: 857265906
module module_0;
  assign module_1.type_13 = 0;
  module_2 modCall_1 ();
  final begin : LABEL_0
    @(posedge 1) id_1 <= -1;
  end
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    output wand  id_2,
    input  uwire id_3,
    input  uwire id_4,
    output logic id_5
);
  id_7(
      .id_0(id_5)
  );
  module_0 modCall_1 ();
  reg id_8, id_9;
  always_comb id_5 <= id_9;
endmodule
module module_2 ();
  tri id_2;
  uwire id_4, id_5 = id_4 | -1, id_6, id_7;
  assign id_5 = id_2;
endmodule
