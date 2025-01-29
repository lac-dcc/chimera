// Seed: 970971721
module module_0;
  assign module_3.id_4 = 0;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 ();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = -1;
  module_0 modCall_1 ();
  assign id_1 = id_2;
  initial if (1 == id_2) id_4 = id_4;
  always_comb begin : LABEL_0
    id_1 = id_4;
    id_3 <= {id_2.id_1, -1, id_1 == id_2 * 1};
  end
  nand primCall (id_1, id_2, id_4);
  wire id_6 = (id_6);
  parameter id_7 = -1 != id_1;
endmodule
