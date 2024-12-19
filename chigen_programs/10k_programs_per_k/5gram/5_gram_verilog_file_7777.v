// Seed: 1170067286
module module_0;
  assign id_1 = 1 >= 1;
  assign module_2.type_0 = 0;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_6 <= 1;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    output logic id_0,
    input  uwire id_1,
    input  logic id_2
);
  initial begin : LABEL_0
    id_0 <= id_2;
    #1 id_0 <= {1 - ~id_1, 1};
  end
  always disable id_4;
  wire id_5;
  module_0 modCall_1 ();
endmodule
