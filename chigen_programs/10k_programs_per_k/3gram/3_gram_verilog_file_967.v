// Seed: 2689098887
module module_0 ();
  assign id_1 = 1'b0;
  module_2 modCall_1 ();
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  wire id_1;
  wire id_2;
  assign module_3.id_4 = 0;
  assign id_1 = 1;
  assign module_0.id_1 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_4;
  module_2 modCall_1 ();
  wire id_5;
  initial begin : LABEL_0
    id_4 <= 1;
  end
endmodule
