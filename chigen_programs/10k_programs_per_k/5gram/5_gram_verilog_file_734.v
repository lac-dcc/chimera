// Seed: 575466564
module module_0 (
    input  tri   id_0,
    output wand  id_1,
    input  uwire id_2,
    input  wand  id_3,
    output tri1  id_4,
    output tri1  id_5
);
  assign id_4 = id_4++;
  assign module_1.id_1 = 0;
  assign id_1 = id_0 != id_2;
  and primCall (id_1, id_2, id_3, id_7);
  wire id_7;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output wor   id_0,
    input  tri0  id_1,
    output logic id_2,
    input  tri   id_3
);
  always_ff @(1 or id_1) begin : LABEL_0
    id_2 <= 1'h0;
  end
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0
  );
endmodule
module module_2;
  wire id_2;
endmodule
