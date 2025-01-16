// Seed: 1451139797
module module_0;
  tri id_1;
  assign id_2 = ~id_1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
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
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  assign id_2 = -1'b0;
  wire id_9;
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
module module_2 ();
  assign id_1 = 1;
  assign module_3.type_0 = 0;
endmodule
module module_3 (
    input  uwire id_0,
    input  logic id_1,
    output logic id_2
);
  initial if (1) id_2 <= id_1;
  module_2 modCall_1 ();
endmodule
