// Seed: 2070355215
module module_0;
  tri0 id_2, id_3;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always begin : LABEL_0
    id_5 <= id_3;
    disable id_6;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  id_7(
      1
  );
  reg id_8, id_9;
  always begin : LABEL_0
    id_5 <= id_4;
    id_4 = 1;
    id_8 <= 1;
  end
endmodule
program module_2 (
    id_1
);
  inout wire id_1;
  wire id_2;
  parameter id_3 = -1;
  nand primCall (id_1, id_2, id_3);
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
