// Seed: 161854000
module module_0;
  always id_1[1] <= 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1  = 0;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output uwire id_1,
    input  wire  id_2,
    output wor   id_3,
    inout  tri   id_4,
    output uwire id_5,
    input  tri0  id_6
);
  module_0 modCall_1 ();
endmodule
module module_2 ();
  assign id_1 = 1;
  wire id_2;
endmodule
module module_3 (
    output logic id_0,
    input  tri   id_1,
    input  logic id_2
);
  assign id_0 = 0;
  module_2 modCall_1 ();
  assign id_0 = 1;
  initial if (id_1) id_0 <= id_2;
  always begin : LABEL_0
    id_0 = 1 || id_1 || 1;
    $display(1, 1, id_1 - 1, (id_1));
    id_0 = 1;
  end
  wire id_4;
endmodule
