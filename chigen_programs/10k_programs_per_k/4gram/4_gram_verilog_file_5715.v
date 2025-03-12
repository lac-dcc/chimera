// Seed: 3893268496
module module_0;
  wire id_1;
  wire id_2;
  wire id_3, id_4;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  module_0 modCall_1 ();
  output wire id_2;
  output wire id_1;
  parameter id_7 = -1;
endmodule
module module_2 #(
    parameter id_1 = 32'd80
) (
    _id_1,
    id_2
);
  output logic [7:0] id_2;
  inout wire _id_1;
  module_0 modCall_1 ();
  assign id_2[id_1] = id_1;
endmodule
