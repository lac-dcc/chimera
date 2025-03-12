// Seed: 824610901
module module_0 (
    id_1
);
  input wire id_1;
  logic id_2 = -1;
  assign module_3.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output reg id_2;
  module_0 modCall_1 (id_1);
  input wire id_1;
  always #1 id_2 <= 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
  output wire id_2;
  inout wire id_1;
  wire [-1 : 1] id_4;
endmodule
module module_3 #(
    parameter id_1 = 32'd39
) (
    _id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire _id_1;
  assign id_2[id_1] = id_1 ^ -1;
  assign id_2[id_1+:id_1] = id_1;
  logic [-1 : -1] id_3;
  ;
  module_0 modCall_1 (id_3);
endmodule
