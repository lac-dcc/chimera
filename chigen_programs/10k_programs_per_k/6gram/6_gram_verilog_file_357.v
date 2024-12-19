// Seed: 1661185255
module module_0 (
    output wand  id_0,
    output wand  id_1,
    input  uwire id_2,
    input  tri   id_3,
    output tri0  id_4,
    output wire  id_5,
    output wor   id_6
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  wire  id_4,
    output uwire id_5,
    output logic id_6
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_4,
      id_2,
      id_5,
      id_0,
      id_5
  );
  always force id_6 = id_3 * 1'h0;
  initial begin : LABEL_0
    id_6 <= 1;
    $display(id_2, id_4);
  end
endmodule
