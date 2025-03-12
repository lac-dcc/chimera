// Seed: 1773308563
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_7;
  parameter id_8 = ~1;
  wire id_9 = id_5;
  logic [-1 'd0 : 1 'b0] id_10;
  ;
endmodule
macromodule module_1 #(
    parameter id_4 = 32'd29
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  output wire _id_4;
  inout wire id_3;
  input wire id_2;
  output logic [7:0] id_1;
  wire id_5;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_3,
      id_5
  );
endmodule
