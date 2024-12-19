// Seed: 1094190286
module module_0;
  wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  reg id_2;
  always begin : LABEL_0
    id_1 <= 1;
  end
  always begin : LABEL_0
    id_2 = 1;
    id_1 <= id_2;
    id_2 <= id_1;
    id_2 <= id_1;
  end
  module_0 modCall_1 ();
  assign id_1 = 1;
  wire id_3;
  wire id_4;
endmodule
